<?php
namespace app\admin\controller;

use think\Controller;

class Common extends Controller
{
    public function _initialize()
    {
        // 资源类型检测
        $top_nav = [
            [
                'name'   => '首页',
                'href'   => get_host() . '/admin/index/index',
                '_child' => [],
            ],
            [
                'name'   => '系统公告',
                'href'   => get_host() . '/admin/annoncements/index',
                '_child' => [],
            ],
        ];

        $this->assign('top_nav', $top_nav);
    }

}
