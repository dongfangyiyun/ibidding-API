<?php
namespace app\api_bids\validate;

use think\Validate;

class Bid extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '信息ID不能为空'],
        ['title', 'require|max:255', '信息标题不能为空|信息标题最大限255字符'],
        ['status', 'in:1,2', '信息状态值非法'],
    ];

    protected $scene = [
        'create' => ['type_id', 'title', 'status'],
        'update' => ['type_id', 'title', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'type_id':
                $bid_type = model('bid_types')->getOne($value);
                if ($bid_type) {
                    return true;
                } else {
                    return '信息分类不存在';
                }
                break;
            case 'id':
                $bid = model('bids')->getOne($value);
                if ($bid) {
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
