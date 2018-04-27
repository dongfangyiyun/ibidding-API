<?php
namespace app\common\model;

/*
 *  【会员资产日志日志模型】
 */
class UserAssetLogs extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_user_asset_logs';

    // 获取器【symbol】
    public function getSymbolAttr($value, $data)
    {
        switch ($data['change_type']) {
            case 'user_drawcash':
                $result = '-';
                break;
            case 'user_drawcash_not_agree':
                $result = '+';
                break;
            default:
                $result = '';
                break;
        }

        $symbol = [$value => $result];
        return $symbol[$data['symbol']];
    }

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
}
