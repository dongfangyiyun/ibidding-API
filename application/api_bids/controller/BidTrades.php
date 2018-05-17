<?php
namespace app\api_bids\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class BidTrades extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部招投标行业类别列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 招投标行业类别名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('bid_trades')->getAllCount($map);
        $lists = model('bid_trades')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询全部招投标行业类别列表
     */
    public function index_tree(Request $request)
    {
        $data               = model('bid_trades')->getAllTree();
        $this->data['data'] = list_to_tree($data);

        return $this->data;
    }

    /**
     * 【public】查询单个招投标行业类别详情
     */
    public function read($id)
    {
        $this->data['data'] = model('bid_trades')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建招投标行业类别
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('bid_trade');
        if ($validate->scene('create')->check($data)) {

            $result = model('bid_trades')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增招投标行业类别成功';
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
     * 【admin】更新招投标行业类别
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('bid_trade');
        if ($validate->scene('update')->check($data)) {

            $result = model('bid_trades')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新招投标行业类别成功';
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
     * 【admin】删除招投标行业类别
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('bid_trades')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除招投标行业类别成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除招投标行业类别
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bid_trades')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除招投标行业类别成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线招投标行业类别
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bid_trades')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线招投标行业类别成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线招投标行业类别
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bid_trades')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线招投标行业类别成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询会员招投标行业类别列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('bid_trades')->getAllCount($map);
        $lists = model('bid_trades')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
