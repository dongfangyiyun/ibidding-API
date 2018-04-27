<?php
namespace app\api_systems\validate;

use think\Validate;

class Code extends Validate
{
    protected $rule = [
        ['mobile', 'require|mobile|checkHasValue:mobile', '手机号不能为空|手机号格式错误'],
        ['type', 'require|in:1,2', '类型值不能为空|类型值非法'],
        ['code', 'require', '验证码不能为空'],
    ];

    protected $regex = [
        'mobile' => '/^1[34578]{1}\d{9}$/',
    ];

    protected $scene = [
        'send'  => ['mobile', 'type'],
        'check' => ['mobile', 'code',],
    ];

    protected function checkHasValue($value, $rule)
    {
        $type = input('type');

        switch ($rule) {
            case 'mobile':
                if ($type == 1 && $this->currentScene == 'send') {
                    // 校验是否被注册
                    $user_account = model('user_accounts')->findOne(['guid' => $value]);
                    if ($user_account) {
                        return "手机号已被注册";
                    } else {
                        return true;
                    }
                } else {
                    return true;
                }
                break;
            default:
                # code...
                break;
        }

    }
}
