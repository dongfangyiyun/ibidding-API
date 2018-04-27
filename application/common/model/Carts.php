<?php
namespace app\common\model;

/*
 *  【商品购物车模型】
 */
class Carts extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_carts';

    // 获取器【goods_info】
    public function getGoodsInfoAttr($value, $data)
    {
        $goods_info = [$value => model('goods')->getOneDetail($data['goods_id'])];
        return $goods_info[$data['goods_info']];
    }

    // 获取器【spec_group_info】
    public function getSpecGroupInfoAttr($value, $data)
    {
        $spec_group_info = [$value => model('goods_spec_groups')->getOne($data['spec_group_id'])];
        return $spec_group_info[$data['spec_group_info']];
    }

    // 初始化
    protected static function init()
    {
        self::beforeWrite(function ($model) {
            if (isset($model->spec_group_id)) {
                $spec_group = model('goods_spec_groups')->getOne($model->spec_group_id);

                if ($spec_group) {
                    $model->spec_group_info = $spec_group['spec_option_group'];
                }
            }
        });
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
            $data[$key]['goods_info']      = '';
            $data[$key]['spec_group_info'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['goods_info']      = '';
            $data['spec_group_info'] = '';
        }

        return $data;
    }

    public function cleanUserCartTrue($where)
    {
        $this->where($where)->delete();
    }
}
