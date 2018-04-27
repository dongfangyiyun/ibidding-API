<?php
namespace app\common\model;

/*
 *  【会员充值模型】
 */
class UserRecharges extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_user_recharges';

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        $user_info = [$value => model('users')->getUserBasicInfo($data['user_id'])];
        return $user_info[$data['user_info']];
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
            $data[$key]['user_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['user_info'] = '';
        }

        return $data;
    }

    // 初始化
    protected static function init()
    {
        self::beforeInsert(function ($model) {
            $model->order_no = make_order_no('R');
        });
    }
}
