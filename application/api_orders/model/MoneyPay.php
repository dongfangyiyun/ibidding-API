<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

/*
 *  【余额支付模型】
 */
class MoneyPay extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_orders';

    // 余额支付
    public function pay($order_no, $user_id)
    {
        $order = model('orders')->findOne(['order_no' => $order_no]);
        if ($order) {
            $order_id   = $order['id'];
            $user_asset = model('user_assets')->findOne(['user_id' => $user_id]);
            if ($user_asset) {
                if ($order['is_pay'] !== 0 && $order['status'] !== 1) {
                    return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可支付'];
                }

                if ($order['user_id'] !== $user_id) {
                    return ['code' => 0, 'data' => [], 'msg' => '非法操作'];
                }

                if ($order['total_money'] > $user_asset['money']) {
                    return ['code' => 0, 'data' => [], 'msg' => '钱包余额不足'];
                }

                $pay_data = [
                    'is_pay'   => 1,
                    'pay_time' => date("Y-m-d H:i:s", time()),
                    'pay_type' => 3,
                    'status'   => 2,
                ];

                $result = $this->save($pay_data, ['id' => $order_id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    $result = model('user_assets')->where(['user_id' => $user_id])->setDec('money', $order['total_money']);
                    if (false === $result) {
                        return ['code' => 0, 'data' => [], 'msg' => '会员钱包扣款失败'];
                    } else {
                        $asset_log_data = [
                            'user_id'      => $user_id,
                            'asset_type'   => 'money',
                            'change_type'  => 'user_pay',
                            'change_money' => $order['total_money'],
                            'intro'        => '购物支付【' . $order['order_no'] . '】',
                            'desc'         => '会员购物扣款，订单号：' . $order['order_no'],
                        ];
                        model('user_asset_logs')->addOne($asset_log_data);

                        return ['code' => 1, 'data' => [], 'msg' => '钱包支付成功'];
                    }
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '会员资产数据不存在'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单不存在'];
        }
    }
}
