<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Request;

class Oauth extends Rest
{
    /*
    ==============================================
    ==============微信授权登录====================
    ==============================================
     */

    /**
     * 【微信】授权登录（生成二维码）
     */
    public function wechat_qrcode()
    {

        $appid = 'wx2f5bcf9566fcb5ac';
        if ($this->client_type == 'pc') {
            $redirect_uri = urlencode(get_host() . '/portal/index/third_login');
        } elseif ($this->client_type == 'wap') {
            $redirect_uri = urlencode(get_host() . '/wap/index/third_login_transition');
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '客户端类型缺失';
            return $this->data;
        }

        $url = 'https://open.weixin.qq.com/connect/qrconnect?appid=' . $appid . '&redirect_uri=' . $redirect_uri . '&response_type=code&scope=snsapi_login&state=STATE#wechat_redirect';

        $this->data['data'] = $url;

        return $this->data;
    }

    /**
     * 【微信】授权登录（微信浏览器内部 [不弹出授权页面，直接跳转，只能获取用户openid] ）
     */
    public function wechat_wx()
    {
        $appid = 'wxac9f1b2f4fc8ff5c';
        // $redirect_uri = urlencode(get_host() . '/api/oauth/wechat_get_openid');
        $redirect_uri = urlencode(get_host() . '/wap/index/third_login_transition');
        $url          = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $appid . '&redirect_uri=' . $redirect_uri . '&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect';

        $this->data['data'] = $url;

        return $this->data;
    }

