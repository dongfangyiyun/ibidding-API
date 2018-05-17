<?php
namespace app\api_orders\validate;

use think\Validate;

class TipDeliver extends Validate
{
    protected $rule = [
        ['user_id', 'require|checkHasValue:user_id', '会员ID不能为空'],
        ['order_id', 'require|checkHasValue:order_id', '订单ID不能为空'],
    ];

    protected $scene = [
        'user' => ['user_id', 'order_id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $order_id = input('order_id');

        switch ($rule) {
            case 'order_id':
                $order = model('orders')->getOne($value);
                if ($order) {
                    if ($order['status'] == 2) {
                        if ($order['last_deliver_tip_time']) {
                            $system          = include 'application/api_init/config-' . WANCLL_ENV . '.php';
                            $interval_length = intval($system['order']['tip_deliver_time']);

                            $time_length = time() - strtotime($order['last_deliver_tip_time']);
                            if ($time_length > 86400 * $interval_length) {
                                return true;
                            } else {
                                return '每次提醒发货限间隔' . $interval_length . '天';
                            }
                        } else {
                            return true;
                        }
                    } else {
                        return '订单状态错误，不可提醒发货';
                    }
                } else {
                    return '订单不存在';
                }
                break;
            case 'user_id':
                $order = model('orders')->getOne($order_id);
                if ($order) {
                    if ($order['user_id'] == $value) {
                        return true;
                    } else {
                        return '非法操作';
                    }
                } else {
                    return '订单不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
