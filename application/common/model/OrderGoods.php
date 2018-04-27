<?php
namespace app\common\model;

/*
 *  【订单商品商品模型】
 */
class OrderGoods extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_order_goods';

    // 获取器【thum】
    public function getThumAttr($value, $data)
    {
        $thum = [$value => ($value ? get_host() . $value : '')];
        return $thum[$data['thum']];
    }

    // 初始化
    protected static function init()
    {
        self::beforeInsert(function ($model) {
            if ($model->spec_group_id) {
                $goods_spec_group = model('goods_spec_groups')->getOne($model->spec_group_id);

                if ($goods_spec_group['thum']) {
                    $model->thum = $goods_spec_group['thum'];
                }

                $model->spec_group_info = $goods_spec_group['spec_option_group'];
                $model->sell_price      = $goods_spec_group['sell_price'];
                $model->weight          = $goods_spec_group['weight'];
            }

            $order = model('orders')->getOne($model->order_id);
            if ($order['market_activity_type'] == 'discount' && $order['market_activity_id']) {
                $discount_rule = model('activity_discount_rules')->getOne($order['market_activity_id']);
                // 更新活动规则中的已使用数量
                model('activity_discount_rules')->editOne(['id' => $order['market_activity_id'], 'use_num' => ($discount_rule['use_num'] + $model->num)]);

                $reduce_money = ($model->sell_price - $discount_rule['discount_price']) * $model->num;
                model('orders')->editOne(['id' => $model->order_id, 'market_reduce_money' => $reduce_money]);

                // 更新个人活动中的已使用数量
                $update_discount_data = [
                    'user_id'                   => $order['user_id'],
                    'activity_discount_rule_id' => $order['market_activity_id'],
                    'use_num'                   => $model->num,
                ];
                model('user_discounts')->addOne($update_discount_data);
            }
        });

        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['thum'])) {
                $model->thum = base64_to_img([$model->data['thum']])[0];
            }
        });
    }

    // 根据订单ID批量新增订单商品
    public function batchAddByOrderId($param)
    {
        $order_id = $param['order_id'];

        $order   = model('orders')->getOne($order_id);
        $user_id = $order['user_id'];

        $data = [];
        foreach ($param['goods_info'] as $key => $value) {
            $goods = model('goods')->getOne($value['goods_id']);

            $data[] = [
                'order_id'        => $order_id,
                'goods_id'        => $value['goods_id'],
                'user_id'         => $user_id,
                'spec_group_id'   => $value['spec_group_id'],
                'num'             => $value['num'],
                'name'            => $goods['name'],
                'thum'            => $goods['thum'],
                'intro'           => $goods['intro'],
                'standard'        => $goods['standard'],
                'spec_group_info' => '',
                'sell_price'      => $goods['sell_price'],
                'weight'          => $goods['weight'],
            ];

            model('carts')->cleanUserCartTrue(['user_id' => $user_id, 'goods_id' => $value['goods_id']]);
        }

        $result = $this->saveAll($data);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $result, 'msg' => '批量添加数据成功'];
        }
    }

    // 查询商品的价格与重量合计
    public function getOrderGoodsSum($order_id)
    {
        $order_goods  = $this->getAll(['order_id' => $order_id]);
        $total_price  = 0;
        $total_weight = 0;
        foreach ($order_goods as $key => $value) {
            $total_price += $value['sell_price'] * $value['num'];
            $total_weight += $value['weight'] * $value['num'];
        }

        return ['total_price' => $total_price, 'total_weight' => $total_weight];
    }

}
