<?php
namespace app\api_query\validate;

use think\Validate;

class GoodsComment extends Validate
{
    protected $rule = [
        ['goods_id', 'require|checkHasValue:goods_id', '商品ID不能为空'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'goods_id':
                $goods = model('goods')->getOne($value);
                if ($goods) {
                    return true;
                } else {
                    return '商品不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
