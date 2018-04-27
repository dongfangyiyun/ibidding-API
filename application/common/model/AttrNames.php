<?php
namespace app\common\model;

/*
 *  【商品属性名称模型】
 */
class AttrNames extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_attr_names';

    // 只读字段(字段的值一旦写入，就无法更改。)
    protected $readonly = ['id', 'create_time', 'attr_template_id'];

    // 获取属性名称下面的值【options】
    public function getOptionsAttr($value, $data)
    {
        $result  = model('attr_options')->getAll(['attr_template_id' => $data['attr_template_id'], 'attr_name_id' => $data['id']]);
        $options = [$value => json_decode(json_encode($result), true)];
        return $options[$data['options']];
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
            $data[$key]['options'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['options'] = '';
        }

        return $data;
    }
}
