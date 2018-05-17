<?php
namespace app\api_orders\validate;

use think\Validate;

class Order extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '订单ID不能为空'],
        ['user_id', 'require|checkHasValue:user_id', '会员ID不能为空'],
        ['address_id', 'require|checkHasValue:address_id', '地址ID不能为空'],
        ['goods_info', 'require|checkHasValue:goods_info', '商品信息不能为空'],
        ['market_activity_type', 'require|in:0,discount,full,coupon', '营销活动类别不能为空|营销活动类别值非法'],
        ['market_activity_id', 'require|checkHasValue:market_activity_id', '营销活动ID不能为空'],
    ];

    protected $scene = [
        'create' => ['user_id', 'address_id', 'goods_info', 'market_activity_type', 'market_activity_id'],
        'update' => ['user_id', 'address_id', 'goods_info', 'id'],
        'view'   => ['address_id', 'goods_info'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $address_id           = input('address_id');
        $market_activity_type = input('market_activity_type');
        $market_activity_id   = input('market_activity_id');
        $goods_info           = input('goods_info');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    $address = model('addresses')->findOne(['user_id' => $value, 'id' => $address_id]);
                    if ($address) {
                        if ($market_activity_type == 'coupon') {
                            $now = date("Y-m-d H:i:s", time());
                            $map = [
                                'id'          => $market_activity_id,
                                'expiry_time' => ['> time', $now],
                                'status'      => 1,
                                'user_id'     => $value,
                            ];
                            $coupon = model('user_coupons')->findOne($map);
                            if ($coupon) {
                                return true;
                            } else {
                                return '优惠券不可用';
                            }
                        } elseif ($market_activity_type == 'discount') {
                            $discount_rule = model('activity_discount_rules')->getOne($market_activity_id);
                            if ($discount_rule) {
                                if ($discount_rule['use_num'] >= $discount_rule['total_goods_num']) {
                                    return '限时折扣活动已结束';
                                } else {
                                    $get_goods_info = json_decode($goods_info, true);
                                    $buy_num        = 0;
                                    $use_num        = 0;
                                    foreach ($get_goods_info as $k => $v) {
                                        $buy_num = $v['num'];
                                    }

                                    $user_discount = model('user_discounts')->findOne(['user_id' => $value, 'activity_discount_rule_id' => $market_activity_id]);
                                    if ($user_discount) {
                                        $use_num = $user_discount['use_num'];
                                    }
                                    $can_num = $discount_rule['user_limit_buy_num'] - $use_num;

                                    if ($buy_num > $can_num) {
                                        if ($can_num > 0) {
                                            return '您在当前活动下本商品的剩余购买数量为' . $can_num . '件';
                                        } else {
                                            return '已达到当前限时折扣活动限购数量';
                                        }
                                    } else {
                                        return true;
                                    }
                                }
                            } else {
                                return '限时折扣活动不可用';
                            }
                        } else {
                            return true;
                        }
                    } else {
                        return '地址不存在';
                    }
                } else {
                    return '会员不存在';
                }
                break;
            case 'address_id':
                $address = model('addresses')->getOne($value);
                if ($address) {
                    $area_code = $address['area_code'];
                    $transport = model('transport_templates')->findOne(['status' => 1]);
                    if ($transport) {
                        if (in_array($area_code, $transport['area_codes'])) {
                            return true;
                        } else {
                            return '暂不支持当前地址';
                        }
                    } else {
                        return '系统暂未设定运费';
                    }
                } else {
                    return '地址不存在';
                }
                break;
            case 'goods_info':
                $goods_info = json_decode($value, true);
                if ($market_activity_type == 'discount') {
                    if (count($goods_info) !== 1) {
                        return '限时折扣活动商品仅限单独购买';
                    }
                }

                // 检查商品是否非法
                foreach ($goods_info as $key1 => $value1) {
                    $goods = model('goods')->getOne($value1['goods_id']);
                    if ($goods) {
                        if ($goods['status'] != 1) {
                            return '商品【' . $goods['name'] . '】已下架';
                            break;
                        }

                        if ($value1['spec_group_id']) {
                            $spec = model('goods_spec_groups')->findOne(['goods_id' => $value1['goods_id'], 'id' => $value1['spec_group_id']]);
                            if ($spec) {
                                if (intval($spec['stock']) < intval($value1['num'])) {
                                    return '商品【' . $goods['name'] . '】库存已不足';
                                    break;
                                }
                            } else {
                                return '商品组合ID参数错误';
                                break;
                            }
                        } else {
                            if (intval($goods['stock']) < intval($value1['num'])) {
                                return '商品【' . $goods['name'] . '】库存已不足';
                                break;
                            }
                        }
                    } else {
                        return '部分商品已下架，请重新下单';
                        break;
                    }
                }
                return true;
                break;
            case 'market_activity_id':
                if ($value && $market_activity_type) {
                    if ($market_activity_type == 'discount') {
                        $discount = model('activity_discount_rules')->getOne($value);
                        if ($discount) {
                            return true;
                        } else {
                            return '限时折扣活动不可用';
                        }
                    } elseif ($market_activity_type == 'full') {
                        $full = model('activity_full_rules')->getOne($value);
                        if ($full) {
                            return true;
                        } else {
                            return '满减促销活动不可用';
                        }
                    } elseif ($market_activity_type == 'coupon') {
                        return true;
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $order = model('orders')->getOne($value);
                if ($order) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
