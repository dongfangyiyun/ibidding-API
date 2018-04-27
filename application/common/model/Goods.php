<?php
namespace app\common\model;

/*
 *  【商品模型】
 */
class Goods extends BaseModel
{
    // 指定数据表
    protected $table = 'ibid_goods';

    // 类型转换
    protected $type = [
        'imgs' => 'json',
        'tags' => 'json',
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

    // 获取器【desc】
    public function getDescAttr($value, $data)
    {
        $data_value = htmlspecialchars_decode($value);
        $str        = 'src="' . get_host() . '/public/upload/ueditor';
        $real_value = str_replace('src="/public/upload/ueditor', $str, $data_value);
        $desc       = [$value => $real_value];
        return $desc[$data['desc']];
    }

    // 获取器【goods_cate_name】
    public function getGoodsCateNameAttr($value, $data)
    {
        $goods_cate = model('goods_cates')->getOne($data['goods_cate_id']);
        if ($goods_cate) {
            $goods_cate_name = $goods_cate['name'];
        } else {
            $goods_cate_name = '';
        }

        $goods_cate_name = [$value => $goods_cate_name];
        return $goods_cate_name[$data['goods_cate_name']];
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['thum'])) {
                $model->thum = base64_to_img([$model->data['thum']], 500, 500)[0];
            }

            if (isset($model->data['imgs'])) {
                $model->imgs = base64_to_img(json_decode($model->data['imgs'], true));
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
            $data[$key]['goods_cate_name'] = '';
        }

        return $data;
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['goods_cate_name'] = '';
        }

        return $data;
    }

    // 查询单个商品详细信息
    public function getOneDetail($id)
    {
        $data = model('goods')->getOne($id);
        if ($data) {
            $goods_cate_id = $data['goods_cate_id'];
            $goods_cate    = model('goods_cates')->getOne($goods_cate_id);

            // 获取属性
            $attr_template_id = $goods_cate['attr_template_id'];
            $goods_attr_info  = [];
            $attr_data        = model('goods_attrs')->getAll(['goods_id' => $id, 'attr_template_id' => $attr_template_id]);
            foreach ($attr_data as $key => $value) {
                $goods_attr_info[$value['attr_name_id']] = $value['attr_option_id'];
            }

            // 获取规格
            $spec_template_id = $goods_cate['spec_template_id'];
            $goods_spec_info  = [];
            $spec_data        = model('goods_spec_options')->getAll(['goods_id' => $id, 'spec_template_id' => $spec_template_id]);
            foreach ($spec_data as $key => $value) {
                $goods_spec_info[$value['spec_name_id']][] = $value;
            }

            // 获取规格组合项
            $goods_spec_group_info = model('goods_spec_groups')->getAll(['goods_id' => $id, 'spec_template_id' => $spec_template_id]);

            $data['goods_attr_info']       = $goods_attr_info ? $goods_attr_info : (object) [];
            $data['goods_spec_info']       = $goods_spec_info ? $goods_spec_info : (object) [];
            $data['goods_spec_group_info'] = $goods_spec_group_info ? $goods_spec_group_info : [];
        }

        return $data;
    }

    // 更新字段
    public function updateNum($id, $type, $field, $num)
    {
        switch ($type) {
            case '+':
                $this->where('id', $id)->setInc($field, $num);
                break;
            case '-':
                $this->where('id', $id)->setDec($field, $num);
                break;
            default:
                # code...
                break;
        }
    }
}
