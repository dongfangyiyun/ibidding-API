<?php
namespace app\common\model;

/*
 *  【招投标信息收藏模型】
 */
class BidCollections extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_bid_collections';

    // 获取器【bid_info】
    public function getBidInfoAttr($value, $data)
    {
        return model('bids')->getOne($data['bid_id']);
    }

    // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        return model('users')->getUserBasicInfo($data['user_id']);
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
            $data[$key]['bid_info'] = '';
            $data[$key]['user_info']  = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['bid_info'] = '';
            $data['user_info']  = '';
        }

        return $data;
    }

    public function batchAddByBidIds($param)
    {
        $user_id = $param['user_id'];
        $data    = [];
        foreach ($param['bid_ids'] as $bid_id) {
            $bid_collection = $this->findOne(['user_id' => $user_id, 'bid_id' => $bid_id]);
            if (!$bid_collection) {
                $data[] = [
                    'user_id'  => $user_id,
                    'bid_id' => $bid_id,
                ];
            }
        }

        $result = $this->saveAll($data);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量添加数据成功'];
        }
    }
}
