/**
 * 全局配置文件
 */
var domain = location.origin;   //协议+域名+端口
var host = domain + '/index.php/';
var auth = 'Basic_Ivj6eZRxMTx2yiyunZvnG8R65';   //认证

var user = getStorage(getClientType() + 'User');    //用户信息
var token = getStorage(getClientType() + 'Token');  //用户登录获取的token
var querystring = querystringParse(location.search);    //路由传递过来的参数，对象，格式?a=b&c=d
