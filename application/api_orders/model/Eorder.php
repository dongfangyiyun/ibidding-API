<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

import('app.api_extend.extend.kdapi.Eorder');
import('app.api_extend.extend.kdapi.Eprint');

/*
 *  【电子面单模型】
 */
class Eorder extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_orders';

    // 创建电子面单
    public function submitEorder($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order['status'] == 3 && $order['is_submit_eorder'] == 0) {
            $eorder = new \Eorder();
            $result = $eorder->create($order_id);

            if ($result['code']) {
                $param = [
                    'is_submit_eorder'   => 1,
                    'submit_eorder_time' => date("Y-m-d H:i:s", time()),
                ];
                $this->save($param, ['id' => $order_id]);

                return ['code' => 1, 'data' => $result['data'], 'msg' => '创建电子面单成功'];
            } else {
                return ['code' => 0, 'data' => [], 'msg' => $result['msg']];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可创建电子面单'];
        }
    }

    // 创建电子面单
    public function batchSubmitEorder($order_ids)
    {
        $orders = model('orders')->getAll(['id' => ['in', $order_ids]]);
        foreach ($orders as $key => $order) {
            if ($order['status'] !== 3) {
                return ['code' => 0, 'data' => [], 'msg' => 'ID为' . $order['id'] . '的订单状态错误，暂不可创建电子发单'];
                break;
            }

            if ($order['is_submit_eorder'] == 1) {
                return ['code' => 0, 'data' => [], 'msg' => 'ID为' . $order['id'] . '的订单已创建电子发单'];
                break;
            }
        }

        foreach ($orders as $key => $order) {
            $eorder = new \Eorder();
            $result = $eorder->create($order['id']);
            if ($result['code']) {
                $param = [
                    'is_submit_eorder'   => 1,
                    'submit_eorder_time' => date("Y-m-d H:i:s", time()),
                ];
                $this->save($param, ['id' => $order['id']]);
            } else {
                return ['code' => 0, 'data' => [], 'msg' => 'ID为' . $order['id'] . '的订单创建电子发单失败，失败原因：' . $result['msg']];
                break;
            }
        }

        return ['code' => 1, 'data' => [], 'msg' => '批量创建电子面单成功'];
    }

    // 打印电子面单
    public function printEorder($order_id)
    {
        $order = model('orders')->getOne($order_id);
        if ($order['is_submit_eorder'] == 1) {
            $eprint = new \Eprint();
            $eprint->create($order_id);
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可打印电子面单'];
        }
    }

    // 批量打印电子面单
    public function batchPrintEorder($order_ids)
    {
        $orders = model('orders')->getAll(['id' => ['in', $order_ids]]);
        foreach ($orders as $key => $order) {
            if ($order['is_submit_eorder'] == 0) {
                return ['code' => 0, 'data' => [], 'msg' => 'ID为' . $order['id'] . '的订单暂未创建电子发单'];
                break;
            }
        }

        $eprint = new \Eprint();
        $eprint->batch_create($order_ids);
    }
}
