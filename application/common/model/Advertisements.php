<?php
namespace app\common\model;

/*
 *  【广告模型】
 */
class Advertisements extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_advertisements';

    // 获取器【img】
    public function getImgAttr($value, $data)
    {
        $img = [$value => ($value ? get_host() . $value : '')];
        return $img[$data['img']];
    }

    // 获取器【memo】
    public function getMemoAttr($value, $data)
    {
        $memo = [$value => ($value ? $value : '')];
        return $memo[$data['memo']];
    }

    // 获取器【href】
    public function getHrefAttr($value, $data)
    {
        $href = [$value => ($value ? $value : '')];
        return $href[$data['href']];
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
