<?php
/**
 *  微信支付
 **/
class WechatPay
{
    // 微信支付appid
    private $appid = '';

    // 微信商户号
    private $mchid = '';

    // 微信商户支付密钥key
    private $key = '';

    // 微信公众帐号secert
    private $appsecret = '';

    // 小程序的应用ID
    private $applet_appid = '';
    // 小程序的应用密钥
    private $applet_secret = '';

    // APP的应用ID
    private $app_appid = '';
    // APP的微信商户号
    private $app_mchid = '';
    // APP的商户key
    private $app_key = '';

    // 支付回调
    public $notify_url = '';
    // APP支付回调
    public $app_notify_url = '';

    // 跳转地址
    public $return_url = '';

    // 初始化参数
    public function __construct()
    {
        $data       = include 'application/api_init/config-' . WANCLL_ENV . '.php';
        $wechat_pay = $data['pay']['wechat'];

        $this->appid          = $wechat_pay['appid'];
        $this->mchid          = $wechat_pay['mchid'];
        $this->key            = $wechat_pay['key'];
        $this->appsecret      = $wechat_pay['appsecret'];
        $this->applet_appid   = $wechat_pay['applet_appid'];
        $this->applet_secret  = $wechat_pay['applet_secret'];
        $this->app_appid      = $wechat_pay['app_appid'];
        $this->app_appsecret  = $wechat_pay['app_appsecret'];
        $this->app_mchid      = $wechat_pay['app_mchid'];
        $this->app_key        = $wechat_pay['app_key'];
        $this->app_notify_url = $wechat_pay['app_notify_url'];
        $this->notify_url     = $wechat_pay['notify_url'];
        $this->return_url     = $wechat_pay['return_url'];

    }

    // jsapi支付
    public function jsapi_pay($order_no, $money, $subject)
    {
        require_once "extend/wechat_pay/lib/WxPay.Api.php";
        require_once "extend/wechat_pay/lib/WxPay.JsApiPay.php";

        //①、获取用户openid
        $tools  = new \JsApiPay();
        $openId = $tools->GetOpenid();

        //②、统一下单
        $input = new \WxPayUnifiedOrder();
        $input->SetBody($subject);
        $input->SetAttach($subject);
        $input->SetOut_trade_no($order_no);
        $input->SetTotal_fee($money * 100);
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag("test");
        $input->SetNotify_url($this->notify_url);
        $input->SetTrade_type("JSAPI");
        $input->SetOpenid($openId);
        $order           = \WxPayApi::unifiedOrder($input);
        $jsApiParameters = $tools->GetJsApiParameters($order);

        return $jsApiParameters;
    }

    // H5支付
    public function h5_pay($order_no, $money, $ip, $subject)
    {
        $appid            = $this->appid;
        $body             = $subject;
        $mch_id           = $this->mchid;
        $nonce_str        = MD5($order_no); //随机字符串
        $notify_url       = $this->notify_url;
        $out_trade_no     = $order_no;
        $scene_info       = "{'h5_info':{'type':'WAP','wap_url':'http://wancllshop.wx.wygoo.com','wap_name':'h5'}}";
        $spbill_create_ip = $ip;
        $total_fee        = $money * 100;
        $trade_type       = 'MWEB';
        $key              = $this->key;

        // 生成字符串
        $params = [
            'appid'            => $appid,
            'body'             => $body,
            'mch_id'           => $mch_id,
            'nonce_str'        => $nonce_str,
            'notify_url'       => $notify_url,
            'out_trade_no'     => $out_trade_no,
            'scene_info'       => $scene_info,
            'spbill_create_ip' => $spbill_create_ip,
            'total_fee'        => $total_fee,
            'trade_type'       => $trade_type,
        ];

        ksort($params);
        $buff = "";
        foreach ($params as $k => $v) {
            if ($k != "sign" && $v != "" && !is_array($v)) {
                $buff .= $k . "=" . $v . "&";
            }
        }
        $buff   = trim($buff, "&");
        $string = $buff . "&key=" . $key;
        $sign   = strtoupper(MD5($string));

        $post_data = "<xml><appid>$appid</appid><body>$body</body><mch_id>$mch_id</mch_id><nonce_str>$nonce_str</nonce_str><notify_url>$notify_url</notify_url><out_trade_no>$out_trade_no</out_trade_no><scene_info>$scene_info</scene_info><spbill_create_ip>$spbill_create_ip</spbill_create_ip><total_fee>$total_fee</total_fee><trade_type>$trade_type</trade_type><sign>$sign</sign></xml>"; //拼接成XML 格式

        $url     = "https://api.mch.weixin.qq.com/pay/unifiedorder"; //微信传参地址
        $dataxml = $this->http_post($url, $post_data); //后台POST微信传参地址  同时取得微信返回的参数

        $objectxml = (array) simplexml_load_string($dataxml, 'SimpleXMLElement', LIBXML_NOCDATA); //将微信返回的XML 转换成数组
        if ($objectxml['return_code'] == 'SUCCESS') {
            if ($objectxml['result_code'] == 'SUCCESS') {
                $url     = $objectxml['mweb_url']; //mweb_url是微信返回的支付链接
                $pay_url = $url . '&redirect_url=' . urlencode($this->return_url); //拼接跳转地址
                return $pay_url;
            }

            if ($objectxml['result_code'] == 'FAIL') {
                return $err_code_des = $objectxml['err_code_des'];
            }
        }
    }

