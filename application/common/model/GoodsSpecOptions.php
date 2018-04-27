<?php
namespace app\common\model;

/*
 *  【商品规格项模型】
 */
class GoodsSpecOptions extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_goods_spec_options';

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

     // 删除数据（批量假删除）
    public function delAllTrueByGoodsId($goods_id)
    {
        $result = $this->where(['goods_id' => $goods_id])->delete();
        if (false === $result) {
            return ['code' => 0, 'data' => [], 'msg' => $this->getError()];
        } else {
            return ['code' => 1, 'data' => [], 'msg' => '批量删除数据成功'];
        }
    }
}
