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

     // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('issue_time desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('issue_time desc')->select();
        }

        return $data;
    }
}
