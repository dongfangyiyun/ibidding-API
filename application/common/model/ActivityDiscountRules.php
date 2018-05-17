<?php
namespace app\common\model;

/*
 *  【限时折扣活动规则模型】
 */
class ActivityDiscountRules extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_activity_discount_rules';

    // 类型转换
    protected $type = [
        'user_level_ids' => 'json',
    ];

    // 获取器【activity_name】
    public function getActivityNameAttr($value, $data)
    {
        $activity      = model('market_activities')->getOne($data['market_activity_id']);
        $activity_name = [$value => $activity['name']];
        return $activity_name[$data['activity_name']];
    }

    // 获取器【goods_info】
    public function getGoodsInfoAttr($value, $data)
    {
        $goods = model('goods')->getOne($data['goods_id']);
        if (!$goods) {
            $goods = (object) [];
        }

        $goods_info = [$value => $goods];
        return $goods_info[$data['goods_info']];
    }

    // 获取器【user_level_info】
    public function getUserLevelInfoAttr($value, $data)
    {
        $user_levels = model('user_levels')->getColumn(['id' => ['in', json_decode($data['user_level_ids'], true)]], 'name');

        $user_level_info = [$value => implode(",", $user_levels)];
        return $user_level_info[$data['user_level_info']];
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['activity_name']   = '';
            $data[$key]['user_level_info'] = '';
            $data[$key]['goods_info']      = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['activity_name']   = '';
            $data['user_level_info'] = '';
            $data['goods_info']      = '';
        }

        return $data;
    }

    // 查询全部(含分页)
    public function getAllBasicInfo($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('id desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('id desc')->select();
        }

        return $data;
    }
}
