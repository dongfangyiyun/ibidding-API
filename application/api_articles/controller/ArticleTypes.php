<?php
namespace app\api_articles\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class ArticleTypes extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['except' => 'read,lists'],
        'checkAdmin' => ['except' => 'read,lists'],
    ];

    /**
     * 【admin】查询全部文章分类列表
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 文章分类名称模糊查询
                if ($key == 'name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

            } else {
                unset($map[$key]);
            }
        }

        $count = model('article_types')->getAllCount($map);
        $lists = model('article_types')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【admin】查询全部文章分类列表
     */
    public function index_tree(Request $request)
    {
        $data               = model('article_types')->getAllTree();
        $this->data['data'] = list_to_tree($data);

        return $this->data;
    }

    /**
     * 【public】查询单个文章分类详情
     */
    public function read($id)
    {
        $this->data['data'] = model('article_types')->getOne($id);

        return $this->data;
    }

    /**
     * 【admin】新建文章分类
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('article_type');
        if ($validate->scene('create')->check($data)) {

            $result = model('article_types')->addOne($data);
            if ($result['code']) {
                $this->data['msg']  = '新增文章分类成功';
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
     * 【admin】更新文章分类
     */
    public function update(Request $request)
    {
        $data = $request->param();
        unset($data['click_num']);

        $validate = Loader::validate('article_type');
        if ($validate->scene('update')->check($data)) {

            $result = model('article_types')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新文章分类成功';
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
     * 【admin】删除文章分类
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('article_types')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除文章分类成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除文章分类
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('article_types')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除文章分类成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量上线文章分类
     */
    public function batch_on_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('article_types')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量上线文章分类成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量下线文章分类
     */
    public function batch_off_line(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('article_types')->batchUpdate(['status' => 2], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量下线文章分类成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【user】查询会员文章分类列表
     */
    public function lists(Request $request)
    {
        $map           = $request->param();
        $map['status'] = 1;

        $count = model('article_types')->getAllCount($map);
        $lists = model('article_types')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

}
