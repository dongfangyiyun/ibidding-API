<?php
namespace app\api_users\validate;

use think\Validate;

class UserDrawcash extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '会员提现ID不能为空'],
        ['user_id', 'require|checkHasValue:user_id', '会员ID不能为空'],
        ['asset_type', 'require|in:money', '提现资产类型不能为空'],
        ['type', 'require', '提现类别不能为空'],
        ['money', 'require|number|>=:0.01', '提现金额不能为空|提现金额值非法|提现金额最小为0.01元'],
        ['bank_card_id', 'require', '银行卡ID不能为空'],
        ['account_id', 'require|checkHasValue:account_id', '会员账号不能为空'],
        ['pay_password', 'require', '请输入支付密码'],
    ];

    protected $scene = [
        'create'   => ['user_id', 'asset_type', 'type', 'money', 'bank_card_id', 'account_id', 'pay_password'],
        'touch_id' => ['user_id', 'asset_type', 'type', 'money', 'bank_card_id'],
        'update'   => ['user_id', 'asset_type', 'type', 'money', 'bank_card_id', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $bank_card_id = input('bank_card_id');
        $asset_type   = input('asset_type');
        $money        = input('money');
        $pay_password = input('pay_password');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    $bank_card = model('bank_cards')->findOne(['user_id' => $value, 'id' => $bank_card_id]);
                    if (!$bank_card) {
                        return '银行卡不存在';
                    }

                    $user_asset = model('user_assets')->findOne(['user_id' => $value]);
                    if ($user_asset) {
                        if ($asset_type == 'money' && $money > $user_asset['money']) {
                            return '提现金额不能大于钱包剩余金额';
                        }
                    } else {
                        return '会员资产数据不存在';
                    }

                    return true;
                } else {
                    return '会员不存在';
                }
                break;
            case 'account_id':
                $user_account = model('user_accounts')->getOne($value);
                if ($user_account) {
                    $map = [
                        'id'           => $value,
                        'pay_password' => wancll_md5($pay_password),
                    ];
                    $result = model('user_accounts')->findOne($map);
                    if ($result) {
                        return true;
                    } else {
                        return '支付密码错误';
                    }
                } else {
                    return '会员账号不存在';
                }
                break;
            case 'id':
                $user_drawcash = model('user_drawcashs')->getOne($value);
                if ($user_drawcash) {
                    return true;
                } else {
                    return '会员提现数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
