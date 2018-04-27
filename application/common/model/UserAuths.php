<?php
namespace app\common\model;

/*
 *  【会员认证模型】
 */
class UserAuths extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_user_auths';

    // 类型转换
    protected $type = [
        'imgs' => 'json',
    ];

    // 获取器【id_card_front_img】
    public function getIdCardFrontImgAttr($value, $data)
    {
        $id_card_front_img = [$value => ($value ? get_host() . $value : '')];
        return $id_card_front_img[$data['id_card_front_img']];
    }

    // 获取器【id_card_back_img】
    public function getIdCardBackImgAttr($value, $data)
    {
        $id_card_back_img = [$value => ($value ? get_host() . $value : '')];
        return $id_card_back_img[$data['id_card_back_img']];
    }

    // 获取器【imgs】
    public function getImgsAttr($value, $data)
    {
        $imgs = json_decode($value);
        foreach ($imgs as $key => $img) {
            $imgs[$key] = $img ? get_host() . $img : '';
        }

        $imgs = [$value => $imgs];
        return $imgs[$data['imgs']];
    }

     // 获取器【user_info】
    public function getUserInfoAttr($value, $data)
    {
        $user_info = [$value => model('users')->getUserBasicInfo($data['user_id'])];
        return $user_info[$data['user_info']];
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            $model->thum              = isset($model->data['thum']) ? base64_to_img([$model->data['thum']], 200, 200)[0] : '';
            $model->id_card_front_img = isset($model->data['id_card_front_img']) ? base64_to_img([$model->data['id_card_front_img']], 400, 240)[0] : '';
            $model->id_card_back_img  = isset($model->data['id_card_back_img']) ? base64_to_img([$model->data['id_card_back_img']], 400, 240)[0] : '';
            $model->imgs              = isset($model->data['imgs']) ? base64_to_img(json_decode($model->data['imgs'], true)) : [];
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
}
