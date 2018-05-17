<?php
namespace app\api_orders\model;

use app\common\model\BaseModel;

/*
 *  【发货模型】
 */
class DeliverGoods extends BaseModel
{
    // 指定数据表
    protected $table = 'wancll_orders';

    // 创建发货信息
    public function addDeliver($data)
    {
        $order = model('orders')->getOne($data['order_id']);
        if ($order['status'] == 2) {
            $param = [
                'is_open_eorder' => $data['is_open_eorder'],
                'status'         => 3,
                'deliver_time'   => date("Y-m-d H:i:s", time()),
            ];

            if ($data['is_open_eorder'] == 1) {
                $param['eorder_express_type'] = $data['eorder_express_type'];
                switch ($data['eorder_express_type']) {
                    // 顺丰快递
                    case 'SF':
                        $param['express_type'] = 'shunfeng';
                        break;
                    // 快捷快递
                    case 'FAST':
                        $param['express_type'] = 'kuaijiesudi';
                        break;
                    // 宅急送
                    case 'ZJS':
                        $param['express_type'] = 'zhaijisong';
                        break;
                    // 邮政快递包裹
                    case 'YZPY':
                        $param['express_type'] = 'youzhengguonei';
                        break;
                    default:
                        # code...
                        break;
                }
            } else {
                $param['eorder_express_type'] = '';
                $param['express_type']        = $data['express_type'];
                $param['express_no']          = $data['express_no'];
            }

            $result = $this->save($param, ['id' => $data['order_id']]);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                if ($data['is_open_eorder']) {
                    import('app.api_extend.extend.kdapi.Eorder');
                    $eorder = new \Eorder();
                    $result = $eorder->create($data['order_id']);
                }
                return ['code' => 1, 'data' => [], 'msg' => '创建发货成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可发货'];
        }
    }

    // 更新发货信息
    public function editDeliver($data)
    {
        $order = model('orders')->getOne($data['order_id']);
        if ($order['status'] == 3) {
            $param = [
                'is_open_eorder' => $data['is_open_eorder'],
            ];

            if ($data['is_open_eorder'] == 1) {
                $param['eorder_express_type'] = $data['eorder_express_type'];
                switch ($data['eorder_express_type']) {
                    // 顺丰快递
                    case 'SF':
                        $param['express_type'] = 'shunfeng';
                        break;
                    // 快捷快递
                    case 'FAST':
                        $param['express_type'] = 'kuaijiesudi';
                        break;
                    // 宅急送
                    case 'ZJS':
                        $param['express_type'] = 'zhaijisong';
                        break;
                    // 邮政快递包裹
                    case 'YZPY':
                        $param['express_type'] = 'youzhengguonei';
                        break;
                    default:
                        # code...
                        break;
                }
            } else {
                $param['eorder_express_type'] = '';
                $param['express_type']        = $data['express_type'];
                $param['express_no']          = $data['express_no'];
            }

            $result = $this->save($param, ['id' => $data['order_id']]);
            if (false === $result) {
                return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
            } else {
                if ($data['is_open_eorder']) {
                    import('app.api_extend.extend.kdapi.Eorder');
                    $eorder = new \Eorder();
                    $result = $eorder->create($data['order_id']);
                }

                return ['code' => 1, 'data' => [], 'msg' => '更新发货成功'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可更新发货'];
        }
    }
}
