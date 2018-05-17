<?php
namespace app\api_articles\validate;

use think\Validate;

class Guide extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '规则ID不能为空'],
        ['type', 'require|max:50', '规则类别不能为空|规则类别最大限50字符'],
        ['title', 'require|max:255', '规则标题不能为空|规则标题最大限255字符'],
        ['author', 'max:50', '作者限50字符'],
        ['status', 'in:1,2', '规则状态值非法'],
        ['imgs', 'array', '规则图片集数据类型值非法'],
    ];

    protected $scene = [
        'create' => ['type', 'title', 'author', 'status', 'imgs'],
        'update' => ['type', 'title', 'author', 'status', 'imgs', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $guide = model('guides')->getOne($value);
                if ($guide) {
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
