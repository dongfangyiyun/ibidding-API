<?php
namespace app\common\model;

/*
 *  【会员商品历史搜索关键词模型】
 */
class UserGoodsKeywords extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_user_goods_keywords';

    // 设置主键
    protected $pk = 'user_id';

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['user_id', 'create_time'];

    // 类型转换
    protected $type = [
        'keywords' => 'json',
    ];

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('create_time desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('create_time desc')->select();
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        return $this->where('user_id', $id)->find();
    }

    // 新增数据
    public function addOne($param)
    {
        $result = $this->save($param);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($this->user_id), 'msg' => '添加会员商品历史搜索关键词成功'];
        }
    }

    // 更新数据
    public function editOne($param)
    {
        $result = $this->save($param, ['user_id' => $param['user_id']]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => $this->getOne($param['user_id']), 'msg' => '更新会员商品历史搜索关键词成功'];
        }
    }

    // 删除数据（假删除）
    public function delOne($id)
    {
        $result = $this->save(['data_state' => 0], ['user_id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '删除会员商品历史搜索关键词成功'];
        }
    }

    // 删除数据（真删除）
    public function delOneTrue($id)
    {
        $this->where('user_id', $id)->delete();
        return ['code' => 1, 'data' => '', 'msg' => '删除会员商品历史搜索关键词成功'];
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        $result = $this->save(['data_state' => 0], ['user_id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量删除会员商品历史搜索关键词成功'];
        }
    }

    // 删除数据（批量真删除）
    public function delAllTrue($ids)
    {
        $result = $this->where(['user_id' => ['in', $ids]])->delete();
        return ['code' => 1, 'data' => [], 'msg' => '批量删除会员商品历史搜索关键词成功'];
    }

    // 批量操作
    public function batchUpdate($param, $ids)
    {
        $result = $this->save($param, ['user_id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量操作成功'];
        }
    }

    // 批量操作
    public function updateUserKeyword($token, $keyword)
    {
        $keyword = trim($keyword);
        if ($keyword) {
            $user_token = model('user_tokens')->findOne(['token' => $token]);
            if ($user_token) {
                $user_id        = $user_token['user_id'];
                $new_keywords   = [];
                $new_keywords[] = $keyword;

                $user_goods_keyword = $this->getOne($user_id);
                if ($user_goods_keyword) {
                    if (in_array($keyword, $user_goods_keyword['keywords'])) {
                        foreach ($user_goods_keyword['keywords'] as $key => $value) {
                            if ($key <= 3 && $value != $keyword) {
                                $new_keywords[] = $value;
                            }
                        }
                    } else {
                        foreach ($user_goods_keyword['keywords'] as $key => $value) {
                            if ($key <= 3) {
                                $new_keywords[] = $value;
                            }
                        }
                    }

                    $this->editOne(['user_id' => $user_id, 'keywords' => $new_keywords]);
                } else {
                    $this->addOne(['user_id' => $user_id, 'keywords' => $new_keywords]);
                }
            }
        }

        return;
    }

}
