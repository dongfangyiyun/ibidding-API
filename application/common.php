<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

use think\Db;

// 发送短信验证码
function send_mobile_code($mobile)
{
    if (preg_match("/^1[0-9]{1}\d{9}$/", $mobile)) {

        $data = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $bami = $data['sms']['bami'];

        $smsname    = $bami['account'];
        $smspwd     = $bami['password'];
        $smscompany = $bami['company'];

        $code = rand(100000, 999999);

        $content = "【" . $smscompany . "】您的验证码是：" . $code . "。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";

        $result = file_get_contents('http://www.itcc8.com:8890/mtPort/mt2?phonelist=' . $mobile . '&content=' . urldecode($content) . '&pwd=' . $smspwd . '&uid=' . $smsname);

        // 处理发送结果
        $_html = array();
        preg_match_all('/<RESULT>(.*)<\/RESULT>/', $result, $_dom);
        foreach ($_dom[1] as $_value) {
            preg_match_all('/<CODE>(.*)<\/CODE>/', $_value, $_CODE);
            preg_match_all('/<DESCRIPTION>(.*)<\/DESCRIPTION>/', $_value, $_DESCRIPTION);
            $_html['code']        = $_CODE[1][0];
            $_html['description'] = $_DESCRIPTION[1][0];
        }
        $smsinfo = $_html;

        if ($smsinfo['code']) {
            $data = [
                'mobile'    => $mobile,
                'msg'       => $content,
                'code'      => $code,
                'status'    => 0,
                'send_time' => date("Y-m-d H:i:s", time()),
            ];
            Db::name('mobile_msgs')->insert($data);

            $mailerror = $smsinfo['description'];
            return [0, $mailerror];
        } else {
            $data = [
                'mobile'    => $mobile,
                'msg'       => $content,
                'code'      => $code,
                'status'    => 1,
                'send_time' => date("Y-m-d H:i:s", time()),
            ];
            Db::name('mobile_msgs')->insert($data);

            return [1, '发送成功'];
        }
    } else {
        return [0, '手机号码格式错误'];
    }
}

function send_mobile_code_zjj($mobile)
{
    if (preg_match("/^1[0-9]{1}\d{9}$/", $mobile)) {

        $data = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $bami = $data['sms']['bami'];

        $smsname    = $bami['account'];
        $smspwd     = $bami['password'];
        $smscompany = $bami['company'];

        $code = rand(100000, 999999);

        $content = "【" . $smscompany . "】您的验证码是：" . $code . "。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";

        $result = file_get_contents('http://wancllsms.wancll.net/api/sms/Send.ashx?action=Send&uid=' . $smsname . '&passwd=' . $smspwd . '&content=' . $content . '&phonelist=' . $mobile);

        $result = json_decode($result, true);
        if ($result['msg1'] != 'success') {
            $data = [
                'mobile'    => $mobile,
                'msg'       => $content,
                'code'      => $code,
                'status'    => 0,
                'send_time' => date("Y-m-d H:i:s", time()),
            ];
            Db::name('mobile_msgs')->insert($data);

            return [0, '发送失败'];
        } else {
            $data = [
                'mobile'    => $mobile,
                'msg'       => $content,
                'code'      => $code,
                'status'    => 1,
                'send_time' => date("Y-m-d H:i:s", time()),
            ];
            Db::name('mobile_msgs')->insert($data);

            return [1, '发送成功'];
        }

    } else {
        return [0, '手机号码格式错误'];
    }
}

// 校验短信验证码
function check_mobile_code($mobile, $code)
{
    $result = Db::name('mobile_msgs')->where(['mobile' => $mobile])->order('id DESC')->limit('1')->select();
    if ($result) {
        //验证码10分钟内有效
        if ($result[0]['code'] == $code && (time() - strtotime($result[0]['send_time'])) <= 600) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }

    // return true;
}

function wancll_md5($param)
{
    return md5(md5($param . '@wancll'));
}

/**
 * 返回带协议的域名
 */
function get_host()
{
    $host     = $_SERVER["HTTP_HOST"];
    $protocol = is_ssl() ? "https://" : "http://";
    return $protocol . $host;
}

/**
 * 判断是否SSL协议
 * @return boolean
 */
function is_ssl()
{
    if (isset($_SERVER['HTTPS']) && ('1' == $_SERVER['HTTPS'] || 'on' == strtolower($_SERVER['HTTPS']))) {
        return true;
    } elseif (isset($_SERVER['SERVER_PORT']) && ('443' == $_SERVER['SERVER_PORT'])) {
        return true;
    }
    return false;
}

/**
 * 处理base64位图片集
 * @return boolean
 */
