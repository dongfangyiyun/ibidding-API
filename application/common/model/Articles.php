<?php
namespace app\common\model;

/*
 *  【文章模型】
 */
class Articles extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_articles';

    // 类型转换
    protected $type = [
        'imgs' => 'json',
    ];

    // 获取器【thum】
    public function getThumAttr($value, $data)
    {
        $thum = [$value => ($value ? get_host() . $value : '')];
        return $thum[$data['thum']];
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

    // 获取器【content】
    public function getContentAttr($value, $data)
    {
        $data_value = htmlspecialchars_decode($value);
        $str        = 'src="' . get_host() . '/public/upload/ueditor';
        $real_value = str_replace('src="/public/upload/ueditor', $str, $data_value);
        $content    = [$value => $real_value];
        return $content[$data['content']];
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['thum'])) {
                $model->thum = base64_to_img([$model->data['thum']], 200, 200)[0];
            }

            if (isset($model->data['imgs'])) {
                $model->imgs = base64_to_img(json_decode($model->data['imgs'], true));
            }
        });
    }
}
