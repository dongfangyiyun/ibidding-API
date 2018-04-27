<?php
namespace app\common\model;

/*
 *  【轮播图模型】
 */
class Banners extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_banners';

    // 获取器【img】
    public function getImgAttr($value, $data)
    {
        $img = [$value => ($value ? get_host() . $value : '')];
        return $img[$data['img']];
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['img'])) {
                $model->img = base64_to_img([$model->data['img']])[0];
            }
        });
    }
}
