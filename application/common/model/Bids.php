<?php
namespace app\common\model;

/*
 *  【招投标模型】
 */
class Bids extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_bids';

    // 类型转换
    protected $type = [
        'tags' => 'json',
    ];
}