function base64_to_img($arr, $new_width = '', $new_height = '', $max_size = '')
{
    $result = [];

    foreach ($arr as $key => $value) {
        if (!$value) {
            $result[] = '';
            continue;
        }

        if (strpos($value, 'http') !== false) {
            $uri_arr  = explode('/', $value);
            $host_uri = $uri_arr[0] . '//' . $uri_arr[2];

            $value = str_replace($host_uri, '', $value);
        }

        if (strpos($value, 'public/upload') === false) {
            $base_img = str_replace('data:image/jpeg;base64,', '', $value);
            $base_img = str_replace('data:image/jpg;base64,', '', $base_img);
            $base_img = str_replace('data:image/png;base64,', '', $base_img);
            $base_img = str_replace('data:image/gif;base64,', '', $base_img);

            $dir         = './public/upload/images/';
            $filename    = time() . rand(100, 999) . '.jpg';
            $output_file = $dir . $filename;
            file_put_contents($output_file, base64_decode($base_img));

            // 处理图片宽高
            if ($new_width && $new_height) {
                deal_img($output_file, $new_width, $new_height);
            }elseif($new_width){
                $img_info=getimagesize($output_file);
                $bili = $img_info[1]/$img_info[0];
                deal_img($output_file, $new_width, $new_width*$bili);
            }elseif($new_height){
                $img_info=getimagesize($output_file);
                $bili = $img_info[0]/$img_info[1];
                deal_img($output_file, $new_height*$bili, $new_height);
            }

            // 处理图片大小
            if ($max_size) {
                $size = filesize($output_file);
                $rate = 100;
                while ($size > $max_size) {
                    deal_img($output_file, '', '', $rate);
                    $size = filesize($output_file);
                    $rate -= 10;

                    if ($rate == 0) {
                        break;
                    }
                }
            }

            $result[] = '/public/upload/images/' . $filename;

        } else {
            $output_file = '.' . $value;
            // 处理图片宽高
            if ($new_width && $new_height) {
                deal_img($output_file, $new_width, $new_height, 100);
            }

            // 处理图片大小
            if ($max_size) {
                $size = filesize($output_file);
                $rate = 100;
                while ($size > $max_size) {
                    deal_img($output_file, '', '', $rate);
                    $size = filesize($output_file);
                    $rate -= 10;

                    if ($rate == 0) {
                        break;
                    }
                }
            }

            $result[] = $value;
        }
    }

    return $result;
}

/**
 * desription 压缩图片
 * @param sting $imgsrc 图片路径
 * @param string $imgdst 压缩后保存路径
 * @param number $rate 压缩比率 0（最差质量，文件最小）到 100（最佳质量，文件最大）
 */
function deal_img($imgsrc, $new_width = '', $new_height = '', $rate = 100, $imgdst = '')
{
    list($width, $height, $type) = getimagesize($imgsrc);

    if (!$new_width) {
        $new_width = $width;
    }

    if (!$new_height) {
        $new_height = $height;
    }

    if (!$imgdst) {
        $imgdst = $imgsrc;
    }

    switch ($type) {
        case 1:
            $giftype = check_gifcartoon($imgsrc);
            if ($giftype) {
                header('Content-Type:image/gif');
                $image_wp = imagecreatetruecolor($new_width, $new_height);
                $image    = imagecreatefromgif($imgsrc);
                imagecopyresampled($image_wp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
                imagejpeg($image_wp, $imgdst, $rate); // 图像质量，范围从 0（最差质量，文件最小）到 100（最佳质量，文件最大），默认75
                imagedestroy($image_wp);
            }
            break;
        case 2:
            header('Content-Type:image/jpeg');
            $image_wp = imagecreatetruecolor($new_width, $new_height);
            $image    = imagecreatefromjpeg($imgsrc);
            imagecopyresampled($image_wp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
            imagejpeg($image_wp, $imgdst, $rate);
            imagedestroy($image_wp);
            break;
        case 3:
            header('Content-Type:image/png');
            $image_wp = imagecreatetruecolor($new_width, $new_height);
            //分配颜色 + alpha，将颜色填充到新图上
            $alpha = imagecolorallocatealpha($image_wp, 0, 0, 0, 127);
            imagefill($image_wp, 0, 0, $alpha);

            $image = imagecreatefrompng($imgsrc);
            imagecopyresampled($image_wp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
            imagejpeg($image_wp, $imgdst, $rate);
            imagedestroy($image_wp);
            break;
    }
}

/**
 * desription 判断是否gif动画
 * @param sting $image_file图片路径
 * @return boolean t 是 f 否
 */
function check_gifcartoon($image_file)
{
    $fp         = fopen($image_file, 'rb');
    $image_head = fread($fp, 1024);
    fclose($fp);
    return preg_match("/" . chr(0x21) . chr(0xff) . chr(0x0b) . 'NETSCAPE2.0' . "/", $image_head) ? false : true;
}

/**
 * 把返回的数据集转换成Tree
 */
function list_to_tree($list, $pk = 'id', $pid = 'pid', $child = '_child', $root = 0)
{
    // 创建Tree
    $tree = array();
    if (is_array($list)) {
        // 创建基于主键的数组引用
        $refer = array();
        foreach ($list as $key => $data) {
            $refer[$data[$pk]] = &$list[$key];
        }
        foreach ($list as $key => $data) {
            // 判断是否存在parent
            $parentId = $data[$pid];
            if ($root == $parentId) {
                $tree[] = &$list[$key];
            } else {
                if (isset($refer[$parentId])) {
                    $parent           = &$refer[$parentId];
                    $parent[$child][] = &$list[$key];
                }
            }
        }
    }

    return $tree;
}

/**
 * 模拟提交数据，获得返回值
 */
function https_request($url, $data = null)
{
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
    if (!empty($data)) {
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    }
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $output = curl_exec($curl);
    curl_close($curl);
    return $output;
}

/**
 * 生成二维码
 * @author YiYun
 */
function qrcode($data, $path = '')
{
    vendor('phpqrcode.phpqrcode');

    $filename = rand(100, 999) . time();
    if (empty($data)) {
        return '参数错误';
    }
    if (empty($path)) {
        $path = './public/upload/qrcodes/' . $filename . '.png';
    }
    QRcode::png($data, $path, 'L', 4);

    $path = '/public/upload/qrcodes/' . $filename . '.png';

    return $path;
}

function make_order_no($type)
{
    return $type . date('YmdHis') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
}