    // 二维码支付
    public function qrcode_pay($order_no, $money, $subject)
    {
        require_once "extend/wechat_pay/lib/WxPay.Api.php";
        require_once "extend/wechat_pay/lib/WxPay.NativePay.php";

        $input = new \WxPayUnifiedOrder();
        $input->SetBody($subject);
        $input->SetAttach($subject);
        $input->SetOut_trade_no($order_no);
        $input->SetTotal_fee($money * 100);
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag("test");
        $input->SetNotify_url($this->notify_url);
        $input->SetTrade_type("NATIVE");
        $input->SetProduct_id("123456789");

        $notify  = new \NativePay();
        $result  = $notify->GetPayUrl($input);
        $pay_url = isset($result["code_url"]) ? $result["code_url"] : '';

        return $pay_url;
    }

    // 小程序支付
    public function applet_pay($code, $order_no, $money, $ip, $subject)
    {
        // 获取openid
        $result = https_request('https://api.weixin.qq.com/sns/jscode2session?appid=' . $this->applet_appid . '&secret=' . $this->applet_secret . '&js_code=' . $code . '&grant_type=authorization_code');
        $openid = $result['openid'];

        // 组合支付的数据
        $appid            = $this->applet_appid;
        $attach           = $subject;
        $body             = $subject;
        $mch_id           = $this->mch_id;
        $nonce_str        = MD5($order_no); //随机字符串
        $notify_url       = $this->notify_url;
        $openid           = $openid;
        $out_trade_no     = $order_no;
        $spbill_create_ip = $ip;
        $total_fee        = $money * 100;
        $trade_type       = 'JSAPI';
        $key              = $this->app_key;

        // 生成字符串
        $params = [
            'appid'            => $appid,
            'attach'           => $attach,
            'body'             => $body,
            'mch_id'           => $mch_id,
            'nonce_str'        => $nonce_str,
            'notify_url'       => $notify_url,
            'openid'           => $openid,
            'out_trade_no'     => $out_trade_no,
            'spbill_create_ip' => $spbill_create_ip,
            'total_fee'        => $total_fee,
            'trade_type'       => $trade_type,
        ];

        // 生成签名
        ksort($params);
        $buff = "";
        foreach ($params as $k => $v) {
            if ($k != "sign" && $v != "" && !is_array($v)) {
                $buff .= $k . "=" . $v . "&";
            }
        }
        $buff   = trim($buff, "&");
        $string = $buff . '&key=' . $key;
        $sign   = strtoupper(MD5($string));

        $post_data = "<xml><appid>$appid</appid><attach>$attach</attach><body>$body</body><mch_id>$mch_id</mch_id><nonce_str>$nonce_str</nonce_str><notify_url>$notify_url</notify_url><openid>$openid</openid><out_trade_no>$out_trade_no</out_trade_no><spbill_create_ip>$spbill_create_ip</spbill_create_ip><total_fee>$total_fee</total_fee><trade_type>$trade_type</trade_type><sign>$sign</sign></xml>"; //拼接成XML 格式

        $url     = "https://api.mch.weixin.qq.com/pay/unifiedorder"; //微信传参地址
        $dataxml = $this->http_post($url, $post_data); //后台POST微信传参地址  同时取得微信返回的参数

        $result = (array) simplexml_load_string($dataxml, 'SimpleXMLElement', LIBXML_NOCDATA); //将微信返回的XML 转换成数组

        return $result;
    }

