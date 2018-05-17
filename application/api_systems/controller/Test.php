<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Request;

import('app.api_extend.extend.dd.ddsql');

class Test extends Rest
{
	protected $beforeActionList = [
        'checkClientType',
        'checkAuth',
    ];
    
    /**
     * 【admin】查询全部角色
     */
    public function index(Request $request)
    {

    }
}