    /**
     * 【微信】获取用户的 openid
     */
    public function wechat_get_openid()
    {
        $code = input('code');

        if ($code) {
            if ($this->client_type == 'pc') {
                $appid     = 'wx2f5bcf9566fcb5ac';
                $appsecret = '26895849290848eedbe90733eab2fbea';
            } elseif ($this->client_type == 'wap' || $this->client_type == 'wechat') {
                $appid     = 'wxac9f1b2f4fc8ff5c';
                $appsecret = '655f090dc79348ed8a53794e10a697cf';
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = '客户端类型缺失';
                return $this->data;
            }

            $res          = https_request('https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $appid . '&secret=' . $appsecret . '&code=' . $code . '&grant_type=authorization_code');
            $result       = json_decode($res, true);
            $openid       = isset($result['openid']) ? $result['openid'] : '';
            $access_token = isset($result['access_token']) ? $result['access_token'] : '';

            if ($openid && $access_token) {
                $res    = https_request('https://api.weixin.qq.com/sns/userinfo?access_token=' . $access_token . '&openid=' . $openid);
                $result = json_decode($res, true);
                $openid = isset($result['unionid']) ? $result['unionid'] : '';

                if (!$openid) {
                    $this->data['code'] = 0;
                    $this->data['msg']  = 'unionid获取失败';
                    return $this->data;
                }
            } else {
                $this->data['code'] = 0;
                $this->data['msg']  = 'openid或access_token获取失败';
                return $this->data;
            }

            $account = model('user_accounts')->findOne(['wechat_openid' => $openid]);
            if ($account) {
                $this->login_info($account['guid']);
            } else {
                $this->data['data'] = [
                    'openid' => $openid,
                ];
                $this->data['msg'] = '请绑定账号';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = 'code缺失';
        }

        return $this->data;
    }

    /*
    ==============================================
    =============== QQ授权登录====================
    ==============================================
     */

    /**
     * 【QQ】授权登录（PC端）
     */
    public function qq_pc()
    {
        $appid = '101450871';
        if ($this->client_type == 'pc') {
            $redirect_uri = get_host() . '/portal/index/third_login';
        } elseif ($this->client_type == 'wap' || $this->client_type == 'wechat') {
            $redirect_uri = get_host() . '/wap/index/third_login_transition';
        }

        $url = 'https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=' . $appid . '&redirect_uri=' . $redirect_uri . '&state=qq_pc&scope=get_user_info';

        $this->data['data'] = $url;

        return $this->data;
    }

    /**
     * 【QQ】获取用户的 openid（PC端）
     */
    public function qq_get_openid_pc()
    {
        $code = input('code');

        if ($code) {
            $appid        = '101450871';
            $appsecret    = '45017ece72e89251b8de1c9087e528a8';
            $redirect_uri = urlencode(get_host() . '/wap/index/third_login_transition');

            $access_token_url = https_request('https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id=' . $appid . '&client_secret=' . $appsecret . '&code=' . $code . '&redirect_uri=' . $redirect_uri);
            $param            = explode('&', $access_token_url);
            $access_token     = $param[0];

            $openid_url = https_request('https://graph.qq.com/oauth2.0/me?' . $access_token);
            $str        = str_replace(array("callback(", ");"), "", $openid_url);
            $result     = json_decode($str, true);
            $openid     = isset($result['openid']) ? $result['openid'] : '';

            if (!$openid) {
                $this->data['code'] = 0;
                $this->data['msg']  = 'openid获取失败';
                return $this->data;
            }

            $account = model('user_accounts')->findOne(['qq_openid' => $openid]);
            if ($account) {
                $this->login_info($account['guid']);
            } else {
                $this->data['data'] = [
                    'openid' => $openid,
                ];
                $this->data['msg'] = '请绑定账号';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = 'code缺失';
        }

        return $this->data;
    }

    /**
     * 【QQ】授权登录（WAP端）
     */
    public function qq_wap()
    {
        $appid        = '101450871';
        $redirect_uri = urlencode(get_host() . '/wap/index/third_login_transition');

        $url = 'https://graph.z.qq.com/moc2/authorize?response_type=code&client_id=' . $appid . '&redirect_uri=' . $redirect_uri . '&state=STATE&scope=get_user_info';

        $this->data['data'] = $url;

        return $this->data;
    }

    /**
     * 【QQ】获取用户的 openid（WAP端）
     */
    public function qq_get_openid_wap()
    {
        $code = input('code');

        if ($code) {
            $appid        = '101450871';
            $appsecret    = '45017ece72e89251b8de1c9087e528a8';
            $redirect_uri = urlencode(get_host() . '/wap/index/third_login_transition');

            $access_token_url = https_request('https://graph.z.qq.com/moc2/token?grant_type=authorization_code&client_id=' . $appid . '&client_secret=' . $appsecret . '&code=' . $code . '&redirect_uri=' . $redirect_uri);
            $param            = explode('&', $access_token_url);
            $access_token     = $param[0];

            $openid_url = https_request('https://graph.z.qq.com/moc2/me?access_token=' . $access_token);
            $$str       = str_replace(array("callback(", ");"), "", $openid_url);
            $result     = json_decode($str, true);
            $openid     = isset($result['openid']) ? $result['openid'] : '';

            if (!$openid) {
                $this->data['code'] = 0;
                $this->data['msg']  = 'openid获取失败';
                return $this->data;
            }

            $account = model('user_accounts')->findOne(['qq_openid' => $openid]);
            if ($account) {
                $this->login_info($account['guid']);
            } else {
                $this->data['data'] = [
                    'openid' => $openid,
                ];
                $this->data['msg'] = '请绑定账号';
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = 'code缺失';
        }

        return $this->data;
    }

    /*
    ==============================================
    =============== 获取用户登录信息 =============
    ==============================================
     */

    /**
     * 【private】获取登录信息
     */
    private function login_info($guid)
    {
        // ==============下发授权token-BEGIN======================
        $result = model('user_tokens')->addOneByGuid($guid, $this->client_type);
        if ($result['code']) {
            $token = $result['data'];
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
            return;
        }
        // ==============下发授权token-END========================

        // ==============登录日志-BEGIN======================
        $result = model('user_visit_logs')->addOneByGuid($guid, $this->client_type, Request::instance()->ip());
        if (!$result['code']) {
            $this->data['code'] = 0;
            $this->data['msg']  = $result['msg'];
            return;
        }
        // ==============登录日志-END========================

        $user         = model('users')->getOneByGuid($guid);
        $user['guid'] = $guid;

        $this->data['msg']           = '登录成功';
        $this->data['data']['token'] = $token;
        $this->data['data']['user']  = $user;
        return;
    }

}
