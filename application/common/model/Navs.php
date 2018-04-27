<?php
namespace app\common\model;

/*
 *  【菜单模型】
 */
class Navs extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_navs';

    // 获取器【thum】
    public function getThumAttr($value, $data)
    {
        $thum = [$value => ($value ? get_host() . $value : '')];
        return $thum[$data['thum']];
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['thum'])) {
                $model->thum = base64_to_img([$model->data['thum']], 200, 200)[0];
            }
        });
    }

    // 查询全部(tree)
    public function getAllTree($where = [])
    {
        $data = $this->where($where)->order('sort desc,id desc')->select();
        return json_decode(json_encode($data), true);
    }
}
