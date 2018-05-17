<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Request;

class Params extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
        'checkToken' => ['only' => 'batch_update'],
        'checkAdmin' => ['only' => 'batch_update'],
    ];

    /**
     * 【admin】查询参数
     */
    public function index()
    {
        $type = input('type');

        switch ($type) {
            case 'all':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data;
                break;
            case 'basic':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data['basic'];
                break;
            case 'auth':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data['auth'];
                break;
            case 'order':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data['order'];
                break;
            case 'pay':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data['pay'];
                break;
            case 'third_login':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data['third_login'];
                break;
            case 'qiniu':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data['qiniu'];
                break;
            case 'sms':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data['sms'];
                break;
            case 'jiguang':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data['jiguang'];
                break;
            case 'email':
                $data               = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                $this->data['data'] = $data['email'];
                break;
            default:
                $this->data['code'] = 0;
                $this->data['msg']  = '参数错误';
                break;
        }

        return $this->data;
    }

    /**
     * 【admin】更新参数
     */
    public function batch_update(Request $request)
    {
        $data = $request->param();

        $type = input('update_type');
        if ($type) {
            unset($data['update_type']);
            switch ($type) {
                case 'basic':
                    update_config_file(['basic' => $data]);
                    $this->data['msg'] = '基础配置更新成功';
                    break;
                case 'auth':
                    update_config_file(['auth' => $data]);
                    $this->data['msg'] = '认证码更新成功';
                    break;
                case 'order':
                    update_config_file(['order' => $data]);
                    $this->data['msg'] = '订单配置更新成功';
                    break;
                case 'ali_pay':
                    $old_data       = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                    $new_pay        = $old_data['pay'];
                    $new_pay['ali'] = $data;
                    update_config_file(['pay' => $new_pay]);
                    $this->data['msg'] = '支付宝配置更新成功';
                    break;
                case 'wechat_pay':
                    $old_data          = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                    $new_pay           = $old_data['pay'];
                    $new_pay['wechat'] = $data;
                    update_config_file(['pay' => $new_pay]);
                    $this->data['msg'] = '微信配置更新成功';
                    break;
                case 'qq_login':
                    $old_data              = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                    $new_third_login       = $old_data['third_login'];
                    $new_third_login['qq'] = $data;
                    update_config_file(['third_login' => $new_third_login]);
                    $this->data['msg'] = 'QQ授权登录配置更新成功';
                    break;
                case 'wechat_login':
                    $old_data                  = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                    $new_third_login           = $old_data['third_login'];
                    $new_third_login['wechat'] = $data;
                    update_config_file(['third_login' => $new_third_login]);
                    $this->data['msg'] = '微信授权登录配置更新成功';
                    break;
                case 'qiniu':
                    update_config_file(['qiniu' => $data]);
                    $this->data['msg'] = '七牛云存储配置更新成功';
                    break;
                case 'jiguang':
                    update_config_file(['jiguang' => $data]);
                    $this->data['msg'] = '极光推送配置更新成功';
                    break;
                case 'email':
                    update_config_file(['email' => $data]);
                    $this->data['msg'] = '邮件配置更新成功';
                    break;
                case 'bami_sms':
                    $old_data        = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                    $new_sms         = $old_data['sms'];
                    $new_sms['bami'] = $data;
                    update_config_file(['sms' => $new_sms]);
                    $this->data['msg'] = '八米短信配置更新成功';
                    break;
                case 'ali_sms':
                    $old_data       = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                    $new_sms        = $old_data['sms'];
                    $new_sms['ali'] = $data;
                    update_config_file(['sms' => $new_sms]);
                    $this->data['msg'] = '阿里短信配置更新成功';
                    break;
                default:
                    $this->data['code'] = 0;
                    $this->data['msg']  = '参数错误';
                    break;
            }
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '参数缺失';
        }

        return $this->data;
    }
}
