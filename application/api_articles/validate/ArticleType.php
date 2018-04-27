<?php
namespace app\api_articles\validate;

use think\Validate;

class ArticleType extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '文章分类ID不能为空'],
        ['name', 'require|max:255', '文章分类名称不能为空|文章分类名称最大限255字符'],
        ['pid', 'require|checkHasValue:pid', '文章分类父ID不能为空'],
        ['status', 'in:1,2', '文章分类状态值非法'],
    ];

    protected $scene = [
        'create' => ['name', 'pid', 'status'],
        'update' => ['name', 'pid', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'pid':
                if ($value) {
                    $article_type = model('article_types')->getOne($value);
                    if ($article_type) {
                        if ($id) {
                            if ($value == $id) {
                                return '文章分类父ID不能为自身ID';
                            } else {
                                return true;
                            }
                        } else {
                            return true;
                        }
                    } else {
                        return '文章分类父ID不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $article_type = model('article_types')->getOne($value);
                if ($article_type) {
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
