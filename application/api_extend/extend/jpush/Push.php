<?php
require 'extend/jpush/autoload.php';

/**
 *  极光推送
 **/
class Push
{
    private $app_key       = 'b342a0792832d5a851ea4486';
    private $master_secret = '7902caa4491145b832ce344c';

    public function send_notice($content, $device_id = '')
    {
        $client = new \JPush\Client($this->app_key, $this->master_secret);

        $pusher = $client->push();
        $pusher->setPlatform('all');
        $pusher->options(['apns_production' => true]);

        if ($device_id) {
            $pusher->addRegistrationId($device_id);
        } else {
            $pusher->addAllAudience();
        }
        $pusher->setNotificationAlert($content);
        $result = $pusher->send();

        return $result;
    }

    public function send_msg()
    {
        $client = new \JPush\Client($this->app_key, $this->master_secret);

        $pusher = $client->push();
        $pusher->setPlatform('all');
        $pusher->options(['apns_production' => true]);

        if ($device_id) {
            $pusher->addRegistrationId($device_id);
        } else {
            $pusher->addAllAudience();
        }
        $pusher->message($content);
        $result = $pusher->send();

        return $result;
    }

}
