<?php
namespace app\api_goods\validate;

use think\Validate;

class Goods extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '商品ID不能为空'],
        ['goods_cate_id', 'require|checkHasValue:goods_cate_id', '商品类别不能为空'],
        ['goods_no', 'max:50', '商品编码限50字符'],
        ['goods_code', 'max:50', '商品条码限50字符'],
        ['is_virtual', 'require|in:0,1', '是否为虚拟商品不能为空|是否为虚拟商品值非法'],
        ['name', 'require|max:255', '商品名称不能为空|商品名称最大限255字符'],
        ['standard', 'max:255', '商品规格最大限255字符'],
        ['stock', 'number', '商品库存数量值必须为数值'],
        ['weight', 'number', '商品重量必须为数值'],
        ['cost_price', 'number', '商品成本价必须为数值'],
        ['sell_price', 'number', '商品销售价必须为数值数'],
        ['market_price', 'number', '商品市场价必须为数值'],
        ['red_price', 'number', '商品红包价必须为数值'],
        ['sell_num', 'number', '商品销售量必须为整数'],
        ['click_num', 'number', '商品点击量必须为整数'],
        ['collect_num', 'number', '商品收藏量必须为整数'],
        ['sort', 'number', '商品排序值必须为整数'],
        ['is_top', 'require|in:0,1', '是否置顶商品不能为空|是否置顶商品值非法'],
        ['score', 'require|in:1,2,3,4,5', '商品综合评分不能为空|商品综合评分值非法'],
        ['status', 'require|in:1,2', '商品状态不能为空|商品状态值非法'],
    ];

    protected $scene = [
        'create' => ['goods_cate_id', 'goods_no', 'goods_code', 'is_virtual', 'name', 'standard', 'stock', 'weight', 'cost_price', 'sell_price', 'market_price', 'red_price', 'sell_num', 'click_num', 'collect_num', 'sort', 'is_top', 'score', 'status'],
        'update' => ['goods_cate_id', 'goods_no', 'goods_code', 'is_virtual', 'name', 'standard', 'stock', 'weight', 'cost_price', 'sell_price', 'market_price', 'red_price', 'sell_num', 'click_num', 'collect_num', 'sort', 'is_top', 'score', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $goods_spec_group_info = input('goods_spec_group_info/a');

        switch ($rule) {
            case 'goods_cate_id':
                $goods_cate = model('goods_cates')->getOne($value);
                if ($goods_cate) {
                    if ($goods_cate['spec_template_id'] && empty($goods_spec_group_info)) {
                        return '请设置商品规格';
                    } else {
                        return true;
                    }
                } else {
                    return '商品分类不存在';
                }
                break;
            case 'id':
                $goods = model('goods')->getOne($value);
                if ($goods) {
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
