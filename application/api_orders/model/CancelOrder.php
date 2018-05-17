<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

/*
 *  【取消订单模型】
 */
class CancelOrder extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_orders';

    // 签收订单
    public function cancel($order_id, $cancel_reason)
    {
        $order = model('orders')->getOne($order_id);
        if ($order) {
            if ($order['status'] == 1) {
                $param = [
                    'status'        => 9,
                    'cancel_reason' => $cancel_reason,
                    'cancel_time'   => date("Y-m-d H:i:s", time()),
                ];

                $result = $this->save($param, ['id' => $order_id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    return ['code' => 1, 'data' => [], 'msg' => '取消订单成功'];
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可取消'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单数据不存在'];
        }
    }
}
