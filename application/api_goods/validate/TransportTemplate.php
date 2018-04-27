<?php
namespace app\api_goods\validate;

use think\Validate;

class TransportTemplate extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '运费模板ID不能为空'],
        ['template_name', 'require|max:255', '运费模板名称不能为空|运费模板名称最大限255字符'],
        ['basic_weight', 'require|numValue', '基本重量不能为空|基本重量必须为整数或小数'],
        ['basic_price', 'require|numValue', '基本价格不能为空|基本价格必须为整数或小数'],
        ['add_weight', 'require|numValue', '增加重量不能为空|增加重量必须为整数或小数'],
        ['add_price', 'require|numValue', '增加价格不能为空|增加价格必须为整数或小数'],
        ['area_codes', 'require|array', '地区codes不能为空|地区codes必须为数组'],
        ['status', 'require|in:1,2', '模板状态不能为空|模板状态值非法'],
    ];

    protected $regex = [
        'numValue' => '/^[0-9]+([.]{1}[0-9]+){0,1}$/',
    ];

    protected $scene = [
        'create' => ['template_name', 'basic_weight', 'basic_price', 'add_weight', 'add_price', 'area_codes', 'status'],
        'update' => ['template_name', 'basic_weight', 'basic_price', 'add_weight', 'add_price', 'area_codes', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $transport_template = model('transport_templates')->getOne($value);
                if ($transport_template) {
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
