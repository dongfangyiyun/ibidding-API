<?php
namespace app\common\model;

/*
 *  【会员积分日志日志模型】
 */
class ScoreLogs extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_score_logs';

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        $user_info = [$value => model('users')->getUserBasicInfo($data['user_id'])];
        return $user_info[$data['user_info']];
    }

    // 获取器【symbol】
    public function getSymbolAttr($value, $data)
    {
        switch ($data['change_type']) {
            case 'login':
                $result = '+';
                break;
            default:
                $result = '';
                break;
        }

        $symbol = [$value => $result];
        return $symbol[$data['symbol']];
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
            $data[$key]['symbol']    = '';
            $data[$key]['user_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['symbol']    = '';
            $data['user_info'] = '';
        }

        return $data;
    }

    public function addScoreByLogin($user_id)
    {
        $result = model('user_assets')->where(['user_id' => $user_id])->setInc('score', 1);

        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            $score_log_data = [
                'user_id'     => $user_id,
                'change_type' => 'login',
                'change_num'  => 1,
                'intro'       => '会员登录',
                'desc'        => '会员登录，登录时间' . date("Y-m-d H:i:s", time()),
            ];
            $this->addOne($score_log_data);

            return ['code' => 1, 'data' => [], 'msg' => '操作成功'];
        }
    }
}
