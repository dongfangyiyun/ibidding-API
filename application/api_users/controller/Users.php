<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Users extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkAdmin' => ['except' => 'read,update'],
    ];

    /**
     * 【admin】查询全部会员
     */
    public function index(Request $request)
    {
        $map = $request->param();
        foreach ($map as $key => $value) {
            if ($value) {
                // 手机号模糊查询
                if ($key == 'mobile') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // 昵称模糊查询
                if ($key == 'nick_name') {
                    $map[$key] = ['like', '%' . $value . '%'];
                }

                // guid关联模糊查询
                if ($key == 'guid') {
                    $user_ids  = model('user_accounts')->getColumn(['guid' => ['like', '%' . $value . '%']], 'user_id');
                    $map['id'] = ['in', $user_ids];
                    unset($map['guid']);
                }
            } else {
                unset($map[$key]);
            }
        }

        $count = model('users')->getAllCount($map);
        $lists = model('users')->getAll($map, $this->page_num, $this->page_limit);

        $this->data['page'] = [
            'page_num'   => $this->page_num,
            'page_limit' => $this->page_limit,
            'data_count' => $count,
        ];

        $this->data['data'] = $lists;

        return $this->data;
    }

    /**
     * 【public】查询单个会员
     */
    public function read($id)
    {
        $user = model('users')->getOne($id);
        if ($this->account_type == 'admin' || $user['id'] == $this->unique_id) {
            $this->data['data'] = $user;
        } else {
            $this->data['code'] = 400100;
            $this->data['msg']  = '非法操作';
        }

        return $this->data;
    }

    /**
     * 【admin】新建会员
     */
    public function save(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('user');
        if ($validate->scene('create')->check($data)) {

            // 注册会员
            $data['role_ids'] = isset($data['role_ids']) ? array_unique($data['role_ids']) : '';

            $result = model('users')->addOne($data);
            if ($result['code']) {
                $user = $result['data'];

                // 写入会员资产表信息
                $result = model('user_assets')->addOne(['user_id' => $user['id']]);
                if (!$result['code']) {
                    $this->data['code'] = 0;
                    $this->data['msg']  = $result['msg'];
                    return $this->data;
                }

                $account_data = [
                    'guid'     => $data['mobile'],
                    'password' => ibid_md5($data['password']),
                    'user_id'  => $user['id'],
                ];
                $result = model('user_accounts')->addOne($account_data);
                if ($result['code']) {
                    $this->data['msg']  = '新增会员成功';
                    $this->data['data'] = $user;
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
     * 【public】更新会员
     */
    public function update(Request $request)
    {
        $data = $request->param();
        if ($this->account_type == 'user') {
            $data['id'] = $this->unique_id;
        }

        unset($data['mobile']);

        $validate = Loader::validate('user');
        if ($validate->scene('update')->check($data)) {
            $result = model('users')->editOne($data);
            if ($result['code']) {
                $this->data['msg']  = '更新会员成功';
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
     * 【admin】删除会员(将会员的账号全部置空)
     */
    public function delete()
    {
        $id     = input('id/d', 0);
        $result = model('users')->delOne($id);
        if ($result['code']) {
            $this->data['msg'] = '删除会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量删除会员
     */
    public function batch_delete(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('users')->delAll($ids);
        if ($result['code']) {
            $this->data['msg'] = '批量删除会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量拉黑会员
     */
    public function batch_pull_black(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('users')->batchUpdate(['status' => 9], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量拉黑会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】批量恢复会员
     */
    public function batch_recover_normal(Request $request)
    {
        $ids = $request->param()['id'];

        $result = model('users')->batchUpdate(['status' => 1], $ids);
        if ($result['code']) {
            $this->data['msg'] = '批量恢复会员成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
        }

        return $this->data;
    }

    /**
     * 【admin】管理员修改用户密码
     */
    public function admin_mod_password(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('password');
        if ($validate->scene('admin_mod')->check($data)) {

            $params = [
                'id'       => model('user_accounts')->findOne(['user_id' => $data['id']])['id'],
                'password' => ibid_md5($data['password']),
            ];

            $result = model('user_accounts')->editOne($params);
            if ($result['code']) {
                $this->data['msg'] = '修改密码成功';
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
