<?php
namespace app\api_init\controller;

use think\Request;

class Test extends Rest
{
    /**
     * 【admin】查询全部购物车列表
     */
    public function index(Request $request)
    {
        $data = $request->param();

        $this->data['data'] = $data;
        $this->data['1111111111'] = $data['test3']['ab'];
        return $this->data;
    }
}
