<?php
namespace app\api_articles\validate;

use think\Validate;

class Annoncement extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '公告ID不能为空'],
        ['type', 'require|max:50', '公告类别不能为空|公告类别最大限50字符'],
        ['title', 'require|max:255', '公告标题不能为空|公告标题最大限255字符'],
        ['author', 'max:50', '作者限50字符'],
        ['status', 'in:1,2', '公告状态值非法'],
        ['imgs', 'array', '公告图片集数据类型值非法'],
    ];

    protected $scene = [
        'create' => ['type', 'title', 'author', 'status', 'imgs'],
        'update' => ['type', 'title', 'author', 'status', 'imgs', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $annoncement = model('annoncements')->getOne($value);
                if ($annoncement) {
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
