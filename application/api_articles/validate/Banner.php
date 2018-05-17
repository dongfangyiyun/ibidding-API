<?php
namespace app\api_articles\validate;

use think\Validate;

class Banner extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '轮播图ID不能为空'],
        ['type', 'require|max:50', '轮播图类别不能为空|轮播图类别最大限50字符'],
        ['name', 'require|max:255', '轮播图名称不能为空|轮播图名称最大限255字符'],
        ['alt', 'max:255', '轮播图alt属性限255字符'],
        ['position', 'max:50', '轮播图位置限50字符'],
        ['is_open_model', 'in:0,1', '是否开启模型状态值非法'],
        ['status', 'in:1,2', '轮播图状态值非法'],
    ];

    protected $scene = [
        'create' => ['type', 'name', 'alt', 'position', 'is_open_model', 'status'],
        'update' => ['type', 'name', 'alt', 'position', 'status', 'is_open_model', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $banner = model('banners')->getOne($value);
                if ($banner) {
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
