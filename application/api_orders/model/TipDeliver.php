<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

/*
 *  【订单确认签收模型】
 */
class TipDeliver extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_orders';

    // 签收订单
    public function tip($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order) {
            if ($order['status'] == 2) {
                $param = [
                    'deliver_tip_num'       => $order['deliver_tip_num'] + 1,
                    'last_deliver_tip_time' => date("Y-m-d H:i:s", time()),
                ];

                $result = $this->save($param, ['id' => $order_id]);
                if (false === $result) {
                    return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
                } else {
                    return ['code' => 1, 'data' => [], 'msg' => '提醒发货成功'];
                }
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可提醒发货'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单数据不存在'];
        }
    }
}
