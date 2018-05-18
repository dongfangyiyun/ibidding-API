<?php
namespace app\api_bids\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class BidAreas extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists,lists_tree'],
        'checkAdmin' => ['except' => 'read,lists,lists_tree'],
    ];

    /**
     * 【admin】查询全部招投标地区类别列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 招投标地区类别名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('bid_areas')->getAllCount($map);
        $lists = model('bid_areas')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询全部招投标地区类别列表
     */
    public function index_tree(Request $request)
    {
        $data               = model('bid_areas')->getAllTree();
        $this->data['data'] = list_to_tree($data);

        return $this->data;
    }

    /**
     * 【public】查询单个招投标地区类别详情
     */
    public function read($id)
    {
        $this->data['data'] = model('bid_areas')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建招投标地区类别
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('bid_area');
        if ($validate->scene('create')->check($data)) {

            $result = model('bid_areas')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增招投标地区类别成功';
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
     * 【admin】更新招投标地区类别
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('bid_area');
        if ($validate->scene('update')->check($data)) {

            $result = model('bid_areas')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新招投标地区类别成功';
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
     * 【admin】删除招投标地区类别
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('bid_areas')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除招投标地区类别成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除招投标地区类别
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bid_areas')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除招投标地区类别成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线招投标地区类别
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bid_areas')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线招投标地区类别成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线招投标地区类别
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('bid_areas')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线招投标地区类别成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询会员招投标地区类别列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('bid_areas')->getAllCount($map);
        $lists = model('bid_areas')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询全部招投标地区类别列表
     */
    public function lists_tree(Request $request)
    {
        $data               = model('bid_areas')->getAllTree(['status' => 1]);
        $this->data['data'] = list_to_tree($data);

        return $this->data;
    }

}
