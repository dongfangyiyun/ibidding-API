<?php
namespace app\api_bids\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class BidCollections extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['only' => 'index'],
        'checkUser'  => ['except' => 'index'],
    ];

    /**
     * 【admin】查询全部商品收藏列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 会员手机号模糊查询
                if ($key == 'mobile') {
                    $user_ids       = model('users')->getColumn(['mobile' => ['like', '%' . $value . '%']], 'id');
                    $map['user_id'] = ['in', $user_ids];
                    unset($map['mobile']);
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

        $count = model('bid_collections')->getAllCount($map);
        $lists = model('bid_collections')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个商品收藏详情
     */
    public function read($id)
    {
        $data               = model('bid_collections')->getOne($id);
        $data['user_info']  = model('users')->getOne($data['user_id']);
        $data['bid_info'] = model('bid')->getOne($data['bid_id']);

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【admin】新建商品收藏
     */
    public function save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('bid_collection');
        if ($validate->scene('create')->check($data)) {
            $bid_collection = model('bid_collections')->findOne($data);
            if ($bid_collection) {
                $this->data['msg']  = '收藏成功';
                $this->data['data'] = $bid_collection;
            } else {
                $result = model('bid_collections')->addOne($data);
                if ($result['code']) {
                    $this->data['msg']  = '收藏成功';
                    $this->data['data'] = $result['data'];
                } else {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                }
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $validate->getError();
        }

        return $this->data;
    }

    /**
     * 【admin】批量商品收藏
     */
    public function batch_save(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('bid_collection');
        if ($validate->scene('batch_create')->check($data)) {
            $result = model('bid_collections')->batchAddByBidIds($data);
            if ($result['code']) {
                $this->data['msg']  = '信息收藏成功';
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
     * 【admin】删除商品收藏
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('bid_collections')->delOneTrue($id);
        if ($result['code']) {
            $this->data['msg'] = '删除收藏成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除商品收藏
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bid_collections')->delAllTrue($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除收藏成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询会员的商品收藏列表
     */
    public function lists(Request $request)
    {
        $map['user_id'] = $this->unique_id;

        $count = model('bid_collections')->getAllCount($map);
        $lists = model('bid_collections')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】取消商品收藏
     */
    public function cancel(Request $request)
    {
        $data            = $request->param();
        $data['user_id'] = $this->unique_id;

        $validate = Loader::validate('bid_collection');
        if ($validate->scene('cancel')->check($data)) {
            $bid_collection = model('bid_collections')->findOne($data);

            $result = model('bid_collections')->delOneTrue($bid_collection['id']);
            if ($result['code']) {
                $this->data['msg']  = '删除收藏成功';
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

}
