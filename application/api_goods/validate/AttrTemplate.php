<?php
namespace app\api_goods\validate;

use think\Validate;

class AttrTemplate extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '属性模板ID不能为空'],
        ['template_name', 'require|max:255', '属性模板名称不能为空|属性模板名称最大限255字符'],
    ];

    protected $scene = [
        'create' => ['template_name'],
        'update' => ['template_name', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $attr_template = model('attr_templates')->getOne($value);
                if ($attr_template) {
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
