<?php
namespace app\api_bids\validate;

use think\Validate;

class BidCollection extends Validate
{
    protected $rule = [
        ['user_id', 'require|checkHasValue:user_id', '会员ID不能为空'],
        ['bid_id', 'require|checkHasValue:bid_id', '信息ID不能为空'],
        ['bid_ids', 'require|array|checkHasValue:bid_ids', '信息IDs不能为空|信息IDs值非法'],
    ];

    protected $scene = [
        'create'       => ['user_id', 'bid_id'],
        'cancel'       => ['user_id', 'bid_id'],
        'batch_create' => ['user_id', 'bid_ids'],
    ];

    protected function checkHasValue($value, $rule)
    {
        $bid_id  = input('bid_id');

        switch ($rule) {
            case 'user_id':
                $user = model('users')->getOne($value);
                if ($user) {
                    return true;
                } else {
                    return '会员ID不存在';
                }
                break;
            case 'bid_id':
                $bid = model('bids')->getOne($value);
                if ($bid) {
                    return true;
                } else {
                    return '数据不存在';
                }
                break;
            case 'bid_ids':
                foreach ($value as $current_bid_id) {
                    $bid = model('bids')->getOne($current_bid_id);
                    if (!$bid) {
                        return '信息【' . $bid['name'] . '】已下线';
                        break;
                    }
                }
                return true;
                break;
            default:
                # code...
                break;
        }
    }
}
