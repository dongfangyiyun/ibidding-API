<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

/*
 *  【订单确认签收模型】
 */
class SignOrder extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_orders';

    // 签收订单
    public function sign($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order) {
            if ($order['status'] == 3) {
                $param = [
                    'status'               => 4,
                    'confirm_receipt_time' => date("Y-m-d H:i:s", time()),
                ];

                $result = $this->save($param, ['id' => $order_id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    return ['code' => 1, 'data' => [], 'msg' => '确认签收成功'];
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可签收'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单数据不存在'];
        }
    }
}
