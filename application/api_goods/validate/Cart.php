<?php
namespace app\api_goods\validate;

use think\Validate;

class Cart extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '购物车ID不能为空'],
        ['user_id', 'require|checkHasValue:user_id', '会员ID不能为空'],
        ['goods_id', 'require|checkHasValue:goods_id', '商品ID不能为空'],
        ['spec_group_id', 'require|checkHasValue:spec_group_id', '商品组合ID不能为空'],
        ['num', 'require|number|min:1', '商品数量不能为空|商品数量必须为整数|商品数量最小为1'],
        ['status', 'in:1,2', '购物车状态值非法'],
    ];

    protected $scene = [
        'create' => ['user_id', 'goods_id', 'spec_group_id', 'num', 'status'],
        'update' => ['user_id', 'goods_id', 'spec_group_id', 'num', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $goods_id = input('goods_id');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    return true;
                } else {
                    return '会员ID不存在';
                }
                break;
            case 'goods_id':
                $goods = model('goods')->getOne($value);
                if ($goods) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            case 'spec_group_id':
                if ($value) {
                    $goods_spec_group = model('goods_spec_groups')->findOne(['id' => $value, 'goods_id' => $goods_id]);
                    if ($goods_spec_group) {
                        return true;
                    } else {
                        return '商品组合ID不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $cart = model('carts')->getOne($value);
                if ($cart) {
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
