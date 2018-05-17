<?php
namespace app\api_goods\validate;

use think\Validate;

class SpecName extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '规格ID不能为空'],
        ['spec_template_id', 'require|checkHasValue:spec_template_id', '规格模板ID不能为空'],
        ['name', 'require|max:255', '规格名称不能为空|规格名称最大限255字符'],
        ['sort', 'require|number', '规格排序不能为空|规格排序值必须为整数'],
    ];

    protected $scene = [
        'create' => ['spec_template_id', 'name', 'sort'],
        'update' => ['spec_template_id', 'name', 'sort', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'spec_template_id':
                $spec_template = model('spec_templates')->getOne($value);
                if ($spec_template) {
                    return true;
                } else {
                    return '规格模板不存在';
                }
                break;
            case 'id':
                $spec = model('spec_options')->getOne($value);
                if ($spec) {
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
