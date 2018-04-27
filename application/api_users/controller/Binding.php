<?php
namespace app\api_users\controller;

use app\api_init\controller\Rest;
use think\Loader;
use think\Request;

class Binding extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'save_in_login,delete'],
        'checkUser'  => ['only' => 'save_in_login,delete'],
    ];

    /**
     * 【admin】授权绑定（未登录状态新增绑定）
     */
    public function save_in_no_login(Request $request)
    {
        $data     = $request->param();
        $validate = Loader::validate('binding');
        if ($validate->scene('in_no_login')->check($data)) {

            $result = model('binding')->noLoginBinding($data);
            if ($result['code']) {
                $this->data['msg'] = '绑定成功';
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
     * 【admin】授权绑定（登录状态新增绑定）
     */
    public function save_in_login(Request $request)
    {
        $data       = $request->param();
        $data['id'] = $this->account_id;

        $validate = Loader::validate('binding');
        if ($validate->scene('in_login')->check($data)) {

            $result = model('binding')->loginBinding($data);
            if ($result['code']) {
                $this->data['msg'] = '绑定成功';
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
     * 【admin】解除绑定
     */
    public function delete(Request $request)
    {
        $data       = $request->param();
        $data['id'] = $this->account_id;

        $validate = Loader::validate('binding');
        if ($validate->scene('no_binding')->check($data)) {

            $result = model('binding')->noBinding($data);
            if ($result['code']) {
                $this->data['msg'] = '解除绑定成功';
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