    // APP支付
    public function app_pay($order_no, $money, $ip, $subject)
    {
        $appid            = $this->app_appid;
        $body             = $subject;
        $mch_id           = $this->app_mchid;
        $nonce_str        = MD5($order_no); //随机字符串
        $notify_url       = $this->app_notify_url;
        $out_trade_no     = $order_no;
        $spbill_create_ip = $ip;
        $total_fee        = $money * 100;
        $trade_type       = 'APP';
        $key              = $this->app_key;

        // 生成字符串
        $params = [
            'appid'            => $appid,
            'body'             => $body,
            'mch_id'           => $mch_id,
            'nonce_str'        => $nonce_str,
            'notify_url'       => $notify_url,
            'out_trade_no'     => $out_trade_no,
            'spbill_create_ip' => $spbill_create_ip,
            'total_fee'        => $total_fee,
            'trade_type'       => $trade_type,
        ];

        ksort($params);
        $buff = "";
        foreach ($params as $k => $v) {
            if ($k != "sign" && $v != "" && !is_array($v)) {
                $buff .= $k . "=" . $v . "&";
            }
        }
        $buff   = trim($buff, "&");
        $string = $buff . "&key=" . $key;
        $sign   = strtoupper(MD5($string));

        $post_data = "<xml><appid>$appid</appid><body>$body</body><mch_id>$mch_id</mch_id><nonce_str>$nonce_str</nonce_str><notify_url>$notify_url</notify_url><out_trade_no>$out_trade_no</out_trade_no><spbill_create_ip>$spbill_create_ip</spbill_create_ip><total_fee>$total_fee</total_fee><trade_type>$trade_type</trade_type><sign>$sign</sign></xml>"; //拼接成XML 格式

        $url     = "https://api.mch.weixin.qq.com/pay/unifiedorder"; //微信传参地址
        $dataxml = $this->http_post($url, $post_data); //后台POST微信传参地址  同时取得微信返回的参数

        $result = (array) simplexml_load_string($dataxml, 'SimpleXMLElement', LIBXML_NOCDATA); //将微信返回的XML 转换成数组

        // 预支付再次签名
        $params = [
            'appid'     => $this->app_appid,
            'partnerid' => $this->app_mchid,
            'prepayid'  => $result['prepay_id'],
            'package'   => 'Sign=WXPay',
            'noncestr'  => $nonce_str,
            'timestamp' => time(),
        ];
        ksort($params);
        $buff = "";
        foreach ($params as $k => $v) {
            if ($k != "sign" && $v != "" && !is_array($v)) {
                $buff .= $k . "=" . $v . "&";
            }
        }
        $buff   = trim($buff, "&");
        $string = $buff . "&key=" . $key;
        $sign   = strtoupper(MD5($string));

        // 组装APP需要的参数
        $data = [
            'apiKey'    => $params['appid'],
            'orderId'   => $params['prepayid'],
            'mchId'     => $params['partnerid'],
            'nonceStr'  => $params['noncestr'],
            'timeStamp' => $params['timestamp'],
            'package'   => $params['package'],
            'sign'      => $sign,
        ];

        return $data;
    }

    // 微信支付回调
    public function notify_deal($params)
    {
        libxml_disable_entity_loader(true);
        $postObj      = (array) simplexml_load_string($params, 'SimpleXMLElement', LIBXML_NOCDATA);
        $out_trade_no = $postObj['out_trade_no'];

        return $out_trade_no;
    }

    /**
     * 【微信】退款
     */
    public function refund($order_no, $out_refund_no, $refund_money, $refund_reason = '')
    {
        require_once "extend/wechat_pay/lib/WxPay.Api.php";
        require_once "extend/wechat_pay/lib/WxPay.Data.php";

        $out_trade_no = $order_no;
        $total_fee    = $refund_money * 100;
        $refund_fee   = $refund_money * 100;
        $input        = new \WxPayRefund();
        $input->SetOut_trade_no($out_trade_no);
        $input->SetTotal_fee($total_fee);
        $input->SetRefund_fee($refund_fee);
        $input->SetOut_refund_no($out_refund_no);
        $input->SetOp_user_id($this->mchid);

        $result = \WxPayApi::refund($input);
        if ($result) {
            if ($result['return_code'] == 'SUCCESS') {
                return ['code' => 1, 'msg' => '退款成功'];
            } else {
                return ['code' => 0, '退款失败'];
            }
        } else {
            return ['code' => 0, '退款失败'];
        }
    }

    /**
     * 【微信】退款
     */
    public function app_refund($order_no, $out_refund_no, $refund_money, $refund_reason = '')
    {
        require_once "extend/wechat_app_pay/lib/WxPay.Api.php";
        require_once "extend/wechat_app_pay/lib/WxPay.Data.php";

        $out_trade_no = $order_no;
        $total_fee    = $refund_money * 100;
        $refund_fee   = $refund_money * 100;
        $input        = new \WxPayRefund();
        $input->SetOut_trade_no($out_trade_no);
        $input->SetTotal_fee($total_fee);
        $input->SetRefund_fee($refund_fee);
        $input->SetOut_refund_no($out_refund_no);
        $input->SetOp_user_id($this->mchid);

        $result = \WxPayApi::refund($input);
        if ($result) {
            if ($result['return_code'] == 'SUCCESS') {
                return ['code' => 1, 'msg' => '退款成功'];
            } else {
                return ['code' => 0, '退款失败'];
            }
        } else {
            return ['code' => 0, '退款失败'];
        }
    }

    public function refund_query($order_no)
    {
        require_once "extend/wechat_pay/lib/WxPay.Api.php";
        require_once "extend/wechat_pay/lib/WxPay.Data.php";

        $out_trade_no = $order_no;
        $input        = new \WxPayRefundQuery();
        $input->SetOut_trade_no($out_trade_no);
        $result = \WxPayApi::refundQuery($input);

        return $result;
    }

    private function http_post($url, $data)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        $res = curl_exec($ch);
        curl_close($ch);
        return $res;
    }
}
