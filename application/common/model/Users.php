<?php
namespace app\common\model;

/*
 *  【会员模型】
 */
class Users extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_users';

    // 类型转换
    protected $type = [
        'role_ids' => 'json',
    ];

    // 获取器【avatar】
    public function getAvatarAttr($value, $data)
    {
        $avatar = [$value => ($value ? get_host() . $value : '')];
        return $avatar[$data['avatar']];
    }

    // 获取器【user_level】
    public function getUserLevelAttr($value, $data)
    {
        $level_info = model('user_levels')->getOneByUserId($data['id']);

        $user_level = [$value => $level_info['name']];
        return $user_level[$data['user_level']];
    }

    // 获取器【user_level_id】
    public function getUserLevelIdAttr($value, $data)
    {
        $level_info = model('user_levels')->getOneByUserId($data['id']);

        $user_level_id = [$value => $level_info['id']];
        return $user_level_id[$data['user_level_id']];
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['avatar'])) {
                $model->avatar = base64_to_img([$model->data['avatar']], 200, 200)[0];
            }
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
            $data[$key]['user_level']    = '';
            $data[$key]['user_level_id'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['user_level']    = '';
            $data['user_level_id'] = '';
        }

        return $data;
    }

    // 根据guid获取会员信息
    public function getOneByGuid($guid)
    {
        $user_account = model('user_accounts')->findOne(['guid' => $guid]);
        if ($user_account) {
            return $this->getOne($user_account['user_id']);
        } else {
            return [];
        }
    }

    // 删除数据（假删除）
    public function delOne($id)
    {
        $result = $this->save(['data_state' => 0], ['id' => $id]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            model('user_accounts')->delAllByUserIds([$id]);
            return ['code' => 1, 'data' => [], 'msg' => '删除会员成功'];
        }
    }

    // 删除数据（真删除）
    public function delOneTrue($id)
    {
        $result = $this->where('id', $id)->delete();
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            model('user_accounts')->delAllByUserIds([$id]);
            return ['code' => 1, 'data' => [], 'msg' => '删除会员成功'];
        }
    }

    // 删除数据（批量假删除）
    public function delAll($ids)
    {
        $result = $this->save(['data_state' => 0], ['id' => ['in', $ids]]);
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            model('user_accounts')->delAllByUserIds($ids);
            return ['code' => 1, 'data' => [], 'msg' => '删除会员成功'];
        }
    }

    // 获取会员基本信息
    public function getUserBasicInfo($user_id)
    {
        return $this->where('id', $user_id)->field('id,mobile,nick_name,avatar')->find();
    }
}
