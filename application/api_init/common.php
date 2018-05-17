<?php

/**
 *  根据经纬度计算两地距离
 */
function get_distance($lat1, $lng1, $lat2, $lng2)
{
    // 地球半径
    $earthRadius = 6367000;

    $lat1 = ($lat1 * pi()) / 180;
    $lng1 = ($lng1 * pi()) / 180;
    $lat2 = ($lat2 * pi()) / 180;
    $lng2 = ($lng2 * pi()) / 180;

    $calcLongitude = $lng2 - $lng1;
    $calcLatitude  = $lat2 - $lat1;
    $stepOne       = pow(sin($calcLatitude / 2), 2) + cos($lat1) * cos($lat2) * pow(sin($calcLongitude / 2), 2);
    $stepTwo       = 2 * asin(min(1, sqrt($stepOne)));
    $distance      = $earthRadius * $stepTwo;

    if ($distance < 1000) {
        $result = round($distance) . 'm';
    } else {
        $result = round(($distance / 1000)) . 'km';
    }

    return $result;
}

/**
 *  查找IDs集
 *  params：key字段
 *  params：value值
 *  params：table表名
 *  params：is_exact是否精确匹配(默认启用模糊查询)
 */
function get_ids($key, $value, $table, $is_exact = 0)
{
    $map = [];
    if ($is_exact == 0) {
        $map = [
            $key         => ['like', '%' . $value . '%'],
            'data_state' => 1,
        ];
    } elseif ($is_exact == 1) {
        $map = [
            $key         => $value,
            'data_state' => 1,
        ];
    }

    $ids = Db::name($table)->where($map)->column('id');
    return $ids;
}

/**
 *  校验layui的认证与授权
 *  params：auth认证码
 *  params：token授权码
 */
function layui_check_power($auth, $token)
{
    $system_auth = DataCache::getAuth();
    if ($auth !== $system_auth) {
        return 0;
    }

    $check_token = Db::name('tokens')->where(['token' => $token, 'is_mobile' => 0])->find();
    if ($check_token) {
        $time_length = time() - $check_token['create_time'];
        // 时间长度大于1天，重新登录
        if ($time_length >= 86400) {
            return 0;
            // 时间长度大于过期时间（2小时）且小于1天，刷新token
        } elseif ($time_length < 86400 && $time_length > $check_token['expire_time']) {
            return 0;
        }
    } else {
        return 0;
    }

    return 1;
}

/**
 *  创建产品的唯一序列号
 */
function make_uuid()
{
    $chars = md5(uniqid(mt_rand(), true));
    $uuid  = substr($chars, 0, 8) . '-';
    $uuid .= substr($chars, 8, 4) . '-';
    $uuid .= substr($chars, 12, 4) . '-';
    $uuid .= substr($chars, 16, 4) . '-';
    $uuid .= substr($chars, 20, 12);
    return $uuid;
}

/**
 *  更新第三方配置文件
 */
function update_config_file($data)
{
    $config_file = 'application/api_init/config-' . WANCLL_ENV . '.php';
    if (file_exists($config_file)) {
        $configs = include $config_file;
    } else {
        $configs = array();
    }

    $configs = array_merge($configs, $data);
    $result  = file_put_contents($config_file, "<?php\nreturn " . var_export($configs, true) . ";");

    return $result;
}
