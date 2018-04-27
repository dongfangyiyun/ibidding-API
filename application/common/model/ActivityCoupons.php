<?php
namespace app\common\model;

/*
 *  【优惠券模型】
 */
class ActivityCoupons extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_activity_coupons';

    // 获取器【nick_name】
    public function getNickNameAttr($value, $data)
    {
        $nick_name = [$value => (model('admins')->findOne(['id' => $data['admin_id']])['nick_name'])];
        return $nick_name[$data['nick_name']];
    }

    // 获取器【activity_name】
    public function getActivityNameAttr($value, $data)
    {
        $activity      = model('market_activities')->getOne($data['market_activity_id']);
        $activity_name = [$value => $activity['name']];
        return $activity_name[$data['activity_name']];
    }

    // 初始化
    protected static function init()
    {
        // 新增时创建优惠券编号
        self::beforeInsert(function ($model) {
            $model->coupon_no = make_order_no('C');
        });
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
            $data[$key]['activity_name'] = '';

        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['activity_name'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function updateUseNum($id, $num)
    {
        $result = $this->where('id', $id)->setInc('use_num', $num);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [$this->getOne($id)], 'msg' => '更新数据成功'];
        }
    }
}
