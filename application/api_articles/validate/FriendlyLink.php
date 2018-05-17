<?php
namespace app\api_articles\validate;

use think\Validate;

class FriendlyLink extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '友情链接ID不能为空'],
        ['type', 'require|max:50', '友情链接类别不能为空|友情链接类别最大限50字符'],
        ['name', 'require|max:255', '友情链接名称不能为空|友情链接名称最大限255字符'],
        ['alt', 'max:255', '友情链接alt属性限255字符'],
        ['position', 'max:50', '友情链接位置限50字符'],
        ['is_open_model', 'in:0,1', '是否开启模型状态值非法'],
        ['status', 'in:1,2', '友情链接状态值非法'],
    ];

    protected $scene = [
        'create' => ['type', 'name', 'alt', 'position', 'is_open_model', 'status'],
        'update' => ['type', 'name', 'alt', 'position', 'is_open_model', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $friendly_link = model('friendly_links')->getOne($value);
                if ($friendly_link) {
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
