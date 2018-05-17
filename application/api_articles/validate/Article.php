<?php
namespace app\api_articles\validate;

use think\Validate;

class Article extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '文章ID不能为空'],
        ['type_id', 'require|checkHasValue:type_id', '文章类别不能为空'],
        ['title', 'require|max:255', '文章标题不能为空|文章标题最大限255字符'],
        ['author', 'max:50', '作者限50字符'],
        ['status', 'in:1,2', '文章状态值非法'],
        ['imgs', 'array', '文章图片集数据类型值非法'],
    ];

    protected $scene = [
        'create' => ['type_id', 'title', 'author', 'status', 'imgs'],
        'update' => ['type_id', 'title', 'author', 'status', 'imgs', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'type_id':
                $article_type = model('article_types')->getOne($value);
                if ($article_type) {
                    return true;
                } else {
                    return '文章分类不存在';
                }
                break;
            case 'id':
                $article = model('articles')->getOne($value);
                if ($article) {
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
