<?php
namespace app\api_query\controller;

use app\api_init\controller\Rest;

class Test extends Rest
{
    /**
     * 【user】注册时创建个人词库
     */
    public function create_user_dd()
    {
        $data = [
            'user_id'    => 1,
            'dd_guid_no' => 'U2018052011454269059',
            'dd_info'    => (object) [],
        ];

        $this->data['data'] = $data;

        return $this->data;
    }

    /**
     * 【user】个人词库样本
     */
    public function demo()
    {
        $data = [
            'user_id'    => 5,
            'dd_guid_no' => 'U2018051011454269000',
            'dd_info'    => [
                '信息' => [
                    'num'         => 5,
                    'rate'        => 1.0,
                    'update_time' => '2018-05-10 16:13:53',
                ],
                '设备' => [
                    'num'         => 3,
                    'rate'        => 0.8,
                    'update_time' => '2018-05-10 16:15:27',
                ],
                '安全' => [
                    'num'         => 1,
                    'rate'        => 0.6,
                    'update_time' => '2018-05-10 16:19:58',
                ],
            ],
        ];

        $this->data['data'] = $data;

        return $this->data;
    }

}
