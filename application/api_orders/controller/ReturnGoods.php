<?php
namespace app\api_orders\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class ReturnGoods extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'save'],
    ];

    /**
     * 【admin】查询全部退货列表
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
            } else {
                unset($map[$key]);
            }
        }

        $count = model('return_goods')->getAllCount($map);
        $lists = model('return_goods')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询单个退货订单详情
     */
    public function read($id)
    {
        $this->data['data'] = model('return_goods')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建退货订单
     */
    public function save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('return_goods');
        if ($validate->scene('create')->check($data)) {

            $result = model('return_goods')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增退货订单成功';
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
     * 【admin】更新退货订单
     */
    public function update(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('return_goods');
        if ($validate->scene('update')->check($data)) {

            $result = model('return_goods')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新退货订单成功';
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
     * 【admin】删除退货
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('return_goods')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除退货订单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除退货订单
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('return_goods')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除退货订单成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】同意退货
     */
    public function agree(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('deal_return_goods');
        if ($validate->scene('agree')->check($data)) {
            $result = model('deal_return_goods')->agree($data['id']);
            if ($result['code']) {
                if($data['is_stock']){
                    $this->update_goods_info($data['order_goods_id']);
                }
                $this->data['msg']  = '同意退货处理成功';
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
     * 【admin】拒绝退货
     */
    public function not_agree(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('deal_return_goods');
        if ($validate->scene('not_agree')->check($data)) {

            $result = model('deal_return_goods')->notAgree($data['id']);
            if ($result['code']) {
                $this->data['msg']  = '拒绝退货处理成功';
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
     * 【admin】同意退款
     */
    public function return_money(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('deal_return_goods');
        if ($validate->scene('return_money')->check($data)) {

            $result = model('deal_return_goods')->returnMoney($data['id']);
            if ($result['code']) {
                $this->data['msg']  = '退款成功';
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
     * 【order】处理库存与收藏量
     */
    private function update_goods_info($order_goods_id)
    {
        $order_goods = model('order_goods')->getAll(['id' => $order_goods_id])[0];
        model('goods')->updateNum($order_goods['goods_id'], '+', 'stock', $order_goods['num']);
        if ($order_goods['spec_group_id']) {
            model('goods_spec_groups')->updateNum($order_goods['spec_group_id'], '+', 'stock', $order_goods['num']);
        }
    }
}
