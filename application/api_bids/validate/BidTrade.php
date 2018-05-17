<?php
namespace app\api_bids\validate;

use think\Validate;

class BidTrade extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '行业标签ID不能为空'],
        ['name', 'require|max:255|checkHasValue:name', '行业标签名称不能为空|行业标签名称最大限255字符'],
        ['pid', 'require|checkHasValue:pid', '行业标签父ID不能为空'],
        ['status', 'in:1,2', '行业标签状态值非法'],
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
                    $bid_trade = model('bid_trades')->findOne(['name' => $value]);
                    if ($bid_trade) {
                        return '行业标签已存在';
                    } else {
                        return true;
                    }
                } elseif ($this->currentScene == 'update') {
                    $bid_trade = model('bid_trades')->findOne(['name' => $value, 'id' => ['neq', $id]]);
                    if ($bid_trade) {
                        return '行业标签已存在';
                    } else {
                        return true;
                    }
                }
                break;
            case 'pid':
                if ($value) {
                    $bid_trade = model('bid_trades')->getOne($value);
                    if ($bid_trade) {
                        if ($id) {
                            if ($value == $id) {
                                return '行业标签父ID不能为自身ID';
                            } else {
                                return true;
                            }
                        } else {
                            return true;
                        }
                    } else {
                        return '行业标签父ID不存在';
                    }
                } else {
                    return true;
                }
                break;
            case 'id':
                $bid_trade = model('bid_trades')->getOne($value);
                if ($bid_trade) {
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
