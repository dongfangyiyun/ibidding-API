<?php
namespace app\api_goods\validate;

use think\Validate;

class SpecTemplate extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '规格模板ID不能为空'],
        ['template_name', 'require|max:255', '规格模板名称不能为空|规格模板名称最大限255字符'],
    ];

    protected $scene = [
        'create' => ['template_name'],
        'update' => ['template_name', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $spec_template = model('spec_templates')->getOne($value);
                if ($spec_template) {
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
