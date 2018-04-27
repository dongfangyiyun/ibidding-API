<?php
namespace app\common\model;

/*
 *  【订单模型】
 */
class Orders extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_orders';

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        $user_info = [$value => model('users')->getUserBasicInfo($data['user_id'])];
        return $user_info[$data['user_info']];
    }

    // 初始化
    protected static function init()
    {
        self::beforeInsert(function ($model) {
            $model->order_no = make_order_no('N');

            $address               = model('addresses')->getOne($model->address_id);
            $model->consignee_name = $address['consignee_name'];
            $model->mobile         = $address['mobile'];
            $model->province       = $address['province'];
            $model->city           = $address['city'];
            $model->area           = $address['area'];
            $model->address        = $address['address'];

            // 满减促销传入优惠的金额
            if ($model->market_activity_type == 'full') {
                $full_rule                  = model('activity_full_rules')->getOne($model->market_activity_id);
                $model->market_reduce_money = $full_rule['reduce_money'];
            }

            // 优惠券（优惠金额类别）传入优惠的金额
            if ($model->market_activity_type == 'coupon') {
                $user_coupon = model('user_coupons')->getOne($model->market_activity_id);
                if ($user_coupon['coupon_type'] == 'full') {
                    $model->market_reduce_money = $user_coupon['change_value'];
                }

                // 修改优惠券状态
                model('user_coupons')->editOne(['id' => $model->market_activity_id, 'status' => 2]);
            }
        });
    }

    // 获取器【order_goods_info】
    public function getOrderGoodsInfoAttr($value, $data)
    {
        $order_goods_info = [$value => model('order_goods')->getAll(['order_id' => $data['id']])];
        return $order_goods_info[$data['order_goods_info']];
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('update_time desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('update_time desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['order_goods_info'] = '';
            $data[$key]['user_info']        = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['order_goods_info'] = '';
            $data['user_info']        = '';
        }

        return $data;
    }

    // 刷新订单商品价格
    public function updateMoney($order_id)
    {
        $sum = model('order_goods')->getOrderGoodsSum($order_id);

        $total_price         = $sum['total_price'];
        $total_weight        = $sum['total_weight'];
        $total_freight_money = 0;

        $transport    = model('transport_templates')->findOne(['status' => 1]);
        $basic_weight = $transport['basic_weight'] * 1000;
        if ($basic_weight >= $total_weight) {
            $total_freight_money = $transport['basic_price'];
        } else {
            $total_freight_money = $transport['basic_price'] + ($total_weight - $basic_weight) / ($transport['add_weight'] * 1000) * $transport['add_price'];
        }

        $goods_money   = round(floatval($total_price), 2);
        $freight_money = round(floatval($total_freight_money), 2);

        $order        = model('orders')->getOne($order_id);
        $reduce_money = $order['market_reduce_money'];
        if ($order['market_activity_type'] == 'coupon' && $order['market_activity_id']) {
            $user_coupon = model('user_coupons')->getOne($order['market_activity_id']);
            if ($user_coupon['coupon_type'] == 'discount') {
                $reduce_money = ($goods_money + $freight_money) * 0.1 * $user_coupon['change_value'];
            }
        }

        $update_data = [
            'id'                  => $order_id,
            'market_reduce_money' => $reduce_money,
            'goods_money'         => $goods_money,
            'freight_money'       => $freight_money,
            'total_money'         => $goods_money + $freight_money - $reduce_money,
        ];

        $this->editOne($update_data);

        // 更新订单商品的实际价格
        $order              = model('orders')->getOne($order_id);
        $rate               = ($order['total_money'] - $order['freight_money']) / ($order['total_money'] - $order['freight_money'] + $order['market_reduce_money']);
        $update_order_goods = [];
        foreach ($order['order_goods_info'] as $key => $value) {
            $update_order_goods[] = [
                'id'         => $value['id'],
                'real_price' => $value['sell_price'] * $value['num'] * $rate,
            ];
        }
        model('order_goods')->batchEdit($update_order_goods);

    }

    // 校验订单（订单预支付时调用）
    public function checkOrder($order_id)
    {
        $order = $this->getOne($order_id);
        if ($order) {
            if ($order['status'] == 1 || $order['is_pay'] == 1) {
                $order_goods = $order['order_goods_info'];
                foreach ($order_goods as $key => $value) {
                    $goods = model('goods')->getOne($value['goods_id']);
                    if ($goods) {
                        if ($goods['status'] != 1) {
                            return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】已下架，请重新下单'];
                            break;
                        }

                        if ($value['spec_group_id']) {
                            $spec = model('goods_spec_groups')->getOne($value['spec_group_id']);
                            if ($spec) {
                                if (intval($spec['stock']) < intval($value['num'])) {
                                    return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】库存已不足，请重新下单'];
                                    break;
                                }
                            } else {
                                return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】数据已更新，请重新下单'];
                                break;
                            }
                        } else {
                            if (intval($goods['stock']) < intval($value['num'])) {
                                return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】库存已不足，请重新下单'];
                                break;
                            }
                        }
                    } else {
                        return ['code' => 0, 'data' => [], 'msg' => '商品【' . $value['name'] . '】已下架，请重新下单'];
                        break;
                    }
                }

                return ['code' => 1, 'data' => [], 'msg' => '订单校验成功'];
            } else {
                return ['code' => 0, 'data' => [], 'msg' => '订单状态错误，不可支付'];
            }
        } else {
            return ['code' => 0, 'data' => [], 'msg' => '订单不存在'];
        }
    }

    // 查询单条数据
    public function getOneBasic($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['user_info'] = '';
        }

        return $data;
    }
}
