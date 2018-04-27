<?php
namespace app\common\model;

/*
 *  【友情链接模型】
 */
class FriendlyLinks extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_friendly_links';

    // 获取器【img】
    public function getImgAttr($value, $data)
    {
        $img = [$value => ($value ? get_host() . $value : '')];
        return $img[$data['img']];
    }
}
