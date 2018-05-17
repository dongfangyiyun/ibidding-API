<?php
namespace app\api_market\validate;

use think\Validate;

class MarketActivity extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '营销活动ID不能为空'],
        ['type', 'require|in:discount,full,coupon', '活动类型不能为空|活动类型值非法'],
        ['name', 'require|max:255', '活动名称不能为空|活动名称最大限255字符'],
        ['begin_time', 'require', '活动开始时间不能为空'],
        ['end_time', 'require', '活动结束时间不能为空'],
        ['status', 'require|in:1,2', '活动状态不能为空|活动状态值非法'],
    ];

    protected $scene = [
        'create' => ['type', 'name', 'begin_time', 'end_time', 'status'],
        'update' => ['type', 'name', 'begin_time', 'end_time', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        switch ($rule) {
            case 'id':
                $market_activity = model('market_activities')->getOne($value);
                if ($market_activity) {
                    return true;
                } else {
                    return '活动数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
