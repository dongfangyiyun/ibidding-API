<?php
namespace app\api_goods\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Goods extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部商品列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 商品名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('goods')->getAllCount($map);
        $lists = model('goods')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个商品详情
     */
    public function read($id)
    {
        $this->data['data'] = model('goods')->getOneDetail($id);

        return $this->data;
    }

    /**
     * 【admin】新建商品
     */
    public function save(Request $request)
    {
        $data = $request->param();

        $validate = Loader::validate('goods');
        if ($validate->scene('create')->check($data)) {

            $result = model('goods')->addOne($data);
            if ($result['code']) {
                $goods_id      = $result['data']['id'];
                $goods_cate_id = $result['data']['goods_cate_id'];
                $goods_cate    = model('goods_cates')->getOne($goods_cate_id);

                // 处理属性
                $attr_template_id = $goods_cate['attr_template_id'];
                $goods_attr_data  = [];
                $goods_attr_info  = $data['goods_attr_info'];
                foreach ($goods_attr_info as $attr_name_id => $attr_option_id) {
                    $goods_attr_data[] = [
                        'goods_id'         => $goods_id,
                        'attr_template_id' => $attr_template_id,
                        'attr_name_id'     => $attr_name_id,
                        'attr_option_id'   => $attr_option_id,
                    ];
                }
                model('goods_attrs')->batchAdd($goods_attr_data);

                // 处理规格
                $spec_template_id = $goods_cate['spec_template_id'];
                $goods_spec_data  = [];
                $goods_spec_info  = $data['goods_spec_info'];
                foreach ($goods_spec_info as $spec_name_id => $spec_options) {
                    foreach ($spec_options as $key => $value) {
                        $goods_spec_data[] = [
                            'goods_id'         => $goods_id,
                            'spec_template_id' => $spec_template_id,
                            'spec_name_id'     => $spec_name_id,
                            'option'           => $value['option'],
                            'id_str'           => $value['id'],
                        ];
                    }
                }
                model('goods_spec_options')->batchAdd($goods_spec_data);

                // 处理规格组合项
                $real_stock            = 0; //真实库存值;
                $goods_spec_group_data = [];
                $goods_spec_group_info = $data['goods_spec_group_info'];
                foreach ($goods_spec_group_info as $spec_group) {
                    // 处理spec_option_id
                    $spec_option_ids_str = explode('_', $spec_group['spec_option_ids']);
                    $spec_option_ids_arr = [];
                    foreach ($spec_option_ids_str as $id_str) {
                        $spec_option           = model('goods_spec_options')->findOne(['id_str' => $id_str]);
                        $spec_option_ids_arr[] = $spec_option['id'];
                    }
                    $spec_option_ids = implode('_', $spec_option_ids_arr);

                    $goods_spec_group_data[] = [
                        'goods_id'          => $goods_id,
                        'spec_template_id'  => $spec_template_id,
                        'spec_option_ids'   => $spec_option_ids,
                        'spec_option_group' => $spec_group['spec_option_group'],
                        'thum'              => $spec_group['thum'],
                        'sell_price'        => $spec_group['sell_price'],
                        'market_price'      => $spec_group['market_price'],
                        'cost_price'        => $spec_group['cost_price'],
                        'red_price'         => $spec_group['red_price'],
                        'stock'             => $spec_group['stock'],
                        'weight'            => $spec_group['weight'],
                        'goods_no'          => $spec_group['goods_no'],
                        'goods_code'        => $spec_group['goods_code'],
                        'sort'              => 0,
                        'is_virtual'        => 0,
                    ];

                    $real_stock += $spec_group['stock'];
                }
                model('goods_spec_groups')->batchAdd($goods_spec_group_data);

                // 更新真实库存
                if (count($goods_spec_group_info) > 0) {
                    model('goods')->editOne(['id' => $goods_id, 'stock' => $real_stock]);
                }

                $this->data['msg']  = '新增商品成功';
                $this->data['data'] = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】更新商品
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('goods');
        if ($validate->scene('update')->check($data)) {

            $result = model('goods')->editOne($data);
            if ($result['code']) {
                $goods_id      = $result['data']['id'];
                $goods_cate_id = $result['data']['goods_cate_id'];
                $goods_cate    = model('goods_cates')->getOne($goods_cate_id);

                // 处理属性
                model('goods_attrs')->delAllTrueByGoodsId($goods_id);
                $attr_template_id = $goods_cate['attr_template_id'];
                $goods_attr_data  = [];
                $goods_attr_info  = $data['goods_attr_info'];
                foreach ($goods_attr_info as $attr_name_id => $attr_option_id) {
                    $goods_attr_data[] = [
                        'goods_id'         => $goods_id,
                        'attr_template_id' => $attr_template_id,
                        'attr_name_id'     => $attr_name_id,
                        'attr_option_id'   => $attr_option_id,
                    ];
                }
                model('goods_attrs')->batchAdd($goods_attr_data);

                // 处理规格
                model('goods_spec_options')->delAllTrueByGoodsId($goods_id);
                $spec_template_id = $goods_cate['spec_template_id'];
                $goods_spec_data  = [];
                $goods_spec_info  = $data['goods_spec_info'];
                foreach ($goods_spec_info as $spec_name_id => $spec_options) {
                    foreach ($spec_options as $key => $value) {
                        $goods_spec_data[] = [
                            'goods_id'         => $goods_id,
                            'spec_template_id' => $spec_template_id,
                            'spec_name_id'     => $spec_name_id,
                            'option'           => $value['option'],
                            'id_str'           => $value['id'],
                        ];
                    }
                }
                model('goods_spec_options')->batchAdd($goods_spec_data);

                // 处理规格组合项
                $real_stock = 0; //真实库存值;
                model('goods_spec_groups')->delAllTrueByGoodsId($goods_id);
                $goods_spec_group_data = [];
                $goods_spec_group_info = $data['goods_spec_group_info'];
                foreach ($goods_spec_group_info as $spec_group) {
                    // 处理spec_option_id
                    $spec_option_ids_str = explode('_', $spec_group['spec_option_ids']);
                    $spec_option_ids_arr = [];
                    foreach ($spec_option_ids_str as $id_str) {
                        $spec_option           = model('goods_spec_options')->findOne(['id_str' => $id_str]);
                        $spec_option_ids_arr[] = $spec_option['id'];
                    }
                    $spec_option_ids = implode('_', $spec_option_ids_arr);

                    $goods_spec_group_data[] = [
                        'goods_id'          => $goods_id,
                        'spec_template_id'  => $spec_template_id,
                        'spec_option_ids'   => $spec_option_ids,
                        'spec_option_group' => $spec_group['spec_option_group'],
                        'thum'              => $spec_group['thum'],
                        'sell_price'        => $spec_group['sell_price'],
                        'market_price'      => $spec_group['market_price'],
                        'cost_price'        => $spec_group['cost_price'],
                        'red_price'         => $spec_group['red_price'],
                        'stock'             => $spec_group['stock'],
                        'weight'            => $spec_group['weight'],
                        'goods_no'          => $spec_group['goods_no'],
                        'goods_code'        => $spec_group['goods_code'],
                        'sort'              => 0,
                        'is_virtual'        => 0,
                    ];
                    $real_stock += $spec_group['stock'];
                }
                model('goods_spec_groups')->batchAdd($goods_spec_group_data);

                // 更新真实库存
                if (count($goods_spec_group_info) > 0) {
                    model('goods')->editOne(['id' => $goods_id, 'stock' => $real_stock]);
                }

                $this->data['msg']  = '更新商品成功';
                $this->data['data'] = $result['data'];
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = $result['msg'];
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】删除商品
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('goods')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除商品
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线商品
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线商品
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('goods')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线商品成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】查询全部商品列表
     */
    public function lists(Request $request)
    {
        $map = $request->param();

        if (isset($map['keyword'])) {
            model('goods_keywords')->updateKeyword($map['keyword']);

            if ($this->token != '') {
                model('user_goods_keywords')->updateUserKeyword($this->token, $map['keyword']);
            }
        }

        $map['status'] = 1;

        foreach ($map as $key => $value) {
            if ($value) {
                // 商品名称模糊查询
                if ($key == 'keyword') {
                    $map['name'] = ['like', '%' . $value . '%'];
                    unset($map['keyword']);
                }

                if ($key == 'tag') {
                    $map['tags'] = ['like', '%' . $value . '%'];
                    unset($map['tag']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('goods')->getAllCount($map);
        $lists = model('goods')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
