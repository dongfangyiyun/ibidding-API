<?php
namespace app\api_goods\validate;

use think\Validate;

class GoodsCate extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '商品分类ID不能为空'],
        ['name', 'require|max:255', '商品分类名称不能为空|商品分类名称最大限255字符'],
        ['pid', 'require|checkHasValue:pid', '商品分类父ID不能为空'],
        ['spec_template_id', 'require|checkHasValue:spec_template_id', '商品规格模板不能为空'],
        ['attr_template_id', 'require|checkHasValue:attr_template_id', '商品属性模板不能为空'],
        ['status', 'require|in:1,2', '商品分类状态值不能为空|商品分类状态值非法'],
    ];

    protected $scene = [
        'create' => ['name', 'pid', 'spec_template_id', 'status'],
        'update' => ['name', 'pid', 'attr_template_id', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'pid':
                if ($value) {
                    $goods_cate = model('goods_cates')->getOne($value);
                    if ($goods_cate) {
                        if ($id) {
                            if ($value == $id) {
                                return '商品分类父ID不能为自身ID';
                            } else {
                                return true;
                            }
                        } else {
                            return true;
                        }
                    } else {
                        return '商品分类父ID不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'spec_template_id':
                if ($value) {
                    $spec_template = model('spec_templates')->getOne($value);
                    if ($spec_template) {
                        return true;
                    } else {
                        return '商品规格模板不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'attr_template_id':
                if ($value) {
                    $attr_template = model('attr_templates')->getOne($value);
                    if ($attr_template) {
                        return true;
                    } else {
                        return '商品属性模板不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'pid':
                if ($value) {
                    $goods_cate = model('goods_cates')->getOne($value);
                    if ($goods_cate) {
                        if ($id) {
                            if ($value == $id) {
                                return '商品分类父ID不能为自身ID';
                            } else {
                                return true;
                            }
                        } else {
                            return true;
                        }
                    } else {
                        return '商品分类父ID不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $goods_cate = model('goods_cates')->getOne($value);
                if ($goods_cate) {
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
