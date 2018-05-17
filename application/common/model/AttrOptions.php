<?php
namespace app\common\model;

/*
 *  【商品属性值模型】
 */
class AttrOptions extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_attr_options';

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['id', 'create_time', 'attr_template_id', 'attr_name_id'];
}
