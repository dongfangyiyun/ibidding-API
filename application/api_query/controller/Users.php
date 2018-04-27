<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class Users extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken',
        'checkUser' => ['only' => 'is_set_pay_password,check_pay_password'],
    ];

    /**
     * 【user】会员等级与成长值
     */
    public function asset()
    {
        $map['user_id'] = $this->unique_id;
        $user_asset     = model('user_assets')->findOne($map);

        $level_info             = model('user_levels')->getOneByUserId($this->unique_id);
        $user_asset['level']    = $level_info['name'];
        $user_asset['level_id'] = $level_info['id'];

        $this->data['data'] = $user_asset;

        return $this->data;
    }

    /**
     * 【user】会员认证
     */
    public function auth()
    {
        $map['user_id'] = $this->unique_id;
        $user_auth      = model('user_auths')->findOne($map);
        if (!$user_auth) {
            $user_auth['status'] = 0;
        }
        $this->data['data'] = $user_auth;

        return $this->data;
    }

    /**
     * 【public】查询默认地址
     */
    public function default_address()
    {
        $map = [
            'user_id'    => $this->unique_id,
            'is_default' => 1,
        ];

        $address = model('addresses')->findOne($map);
        if ($address) {
            $this->data['data'] = $address;
        } else {
            $this->data['data'] = (object) [];
        }

        return $this->data;
    }

    /**
     * 【public】查询是否设置支付密码
     */
    public function is_set_pay_password()
    {
        $result             = model('user_accounts')->isSetPayPassword($this->account_id);
        $this->data['data'] = [
            'is_set_pay_password' => $result['code'],
            'user_account_id'     => $this->account_id,
        ];

        return $this->data;
    }

    /**
     * 【public】查询支付密码是否正确
     */
    public function check_pay_password()
    {
        $pay_password = input('pay_password');

        if ($pay_password) {
            $user_account = model('user_accounts')->findOne(['id' => $this->account_id, 'pay_password' => ibid_md5($pay_password)]);
            if (!$user_account) {
                $this->data['code'] = 0;
                $this->data['msg']  = '支付密码错误';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '支付密码不能为空';
        }

        return $this->data;
    }
}
