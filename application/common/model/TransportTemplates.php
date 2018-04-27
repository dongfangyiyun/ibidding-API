<?php
namespace app\common\model;

/*
 *  【商品运费模板模型】
 */
class TransportTemplates extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_transport_templates';

    // 类型转换
    protected $type = [
        'area_codes' => 'json',
    ];
}
