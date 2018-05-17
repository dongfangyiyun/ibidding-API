<?php
namespace app\api_bids\validate;

use think\Validate;

class BidArea extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '地区标签ID不能为空'],
        ['name', 'require|max:255|checkHasValue:name', '地区标签名称不能为空|地区标签名称最大限255字符'],
        ['pid', 'require|checkHasValue:pid', '地区标签父ID不能为空'],
        ['status', 'in:1,2', '地区标签状态值非法'],
    ];

    protected $scene = [
        'create' => ['name', 'pid', 'status'],
        'update' => ['name', 'pid', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $id = input('id');

        switch ($rule) {
            case 'name':
                if ($this->currentScene == 'create') {
                    $bid_area = model('bid_areas')->findOne(['name' => $value]);
                    if ($bid_area) {
                        return '地区标签已存在';
                    } else {
                        return true;
                    }
                } elseif ($this->currentScene == 'update') {
                    $bid_area = model('bid_areas')->findOne(['name' => $value, 'id' => ['neq', $id]]);
                    if ($bid_area) {
                        return '地区标签已存在';
                    } else {
                        return true;
                    }
                }
                break;
            case 'pid':
                if ($value) {
                    $bid_area = model('bid_areas')->getOne($value);
                    if ($bid_area) {
                        if ($id) {
                            if ($value == $id) {
                                return '地区标签父ID不能为自身ID';
                            } else {
                                return true;
                            }
                        } else {
                            return true;
                        }
                    } else {
                        return '地区标签父ID不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $bid_area = model('bid_areas')->getOne($value);
                if ($bid_area) {
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
