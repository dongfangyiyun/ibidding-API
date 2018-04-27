<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;
use think\Db;

class Configs extends Rest
{
    protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];

    /**
     * 【user】查询WAP端首页配置
     */
    public function wap_index()
    {
        $data = Db::name('custom_indexbannergoods')->select();
        foreach ($data as $key => $value) {
            $value['ad_img'] = $value['ad_img'] ? get_host() . $value['ad_img'] : '';
            if ($value['goods_ids']) {
                $value['goods_info'] = model('goods')->getAll(['id' => ['in', $value['goods_ids']]]);
            } else {
                $value['goods_info'] = [];
            }

            $data[$key] = $value;
        }

        $this->data['data'] = $data;
        return $this->data;
    }

    /**
     * 【user】查询PC端推荐商品配置
     */
    public function pc_index()
    {
        $data = Db::name('custom_pcindexgoods')->select();

        foreach ($data as $key => $value) {
            $data[$key]['ad1']          = $data[$key]['ad1'] ? get_host() . $data[$key]['ad1'] : '';
            $data[$key]['ad2']          = $data[$key]['ad2'] ? get_host() . $data[$key]['ad2'] : '';
            $data[$key]['goods_info']   = model('goods')->getAll(['id' => ['in', $value['goods_ids']]]);
            $data[$key]['hot_keywords'] = explode(',', $value['hot_keywords']);
        }

        $this->data['data'] = $data;
        return $this->data;
    }
}
