<?php
namespace app\api_market\validate;

use think\Validate;

class Coupon extends Validate
{
    protected $rule = [
        ['id', 'require|checkHasValue:id', '营销活动ID不能为空'],
        ['market_activity_id', 'require|checkHasValue:market_activity_id', '活动不能为空'],
        ['coupon_type', 'require|in:discount,full', '优惠券类别不能为空|优惠券类别值非法'],
        ['expiry_time', 'require|date|checkHasValue:expiry_time', '过期时间不能为空|过期时间值非法'],
        ['reach_money', 'require|number', '满金额不能为空|满金额必须为数值'],
        ['change_value', 'require|number|checkHasValue:change_value', '优惠值不能为空|优惠值必须为数值'],
        ['issue_num', 'require|number|>=:1', '优惠券发行数量不能为空|优惠券发行数量值非法|优惠券发行数量值不能小于1'],
        ['use_num', 'require|number|>=:0', '优惠券认领数量不能为空|优惠券认领数量值非法|优惠券认领数量值不能小于0'],
        ['status', 'require|in:1,2', '状态不能为空|状态值非法'],
    ];

    protected $scene = [
        'create' => ['market_activity_id', 'coupon_type', 'expiry_time', 'reach_money', 'change_value', 'issue_num', 'use_num', 'status'],
        'update' => ['market_activity_id', 'coupon_type', 'expiry_time', 'reach_money', 'change_value', 'issue_num', 'use_num', 'status', 'id'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $coupon_type = input('coupon_type');
        $reach_money = input('reach_money');

        switch ($rule) {
            case 'market_activity_id':
                $market_activity = model('market_activities')->findOne(['id' => $value, 'type' => 'coupon']);
                if ($market_activity) {
                    return true;
                } else {
                    return '活动不存在';
                }
                break;
            case 'expiry_time':
                if (strtotime($value) <= time()) {
                    return '优惠券过期时间必须大于当前时间';
                } else {
                    return true;
                }
                break;
            case 'change_value':
                if ($coupon_type == 'discount' && floatval($value) >= 10) {
                    return '折扣优惠券的优惠折扣必须小于10';
                } elseif ($coupon_type == 'full' && floatval($value) >= floatval($reach_money)) {
                    return '满减优惠券的减免金额必须小于使用所需金额';
                } else {
                    return true;
                }
                break;
            case 'id':
                $coupon = model('activity_coupons')->getOne($value);
                if ($coupon) {
                    return true;
                } else {
                    return '优惠券数据不存在';
                }
                break;
            default:
                # code...
                break;
        }
    }
}
