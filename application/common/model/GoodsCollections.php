<?php
namespace app\common\model;

/*
 *  【商品收藏模型】
 */
class GoodsCollections extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_goods_collections';

    // 获取器【goods_info】
    public function getGoodsInfoAttr($value, $data)
    {
        $goods_info = [$value => model('goods')->getOne($data['goods_id'])];
        return $goods_info[$data['goods_info']];
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
            $data[$key]['goods_info'] = '';
            $data[$key]['user_info']  = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['goods_info'] = '';
            $data['user_info']  = '';
        }

        return $data;
    }

    public function batchAddByGoodsIds($param)
    {
        $user_id = $param['user_id'];
        $data    = [];
        foreach ($param['goods_ids'] as $goods_id) {
            $goods_collection = $this->findOne(['user_id' => $user_id, 'goods_id' => $goods_id]);
            if (!$goods_collection) {
                $data[] = [
                    'user_id'  => $user_id,
                    'goods_id' => $goods_id,
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
