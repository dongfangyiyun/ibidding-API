<?php

namespace app\api_orders\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Orders extends Rest
{

    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
        'checkUser'  => ['only' => 'lists'],
    ];

    /**
     * 【admin】查询全部订单列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 会员手机号模糊查询
                if ($key == 'user_mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['user_mobile']);
                }

                // 会员昵称模糊查询
                if ($key == 'nick_name') {
                    $user_ids       = model('users')->getColumn(['nick_name' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['nick_name']);
                }

                // 会员昵称模糊查询
                if ($key == 'order_no') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 会员昵称模糊查询
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('orders')->getAllCount($map);
        $lists = model('orders')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个订单详情
     */
    public function read($id)
    {
        $this->data['data'] = model('orders')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】订单预览
     */
    public function view(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('order');
        if ($validate->scene('view')->check($data)) {
            $goods_info = json_decode($data['goods_info'], true);

            $goods_money   = 0;
            $freight_money = 0;
            $total_freight = 0;

            foreach ($goods_info as $key => $value) {
                $goods_id = $value['goods_id'];
                if ($value['spec_group_id']) {
                    $spec_group_info = model('goods_spec_groups')->getOne($value['spec_group_id']);
                    $goods_money += $spec_group_info['sell_price'] * $value['num'];
                    $total_freight += $spec_group_info['weight'] * $value['num'];
                } else {
                    $goods = model('goods')->getOne($goods_id);
                    $goods_money += $goods['sell_price'] * $value['num'];
                    $total_freight += $goods['weight'] * $value['num'];
                }
            }

            $transport    = model('transport_templates')->findOne(['status' => 1]);
            $basic_weight = $transport['basic_weight'] * 1000;
            if ($basic_weight >= $total_freight) {
                $freight_money = $transport['basic_price'];
            } else {
                $freight_money = $transport['basic_price'] + ($total_freight - $basic_weight) / ($transport['add_weight'] * 1000) * $transport['add_price'];
            }

            $freight_money = round(floatval($freight_money), 2);
            $goods_money   = round(floatval($goods_money), 2);

            $this->data['data'] = [
                'goods_money'   => $goods_money,
                'freight_money' => $freight_money,
                'total_money'   => $goods_money + $freight_money,
            ];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】新建订单
     */
    public function save(Request $request)
    {

        $data = $request->param();

        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('order');
        if ($validate->scene('create')->check($data)) {

            // 写入订单
            $result = model('orders')->addOne($data);
            if ($result['code']) {

                // 更新订单商品
                $order_id   = $result['data']['id'];
                $goods_info = json_decode($data['goods_info'], true);
                $result     = model('order_goods')->batchAddByOrderId(['order_id' => $order_id, 'goods_info' => $goods_info]);

                if ($result['code']) {

                    // 更新订单价格
                    model('orders')->updateMoney($order_id);

                    // 获取订单信息
                    $order = model('orders')->getOne($order_id);
                    // 增加登录积分与日志
                    model('score_logs')->addScoreByLogin($this->unique_id);
                    $this->data['msg']  = '创建订单成功';
                    $this->data['data'] = $order;
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }
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
     * 【admin】更新订单
     */
    public function update(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('order');
        if ($validate->scene('update')->check($data)) {

            $result = model('orders')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新订单成功';
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
     * 【admin】删除订单
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('orders')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除订单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除订单
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('orders')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除订单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】会员全部订单列表
     */
    public function lists(Request $request)
    {
        $map            = $request->param();
        $map['user_id'] = $this->unique_id;

        if (isset($map['is_comment'])) {
            if ($map['is_comment'] == 0) {
                $map['is_all_return_goods'] = 0;
            }
        }

        $count = model('orders')->getAllCount($map);
        $lists = model('orders')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    // /**
    //  * 【user】导出订单
    //  */
    // public function export(Request $request)
    // {
    //     // $map = $request->param();

    //     // $count = model('orders')->getAllCount($map);
    //     // $lists = model('orders')->getAll($map, $this->page_num, $this->page_limit);

    //     import('app.api_extend.extend.importAndExport.export');

    //     $arr = [
    //         'title',
    //         'name',
    //     ];

    //     $lists = [
    //         [1, 2],
    //         [3, 4],
    //     ];

    //     $title = 'test';

    //     $export = new \export();
    //     $result = $export->order($arr, $lists, $title);

    //     // return $this->data;
    // }


    // /**
    //  * 【user】导出订单
    //  */
    // public function import(Request $request)
    // {

    //     import('app.api_extend.extend.importAndExport.import');

    //     $import = new \import();
    //     $result = $import->importExecl($file = './test.xlsx');

    //     return $result;
    // }

}
