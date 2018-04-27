
-- -----------------------------
-- Table structure for `ibid_activity_coupons`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_activity_coupons`;
CREATE TABLE `ibid_activity_coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_no` varchar(255) NOT NULL COMMENT '优惠券编号',
  `market_activity_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `coupon_type` varchar(20) NOT NULL COMMENT '优惠券类别：discount打折券full满减券',
  `expiry_time` datetime NOT NULL COMMENT '到期时间',
  `reach_money` decimal(10,2) NOT NULL COMMENT '满多少元后可用',
  `change_value` decimal(10,2) NOT NULL COMMENT '优惠值：discount打折值full满减金额',
  `issue_num` bigint(20) NOT NULL COMMENT '优惠券发行数量',
  `use_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '已被领取的数量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_activity_coupons`
-- -----------------------------
INSERT INTO `ibid_activity_coupons` VALUES ('1', 'C2018042010533698532', '2', 'full', '2018-04-30 10:52:54', '100.00', '20.00', '10', '2', '1', '0', '2018-04-20 10:53:36', '2018-04-20 13:46:07');
INSERT INTO `ibid_activity_coupons` VALUES ('2', 'C2018042010545286477', '2', 'discount', '2018-04-30 11:00:16', '100.00', '2.00', '5', '1', '1', '0', '2018-04-20 10:54:52', '2018-04-20 13:46:05');
INSERT INTO `ibid_activity_coupons` VALUES ('3', 'C2018042011502905039', '2', 'full', '2018-04-30 11:49:50', '200.00', '100.00', '3', '1', '1', '0', '2018-04-20 11:50:29', '2018-04-20 13:45:48');
INSERT INTO `ibid_activity_coupons` VALUES ('4', 'C2018042013464096645', '2', 'full', '2018-04-30 14:00:00', '100.00', '50.00', '10', '5', '1', '1', '2018-04-20 13:46:40', '2018-04-20 13:46:40');
INSERT INTO `ibid_activity_coupons` VALUES ('5', 'C2018042013471611674', '2', 'full', '2018-04-30 14:00:00', '200.00', '100.00', '10', '6', '1', '1', '2018-04-20 13:47:16', '2018-04-20 13:47:16');
INSERT INTO `ibid_activity_coupons` VALUES ('6', 'C2018042013480967887', '2', 'discount', '2018-04-30 14:00:00', '200.00', '5.00', '10', '7', '1', '1', '2018-04-20 13:48:09', '2018-04-20 13:48:09');
INSERT INTO `ibid_activity_coupons` VALUES ('7', 'C2018042013484283390', '2', 'discount', '2018-04-30 14:00:00', '100.00', '5.00', '10', '7', '1', '1', '2018-04-20 13:48:42', '2018-04-20 13:48:42');
INSERT INTO `ibid_activity_coupons` VALUES ('8', 'C2018042315243185706', '2', 'full', '2018-04-30 15:24:46', '100.00', '50.00', '10', '4', '1', '1', '2018-04-23 15:24:31', '2018-04-23 15:24:31');
INSERT INTO `ibid_activity_coupons` VALUES ('9', 'C2018042410114467380', '2', 'discount', '2018-04-25 10:12:20', '1000.00', '8.50', '1', '1', '1', '1', '2018-04-24 10:11:44', '2018-04-24 10:11:44');

-- -----------------------------
-- Table structure for `ibid_activity_discount_rules`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_activity_discount_rules`;
CREATE TABLE `ibid_activity_discount_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `market_activity_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `discount_price` decimal(10,2) NOT NULL COMMENT '折扣价',
  `user_level_ids` text NOT NULL COMMENT '会员等级IDs',
  `user_limit_buy_num` int(11) NOT NULL COMMENT '单个会员限购买数量',
  `total_goods_num` int(11) NOT NULL COMMENT '总共可售出的商品数量',
  `use_num` int(11) DEFAULT '0' COMMENT '已被购买的数量',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_activity_discount_rules`
-- -----------------------------
INSERT INTO `ibid_activity_discount_rules` VALUES ('1', '1', '40', '20.00', '[3,2,1]', '10', '1000', '7', '1', '1', '2018-04-17 15:56:04', '2018-04-20 11:54:10');
INSERT INTO `ibid_activity_discount_rules` VALUES ('2', '1', '39', '20.00', '[1,2,3]', '100', '1900', '8', '1', '1', '2018-04-19 14:18:44', '2018-04-24 15:52:43');
INSERT INTO `ibid_activity_discount_rules` VALUES ('3', '1', '38', '20.00', '[2,1,3]', '100', '10000', '4', '1', '1', '2018-04-19 14:18:58', '2018-04-22 17:54:21');

-- -----------------------------
-- Table structure for `ibid_activity_full_rules`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_activity_full_rules`;
CREATE TABLE `ibid_activity_full_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `market_activity_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `user_level_ids` text NOT NULL COMMENT '会员等级IDs',
  `full_money` decimal(10,2) NOT NULL,
  `reduce_money` decimal(10,2) NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_activity_full_rules`
-- -----------------------------
INSERT INTO `ibid_activity_full_rules` VALUES ('1', '3', '[3,2,1]', '200.00', '60.00', '1', '1', '2018-04-17 15:57:14', '2018-04-17 15:57:14');

-- -----------------------------
-- Table structure for `ibid_addresses`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_addresses`;
CREATE TABLE `ibid_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `consignee_name` varchar(100) NOT NULL COMMENT '收货人',
  `mobile` varchar(20) NOT NULL COMMENT '联系电话',
  `province` varchar(255) NOT NULL COMMENT '省份',
  `province_code` int(20) NOT NULL COMMENT '省份编码ID',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `city_code` int(20) NOT NULL COMMENT '城市编码ID',
  `area` varchar(255) NOT NULL COMMENT '地区',
  `area_code` int(20) NOT NULL COMMENT '地区编码ID',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否为默认收货地址1-是 0-否',
  `sort` int(11) DEFAULT '0' COMMENT '地址排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_addresses`
-- -----------------------------
INSERT INTO `ibid_addresses` VALUES ('1', '2', '李舟', '18175974828', '北京市', '110000', '市辖区', '110100', '朝阳区', '110105', '哦明敏', '', '', '1', '0', '1', '2018-04-17 16:24:34', '2018-04-17 16:25:44');
INSERT INTO `ibid_addresses` VALUES ('2', '2', '哇哇哇哇哇', '18175977744', '辽宁省', '210000', '抚顺市', '210400', '抚顺县', '210421', '朱古力', '', '', '0', '0', '1', '2018-04-17 16:25:00', '2018-04-17 16:25:44');
INSERT INTO `ibid_addresses` VALUES ('3', '3', '易云', '15580841403', '湖南省', '430000', '长沙市', '430100', '芙蓉区', '430102', '测试', '', '', '1', '0', '1', '2018-04-17 23:17:27', '2018-04-17 23:17:27');
INSERT INTO `ibid_addresses` VALUES ('4', '5', '郭闻天', '13170308670', '湖南省', '430000', '长沙市', '430100', '芙蓉区', '430102', '星沙大道\n鸿兴阁小区1栋8079', '', '', '1', '0', '1', '2018-04-18 09:18:57', '2018-04-18 09:18:57');
INSERT INTO `ibid_addresses` VALUES ('5', '1', '的方式', '18888888888', '吉林省', '220000', '通化市', '220500', '柳河县', '220524', '防守打法知足', 'null', 'null', '1', '0', '0', '2018-04-18 10:42:06', '2018-04-25 09:02:50');
INSERT INTO `ibid_addresses` VALUES ('6', '4', '小唐', '15874253215', '河北省', '130000', '唐山市', '130200', '丰润区', '130208', '哦呦喂具体', '', '', '1', '0', '1', '2018-04-18 13:44:06', '2018-04-18 13:44:06');
INSERT INTO `ibid_addresses` VALUES ('7', '10', '刘备', '17670745968', '湖南省', '430000', '长沙市', '430100', '长沙县', '430121', '湘绣城', '', '', '1', '0', '1', '2018-04-18 13:53:53', '2018-04-21 13:40:56');
INSERT INTO `ibid_addresses` VALUES ('8', '11', '韩梅梅', '18390916324', '北京市', '110000', '市辖区', '110100', '西城区', '110102', '开源路17号', '', '', '1', '0', '1', '2018-04-18 14:03:56', '2018-04-18 14:03:56');
INSERT INTO `ibid_addresses` VALUES ('9', '1', '默默', '13568524558', '山西省', '140000', '阳泉市', '140300', '盂县', '140322', '陌路了', 'null', 'null', '0', '0', '0', '2018-04-18 16:19:20', '2018-04-25 09:02:48');
INSERT INTO `ibid_addresses` VALUES ('10', '13', 'Bbbb', '18390912268', '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '康巴什区', '150603', '咯OK了', '', '', '1', '0', '1', '2018-04-20 11:52:50', '2018-04-20 11:52:50');
INSERT INTO `ibid_addresses` VALUES ('11', '2', '李白', '18175974882', '辽宁省', '210000', '丹东市', '210600', '东港市', '210681', '民生银MP5分', '', '', '0', '0', '0', '2018-04-20 14:08:25', '2018-04-20 14:08:31');
INSERT INTO `ibid_addresses` VALUES ('12', '2', '嘿呀', '18175974828', '河北省', '130000', '唐山市', '130200', '市辖区', '130201', '一字一句', '', '', '0', '0', '1', '2018-04-20 17:15:27', '2018-04-20 17:15:27');
INSERT INTO `ibid_addresses` VALUES ('13', '15', '测试', '13030303030', '河北省', '130000', '秦皇岛市', '130300', '海港区', '130302', '测试地址', '', '', '1', '0', '1', '2018-04-21 13:31:44', '2018-04-23 16:06:08');
INSERT INTO `ibid_addresses` VALUES ('14', '10', '123', '13030303030', '山西省', '140000', '阳泉市', '140300', '矿区', '140303', '123123', '', '', '0', '0', '0', '2018-04-21 13:33:55', '2018-04-21 13:48:30');
INSERT INTO `ibid_addresses` VALUES ('15', '9', '罗铸', '13574849891', '天津市', '120000', '市辖区', '120100', '河北区', '120105', 'hhhdj', '', '', '0', '0', '1', '2018-04-21 16:50:23', '2018-04-24 16:12:09');
INSERT INTO `ibid_addresses` VALUES ('16', '15', 'aaaa', '17621502221', '山东省', '370000', '德州市', '371400', '夏津县', '371427', '123', '', '', '1', '0', '0', '2018-04-22 20:42:14', '2018-04-23 15:37:43');
INSERT INTO `ibid_addresses` VALUES ('17', '15', '2323', '13574849891', '安徽省', '340000', '阜阳市', '341200', '市辖区', '341201', '1212', '', '', '0', '0', '1', '2018-04-23 09:36:21', '2018-04-23 16:06:08');
INSERT INTO `ibid_addresses` VALUES ('18', '9', '2323', '13574849891', '安徽省', '340000', '阜阳市', '341200', '市辖区', '341201', '1212', '', '', '1', '0', '0', '2018-04-23 09:36:22', '2018-04-24 22:49:53');
INSERT INTO `ibid_addresses` VALUES ('19', '22', '测试', '15500000000', '天津市', '120000', '市辖区', '120100', '南开区', '120104', '测试', '', '', '1', '0', '1', '2018-04-25 08:23:06', '2018-04-25 08:23:06');

-- -----------------------------
-- Table structure for `ibid_admin_accounts`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_admin_accounts`;
CREATE TABLE `ibid_admin_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(50) NOT NULL COMMENT '登录的唯一标识符',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `admin_id` bigint(20) DEFAULT '0' COMMENT '管理员ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态:1正常0已删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_admin_accounts`
-- -----------------------------
INSERT INTO `ibid_admin_accounts` VALUES ('1', 'yiyun', '18002797d30d04fdc5fe16aceec36d47', '1', '1', '2018-04-10 16:40:36', '2018-04-10 16:40:36');
INSERT INTO `ibid_admin_accounts` VALUES ('2', 'admin', 'b5305e8c4c5e08c246943fe736701525', '2', '1', '2018-04-10 16:40:48', '2018-04-17 20:42:09');
INSERT INTO `ibid_admin_accounts` VALUES ('3', 'test', 'b5305e8c4c5e08c246943fe736701525', '3', '0', '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `ibid_admin_accounts` VALUES ('4', 'test', 'b5305e8c4c5e08c246943fe736701525', '4', '1', '2018-04-11 14:09:07', '2018-04-11 14:09:07');
INSERT INTO `ibid_admin_accounts` VALUES ('5', 'admin2', 'e6297b585db794e177808f8953b46669', '5', '1', '2018-04-23 10:58:22', '2018-04-23 10:58:22');

-- -----------------------------
-- Table structure for `ibid_admin_assets`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_admin_assets`;
CREATE TABLE `ibid_admin_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_admin_assets`
-- -----------------------------
INSERT INTO `ibid_admin_assets` VALUES ('1', '1', '0.00', '0.00', '1', '2018-04-10 16:40:36', '2018-04-10 16:40:36');
INSERT INTO `ibid_admin_assets` VALUES ('2', '2', '0.00', '0.00', '1', '2018-04-10 16:40:48', '2018-04-10 16:40:48');
INSERT INTO `ibid_admin_assets` VALUES ('3', '3', '0.00', '0.00', '1', '2018-04-11 10:22:20', '2018-04-11 10:22:20');
INSERT INTO `ibid_admin_assets` VALUES ('4', '4', '0.00', '0.00', '1', '2018-04-11 14:09:07', '2018-04-11 14:09:07');
INSERT INTO `ibid_admin_assets` VALUES ('5', '5', '0.00', '0.00', '1', '2018-04-23 10:58:22', '2018-04-23 10:58:22');

-- -----------------------------
-- Table structure for `ibid_admin_tokens`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_admin_tokens`;
CREATE TABLE `ibid_admin_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_account_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '管理员账号ID',
  `admin_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `client_type` varchar(50) NOT NULL COMMENT '客户端类型：pc|wap|app|wechat|applet',
  `token` varchar(255) NOT NULL COMMENT '授权token',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '刷新token',
  `expire_time` int(11) DEFAULT NULL COMMENT 'token有效时长，为空表示永久有效',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=232 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_admin_tokens`
-- -----------------------------
INSERT INTO `ibid_admin_tokens` VALUES ('1', '1', '1', 'pc', 'admin&pc@fb7c4f53d4e80dbd4f30c1fd9703576f', 'admin&pc@98746feac1d78d82cd4cbf32ba6f895d', '7200', '1', '2018-04-10 16:40:56', '2018-04-10 16:40:56');
INSERT INTO `ibid_admin_tokens` VALUES ('2', '2', '2', 'pc', 'admin&pc@3f9c0f4e0fa196178ed3b522a893870a', 'admin&pc@e121a4c31bb5d7bc01564a374e53d9b9', '7200', '1', '2018-04-10 16:41:03', '2018-04-10 16:41:03');
INSERT INTO `ibid_admin_tokens` VALUES ('3', '2', '2', 'pc', 'admin&pc@0dc85b94911f9009dcbf3fb4dac9b26b', 'admin&pc@7c70a0bdfa1808ef0953ddcba87f65ed', '7200', '1', '2018-04-10 16:42:15', '2018-04-10 16:42:15');
INSERT INTO `ibid_admin_tokens` VALUES ('4', '2', '2', 'pc', 'admin&pc@233c20c9ca515c89924466029cf12ddc', 'admin&pc@45144142b9ffb56e0a504fb99bf3a6ec', '7200', '1', '2018-04-10 16:42:36', '2018-04-10 16:42:36');
INSERT INTO `ibid_admin_tokens` VALUES ('5', '2', '2', 'pc', 'admin&pc@c31943eb4507d496d0d76c6d1e0340cf', 'admin&pc@6b3e5140889225ab7b8d63d58c4c208b', '7200', '1', '2018-04-10 16:44:52', '2018-04-10 16:44:52');
INSERT INTO `ibid_admin_tokens` VALUES ('6', '2', '2', 'pc', 'admin&pc@21f74fbc2a835f4f493cc8b4798d9bb7', 'admin&pc@a5b34dea7e36d6a2a0b8a5fc96974ef5', '7200', '1', '2018-04-10 17:54:37', '2018-04-10 17:54:37');
INSERT INTO `ibid_admin_tokens` VALUES ('7', '2', '2', 'pc', 'admin&pc@1912cb908fadd1526760a62ecd211f17', 'admin&pc@3186cc5b61b9acf6de69880d046f72ad', '7200', '1', '2018-04-11 09:07:48', '2018-04-11 09:07:48');
INSERT INTO `ibid_admin_tokens` VALUES ('8', '2', '2', 'pc', 'admin&pc@67dbee5064050cc0f8c5f21edf43e75f', 'admin&pc@cda5ddcc7053e473c9aa9595f9f3f7b1', '7200', '1', '2018-04-11 09:13:12', '2018-04-11 09:13:12');
INSERT INTO `ibid_admin_tokens` VALUES ('9', '2', '2', 'pc', 'admin&pc@494521876a929f792ed402901d527da7', 'admin&pc@745e9c4d3a8873d967e4e22e6370e265', '7200', '1', '2018-04-11 10:33:07', '2018-04-11 10:33:07');
INSERT INTO `ibid_admin_tokens` VALUES ('10', '2', '2', 'pc', 'admin&pc@4f4dcb4bfcc42001f0f0392da00ec7ae', 'admin&pc@3030671b6076dc4fee815e352bfb8c38', '7200', '1', '2018-04-11 11:10:51', '2018-04-11 11:10:51');
INSERT INTO `ibid_admin_tokens` VALUES ('11', '2', '2', 'pc', 'admin&pc@ba68e9bfa106d34468cc7fb3695e976e', 'admin&pc@fba798664a5f9bc2af8a36ba0179057b', '7200', '1', '2018-04-11 11:11:27', '2018-04-11 11:11:27');
INSERT INTO `ibid_admin_tokens` VALUES ('12', '2', '2', 'pc', 'admin&pc@df372e3eed25fab71335e10f3e1dd8c9', 'admin&pc@3bca942d29cd024bd8fed12f64941be2', '7200', '1', '2018-04-11 11:14:04', '2018-04-11 11:14:04');
INSERT INTO `ibid_admin_tokens` VALUES ('13', '2', '2', 'pc', 'admin&pc@daba0a49d546e7e6309aba9e958f8b74', 'admin&pc@86d9042efc16239ce877791a5cca3e9c', '7200', '1', '2018-04-11 11:14:21', '2018-04-11 11:14:21');
INSERT INTO `ibid_admin_tokens` VALUES ('14', '2', '2', 'pc', 'admin&pc@f5a9cb667f9dd2fd5dc43631f9894ae6', 'admin&pc@7b130f6f0e10e8fa1892be7888171835', '7200', '1', '2018-04-11 11:17:32', '2018-04-11 11:17:32');
INSERT INTO `ibid_admin_tokens` VALUES ('15', '2', '2', 'pc', 'admin&pc@bc6f32e5e91897bdecddd07bd8486c72', 'admin&pc@1685ba6a7a81bb85c93440e62681096c', '7200', '1', '2018-04-11 14:08:10', '2018-04-11 14:08:10');
INSERT INTO `ibid_admin_tokens` VALUES ('16', '2', '2', 'pc', 'admin&pc@aee1f4ed9ff6ec0e85223fb8d4f7fc55', 'admin&pc@2a7417df591c2a9e3777550472be28e5', '7200', '1', '2018-04-11 14:08:18', '2018-04-11 14:08:18');
INSERT INTO `ibid_admin_tokens` VALUES ('17', '2', '2', 'pc', 'admin&pc@6a8a696123f2a3536b29ea6f4470a529', 'admin&pc@9a3bd5b89d4b4c88517ff1f88b0d733e', '7200', '1', '2018-04-11 14:08:35', '2018-04-11 14:08:35');
INSERT INTO `ibid_admin_tokens` VALUES ('18', '2', '2', 'pc', 'admin&pc@4c2247a7c5f65906baa800e0da724eee', 'admin&pc@96eb04c578c6dc073f6002fd4b44636e', '7200', '1', '2018-04-11 14:09:13', '2018-04-11 14:09:13');
INSERT INTO `ibid_admin_tokens` VALUES ('19', '2', '2', 'pc', 'admin&pc@a75d21fdd5d3de0e6fa98b2e020ee677', 'admin&pc@dd12e93c0faca838082a58aa01a81deb', '7200', '1', '2018-04-11 14:10:26', '2018-04-11 14:10:26');
INSERT INTO `ibid_admin_tokens` VALUES ('20', '2', '2', 'pc', 'admin&pc@5fee552017959a7fa6391be6071e5a6f', 'admin&pc@1890af915aa9f77dabc1cf3112e208ed', '7200', '1', '2018-04-11 14:10:33', '2018-04-11 14:10:33');
INSERT INTO `ibid_admin_tokens` VALUES ('21', '2', '2', 'pc', 'admin&pc@11c46ce8a3bce0b3ba71b78dd05f2659', 'admin&pc@bedb55b260a7f2383574216936bbc19b', '7200', '1', '2018-04-11 15:49:38', '2018-04-11 15:49:38');
INSERT INTO `ibid_admin_tokens` VALUES ('22', '2', '2', 'pc', 'admin&pc@40d57efb927cc3b1e26eb203d480f781', 'admin&pc@fe0831e6ba9a9fc3a40e6ead9c586c60', '7200', '1', '2018-04-11 16:29:39', '2018-04-11 16:29:39');
INSERT INTO `ibid_admin_tokens` VALUES ('23', '2', '2', 'pc', 'admin&pc@67e5b628127047ca824ce0a849fbb2e5', 'admin&pc@3fa2904b471f230630531bbc12b4cb63', '7200', '1', '2018-04-11 16:30:03', '2018-04-11 16:30:03');
INSERT INTO `ibid_admin_tokens` VALUES ('24', '2', '2', 'pc', 'admin&pc@6e84ae84fb7867f2472c127fdd7a45d3', 'admin&pc@33b34f03189bf3dc7456f6b2f7ba6033', '7200', '1', '2018-04-11 16:37:30', '2018-04-11 16:37:30');
INSERT INTO `ibid_admin_tokens` VALUES ('25', '2', '2', 'pc', 'admin&pc@507d1a9b402c4ed7b47cbe1840dfbefd', 'admin&pc@c406c7c4a0199939511fb4fdc61e2c8f', '7200', '1', '2018-04-11 16:39:55', '2018-04-11 16:39:55');
INSERT INTO `ibid_admin_tokens` VALUES ('26', '2', '2', 'pc', 'admin&pc@5a2c755c0f40487797f502125fa343c7', 'admin&pc@aa878775ade6059935a8dc45819cfed2', '7200', '1', '2018-04-11 16:43:28', '2018-04-11 16:43:28');
INSERT INTO `ibid_admin_tokens` VALUES ('27', '2', '2', 'pc', 'admin&pc@c1179ca4bdbd27bf57f258fe87f92a20', 'admin&pc@df4aa36527600beffca4d299f8ceb731', '7200', '1', '2018-04-11 20:08:51', '2018-04-11 20:08:51');
INSERT INTO `ibid_admin_tokens` VALUES ('28', '2', '2', 'pc', 'admin&pc@5581dc44e92c41cd077b9427ae309499', 'admin&pc@93a695053e6f2914de9ad1405b8ca8ce', '7200', '1', '2018-04-11 20:59:17', '2018-04-11 20:59:17');
INSERT INTO `ibid_admin_tokens` VALUES ('29', '2', '2', 'pc', 'admin&pc@d039a46e9c9e8e7b9b282df33de073a0', 'admin&pc@47b63a7c1c7260cc3ab2bee337d79dcf', '7200', '1', '2018-04-11 21:28:56', '2018-04-11 21:28:56');
INSERT INTO `ibid_admin_tokens` VALUES ('30', '2', '2', 'pc', 'admin&pc@3b3dc6903f98d3ce421c3313a4a683a6', 'admin&pc@ead2455958bc19c9f84ffc5fe9604ed0', '7200', '1', '2018-04-12 00:01:53', '2018-04-12 00:01:53');
INSERT INTO `ibid_admin_tokens` VALUES ('31', '2', '2', 'pc', 'admin&pc@a10afe2ab5cb7685311db46e68cc6301', 'admin&pc@dfa2f9799fc4b45d68c0491f4cb060ee', '7200', '1', '2018-04-12 10:08:29', '2018-04-12 10:08:29');
INSERT INTO `ibid_admin_tokens` VALUES ('32', '2', '2', 'pc', 'admin&pc@c7d39dc6a13afbd8d7a4db54e9a46f03', 'admin&pc@7148b08f8e9ac6a7333e66e6bee419ea', '7200', '1', '2018-04-12 10:08:30', '2018-04-12 10:08:30');
INSERT INTO `ibid_admin_tokens` VALUES ('33', '2', '2', 'pc', 'admin&pc@1ea7ccafe85cbe38ae4f8e98f491c0e0', 'admin&pc@8e101fc8f295eb1c43891dac81e2644b', '7200', '1', '2018-04-12 10:08:32', '2018-04-12 10:08:32');
INSERT INTO `ibid_admin_tokens` VALUES ('34', '2', '2', 'pc', 'admin&pc@86526df273bfc5a900fe03809e714c7d', 'admin&pc@a6928c26a210afc84747ce776bbd8074', '7200', '0', '2018-04-12 12:00:14', '2018-04-13 12:00:30');
INSERT INTO `ibid_admin_tokens` VALUES ('35', '2', '2', 'pc', 'admin&pc@d4f2bb9e7899617a90ce508e6ae3171c', 'admin&pc@12edefba3dfcee49bce6188bf3deb806', '7200', '1', '2018-04-12 14:54:57', '2018-04-12 14:54:57');
INSERT INTO `ibid_admin_tokens` VALUES ('36', '2', '2', 'pc', 'admin&pc@2d044fa16247c97225c7b8408af2fa17', 'admin&pc@f8a6e718b11f12271a8a14f9cb273cb9', '7200', '1', '2018-04-12 20:54:55', '2018-04-12 20:54:55');
INSERT INTO `ibid_admin_tokens` VALUES ('37', '2', '2', 'pc', 'admin&pc@def084e8866b6c9d42623b0e42b268ac', 'admin&pc@131c209a364969ce8b123c00bd8c5af8', '7200', '1', '2018-04-13 00:29:24', '2018-04-13 00:29:24');
INSERT INTO `ibid_admin_tokens` VALUES ('38', '2', '2', 'pc', 'admin&pc@678a1c73dc29419eb35c84083f8e5fe7', 'admin&pc@61091111b5ed85fa6f08e44a26ad060a', '7200', '1', '2018-04-13 13:58:21', '2018-04-13 13:58:21');
INSERT INTO `ibid_admin_tokens` VALUES ('39', '2', '2', 'pc', 'admin&pc@ba4755832fbcaa71230ef450d104a313', 'admin&pc@2a1aa3a0582758a9b41a9ab0a41e7746', '7200', '1', '2018-04-13 14:19:42', '2018-04-13 14:19:42');
INSERT INTO `ibid_admin_tokens` VALUES ('40', '2', '2', 'pc', 'admin&pc@2f69104bc6de58a7c80435da4879f3ab', 'admin&pc@c217f511623bc4cca645646e62916c50', '7200', '1', '2018-04-13 14:20:02', '2018-04-13 14:20:02');
INSERT INTO `ibid_admin_tokens` VALUES ('41', '2', '2', 'pc', 'admin&pc@9bc970d0f964187d23ae8d2f0ef752d6', 'admin&pc@cc5951ce9a94feb2ae9567233695b373', '7200', '1', '2018-04-13 14:21:30', '2018-04-13 14:21:30');
INSERT INTO `ibid_admin_tokens` VALUES ('42', '2', '2', 'pc', 'admin&pc@7e7fbc4d10b495423ede8c7cc7db2028', 'admin&pc@46c4454321b57c3fa1828cbe90df717a', '7200', '1', '2018-04-13 14:21:44', '2018-04-13 14:21:44');
INSERT INTO `ibid_admin_tokens` VALUES ('43', '2', '2', 'pc', 'admin&pc@3fe00264aa12808dc2a2f8c7e72d03d6', 'admin&pc@d8c0ba72c9acc068681a271c2225d09d', '7200', '1', '2018-04-13 22:08:31', '2018-04-13 22:08:31');
INSERT INTO `ibid_admin_tokens` VALUES ('44', '2', '2', 'pc', 'admin&pc@e224b4f8e8f8f01e531bea6e976f2cd5', 'admin&pc@4b52f332920664d473d138e940f5640b', '7200', '1', '2018-04-13 22:10:32', '2018-04-13 22:10:32');
INSERT INTO `ibid_admin_tokens` VALUES ('45', '2', '2', 'pc', 'admin&pc@304c9ab1b9653464b7bbdba26be6c13c', 'admin&pc@5bb54f87684583597d561a3073184b8b', '7200', '1', '2018-04-13 22:28:54', '2018-04-13 22:28:54');
INSERT INTO `ibid_admin_tokens` VALUES ('46', '2', '2', 'pc', 'admin&pc@9de5a286e50b18122875ca313ad56302', 'admin&pc@c0d9f9114724d9941805670f2589999b', '7200', '1', '2018-04-14 11:01:29', '2018-04-14 11:01:29');
INSERT INTO `ibid_admin_tokens` VALUES ('47', '2', '2', 'pc', 'admin&pc@072fbd3eacdcd3d218a49964b885f73e', 'admin&pc@267e6ae16a67fbc12122068a089aa99c', '7200', '1', '2018-04-14 12:02:29', '2018-04-14 12:02:29');
INSERT INTO `ibid_admin_tokens` VALUES ('48', '2', '2', 'pc', 'admin&pc@a520e798b53a946bc648e02b7ca6cb83', 'admin&pc@fc1972e326c74d57127a2a430d40a245', '7200', '1', '2018-04-14 13:55:58', '2018-04-14 13:55:58');
INSERT INTO `ibid_admin_tokens` VALUES ('49', '2', '2', 'pc', 'admin&pc@d7f67bc13b26fa077ee166ba6a63152c', 'admin&pc@4b0fe5a76b933c33ddee4f26d1738383', '7200', '1', '2018-04-14 14:02:36', '2018-04-14 14:02:36');
INSERT INTO `ibid_admin_tokens` VALUES ('50', '2', '2', 'pc', 'admin&pc@db01d9e91169d5750b569172a86616be', 'admin&pc@cf2c1e6f1b8b9eba5762d51aa601267a', '7200', '1', '2018-04-14 14:05:40', '2018-04-14 14:05:40');
INSERT INTO `ibid_admin_tokens` VALUES ('51', '2', '2', 'pc', 'admin&pc@4bf8ec801179bee150adf6ff68bcfb28', 'admin&pc@7884b93b60cf7d4877cab5733c16b363', '7200', '1', '2018-04-14 14:13:57', '2018-04-14 14:13:57');
INSERT INTO `ibid_admin_tokens` VALUES ('52', '2', '2', 'pc', 'admin&pc@d66d7be061e692af9010846bce4deb83', 'admin&pc@986cd53138d14ca1099a95b474bee637', '7200', '1', '2018-04-14 14:14:19', '2018-04-14 14:14:19');
INSERT INTO `ibid_admin_tokens` VALUES ('53', '2', '2', 'pc', 'admin&pc@ebfaa8337032104a25f962886a5afbc2', 'admin&pc@1b44d2ef2debe8a947a2da750c819210', '7200', '1', '2018-04-14 14:57:48', '2018-04-14 14:57:48');
INSERT INTO `ibid_admin_tokens` VALUES ('54', '2', '2', 'pc', 'admin&pc@bdb9e186f02e5a70029d6c95819353c4', 'admin&pc@af04a893b94e31c787003add5684c307', '7200', '1', '2018-04-14 14:59:52', '2018-04-14 14:59:52');
INSERT INTO `ibid_admin_tokens` VALUES ('55', '2', '2', 'pc', 'admin&pc@803ea448c81809d742a207e5dbcc8591', 'admin&pc@9ec21e9b1d926791036d274d51723b1e', '7200', '1', '2018-04-14 15:28:11', '2018-04-14 15:28:11');
INSERT INTO `ibid_admin_tokens` VALUES ('56', '2', '2', 'pc', 'admin&pc@a386c4b23351ab71f6e86c15e4622252', 'admin&pc@de879a765fccd476ec815be3ab938228', '7200', '1', '2018-04-14 16:30:09', '2018-04-14 16:30:09');
INSERT INTO `ibid_admin_tokens` VALUES ('57', '2', '2', 'pc', 'admin&pc@352cf49c4d003eab94903dc9b69928ce', 'admin&pc@cfd9bc54a02696ad48d984f4b2461521', '7200', '1', '2018-04-14 16:33:52', '2018-04-14 16:33:52');
INSERT INTO `ibid_admin_tokens` VALUES ('58', '2', '2', 'pc', 'admin&pc@8d304763538d3266cff1a34b9608b24b', 'admin&pc@a126b2d9359002f00ac0ecc2d85b55a0', '7200', '1', '2018-04-14 18:00:10', '2018-04-14 18:00:10');
INSERT INTO `ibid_admin_tokens` VALUES ('59', '2', '2', 'pc', 'admin&pc@2b40f2e6d654effef21a20eb0c9b2b2e', 'admin&pc@6badcea26a2375680498a1db4726ba5b', '7200', '1', '2018-04-14 18:45:54', '2018-04-14 18:45:54');
INSERT INTO `ibid_admin_tokens` VALUES ('60', '2', '2', 'pc', 'admin&pc@abe9cff00ecaa7b1daebeb0678c0c91b', 'admin&pc@e777623d45866a3c105be77737661282', '7200', '1', '2018-04-14 21:05:55', '2018-04-14 21:05:55');
INSERT INTO `ibid_admin_tokens` VALUES ('61', '2', '2', 'pc', 'admin&pc@99cbe88527f769af85f8d34234ca9039', 'admin&pc@6f5099c5e6133fa938c5699e5da75748', '7200', '1', '2018-04-14 21:34:39', '2018-04-14 21:34:39');
INSERT INTO `ibid_admin_tokens` VALUES ('62', '2', '2', 'pc', 'admin&pc@a16fcc014c2f4918c318704f69f7f0a1', 'admin&pc@96f2f2841116f71487a5a9e7a247a5c8', '7200', '1', '2018-04-15 00:07:19', '2018-04-15 00:07:19');
INSERT INTO `ibid_admin_tokens` VALUES ('63', '2', '2', 'pc', 'admin&pc@fdef195d0b0ae9e89c414c0a2ec791f2', 'admin&pc@9013c78edb1161cea0d02585ef880e51', '7200', '1', '2018-04-16 09:22:32', '2018-04-16 09:22:32');
INSERT INTO `ibid_admin_tokens` VALUES ('64', '2', '2', 'pc', 'admin&pc@cc91b0608462ae6b7d39e6efa2adf3ae', 'admin&pc@0e990e28a08308117e124530acb2f6be', '7200', '1', '2018-04-16 10:39:53', '2018-04-16 10:39:53');
INSERT INTO `ibid_admin_tokens` VALUES ('65', '2', '2', 'pc', 'admin&pc@60ae845b733d4053a4f86f2471ac1a42', 'admin&pc@1c2a42b3629c15688558ea87a453fe0a', '7200', '1', '2018-04-16 10:58:29', '2018-04-16 10:58:29');
INSERT INTO `ibid_admin_tokens` VALUES ('66', '2', '2', 'pc', 'admin&pc@7eb3a569cff24fb80c64a3fb1d153da0', 'admin&pc@b01ab5c8bc15fd3a2e61338bbe9f76da', '7200', '1', '2018-04-16 11:04:59', '2018-04-16 11:04:59');
INSERT INTO `ibid_admin_tokens` VALUES ('67', '2', '2', 'pc', 'admin&pc@87d0a5540e3305a491a5cf2f4fec7a6f', 'admin&pc@0fe133c711ed0ab01c86b40d160e5cf2', '7200', '1', '2018-04-16 11:11:18', '2018-04-16 11:11:18');
INSERT INTO `ibid_admin_tokens` VALUES ('68', '2', '2', 'pc', 'admin&pc@36ffa3808eb046c7918a19c961eba839', 'admin&pc@f5dd2eca24d796d09410f8003c6c6239', '7200', '1', '2018-04-16 11:12:09', '2018-04-16 11:12:09');
INSERT INTO `ibid_admin_tokens` VALUES ('69', '2', '2', 'pc', 'admin&pc@7adab10e0aca64d49709b91254e11afd', 'admin&pc@9dec17b65f37eff22448bf3ca1170a7c', '7200', '1', '2018-04-16 11:23:53', '2018-04-16 11:23:53');
INSERT INTO `ibid_admin_tokens` VALUES ('70', '2', '2', 'pc', 'admin&pc@620ef2b023ae317af4588e673d9b4a7b', 'admin&pc@e7a5435a769ad90244f27fb90f968194', '7200', '1', '2018-04-16 12:04:23', '2018-04-16 12:04:23');
INSERT INTO `ibid_admin_tokens` VALUES ('71', '2', '2', 'pc', 'admin&pc@2591d5b4d1e2800a8ddb0d097894a579', 'admin&pc@fb6ecb025b5dd19ff29ad844bc6ea456', '7200', '1', '2018-04-16 13:46:54', '2018-04-16 13:46:54');
INSERT INTO `ibid_admin_tokens` VALUES ('72', '2', '2', 'pc', 'admin&pc@ef49407a83c3702e45801866e48d6ea3', 'admin&pc@01f5befd3d11ef9407c97a097eb1673e', '7200', '1', '2018-04-16 13:47:12', '2018-04-16 13:47:12');
INSERT INTO `ibid_admin_tokens` VALUES ('73', '2', '2', 'pc', 'admin&pc@24c0187c1c32316a0395e9c58b7ed764', 'admin&pc@663c209faf4c8049e6a951d89e7307a0', '7200', '1', '2018-04-16 14:27:11', '2018-04-16 14:27:11');
INSERT INTO `ibid_admin_tokens` VALUES ('74', '2', '2', 'pc', 'admin&pc@82c40a4de2214585838e3cf92a556aff', 'admin&pc@6ccd573377caa71886521637f67c7db6', '7200', '1', '2018-04-16 14:36:20', '2018-04-16 14:36:20');
INSERT INTO `ibid_admin_tokens` VALUES ('75', '2', '2', 'pc', 'admin&pc@a40035f89b53a969a5f06bb01886e0f7', 'admin&pc@f81158f3f3d7ee61790ef7f8db855db3', '7200', '1', '2018-04-16 14:58:22', '2018-04-16 14:58:22');
INSERT INTO `ibid_admin_tokens` VALUES ('76', '2', '2', 'pc', 'admin&pc@2309922f9c288082f1fbda64d312e2c0', 'admin&pc@d2ee20b810a11bdd8a038a562e34b617', '7200', '1', '2018-04-16 15:37:04', '2018-04-16 15:37:04');
INSERT INTO `ibid_admin_tokens` VALUES ('77', '2', '2', 'pc', 'admin&pc@852dd3ce166fbe6d5b36e10986e1f09c', 'admin&pc@169634336ef474a228f9b70f66d34a37', '7200', '1', '2018-04-16 17:14:07', '2018-04-16 17:14:07');
INSERT INTO `ibid_admin_tokens` VALUES ('78', '2', '2', 'pc', 'admin&pc@ba82ff3e9e1c29f5367dd87165d49876', 'admin&pc@d46f488127ed492cd37b9410dfee7ae6', '7200', '1', '2018-04-16 19:14:44', '2018-04-16 19:14:44');
INSERT INTO `ibid_admin_tokens` VALUES ('79', '2', '2', 'pc', 'admin&pc@3caac5c5de3bb9f92fc5ee8599ef3cae', 'admin&pc@abfd7603f7ae2e683438530f571d1228', '7200', '1', '2018-04-16 20:03:18', '2018-04-16 20:03:18');
INSERT INTO `ibid_admin_tokens` VALUES ('80', '2', '2', 'pc', 'admin&pc@b5fd4ea9fede7d1fddd458255db355a5', 'admin&pc@5f8701766560f65b43880bd8972d1f60', '7200', '1', '2018-04-16 20:45:05', '2018-04-16 20:45:05');
INSERT INTO `ibid_admin_tokens` VALUES ('140', '2', '2', 'pc', 'admin&pc@c66112673d343293a833248a74a37450', 'admin&pc@8a0a7da412933864f3b55308e140b024', '7200', '1', '2018-04-19 11:40:09', '2018-04-19 11:40:09');
INSERT INTO `ibid_admin_tokens` VALUES ('82', '2', '2', 'pc', 'admin&pc@f6c9dfc427719af387f390bfec765277', 'admin&pc@d3a278f1d571f9d7dfbdfe41c28c0e09', '7200', '1', '2018-04-16 22:56:14', '2018-04-16 22:56:14');
INSERT INTO `ibid_admin_tokens` VALUES ('83', '2', '2', 'pc', 'admin&pc@ebe98352603badb72f76b1d6c516c0f7', 'admin&pc@2f9d8858c48dbc1eb58b47a9c29cc027', '7200', '1', '2018-04-16 23:23:35', '2018-04-16 23:23:35');
INSERT INTO `ibid_admin_tokens` VALUES ('144', '2', '2', 'pc', 'admin&pc@e31fe457f74a0b0f6e65ecf253f6ab92', 'admin&pc@eba510908bce11488d1002eca952c7c2', '7200', '1', '2018-04-19 15:03:17', '2018-04-19 15:03:17');
INSERT INTO `ibid_admin_tokens` VALUES ('85', '2', '2', 'pc', 'admin&pc@816661133017b9c0e6a9a0714bea945c', 'admin&pc@1c0c5f9bbf85ea89463d8079c5a3d8d0', '7200', '1', '2018-04-17 00:09:36', '2018-04-17 00:09:36');
INSERT INTO `ibid_admin_tokens` VALUES ('86', '2', '2', 'pc', 'admin&pc@d127674d53b9ab432efa818cdd959dd1', 'admin&pc@c7619a4a75ecc36138edeeaa6633e3a0', '7200', '1', '2018-04-17 09:53:19', '2018-04-17 09:53:19');
INSERT INTO `ibid_admin_tokens` VALUES ('87', '2', '2', 'pc', 'admin&pc@bcf5adc88882e198f0d08591775c97b1', 'admin&pc@7523b4851e3eb260dea39554066c77fd', '7200', '1', '2018-04-17 11:23:25', '2018-04-17 11:23:25');
INSERT INTO `ibid_admin_tokens` VALUES ('88', '2', '2', 'pc', 'admin&pc@9b75e442edb1676037c7e0ab50374d7c', 'admin&pc@504395be2010de8b450cec5f4aa90bc9', '7200', '1', '2018-04-17 13:47:05', '2018-04-17 13:47:05');
INSERT INTO `ibid_admin_tokens` VALUES ('89', '2', '2', 'pc', 'admin&pc@0c3a2445b0dcd78e45be0c91e493944e', 'admin&pc@f61e064bb734edf3108e3e2fa1a74919', '7200', '1', '2018-04-17 13:50:19', '2018-04-17 13:50:19');
INSERT INTO `ibid_admin_tokens` VALUES ('90', '2', '2', 'pc', 'admin&pc@20fd44aeb2495c42db1521d17fd477d1', 'admin&pc@d380bf79f08d06435a219693e4db125c', '7200', '1', '2018-04-17 13:59:46', '2018-04-17 13:59:46');
INSERT INTO `ibid_admin_tokens` VALUES ('91', '2', '2', 'pc', 'admin&pc@25cb37ad6d1d294482cdb1714910a660', 'admin&pc@d32d1bf06d6c1bd365aeaf46043008fc', '7200', '1', '2018-04-17 14:20:40', '2018-04-17 14:20:40');
INSERT INTO `ibid_admin_tokens` VALUES ('92', '2', '2', 'pc', 'admin&pc@61b84efe81e721d9aef78971991cf954', 'admin&pc@4d35fee2bee128deaa997724c55fd636', '7200', '1', '2018-04-17 14:26:58', '2018-04-17 14:26:58');
INSERT INTO `ibid_admin_tokens` VALUES ('93', '2', '2', 'pc', 'admin&pc@edcc81f2443e04a7e4662814a5ec9f64', 'admin&pc@071293377fe86e9d637608cf3a3c974f', '7200', '1', '2018-04-17 14:49:59', '2018-04-17 14:49:59');
INSERT INTO `ibid_admin_tokens` VALUES ('94', '2', '2', 'pc', 'admin&pc@90d3f0539c3984c179221123d675328e', 'admin&pc@1474ff0f1b2f05086f7e945d48e8577c', '7200', '1', '2018-04-17 15:17:58', '2018-04-17 15:17:58');
INSERT INTO `ibid_admin_tokens` VALUES ('95', '2', '2', 'pc', 'admin&pc@6a6872b334b516216ed800dcf526d7e3', 'admin&pc@d13768c891bec2a171a768cdd51e9302', '7200', '1', '2018-04-17 15:25:22', '2018-04-17 15:25:22');
INSERT INTO `ibid_admin_tokens` VALUES ('96', '2', '2', 'pc', 'admin&pc@e46e6c4f47e98a9f8d02b6d7f9a33940', 'admin&pc@d74d8ab01a1060077f5e116d64e67309', '7200', '1', '2018-04-17 15:32:59', '2018-04-17 15:32:59');
INSERT INTO `ibid_admin_tokens` VALUES ('97', '2', '2', 'pc', 'admin&pc@2b1284ac158164beb903aa64ad4d5dcb', 'admin&pc@06267cc994493e598c81cf301299155d', '7200', '1', '2018-04-17 16:13:14', '2018-04-17 16:13:14');
INSERT INTO `ibid_admin_tokens` VALUES ('98', '2', '2', 'pc', 'admin&pc@84f0a1d26eacc96d3471861f4e5cbc50', 'admin&pc@2c0a6eaa2c9c7f7e8b6890f14a0eaca3', '7200', '1', '2018-04-17 16:34:35', '2018-04-17 16:34:35');
INSERT INTO `ibid_admin_tokens` VALUES ('99', '2', '2', 'pc', 'admin&pc@9a64cda62d2fd29effc538b68b14960f', 'admin&pc@b46c4c94bed71e7a601d9eeb972612ea', '7200', '1', '2018-04-17 16:57:49', '2018-04-17 16:57:49');
INSERT INTO `ibid_admin_tokens` VALUES ('100', '2', '2', 'pc', 'admin&pc@7fddc6ac3fee3e013c3ba4fd87f84876', 'admin&pc@768fba5f983e7738c1995e20d7daf479', '7200', '1', '2018-04-17 17:26:52', '2018-04-17 17:26:52');
INSERT INTO `ibid_admin_tokens` VALUES ('101', '2', '2', 'pc', 'admin&pc@8f8823f5ed80ded82f7442b11af3d2d6', 'admin&pc@f2d8d655523ad2af89b5351b3cf32912', '7200', '1', '2018-04-17 20:41:20', '2018-04-17 20:41:20');
INSERT INTO `ibid_admin_tokens` VALUES ('102', '2', '2', 'pc', 'admin&pc@ccffb46ab2d092f23ee92aeadb706b8b', 'admin&pc@11a4067137714222e5c680c239d0e16b', '7200', '1', '2018-04-17 21:10:43', '2018-04-17 21:10:43');
INSERT INTO `ibid_admin_tokens` VALUES ('103', '2', '2', 'pc', 'admin&pc@f0b7e5dccea52603e0f1a94bd315bd99', 'admin&pc@1e2aff26b6ee4026ef6bb941f7a809bf', '7200', '1', '2018-04-17 21:11:44', '2018-04-17 21:11:44');
INSERT INTO `ibid_admin_tokens` VALUES ('104', '2', '2', 'pc', 'admin&pc@a9602871e2e682ebad8771b4cad0cbb3', 'admin&pc@11c854121181e7786b83d0f6196b0bd0', '7200', '1', '2018-04-17 21:19:35', '2018-04-17 21:19:35');
INSERT INTO `ibid_admin_tokens` VALUES ('105', '2', '2', 'pc', 'admin&pc@5d05a92f6520634ad331859c713c00ce', 'admin&pc@4911902e3fbbdb81e923f2744eef5b9d', '7200', '1', '2018-04-17 21:21:09', '2018-04-17 21:21:09');
INSERT INTO `ibid_admin_tokens` VALUES ('106', '2', '2', 'pc', 'admin&pc@e08029514a089dd6c40e6bea1da24504', 'admin&pc@3723f2071517e5b72e694ec5de6c630b', '7200', '1', '2018-04-17 23:16:32', '2018-04-17 23:16:32');
INSERT INTO `ibid_admin_tokens` VALUES ('107', '2', '2', 'pc', 'admin&pc@2f41d647ce2ac5f4d12b64d8141b5604', 'admin&pc@77839fa1bdcb22abefc7620b64cb1b1f', '7200', '1', '2018-04-18 09:28:38', '2018-04-18 09:28:38');
INSERT INTO `ibid_admin_tokens` VALUES ('108', '2', '2', 'pc', 'admin&pc@7a9ea7f8d5b894332a41eba0e3b2536d', 'admin&pc@dc9dbda7b283c66edcf8c6b50eac041b', '7200', '1', '2018-04-18 09:28:48', '2018-04-18 09:28:48');
INSERT INTO `ibid_admin_tokens` VALUES ('109', '2', '2', 'pc', 'admin&pc@fd29cf9b0c2c98404e61972a51dc0ebc', 'admin&pc@0a7eae156a11375b816e6273cee00563', '7200', '1', '2018-04-18 09:37:31', '2018-04-18 09:37:31');
INSERT INTO `ibid_admin_tokens` VALUES ('110', '2', '2', 'pc', 'admin&pc@53a8f9aebb7f3f827da645be2e2bf322', 'admin&pc@92b9fc9f090e72c5416fa4d3ed458fe4', '7200', '1', '2018-04-18 09:50:11', '2018-04-18 09:50:11');
INSERT INTO `ibid_admin_tokens` VALUES ('111', '2', '2', 'pc', 'admin&pc@68c9e9f06acb3a2692593d6dda459e85', 'admin&pc@85305cebf4caeb4b0910c27b995d0c0d', '7200', '1', '2018-04-18 09:53:09', '2018-04-18 09:53:09');
INSERT INTO `ibid_admin_tokens` VALUES ('112', '2', '2', 'pc', 'admin&pc@6e9caea7a5e799f556dfec39cb018b1a', 'admin&pc@bf8e93479326675b89220095fa4298f4', '7200', '1', '2018-04-18 10:04:30', '2018-04-18 10:04:30');
INSERT INTO `ibid_admin_tokens` VALUES ('113', '2', '2', 'pc', 'admin&pc@eb3606a4076de8c41ed7e85bf457ef46', 'admin&pc@61346338bbd3823fb723a8d942b41207', '7200', '1', '2018-04-18 10:55:35', '2018-04-18 10:55:35');
INSERT INTO `ibid_admin_tokens` VALUES ('114', '2', '2', 'pc', 'admin&pc@7409b57a1250fc53e7d1967144571a39', 'admin&pc@2a9359a62d1a03fd9e83e53b534314a3', '7200', '1', '2018-04-18 13:38:15', '2018-04-18 13:38:15');
INSERT INTO `ibid_admin_tokens` VALUES ('115', '2', '2', 'pc', 'admin&pc@19eaff807fc4aad92a5223de3feacdab', 'admin&pc@7a2fbccc505883ead326fda02b158228', '7200', '1', '2018-04-18 13:47:02', '2018-04-18 13:47:02');
INSERT INTO `ibid_admin_tokens` VALUES ('116', '2', '2', 'pc', 'admin&pc@499baf0f4ada52688dbf661c6732fd3e', 'admin&pc@f2dd69ae3298e68b4ce4eb48347d3fbc', '7200', '1', '2018-04-18 13:54:26', '2018-04-18 13:54:26');
INSERT INTO `ibid_admin_tokens` VALUES ('117', '2', '2', 'pc', 'admin&pc@88caf84cfe79fddd00be52441bf1fa16', 'admin&pc@057833404831ce02410cf5deb170e29b', '7200', '1', '2018-04-18 13:57:31', '2018-04-18 13:57:31');
INSERT INTO `ibid_admin_tokens` VALUES ('118', '2', '2', 'pc', 'admin&pc@89418f2fdd2b0773eb230c3248fceb73', 'admin&pc@dc4b316b3596fbba2e89d4abbae766bc', '7200', '1', '2018-04-18 13:58:03', '2018-04-18 13:58:03');
INSERT INTO `ibid_admin_tokens` VALUES ('119', '2', '2', 'pc', 'admin&pc@7ae818acdbc52a2ee2b93771a0508b79', 'admin&pc@2bdc23f80a984359d757153cc688c05c', '7200', '1', '2018-04-18 14:01:02', '2018-04-18 14:01:02');
INSERT INTO `ibid_admin_tokens` VALUES ('120', '2', '2', 'pc', 'admin&pc@03a6b41ac0f661e0c8f4743a923a11ae', 'admin&pc@009d17716e39ea7e2248ccc963981371', '7200', '1', '2018-04-18 14:36:57', '2018-04-18 14:36:57');
INSERT INTO `ibid_admin_tokens` VALUES ('121', '2', '2', 'pc', 'admin&pc@e0b4050c3158244ac46d24b594dc4198', 'admin&pc@5ffb7dc08b95050aff785c454c180b4f', '7200', '1', '2018-04-18 14:47:43', '2018-04-18 14:47:43');
INSERT INTO `ibid_admin_tokens` VALUES ('122', '2', '2', 'app', 'admin&app@4717fe2c6cb30d6ff822d80afbf7be3c', 'admin&app@5c0eb00da479f4343f23632f6f3cda9c', '0', '1', '2018-04-18 15:21:26', '2018-04-18 15:21:26');
INSERT INTO `ibid_admin_tokens` VALUES ('123', '2', '2', 'pc', 'admin&pc@689122d2a13f67f097ee2ed66e0b1fe2', 'admin&pc@b6231eaf401d4a202b4715f5703753f4', '7200', '1', '2018-04-18 15:34:04', '2018-04-18 15:34:04');
INSERT INTO `ibid_admin_tokens` VALUES ('124', '2', '2', 'pc', 'admin&pc@d373616e3bafee219455f64ef2a3fb56', 'admin&pc@8a9da8ff63bf7f8e0ba84398fb514eec', '7200', '1', '2018-04-18 15:40:27', '2018-04-18 15:40:27');
INSERT INTO `ibid_admin_tokens` VALUES ('125', '2', '2', 'pc', 'admin&pc@66cc2cc39a71dce57932453549930696', 'admin&pc@707de353f4731ba888a6e4ae719fe9ef', '7200', '1', '2018-04-18 16:10:27', '2018-04-18 16:10:27');
INSERT INTO `ibid_admin_tokens` VALUES ('126', '2', '2', 'pc', 'admin&pc@5087337e165c1b3f33bf9af4965a37d6', 'admin&pc@81d996c3047f9985c70c6b99edfce19c', '7200', '1', '2018-04-18 16:12:55', '2018-04-18 16:12:55');
INSERT INTO `ibid_admin_tokens` VALUES ('127', '2', '2', 'app', 'admin&app@712a20a63aea11a93f367ca639030074', 'admin&app@22f8ed194a84de4ab9ffe47d3d00f929', '0', '1', '2018-04-18 17:24:22', '2018-04-18 17:24:22');
INSERT INTO `ibid_admin_tokens` VALUES ('128', '2', '2', 'pc', 'admin&pc@2ff98acf1d1244fed43eb9a70b19bcd9', 'admin&pc@16e0dba0d42e62dd99116b6c2e76ef13', '7200', '1', '2018-04-19 09:08:50', '2018-04-19 09:08:50');
INSERT INTO `ibid_admin_tokens` VALUES ('129', '2', '2', 'pc', 'admin&pc@6792bad0acf57ea7cb6eb6e3fd698abf', 'admin&pc@3550a6112ebbc76e22fc813fd0579822', '7200', '1', '2018-04-19 09:09:19', '2018-04-19 09:09:19');
INSERT INTO `ibid_admin_tokens` VALUES ('216', '2', '2', 'pc', 'admin&pc@52960be89b64da7223f719d61c27e575', 'admin&pc@a1a7ae11df512651c2024229deba693f', '7200', '1', '2018-04-24 00:01:13', '2018-04-24 00:01:13');
INSERT INTO `ibid_admin_tokens` VALUES ('131', '2', '2', 'pc', 'admin&pc@f200cefa8ea967ab891a8254b8754505', 'admin&pc@ad64897069c5871eaaf0c939fd71e777', '7200', '1', '2018-04-19 09:24:42', '2018-04-19 09:24:42');
INSERT INTO `ibid_admin_tokens` VALUES ('132', '2', '2', 'pc', 'admin&pc@848d6432564cdb7ff5305fb981520c64', 'admin&pc@7e6c4809fcf793e0d8bdb3032dc0c30b', '7200', '1', '2018-04-19 09:39:48', '2018-04-19 09:39:48');
INSERT INTO `ibid_admin_tokens` VALUES ('133', '2', '2', 'pc', 'admin&pc@b5d3c25d012a47e0baa888ea900995b3', 'admin&pc@4addddbbe067aecca6cd39b267bea5b1', '7200', '1', '2018-04-19 10:24:14', '2018-04-19 10:24:14');
INSERT INTO `ibid_admin_tokens` VALUES ('134', '2', '2', 'pc', 'admin&pc@2264c17e81da733d2f7e24c9f3157d4c', 'admin&pc@1fc6bd6979b4ae916de21e6f81f53ba9', '7200', '1', '2018-04-19 10:29:22', '2018-04-19 10:29:22');
INSERT INTO `ibid_admin_tokens` VALUES ('135', '2', '2', 'pc', 'admin&pc@2fd1586ff7f907680b0b3d933ca155f0', 'admin&pc@4e282766d5657aae5b91f7d20d5d3383', '7200', '1', '2018-04-19 10:40:41', '2018-04-19 10:40:41');
INSERT INTO `ibid_admin_tokens` VALUES ('136', '2', '2', 'pc', 'admin&pc@c331e14976c2779610586e4020f2cc3d', 'admin&pc@8e74c35c95421942e321aa120119a2ef', '7200', '1', '2018-04-19 10:54:11', '2018-04-19 10:54:11');
INSERT INTO `ibid_admin_tokens` VALUES ('137', '2', '2', 'app', 'admin&app@5838c294ea50236560ccfce7342c8283', 'admin&app@045249f9f753c1593e90ca8405281e17', '0', '1', '2018-04-19 10:55:21', '2018-04-19 10:55:21');
INSERT INTO `ibid_admin_tokens` VALUES ('138', '2', '2', 'pc', 'admin&pc@eadefc40e2ce6f88fbfd0f06edbccbf5', 'admin&pc@1968aba0f5aeba4df5e9396152b97b48', '7200', '1', '2018-04-19 10:55:51', '2018-04-19 10:55:51');
INSERT INTO `ibid_admin_tokens` VALUES ('139', '2', '2', 'pc', 'admin&pc@4e3e368e661a34902eed3cd65785ef80', 'admin&pc@f623fbdb4363a3dd3e3fa8683d48b9a9', '7200', '1', '2018-04-19 11:08:43', '2018-04-19 11:08:43');
INSERT INTO `ibid_admin_tokens` VALUES ('153', '2', '2', 'pc', 'admin&pc@f2a4d7188b0b43571945bc8cb9a47b3e', 'admin&pc@f51b3dcd5d5ffa7caed7d4b2e6b4de22', '7200', '1', '2018-04-20 13:55:12', '2018-04-20 13:55:12');
INSERT INTO `ibid_admin_tokens` VALUES ('142', '2', '2', 'pc', 'admin&pc@1bfbccd3ebb409e12b5da93d5dd79a5c', 'admin&pc@7d9948ebc538bc62f2244962e5308959', '7200', '1', '2018-04-19 13:51:17', '2018-04-19 13:51:17');
INSERT INTO `ibid_admin_tokens` VALUES ('143', '2', '2', 'pc', 'admin&pc@2cfaef615719b1e4c7baf51e477df896', 'admin&pc@16c8f4cd4d70e9e9866225840765ef7b', '7200', '1', '2018-04-19 13:58:35', '2018-04-19 13:58:35');
INSERT INTO `ibid_admin_tokens` VALUES ('145', '2', '2', 'pc', 'admin&pc@a5eb12f105eb07acb06b7e2fbfb8f385', 'admin&pc@b0bf0a420f561ade5e6f4c473e9e8038', '7200', '1', '2018-04-19 15:51:55', '2018-04-19 15:51:55');
INSERT INTO `ibid_admin_tokens` VALUES ('146', '2', '2', 'pc', 'admin&pc@7fa5ae1256ff77a7cbd8bd18ceab8c7d', 'admin&pc@e38de8dc0cb811a48bbbd9122a197858', '7200', '1', '2018-04-19 16:54:26', '2018-04-19 16:54:26');
INSERT INTO `ibid_admin_tokens` VALUES ('147', '2', '2', 'pc', 'admin&pc@3f994ea1eee06b2706a2fb8c5db5f73e', 'admin&pc@8f99ef24ee5cea3c632c9852b9338a8c', '7200', '1', '2018-04-19 18:00:46', '2018-04-19 18:00:46');
INSERT INTO `ibid_admin_tokens` VALUES ('148', '2', '2', 'pc', 'admin&pc@55858c42a204511eecd303ec1b3a0ae3', 'admin&pc@0c87b259e2ba63bbcddf41668815904a', '7200', '1', '2018-04-19 19:29:57', '2018-04-19 19:29:57');
INSERT INTO `ibid_admin_tokens` VALUES ('149', '2', '2', 'pc', 'admin&pc@8f207cc6b7f35b1f95c80ae8e97eba0b', 'admin&pc@56b1aa2ba17eb9335ef5f585b6b0ccb3', '7200', '1', '2018-04-19 23:28:32', '2018-04-19 23:28:32');
INSERT INTO `ibid_admin_tokens` VALUES ('150', '2', '2', 'pc', 'admin&pc@874a70aab912a8f6443646c500922646', 'admin&pc@8dfddb3fc69f91498a1f71f0b2806c2d', '7200', '1', '2018-04-20 09:04:23', '2018-04-20 09:04:23');
INSERT INTO `ibid_admin_tokens` VALUES ('151', '2', '2', 'pc', 'admin&pc@4667c5585130951ceb05d415ced6d986', 'admin&pc@850f2d04fc7a8657fbd055bd28ef43fe', '7200', '1', '2018-04-20 09:48:26', '2018-04-20 09:48:26');
INSERT INTO `ibid_admin_tokens` VALUES ('152', '2', '2', 'pc', 'admin&pc@88b9c57fa39df35a7ff5fed2a3f89645', 'admin&pc@429b84386ba587a87b87c6ad4ac7892a', '7200', '1', '2018-04-20 10:25:20', '2018-04-20 10:25:20');
INSERT INTO `ibid_admin_tokens` VALUES ('154', '2', '2', 'pc', 'admin&pc@ea0d1f296a64b424492d22cfafa81479', 'admin&pc@4f3e10ec6235f65793074aeee12d5df9', '7200', '1', '2018-04-20 14:50:56', '2018-04-20 14:50:56');
INSERT INTO `ibid_admin_tokens` VALUES ('155', '2', '2', 'pc', 'admin&pc@a7bca4c959c11fb70914c04fb2267994', 'admin&pc@249479856cb569cb0252ea3d2973c0a2', '7200', '1', '2018-04-20 15:21:50', '2018-04-20 15:21:50');
INSERT INTO `ibid_admin_tokens` VALUES ('156', '2', '2', 'pc', 'admin&pc@516b94314e82b0410aabc8180f572abe', 'admin&pc@38ef5b80975516893db75ec7e9017925', '7200', '1', '2018-04-20 16:04:09', '2018-04-20 16:04:09');
INSERT INTO `ibid_admin_tokens` VALUES ('157', '2', '2', 'pc', 'admin&pc@0276eced12ccb10f389f3e60d9afdcba', 'admin&pc@68694159ad33afd26dfeb6665725dbcc', '7200', '1', '2018-04-20 17:01:03', '2018-04-20 17:01:03');
INSERT INTO `ibid_admin_tokens` VALUES ('158', '2', '2', 'pc', 'admin&pc@1c2db14e8d9e945b80a180b031a2a424', 'admin&pc@a29902c6ef53013b9062013ace5b0792', '7200', '1', '2018-04-20 19:25:44', '2018-04-20 19:25:44');
INSERT INTO `ibid_admin_tokens` VALUES ('159', '2', '2', 'pc', 'admin&pc@4da4704039557627cb5bae6fbe778326', 'admin&pc@66aeb7576efc7a322ba89a10434180d1', '7200', '1', '2018-04-21 08:24:18', '2018-04-21 08:24:18');
INSERT INTO `ibid_admin_tokens` VALUES ('160', '2', '2', 'pc', 'admin&pc@e5aaa7683e1b8046c3f544c7ef76eaa0', 'admin&pc@9aeef6162f42a9a36f2e87cc9e455a25', '7200', '1', '2018-04-21 08:25:47', '2018-04-21 08:25:47');
INSERT INTO `ibid_admin_tokens` VALUES ('161', '2', '2', 'pc', 'admin&pc@c662708ea03c31eea5f1dda8a8b50780', 'admin&pc@570392310a36dd6d84e391d28857077a', '7200', '1', '2018-04-21 09:04:46', '2018-04-21 09:04:46');
INSERT INTO `ibid_admin_tokens` VALUES ('162', '2', '2', 'pc', 'admin&pc@ae7ba98f627f338b8dd6270ae3ddf841', 'admin&pc@4e12d97c31a10cd5cf61c2b251bacf0d', '7200', '1', '2018-04-21 09:17:02', '2018-04-21 09:17:02');
INSERT INTO `ibid_admin_tokens` VALUES ('163', '1', '1', 'pc', 'admin&pc@a9e2cc76238280c72fd9349039390bce', 'admin&pc@35460bebfc75cb03e4f3bcdf6a5ab04b', '7200', '1', '2018-04-21 09:26:44', '2018-04-21 09:26:44');
INSERT INTO `ibid_admin_tokens` VALUES ('164', '2', '2', 'pc', 'admin&pc@5d00be2da0a7e5db53b968651e6fa417', 'admin&pc@d9287232fcfa3fc658540217e8624234', '7200', '1', '2018-04-21 10:02:33', '2018-04-21 10:02:33');
INSERT INTO `ibid_admin_tokens` VALUES ('165', '2', '2', 'pc', 'admin&pc@32bf872ace1d85a722667b997f86376a', 'admin&pc@f67eed7e80204addddbec4c4ee078a66', '7200', '1', '2018-04-21 10:16:38', '2018-04-21 10:16:38');
INSERT INTO `ibid_admin_tokens` VALUES ('166', '2', '2', 'pc', 'admin&pc@d85048e96ce4b8749cd585e0217b6c32', 'admin&pc@8e305bbae1013f6ebf7629f0e3059eb7', '7200', '1', '2018-04-21 10:35:55', '2018-04-21 10:35:55');
INSERT INTO `ibid_admin_tokens` VALUES ('167', '2', '2', 'pc', 'admin&pc@ca6ea22520ad671e104720a9505bbb5b', 'admin&pc@5f1fcf33d8539fcea1a79c59b2d2b558', '7200', '1', '2018-04-21 10:38:35', '2018-04-21 10:38:35');
INSERT INTO `ibid_admin_tokens` VALUES ('168', '2', '2', 'pc', 'admin&pc@ea1b09c7ffa8518edc33e036b6262099', 'admin&pc@656284d8d7603ab14e5019da5beca6fd', '7200', '1', '2018-04-21 11:56:53', '2018-04-21 11:56:53');
INSERT INTO `ibid_admin_tokens` VALUES ('169', '2', '2', 'pc', 'admin&pc@3ff304c71cb4cbb83f8976b00d4bbb60', 'admin&pc@44eb28bcb560f4b8e803869d3539725a', '7200', '1', '2018-04-21 12:00:42', '2018-04-21 12:00:42');
INSERT INTO `ibid_admin_tokens` VALUES ('170', '2', '2', 'pc', 'admin&pc@0988972974856fc6cbb1d3b880ed0f73', 'admin&pc@fdcb13d931a7116576c0a287bea89a51', '7200', '1', '2018-04-21 14:22:36', '2018-04-21 14:22:36');
INSERT INTO `ibid_admin_tokens` VALUES ('171', '2', '2', 'pc', 'admin&pc@6a66590ebd82a2db04cabc74e3aa195f', 'admin&pc@147f4337ed57c684b71ddee7a05f0b6d', '7200', '1', '2018-04-21 15:46:40', '2018-04-21 15:46:40');
INSERT INTO `ibid_admin_tokens` VALUES ('172', '2', '2', 'pc', 'admin&pc@d33de5103a505059a6fb8c9a1363b516', 'admin&pc@1400f3a98d08a7521934211eeb9ddf18', '7200', '1', '2018-04-21 16:35:57', '2018-04-21 16:35:57');
INSERT INTO `ibid_admin_tokens` VALUES ('173', '2', '2', 'pc', 'admin&pc@7a1da9db36728bdc649b820c9cf14250', 'admin&pc@03cf8e87906ba645b9435ec81f72aae1', '7200', '1', '2018-04-21 16:53:30', '2018-04-21 16:53:30');
INSERT INTO `ibid_admin_tokens` VALUES ('174', '2', '2', 'pc', 'admin&pc@5b8408abe99c76d90e2a95c570c30dcd', 'admin&pc@321f79df4c315dda1510f4eb4913cfe7', '7200', '1', '2018-04-21 17:34:07', '2018-04-21 17:34:07');
INSERT INTO `ibid_admin_tokens` VALUES ('175', '2', '2', 'pc', 'admin&pc@9e7ea4939e0812b7008856eb54d6e2eb', 'admin&pc@2b26f557402c31ca6156d2995744ed74', '7200', '1', '2018-04-21 17:45:44', '2018-04-21 17:45:44');
INSERT INTO `ibid_admin_tokens` VALUES ('199', '2', '2', 'pc', 'admin&pc@73e224579c15a3dbbef15d1f95927be6', 'admin&pc@ede29849e80611d74d344446e8de2ff7', '7200', '1', '2018-04-23 10:59:18', '2018-04-23 10:59:18');
INSERT INTO `ibid_admin_tokens` VALUES ('177', '2', '2', 'pc', 'admin&pc@514eab631acddc98101a246b7a961328', 'admin&pc@db292853c32399ac009dc2e5d460dc28', '7200', '1', '2018-04-21 18:45:24', '2018-04-21 18:45:24');
INSERT INTO `ibid_admin_tokens` VALUES ('178', '2', '2', 'pc', 'admin&pc@7418749e37e82249fff13f1cdbe09a97', 'admin&pc@586421ec3e8f778d79a879ac5646e17c', '7200', '1', '2018-04-21 20:00:46', '2018-04-21 20:00:46');
INSERT INTO `ibid_admin_tokens` VALUES ('179', '2', '2', 'pc', 'admin&pc@3bb9e623098c6348ed20c28535ec5a3c', 'admin&pc@a7a058b54af799ec410dcbfc3a2581cc', '7200', '1', '2018-04-21 20:08:40', '2018-04-21 20:08:40');
INSERT INTO `ibid_admin_tokens` VALUES ('180', '2', '2', 'pc', 'admin&pc@7b8e950b908981baa66e7cba737d7c73', 'admin&pc@282de3433ebed4f1f4b58e5e9a4556b4', '7200', '1', '2018-04-21 21:21:10', '2018-04-21 21:21:10');
INSERT INTO `ibid_admin_tokens` VALUES ('192', '2', '2', 'pc', 'admin&pc@5b4eeaba7fb51d4310aa854e598a479f', 'admin&pc@a58efb71004d09a5f4c302ede7e1781e', '7200', '1', '2018-04-22 21:47:56', '2018-04-22 21:47:56');
INSERT INTO `ibid_admin_tokens` VALUES ('182', '2', '2', 'pc', 'admin&pc@64d6f63042171569dcde014dce64eb25', 'admin&pc@e4ac907233c02a55fdfa58a3d9afed6a', '7200', '1', '2018-04-21 21:22:28', '2018-04-21 21:22:28');
INSERT INTO `ibid_admin_tokens` VALUES ('183', '2', '2', 'pc', 'admin&pc@5d2c045cd7c6961497b5ec0dfde314cb', 'admin&pc@2d6bee09d943e12b60e3a4dbd830632c', '7200', '1', '2018-04-21 22:02:12', '2018-04-21 22:02:12');
INSERT INTO `ibid_admin_tokens` VALUES ('197', '2', '2', 'pc', 'admin&pc@4d9d660db775e30de3a049865c0581cf', 'admin&pc@c4ebf35c52e3eef946bf8806f46e6ff2', '7200', '1', '2018-04-23 10:57:59', '2018-04-23 10:57:59');
INSERT INTO `ibid_admin_tokens` VALUES ('185', '2', '2', 'pc', 'admin&pc@70d364906665993cdf8f6c45b38ff669', 'admin&pc@e7378713618ccac3da52e656735fcd0b', '7200', '1', '2018-04-22 13:51:09', '2018-04-22 13:51:09');
INSERT INTO `ibid_admin_tokens` VALUES ('186', '2', '2', 'pc', 'admin&pc@9a7e5ace5f4d868cffd172efab58d69e', 'admin&pc@922425bd2478de0858758ce522f09dc9', '7200', '1', '2018-04-22 13:56:37', '2018-04-22 13:56:37');
INSERT INTO `ibid_admin_tokens` VALUES ('187', '2', '2', 'pc', 'admin&pc@ac4da9a8eee19a4f809de2a210896621', 'admin&pc@4741b3e9a55891e8e7efdda513ffa89e', '7200', '1', '2018-04-22 13:57:43', '2018-04-22 13:57:43');
INSERT INTO `ibid_admin_tokens` VALUES ('188', '2', '2', 'pc', 'admin&pc@7129b32e6190a4ad4fb2c9ef02a50826', 'admin&pc@21b898703f3f9c3508ef661b832bcaf1', '7200', '1', '2018-04-22 14:00:04', '2018-04-22 14:00:04');
INSERT INTO `ibid_admin_tokens` VALUES ('189', '2', '2', 'pc', 'admin&pc@3cb913660d82ac14573990d536575739', 'admin&pc@63581fb3abf5f881dc9f62e37f3849bc', '7200', '1', '2018-04-22 17:55:31', '2018-04-22 17:55:31');
INSERT INTO `ibid_admin_tokens` VALUES ('190', '2', '2', 'pc', 'admin&pc@364d222d5e77b54303270cf74d8de8e4', 'admin&pc@2b183ae05a174ce801acb40292e177c7', '7200', '1', '2018-04-22 18:00:53', '2018-04-22 18:00:53');
INSERT INTO `ibid_admin_tokens` VALUES ('191', '2', '2', 'pc', 'admin&pc@987088afed525c5c0a876e8d6e57a9f0', 'admin&pc@19d37d1744a39d49c7955eea561addd9', '7200', '1', '2018-04-22 21:47:49', '2018-04-22 21:47:49');
INSERT INTO `ibid_admin_tokens` VALUES ('193', '2', '2', 'pc', 'admin&pc@a8cf1b9fca15b0e792e556ceb619919e', 'admin&pc@ebfc98c90a787df06802331d81865e63', '7200', '1', '2018-04-23 09:03:50', '2018-04-23 09:03:50');
INSERT INTO `ibid_admin_tokens` VALUES ('194', '2', '2', 'pc', 'admin&pc@20bc0d278e50aaa93141aa02192df03e', 'admin&pc@2bf92027cf435304fe26af67b388ca5d', '7200', '1', '2018-04-23 10:09:26', '2018-04-23 10:09:26');
INSERT INTO `ibid_admin_tokens` VALUES ('195', '2', '2', 'pc', 'admin&pc@93a99a2e92d17668a0a4da5e0e983664', 'admin&pc@adb24651d33d6641aff7a7a3410a95cf', '7200', '1', '2018-04-23 10:19:15', '2018-04-23 10:19:15');
INSERT INTO `ibid_admin_tokens` VALUES ('196', '2', '2', 'pc', 'admin&pc@c9e8c4185e4707270132d766345f93be', 'admin&pc@ac7714a8846b56a03d47bc1120eccac1', '7200', '1', '2018-04-23 10:57:37', '2018-04-23 10:57:37');
INSERT INTO `ibid_admin_tokens` VALUES ('198', '2', '2', 'pc', 'admin&pc@e9c843417cb60b90f676dfb69424e60f', 'admin&pc@9c98c8535e6c3c58a39d83487470fc49', '7200', '1', '2018-04-23 10:58:44', '2018-04-23 10:58:44');
INSERT INTO `ibid_admin_tokens` VALUES ('200', '2', '2', 'pc', 'admin&pc@d0406a66c09f97ee91e200fc693280fe', 'admin&pc@5696b4ccd815793582a8d0da8558bbab', '7200', '1', '2018-04-23 11:04:44', '2018-04-23 11:04:44');
INSERT INTO `ibid_admin_tokens` VALUES ('201', '2', '2', 'pc', 'admin&pc@c3f82af5f7de19a1fc2aa09b26f5e116', 'admin&pc@5f6b52683947937615dff3eb209b88e4', '7200', '1', '2018-04-23 11:09:04', '2018-04-23 11:09:04');
INSERT INTO `ibid_admin_tokens` VALUES ('202', '2', '2', 'pc', 'admin&pc@a975b0bf4add2c94a0a7a691c34f09b7', 'admin&pc@9895ff7982eaef2ff28e139748d7ee5b', '7200', '1', '2018-04-23 11:10:16', '2018-04-23 11:10:16');
INSERT INTO `ibid_admin_tokens` VALUES ('203', '2', '2', 'pc', 'admin&pc@881b053ba256a31c47b83fd7c24ea967', 'admin&pc@d525d88b2c28ddf061f5f99af4ff2d5c', '7200', '1', '2018-04-23 11:12:30', '2018-04-23 11:12:30');
INSERT INTO `ibid_admin_tokens` VALUES ('204', '2', '2', 'pc', 'admin&pc@07024a93058b3a261a26a67cb1679069', 'admin&pc@3f0006510e14973812efebda6fbb624f', '7200', '1', '2018-04-23 11:18:40', '2018-04-23 11:18:40');
INSERT INTO `ibid_admin_tokens` VALUES ('205', '2', '2', 'pc', 'admin&pc@ac665d0fb721fdd6ef496fdaf07f1011', 'admin&pc@803dad85d4960ef9fd5390d1f6bfb196', '7200', '1', '2018-04-23 11:31:30', '2018-04-23 11:31:30');
INSERT INTO `ibid_admin_tokens` VALUES ('206', '2', '2', 'pc', 'admin&pc@0629f215557521b0d631482992d02b7a', 'admin&pc@aaf895fbfb48dcbac0adfb3bd529de73', '7200', '1', '2018-04-23 11:47:49', '2018-04-23 11:47:49');
INSERT INTO `ibid_admin_tokens` VALUES ('207', '2', '2', 'pc', 'admin&pc@111c22ebd854d64fd96a46fcffc64c85', 'admin&pc@b37d588b35c5af0fac23311c83e68d76', '7200', '1', '2018-04-23 11:54:35', '2018-04-23 11:54:35');
INSERT INTO `ibid_admin_tokens` VALUES ('208', '2', '2', 'pc', 'admin&pc@5865d47a613de86bdd2f2cc2451306ca', 'admin&pc@e39b26c83b55ea82a767316e0658e3dd', '7200', '1', '2018-04-23 13:41:53', '2018-04-23 13:41:53');
INSERT INTO `ibid_admin_tokens` VALUES ('209', '2', '2', 'pc', 'admin&pc@bea508b3343898ebdc241a7b0d5be09a', 'admin&pc@3d1c9a6de105b25b38dfb3a86dc55876', '7200', '1', '2018-04-23 13:50:29', '2018-04-23 13:50:29');
INSERT INTO `ibid_admin_tokens` VALUES ('210', '2', '2', 'pc', 'admin&pc@0a4115878787c1cebe108d341a260c09', 'admin&pc@35144981de360c415de23add4fe23287', '7200', '1', '2018-04-23 15:01:04', '2018-04-23 15:01:04');
INSERT INTO `ibid_admin_tokens` VALUES ('211', '2', '2', 'pc', 'admin&pc@8eaf250653a9924ad2017d7952232d64', 'admin&pc@e5a667cef135803550b6b6f6c504e58e', '7200', '1', '2018-04-23 15:03:36', '2018-04-23 15:03:36');
INSERT INTO `ibid_admin_tokens` VALUES ('212', '2', '2', 'pc', 'admin&pc@4d44a9f890a96752a60891a3e3379ebc', 'admin&pc@eff7dfc385966436871c933e21dd251b', '7200', '1', '2018-04-23 15:50:39', '2018-04-23 15:50:39');
INSERT INTO `ibid_admin_tokens` VALUES ('213', '2', '2', 'pc', 'admin&pc@ce1bc423e77b371236f84234a428e703', 'admin&pc@178658883720504e20cb8f8aa2c7eb83', '7200', '1', '2018-04-23 15:50:50', '2018-04-23 15:50:50');
INSERT INTO `ibid_admin_tokens` VALUES ('214', '2', '2', 'pc', 'admin&pc@fb36c3d0bcbbaa8c8902038576b1aca2', 'admin&pc@9032fb08c0651881b6800977e0e9db4e', '7200', '1', '2018-04-23 16:50:13', '2018-04-23 16:50:13');
INSERT INTO `ibid_admin_tokens` VALUES ('215', '2', '2', 'pc', 'admin&pc@ec1726c805b833e19e85c3b3aa31f18e', 'admin&pc@23dda04996cdeaf1fc2680db2d4f0faa', '7200', '1', '2018-04-23 16:50:03', '2018-04-23 16:50:03');
INSERT INTO `ibid_admin_tokens` VALUES ('217', '2', '2', 'pc', 'admin&pc@7b2e606bd3d8899ff1015f9a01e8a432', 'admin&pc@512b9611745248cdc648a208b9c283a2', '7200', '1', '2018-04-24 00:02:40', '2018-04-24 00:02:40');
INSERT INTO `ibid_admin_tokens` VALUES ('218', '2', '2', 'pc', 'admin&pc@491e03cbadee01ff9e3ca59be85c7cdd', 'admin&pc@7c74f8eb348c5bc04332092c2b238e80', '7200', '1', '2018-04-24 09:12:20', '2018-04-24 09:12:20');
INSERT INTO `ibid_admin_tokens` VALUES ('219', '2', '2', 'pc', 'admin&pc@4c2a8e760fab9f984f65aa0b2b5faa65', 'admin&pc@7eff981eeee36dd1128930997c1a5bb1', '7200', '1', '2018-04-24 09:12:32', '2018-04-24 09:12:32');
INSERT INTO `ibid_admin_tokens` VALUES ('220', '2', '2', 'pc', 'admin&pc@ffa8b07e7a513fff7c5da2276417e297', 'admin&pc@26535825fd5a6577f67cf7f43d6ea3e4', '7200', '1', '2018-04-24 09:15:45', '2018-04-24 09:15:45');
INSERT INTO `ibid_admin_tokens` VALUES ('221', '2', '2', 'pc', 'admin&pc@6ecb0cc83958d546bfa3d5ce553487c8', 'admin&pc@e6a1a06603b322acf6f4d623447d83d4', '7200', '1', '2018-04-24 09:16:28', '2018-04-24 09:16:28');
INSERT INTO `ibid_admin_tokens` VALUES ('222', '2', '2', 'pc', 'admin&pc@10c8ca1e1c4437ba6c2c46e4738f1da8', 'admin&pc@a9a6ae672c5b56de2b0768b41944d207', '7200', '1', '2018-04-24 10:10:49', '2018-04-24 10:10:49');
INSERT INTO `ibid_admin_tokens` VALUES ('223', '2', '2', 'pc', 'admin&pc@b4c4220c5200b355c8036f61da845350', 'admin&pc@9b37849d73a6559d9b2064994218bf2f', '7200', '1', '2018-04-24 10:21:34', '2018-04-24 10:21:34');
INSERT INTO `ibid_admin_tokens` VALUES ('224', '2', '2', 'pc', 'admin&pc@1a56d28f22f3c003cb59d1075513eb5d', 'admin&pc@ce0c9bbfa3204b6af07c673c67725fe1', '7200', '1', '2018-04-24 10:59:29', '2018-04-24 10:59:29');
INSERT INTO `ibid_admin_tokens` VALUES ('225', '2', '2', 'pc', 'admin&pc@a76ebf823c703eb221ba4b0c83d057ed', 'admin&pc@acb3d11f8ae3a3ab5d606fd6f0d5ccc5', '7200', '1', '2018-04-24 14:16:29', '2018-04-24 14:16:29');
INSERT INTO `ibid_admin_tokens` VALUES ('226', '2', '2', 'pc', 'admin&pc@df6a91848fe1b00a96d43a0f52e0aa77', 'admin&pc@4f91bf12f6b0516b34de95687673188f', '7200', '1', '2018-04-24 15:21:09', '2018-04-24 15:21:09');
INSERT INTO `ibid_admin_tokens` VALUES ('227', '2', '2', 'pc', 'admin&pc@2546d610a1e02781e2f3e8f40ec85863', 'admin&pc@5ff444d7ab39804f1ee205dfeefe5f60', '7200', '1', '2018-04-24 15:22:19', '2018-04-24 15:22:19');
INSERT INTO `ibid_admin_tokens` VALUES ('228', '2', '2', 'pc', 'admin&pc@e159be012f92b9d83f07422931ade54a', 'admin&pc@0d560c723e712aca7063efe004d902de', '7200', '1', '2018-04-24 17:06:20', '2018-04-24 17:06:20');
INSERT INTO `ibid_admin_tokens` VALUES ('229', '2', '2', 'pc', 'admin&pc@bbdc944eaca49ea43efdc9838084821d', 'admin&pc@43177fb01ab7d901e65504f6e9c9798d', '7200', '1', '2018-04-24 17:42:30', '2018-04-24 17:42:30');
INSERT INTO `ibid_admin_tokens` VALUES ('230', '2', '2', 'pc', 'admin&pc@77d6374ed052c759205d796649631e33', 'admin&pc@1406bc514f52b4327dbd7413b11438de', '7200', '1', '2018-04-25 08:34:10', '2018-04-25 08:34:10');
INSERT INTO `ibid_admin_tokens` VALUES ('231', '2', '2', 'pc', 'admin&pc@46d16d882b40e0415d840e506b03fe22', 'admin&pc@a2ae387c99bf26be5974477687c51fef', '7200', '1', '2018-04-25 09:12:34', '2018-04-25 09:12:34');

-- -----------------------------
-- Table structure for `ibid_admin_visit_logs`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_admin_visit_logs`;
CREATE TABLE `ibid_admin_visit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_account_id` bigint(20) NOT NULL COMMENT '管理员账号ID',
  `admin_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `ip` varchar(255) NOT NULL COMMENT '访问IP',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `client_type` varchar(255) NOT NULL COMMENT '客户端类型：pc|wap|app|wechat|applet',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=232 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_admin_visit_logs`
-- -----------------------------
INSERT INTO `ibid_admin_visit_logs` VALUES ('1', '1', '1', '192.168.1.102', '2018-04-10 16:40:56', 'pc', '1', '2018-04-10 16:40:56', '2018-04-10 16:40:56');
INSERT INTO `ibid_admin_visit_logs` VALUES ('2', '2', '2', '192.168.1.124', '2018-04-10 16:41:03', 'pc', '1', '2018-04-10 16:41:03', '2018-04-10 16:41:03');
INSERT INTO `ibid_admin_visit_logs` VALUES ('3', '2', '2', '192.168.1.102', '2018-04-10 16:42:15', 'pc', '1', '2018-04-10 16:42:15', '2018-04-10 16:42:15');
INSERT INTO `ibid_admin_visit_logs` VALUES ('4', '2', '2', '192.168.1.102', '2018-04-10 16:42:36', 'pc', '1', '2018-04-10 16:42:36', '2018-04-10 16:42:36');
INSERT INTO `ibid_admin_visit_logs` VALUES ('5', '2', '2', '192.168.1.102', '2018-04-10 16:44:52', 'pc', '1', '2018-04-10 16:44:52', '2018-04-10 16:44:52');
INSERT INTO `ibid_admin_visit_logs` VALUES ('6', '2', '2', '192.168.1.124', '2018-04-10 17:54:37', 'pc', '1', '2018-04-10 17:54:37', '2018-04-10 17:54:37');
INSERT INTO `ibid_admin_visit_logs` VALUES ('7', '2', '2', '192.168.1.102', '2018-04-11 09:07:48', 'pc', '1', '2018-04-11 09:07:48', '2018-04-11 09:07:48');
INSERT INTO `ibid_admin_visit_logs` VALUES ('8', '2', '2', '192.168.1.102', '2018-04-11 09:13:12', 'pc', '1', '2018-04-11 09:13:12', '2018-04-11 09:13:12');
INSERT INTO `ibid_admin_visit_logs` VALUES ('9', '2', '2', '192.168.1.102', '2018-04-11 10:33:07', 'pc', '1', '2018-04-11 10:33:07', '2018-04-11 10:33:07');
INSERT INTO `ibid_admin_visit_logs` VALUES ('10', '2', '2', '192.168.1.124', '2018-04-11 11:10:51', 'pc', '1', '2018-04-11 11:10:51', '2018-04-11 11:10:51');
INSERT INTO `ibid_admin_visit_logs` VALUES ('11', '2', '2', '192.168.1.124', '2018-04-11 11:11:27', 'pc', '1', '2018-04-11 11:11:27', '2018-04-11 11:11:27');
INSERT INTO `ibid_admin_visit_logs` VALUES ('12', '2', '2', '192.168.1.102', '2018-04-11 11:14:04', 'pc', '1', '2018-04-11 11:14:04', '2018-04-11 11:14:04');
INSERT INTO `ibid_admin_visit_logs` VALUES ('13', '2', '2', '192.168.1.102', '2018-04-11 11:14:21', 'pc', '1', '2018-04-11 11:14:21', '2018-04-11 11:14:21');
INSERT INTO `ibid_admin_visit_logs` VALUES ('14', '2', '2', '192.168.1.102', '2018-04-11 11:17:32', 'pc', '1', '2018-04-11 11:17:32', '2018-04-11 11:17:32');
INSERT INTO `ibid_admin_visit_logs` VALUES ('15', '2', '2', '192.168.1.102', '2018-04-11 14:08:10', 'pc', '1', '2018-04-11 14:08:10', '2018-04-11 14:08:10');
INSERT INTO `ibid_admin_visit_logs` VALUES ('16', '2', '2', '192.168.1.102', '2018-04-11 14:08:18', 'pc', '1', '2018-04-11 14:08:18', '2018-04-11 14:08:18');
INSERT INTO `ibid_admin_visit_logs` VALUES ('17', '2', '2', '192.168.1.102', '2018-04-11 14:08:35', 'pc', '1', '2018-04-11 14:08:35', '2018-04-11 14:08:35');
INSERT INTO `ibid_admin_visit_logs` VALUES ('18', '2', '2', '192.168.1.102', '2018-04-11 14:09:13', 'pc', '1', '2018-04-11 14:09:13', '2018-04-11 14:09:13');
INSERT INTO `ibid_admin_visit_logs` VALUES ('19', '2', '2', '192.168.1.102', '2018-04-11 14:10:26', 'pc', '1', '2018-04-11 14:10:26', '2018-04-11 14:10:26');
INSERT INTO `ibid_admin_visit_logs` VALUES ('20', '2', '2', '192.168.1.102', '2018-04-11 14:10:33', 'pc', '1', '2018-04-11 14:10:33', '2018-04-11 14:10:33');
INSERT INTO `ibid_admin_visit_logs` VALUES ('21', '2', '2', '192.168.1.124', '2018-04-11 15:49:38', 'pc', '1', '2018-04-11 15:49:38', '2018-04-11 15:49:38');
INSERT INTO `ibid_admin_visit_logs` VALUES ('22', '2', '2', '192.168.1.124', '2018-04-11 16:29:39', 'pc', '1', '2018-04-11 16:29:39', '2018-04-11 16:29:39');
INSERT INTO `ibid_admin_visit_logs` VALUES ('23', '2', '2', '192.168.1.124', '2018-04-11 16:30:03', 'pc', '1', '2018-04-11 16:30:03', '2018-04-11 16:30:03');
INSERT INTO `ibid_admin_visit_logs` VALUES ('24', '2', '2', '192.168.1.124', '2018-04-11 16:37:30', 'pc', '1', '2018-04-11 16:37:30', '2018-04-11 16:37:30');
INSERT INTO `ibid_admin_visit_logs` VALUES ('25', '2', '2', '192.168.1.124', '2018-04-11 16:39:55', 'pc', '1', '2018-04-11 16:39:55', '2018-04-11 16:39:55');
INSERT INTO `ibid_admin_visit_logs` VALUES ('26', '2', '2', '192.168.1.119', '2018-04-11 16:43:28', 'pc', '1', '2018-04-11 16:43:28', '2018-04-11 16:43:28');
INSERT INTO `ibid_admin_visit_logs` VALUES ('27', '2', '2', '192.168.1.119', '2018-04-11 20:08:51', 'pc', '1', '2018-04-11 20:08:51', '2018-04-11 20:08:51');
INSERT INTO `ibid_admin_visit_logs` VALUES ('28', '2', '2', '192.168.1.119', '2018-04-11 20:59:17', 'pc', '1', '2018-04-11 20:59:17', '2018-04-11 20:59:17');
INSERT INTO `ibid_admin_visit_logs` VALUES ('29', '2', '2', '192.168.1.119', '2018-04-11 21:28:56', 'pc', '1', '2018-04-11 21:28:56', '2018-04-11 21:28:56');
INSERT INTO `ibid_admin_visit_logs` VALUES ('30', '2', '2', '192.168.1.119', '2018-04-12 00:01:53', 'pc', '1', '2018-04-12 00:01:53', '2018-04-12 00:01:53');
INSERT INTO `ibid_admin_visit_logs` VALUES ('31', '2', '2', '192.168.1.119', '2018-04-12 10:08:29', 'pc', '1', '2018-04-12 10:08:29', '2018-04-12 10:08:29');
INSERT INTO `ibid_admin_visit_logs` VALUES ('32', '2', '2', '192.168.1.119', '2018-04-12 10:08:30', 'pc', '1', '2018-04-12 10:08:30', '2018-04-12 10:08:30');
INSERT INTO `ibid_admin_visit_logs` VALUES ('33', '2', '2', '192.168.1.119', '2018-04-12 10:08:32', 'pc', '1', '2018-04-12 10:08:32', '2018-04-12 10:08:32');
INSERT INTO `ibid_admin_visit_logs` VALUES ('34', '2', '2', '192.168.1.124', '2018-04-12 12:00:14', 'pc', '1', '2018-04-12 12:00:14', '2018-04-12 12:00:14');
INSERT INTO `ibid_admin_visit_logs` VALUES ('35', '2', '2', '192.168.1.119', '2018-04-12 14:54:57', 'pc', '1', '2018-04-12 14:54:57', '2018-04-12 14:54:57');
INSERT INTO `ibid_admin_visit_logs` VALUES ('36', '2', '2', '192.168.1.119', '2018-04-12 20:54:55', 'pc', '1', '2018-04-12 20:54:55', '2018-04-12 20:54:55');
INSERT INTO `ibid_admin_visit_logs` VALUES ('37', '2', '2', '192.168.1.141', '2018-04-13 00:29:24', 'pc', '1', '2018-04-13 00:29:24', '2018-04-13 00:29:24');
INSERT INTO `ibid_admin_visit_logs` VALUES ('38', '2', '2', '192.168.1.119', '2018-04-13 13:58:21', 'pc', '1', '2018-04-13 13:58:21', '2018-04-13 13:58:21');
INSERT INTO `ibid_admin_visit_logs` VALUES ('39', '2', '2', '192.168.1.124', '2018-04-13 14:19:42', 'pc', '1', '2018-04-13 14:19:42', '2018-04-13 14:19:42');
INSERT INTO `ibid_admin_visit_logs` VALUES ('40', '2', '2', '192.168.1.119', '2018-04-13 14:20:02', 'pc', '1', '2018-04-13 14:20:02', '2018-04-13 14:20:02');
INSERT INTO `ibid_admin_visit_logs` VALUES ('41', '2', '2', '192.168.1.124', '2018-04-13 14:21:30', 'pc', '1', '2018-04-13 14:21:30', '2018-04-13 14:21:30');
INSERT INTO `ibid_admin_visit_logs` VALUES ('42', '2', '2', '192.168.1.124', '2018-04-13 14:21:44', 'pc', '1', '2018-04-13 14:21:44', '2018-04-13 14:21:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('43', '2', '2', '192.168.1.119', '2018-04-13 22:08:31', 'pc', '1', '2018-04-13 22:08:31', '2018-04-13 22:08:31');
INSERT INTO `ibid_admin_visit_logs` VALUES ('44', '2', '2', '192.168.1.119', '2018-04-13 22:10:32', 'pc', '1', '2018-04-13 22:10:32', '2018-04-13 22:10:32');
INSERT INTO `ibid_admin_visit_logs` VALUES ('45', '2', '2', '192.168.1.119', '2018-04-13 22:28:54', 'pc', '1', '2018-04-13 22:28:54', '2018-04-13 22:28:54');
INSERT INTO `ibid_admin_visit_logs` VALUES ('46', '2', '2', '192.168.1.119', '2018-04-14 11:01:29', 'pc', '1', '2018-04-14 11:01:29', '2018-04-14 11:01:29');
INSERT INTO `ibid_admin_visit_logs` VALUES ('47', '2', '2', '192.168.1.124', '2018-04-14 12:02:29', 'pc', '1', '2018-04-14 12:02:29', '2018-04-14 12:02:29');
INSERT INTO `ibid_admin_visit_logs` VALUES ('48', '2', '2', '192.168.1.124', '2018-04-14 13:55:58', 'pc', '1', '2018-04-14 13:55:58', '2018-04-14 13:55:58');
INSERT INTO `ibid_admin_visit_logs` VALUES ('49', '2', '2', '192.168.1.124', '2018-04-14 14:02:36', 'pc', '1', '2018-04-14 14:02:36', '2018-04-14 14:02:36');
INSERT INTO `ibid_admin_visit_logs` VALUES ('50', '2', '2', '192.168.1.124', '2018-04-14 14:05:40', 'pc', '1', '2018-04-14 14:05:40', '2018-04-14 14:05:40');
INSERT INTO `ibid_admin_visit_logs` VALUES ('51', '2', '2', '192.168.1.124', '2018-04-14 14:13:57', 'pc', '1', '2018-04-14 14:13:57', '2018-04-14 14:13:57');
INSERT INTO `ibid_admin_visit_logs` VALUES ('52', '2', '2', '192.168.1.124', '2018-04-14 14:14:19', 'pc', '1', '2018-04-14 14:14:19', '2018-04-14 14:14:19');
INSERT INTO `ibid_admin_visit_logs` VALUES ('53', '2', '2', '192.168.1.119', '2018-04-14 14:57:48', 'pc', '1', '2018-04-14 14:57:48', '2018-04-14 14:57:48');
INSERT INTO `ibid_admin_visit_logs` VALUES ('54', '2', '2', '192.168.1.119', '2018-04-14 14:59:52', 'pc', '1', '2018-04-14 14:59:52', '2018-04-14 14:59:52');
INSERT INTO `ibid_admin_visit_logs` VALUES ('55', '2', '2', '192.168.1.119', '2018-04-14 15:28:11', 'pc', '1', '2018-04-14 15:28:11', '2018-04-14 15:28:11');
INSERT INTO `ibid_admin_visit_logs` VALUES ('56', '2', '2', '192.168.1.119', '2018-04-14 16:30:09', 'pc', '1', '2018-04-14 16:30:09', '2018-04-14 16:30:09');
INSERT INTO `ibid_admin_visit_logs` VALUES ('57', '2', '2', '192.168.1.119', '2018-04-14 16:33:52', 'pc', '1', '2018-04-14 16:33:52', '2018-04-14 16:33:52');
INSERT INTO `ibid_admin_visit_logs` VALUES ('58', '2', '2', '192.168.1.124', '2018-04-14 18:00:10', 'pc', '1', '2018-04-14 18:00:10', '2018-04-14 18:00:10');
INSERT INTO `ibid_admin_visit_logs` VALUES ('59', '2', '2', '192.168.1.119', '2018-04-14 18:45:54', 'pc', '1', '2018-04-14 18:45:54', '2018-04-14 18:45:54');
INSERT INTO `ibid_admin_visit_logs` VALUES ('60', '2', '2', '192.168.1.119', '2018-04-14 21:05:55', 'pc', '1', '2018-04-14 21:05:55', '2018-04-14 21:05:55');
INSERT INTO `ibid_admin_visit_logs` VALUES ('61', '2', '2', '192.168.1.119', '2018-04-14 21:34:39', 'pc', '1', '2018-04-14 21:34:39', '2018-04-14 21:34:39');
INSERT INTO `ibid_admin_visit_logs` VALUES ('62', '2', '2', '192.168.1.141', '2018-04-15 00:07:19', 'pc', '1', '2018-04-15 00:07:19', '2018-04-15 00:07:19');
INSERT INTO `ibid_admin_visit_logs` VALUES ('63', '2', '2', '192.168.1.124', '2018-04-16 09:22:32', 'pc', '1', '2018-04-16 09:22:32', '2018-04-16 09:22:32');
INSERT INTO `ibid_admin_visit_logs` VALUES ('64', '2', '2', '192.168.1.163', '2018-04-16 10:39:53', 'pc', '1', '2018-04-16 10:39:53', '2018-04-16 10:39:53');
INSERT INTO `ibid_admin_visit_logs` VALUES ('65', '2', '2', '192.168.1.163', '2018-04-16 10:58:29', 'pc', '1', '2018-04-16 10:58:29', '2018-04-16 10:58:29');
INSERT INTO `ibid_admin_visit_logs` VALUES ('66', '2', '2', '192.168.1.163', '2018-04-16 11:04:59', 'pc', '1', '2018-04-16 11:04:59', '2018-04-16 11:04:59');
INSERT INTO `ibid_admin_visit_logs` VALUES ('67', '2', '2', '192.168.1.163', '2018-04-16 11:11:18', 'pc', '1', '2018-04-16 11:11:18', '2018-04-16 11:11:18');
INSERT INTO `ibid_admin_visit_logs` VALUES ('68', '2', '2', '192.168.1.163', '2018-04-16 11:12:09', 'pc', '1', '2018-04-16 11:12:09', '2018-04-16 11:12:09');
INSERT INTO `ibid_admin_visit_logs` VALUES ('69', '2', '2', '192.168.1.163', '2018-04-16 11:23:53', 'pc', '1', '2018-04-16 11:23:53', '2018-04-16 11:23:53');
INSERT INTO `ibid_admin_visit_logs` VALUES ('70', '2', '2', '192.168.1.119', '2018-04-16 12:04:23', 'pc', '1', '2018-04-16 12:04:23', '2018-04-16 12:04:23');
INSERT INTO `ibid_admin_visit_logs` VALUES ('71', '2', '2', '192.168.1.119', '2018-04-16 13:46:55', 'pc', '1', '2018-04-16 13:46:55', '2018-04-16 13:46:55');
INSERT INTO `ibid_admin_visit_logs` VALUES ('72', '2', '2', '192.168.1.119', '2018-04-16 13:47:12', 'pc', '1', '2018-04-16 13:47:12', '2018-04-16 13:47:12');
INSERT INTO `ibid_admin_visit_logs` VALUES ('73', '2', '2', '192.168.1.119', '2018-04-16 14:27:12', 'pc', '1', '2018-04-16 14:27:12', '2018-04-16 14:27:12');
INSERT INTO `ibid_admin_visit_logs` VALUES ('74', '2', '2', '113.247.12.202', '2018-04-16 14:36:20', 'pc', '1', '2018-04-16 14:36:20', '2018-04-16 14:36:20');
INSERT INTO `ibid_admin_visit_logs` VALUES ('75', '2', '2', '113.247.12.202', '2018-04-16 14:58:22', 'pc', '1', '2018-04-16 14:58:22', '2018-04-16 14:58:22');
INSERT INTO `ibid_admin_visit_logs` VALUES ('76', '2', '2', '113.247.12.202', '2018-04-16 15:37:04', 'pc', '1', '2018-04-16 15:37:04', '2018-04-16 15:37:04');
INSERT INTO `ibid_admin_visit_logs` VALUES ('77', '2', '2', '124.232.147.165', '2018-04-16 17:14:07', 'pc', '1', '2018-04-16 17:14:07', '2018-04-16 17:14:07');
INSERT INTO `ibid_admin_visit_logs` VALUES ('78', '2', '2', '113.247.12.202', '2018-04-16 19:14:44', 'pc', '1', '2018-04-16 19:14:44', '2018-04-16 19:14:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('79', '2', '2', '113.247.12.202', '2018-04-16 20:03:18', 'pc', '1', '2018-04-16 20:03:18', '2018-04-16 20:03:18');
INSERT INTO `ibid_admin_visit_logs` VALUES ('80', '2', '2', '113.247.12.202', '2018-04-16 20:45:05', 'pc', '1', '2018-04-16 20:45:05', '2018-04-16 20:45:05');
INSERT INTO `ibid_admin_visit_logs` VALUES ('81', '2', '2', '192.168.1.119', '2018-04-16 22:07:27', 'pc', '1', '2018-04-16 22:07:27', '2018-04-16 22:07:27');
INSERT INTO `ibid_admin_visit_logs` VALUES ('82', '2', '2', '113.247.12.202', '2018-04-16 22:56:14', 'pc', '1', '2018-04-16 22:56:15', '2018-04-16 22:56:15');
INSERT INTO `ibid_admin_visit_logs` VALUES ('83', '2', '2', '113.247.12.202', '2018-04-16 23:23:35', 'pc', '1', '2018-04-16 23:23:35', '2018-04-16 23:23:35');
INSERT INTO `ibid_admin_visit_logs` VALUES ('84', '2', '2', '113.247.12.202', '2018-04-16 23:24:49', 'pc', '1', '2018-04-16 23:24:49', '2018-04-16 23:24:49');
INSERT INTO `ibid_admin_visit_logs` VALUES ('85', '2', '2', '192.168.1.124', '2018-04-17 00:09:36', 'pc', '1', '2018-04-17 00:09:36', '2018-04-17 00:09:36');
INSERT INTO `ibid_admin_visit_logs` VALUES ('86', '2', '2', '124.232.147.165', '2018-04-17 09:53:19', 'pc', '1', '2018-04-17 09:53:20', '2018-04-17 09:53:20');
INSERT INTO `ibid_admin_visit_logs` VALUES ('87', '2', '2', '113.247.12.202', '2018-04-17 11:23:25', 'pc', '1', '2018-04-17 11:23:25', '2018-04-17 11:23:25');
INSERT INTO `ibid_admin_visit_logs` VALUES ('88', '2', '2', '113.246.200.92', '2018-04-17 13:47:05', 'pc', '1', '2018-04-17 13:47:05', '2018-04-17 13:47:05');
INSERT INTO `ibid_admin_visit_logs` VALUES ('89', '2', '2', '192.168.1.119', '2018-04-17 13:50:19', 'pc', '1', '2018-04-17 13:50:19', '2018-04-17 13:50:19');
INSERT INTO `ibid_admin_visit_logs` VALUES ('90', '2', '2', '192.168.1.119', '2018-04-17 13:59:46', 'pc', '1', '2018-04-17 13:59:46', '2018-04-17 13:59:46');
INSERT INTO `ibid_admin_visit_logs` VALUES ('91', '2', '2', '192.168.1.112', '2018-04-17 14:20:40', 'pc', '1', '2018-04-17 14:20:40', '2018-04-17 14:20:40');
INSERT INTO `ibid_admin_visit_logs` VALUES ('92', '2', '2', '113.247.49.232', '2018-04-17 14:26:58', 'pc', '1', '2018-04-17 14:26:58', '2018-04-17 14:26:58');
INSERT INTO `ibid_admin_visit_logs` VALUES ('93', '2', '2', '113.247.49.232', '2018-04-17 14:49:59', 'pc', '1', '2018-04-17 14:49:59', '2018-04-17 14:49:59');
INSERT INTO `ibid_admin_visit_logs` VALUES ('94', '2', '2', '113.247.49.232', '2018-04-17 15:17:58', 'pc', '1', '2018-04-17 15:17:58', '2018-04-17 15:17:58');
INSERT INTO `ibid_admin_visit_logs` VALUES ('95', '2', '2', '113.247.49.232', '2018-04-17 15:25:22', 'pc', '1', '2018-04-17 15:25:22', '2018-04-17 15:25:22');
INSERT INTO `ibid_admin_visit_logs` VALUES ('96', '2', '2', '113.247.49.232', '2018-04-17 15:32:59', 'pc', '1', '2018-04-17 15:32:59', '2018-04-17 15:32:59');
INSERT INTO `ibid_admin_visit_logs` VALUES ('97', '2', '2', '113.247.49.232', '2018-04-17 16:13:14', 'pc', '1', '2018-04-17 16:13:14', '2018-04-17 16:13:14');
INSERT INTO `ibid_admin_visit_logs` VALUES ('98', '2', '2', '113.247.49.232', '2018-04-17 16:34:35', 'pc', '1', '2018-04-17 16:34:35', '2018-04-17 16:34:35');
INSERT INTO `ibid_admin_visit_logs` VALUES ('99', '2', '2', '113.247.49.232', '2018-04-17 16:57:49', 'pc', '1', '2018-04-17 16:57:49', '2018-04-17 16:57:49');
INSERT INTO `ibid_admin_visit_logs` VALUES ('100', '2', '2', '113.247.49.232', '2018-04-17 17:26:52', 'pc', '1', '2018-04-17 17:26:52', '2018-04-17 17:26:52');
INSERT INTO `ibid_admin_visit_logs` VALUES ('101', '2', '2', '113.247.49.232', '2018-04-17 20:41:20', 'pc', '1', '2018-04-17 20:41:20', '2018-04-17 20:41:20');
INSERT INTO `ibid_admin_visit_logs` VALUES ('102', '2', '2', '113.247.49.232', '2018-04-17 21:10:43', 'pc', '1', '2018-04-17 21:10:43', '2018-04-17 21:10:43');
INSERT INTO `ibid_admin_visit_logs` VALUES ('103', '2', '2', '113.247.49.232', '2018-04-17 21:11:44', 'pc', '1', '2018-04-17 21:11:44', '2018-04-17 21:11:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('104', '2', '2', '113.247.49.232', '2018-04-17 21:19:35', 'pc', '1', '2018-04-17 21:19:35', '2018-04-17 21:19:35');
INSERT INTO `ibid_admin_visit_logs` VALUES ('105', '2', '2', '113.247.49.232', '2018-04-17 21:21:09', 'pc', '1', '2018-04-17 21:21:09', '2018-04-17 21:21:09');
INSERT INTO `ibid_admin_visit_logs` VALUES ('106', '2', '2', '113.247.49.232', '2018-04-17 23:16:32', 'pc', '1', '2018-04-17 23:16:32', '2018-04-17 23:16:32');
INSERT INTO `ibid_admin_visit_logs` VALUES ('107', '2', '2', '113.247.49.232', '2018-04-18 09:28:38', 'pc', '1', '2018-04-18 09:28:38', '2018-04-18 09:28:38');
INSERT INTO `ibid_admin_visit_logs` VALUES ('108', '2', '2', '113.247.49.232', '2018-04-18 09:28:48', 'pc', '1', '2018-04-18 09:28:48', '2018-04-18 09:28:48');
INSERT INTO `ibid_admin_visit_logs` VALUES ('109', '2', '2', '113.247.49.232', '2018-04-18 09:37:31', 'pc', '1', '2018-04-18 09:37:31', '2018-04-18 09:37:31');
INSERT INTO `ibid_admin_visit_logs` VALUES ('110', '2', '2', '113.247.49.232', '2018-04-18 09:50:11', 'pc', '1', '2018-04-18 09:50:11', '2018-04-18 09:50:11');
INSERT INTO `ibid_admin_visit_logs` VALUES ('111', '2', '2', '113.247.49.232', '2018-04-18 09:53:09', 'pc', '1', '2018-04-18 09:53:09', '2018-04-18 09:53:09');
INSERT INTO `ibid_admin_visit_logs` VALUES ('112', '2', '2', '127.0.0.1', '2018-04-18 10:04:30', 'pc', '1', '2018-04-18 10:04:30', '2018-04-18 10:04:30');
INSERT INTO `ibid_admin_visit_logs` VALUES ('113', '2', '2', '127.0.0.1', '2018-04-18 10:55:35', 'pc', '1', '2018-04-18 10:55:35', '2018-04-18 10:55:35');
INSERT INTO `ibid_admin_visit_logs` VALUES ('114', '2', '2', '113.247.49.232', '2018-04-18 13:38:15', 'pc', '1', '2018-04-18 13:38:15', '2018-04-18 13:38:15');
INSERT INTO `ibid_admin_visit_logs` VALUES ('115', '2', '2', '113.247.49.232', '2018-04-18 13:47:02', 'pc', '1', '2018-04-18 13:47:02', '2018-04-18 13:47:02');
INSERT INTO `ibid_admin_visit_logs` VALUES ('116', '2', '2', '43.250.200.30', '2018-04-18 13:54:26', 'pc', '1', '2018-04-18 13:54:26', '2018-04-18 13:54:26');
INSERT INTO `ibid_admin_visit_logs` VALUES ('117', '2', '2', '113.247.49.232', '2018-04-18 13:57:31', 'pc', '1', '2018-04-18 13:57:31', '2018-04-18 13:57:31');
INSERT INTO `ibid_admin_visit_logs` VALUES ('118', '2', '2', '113.247.49.232', '2018-04-18 13:58:03', 'pc', '1', '2018-04-18 13:58:03', '2018-04-18 13:58:03');
INSERT INTO `ibid_admin_visit_logs` VALUES ('119', '2', '2', '43.250.200.30', '2018-04-18 14:01:02', 'pc', '1', '2018-04-18 14:01:02', '2018-04-18 14:01:02');
INSERT INTO `ibid_admin_visit_logs` VALUES ('120', '2', '2', '113.247.49.232', '2018-04-18 14:36:57', 'pc', '1', '2018-04-18 14:36:57', '2018-04-18 14:36:57');
INSERT INTO `ibid_admin_visit_logs` VALUES ('121', '2', '2', '113.247.49.232', '2018-04-18 14:47:44', 'pc', '1', '2018-04-18 14:47:44', '2018-04-18 14:47:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('122', '2', '2', '113.247.49.232', '2018-04-18 15:21:26', 'app', '1', '2018-04-18 15:21:26', '2018-04-18 15:21:26');
INSERT INTO `ibid_admin_visit_logs` VALUES ('123', '2', '2', '113.247.49.232', '2018-04-18 15:34:04', 'pc', '1', '2018-04-18 15:34:04', '2018-04-18 15:34:04');
INSERT INTO `ibid_admin_visit_logs` VALUES ('124', '2', '2', '113.247.49.232', '2018-04-18 15:40:27', 'pc', '1', '2018-04-18 15:40:27', '2018-04-18 15:40:27');
INSERT INTO `ibid_admin_visit_logs` VALUES ('125', '2', '2', '113.247.49.232', '2018-04-18 16:10:27', 'pc', '1', '2018-04-18 16:10:27', '2018-04-18 16:10:27');
INSERT INTO `ibid_admin_visit_logs` VALUES ('126', '2', '2', '113.247.49.232', '2018-04-18 16:12:55', 'pc', '1', '2018-04-18 16:12:55', '2018-04-18 16:12:55');
INSERT INTO `ibid_admin_visit_logs` VALUES ('127', '2', '2', '113.247.49.232', '2018-04-18 17:24:22', 'app', '1', '2018-04-18 17:24:22', '2018-04-18 17:24:22');
INSERT INTO `ibid_admin_visit_logs` VALUES ('128', '2', '2', '113.247.49.232', '2018-04-19 09:08:50', 'pc', '1', '2018-04-19 09:08:51', '2018-04-19 09:08:51');
INSERT INTO `ibid_admin_visit_logs` VALUES ('129', '2', '2', '127.0.0.1', '2018-04-19 09:09:19', 'pc', '1', '2018-04-19 09:09:19', '2018-04-19 09:09:19');
INSERT INTO `ibid_admin_visit_logs` VALUES ('130', '2', '2', '113.247.49.232', '2018-04-19 09:20:18', 'pc', '1', '2018-04-19 09:20:18', '2018-04-19 09:20:18');
INSERT INTO `ibid_admin_visit_logs` VALUES ('131', '2', '2', '113.247.49.232', '2018-04-19 09:24:42', 'pc', '1', '2018-04-19 09:24:42', '2018-04-19 09:24:42');
INSERT INTO `ibid_admin_visit_logs` VALUES ('132', '2', '2', '127.0.0.1', '2018-04-19 09:39:48', 'pc', '1', '2018-04-19 09:39:48', '2018-04-19 09:39:48');
INSERT INTO `ibid_admin_visit_logs` VALUES ('133', '2', '2', '127.0.0.1', '2018-04-19 10:24:14', 'pc', '1', '2018-04-19 10:24:14', '2018-04-19 10:24:14');
INSERT INTO `ibid_admin_visit_logs` VALUES ('134', '2', '2', '113.247.49.232', '2018-04-19 10:29:22', 'pc', '1', '2018-04-19 10:29:22', '2018-04-19 10:29:22');
INSERT INTO `ibid_admin_visit_logs` VALUES ('135', '2', '2', '113.247.49.232', '2018-04-19 10:40:41', 'pc', '1', '2018-04-19 10:40:41', '2018-04-19 10:40:41');
INSERT INTO `ibid_admin_visit_logs` VALUES ('136', '2', '2', '124.232.147.165', '2018-04-19 10:54:11', 'pc', '1', '2018-04-19 10:54:11', '2018-04-19 10:54:11');
INSERT INTO `ibid_admin_visit_logs` VALUES ('137', '2', '2', '113.247.49.232', '2018-04-19 10:55:21', 'app', '1', '2018-04-19 10:55:21', '2018-04-19 10:55:21');
INSERT INTO `ibid_admin_visit_logs` VALUES ('138', '2', '2', '113.247.49.232', '2018-04-19 10:55:51', 'pc', '1', '2018-04-19 10:55:51', '2018-04-19 10:55:51');
INSERT INTO `ibid_admin_visit_logs` VALUES ('139', '2', '2', '113.247.49.232', '2018-04-19 11:08:43', 'pc', '1', '2018-04-19 11:08:43', '2018-04-19 11:08:43');
INSERT INTO `ibid_admin_visit_logs` VALUES ('140', '2', '2', '113.247.49.232', '2018-04-19 11:40:09', 'pc', '1', '2018-04-19 11:40:09', '2018-04-19 11:40:09');
INSERT INTO `ibid_admin_visit_logs` VALUES ('141', '2', '2', '113.247.49.232', '2018-04-19 11:59:23', 'pc', '1', '2018-04-19 11:59:23', '2018-04-19 11:59:23');
INSERT INTO `ibid_admin_visit_logs` VALUES ('142', '2', '2', '113.247.14.175', '2018-04-19 13:51:17', 'pc', '1', '2018-04-19 13:51:17', '2018-04-19 13:51:17');
INSERT INTO `ibid_admin_visit_logs` VALUES ('143', '2', '2', '113.247.14.175', '2018-04-19 13:58:35', 'pc', '1', '2018-04-19 13:58:35', '2018-04-19 13:58:35');
INSERT INTO `ibid_admin_visit_logs` VALUES ('144', '2', '2', '175.8.204.108', '2018-04-19 15:03:17', 'pc', '1', '2018-04-19 15:03:17', '2018-04-19 15:03:17');
INSERT INTO `ibid_admin_visit_logs` VALUES ('145', '2', '2', '175.8.204.108', '2018-04-19 15:51:55', 'pc', '1', '2018-04-19 15:51:55', '2018-04-19 15:51:55');
INSERT INTO `ibid_admin_visit_logs` VALUES ('146', '2', '2', '175.8.204.108', '2018-04-19 16:54:26', 'pc', '1', '2018-04-19 16:54:26', '2018-04-19 16:54:26');
INSERT INTO `ibid_admin_visit_logs` VALUES ('147', '2', '2', '175.8.204.108', '2018-04-19 18:00:46', 'pc', '1', '2018-04-19 18:00:46', '2018-04-19 18:00:46');
INSERT INTO `ibid_admin_visit_logs` VALUES ('148', '2', '2', '36.157.214.127', '2018-04-19 19:29:57', 'pc', '1', '2018-04-19 19:29:57', '2018-04-19 19:29:57');
INSERT INTO `ibid_admin_visit_logs` VALUES ('149', '2', '2', '36.157.217.146', '2018-04-19 23:28:32', 'pc', '1', '2018-04-19 23:28:32', '2018-04-19 23:28:32');
INSERT INTO `ibid_admin_visit_logs` VALUES ('150', '2', '2', '175.8.204.108', '2018-04-20 09:04:23', 'pc', '1', '2018-04-20 09:04:23', '2018-04-20 09:04:23');
INSERT INTO `ibid_admin_visit_logs` VALUES ('151', '2', '2', '175.8.204.108', '2018-04-20 09:48:26', 'pc', '1', '2018-04-20 09:48:26', '2018-04-20 09:48:26');
INSERT INTO `ibid_admin_visit_logs` VALUES ('152', '2', '2', '0.0.0.0', '2018-04-20 10:25:20', 'pc', '1', '2018-04-20 10:25:21', '2018-04-20 10:25:21');
INSERT INTO `ibid_admin_visit_logs` VALUES ('153', '2', '2', '175.8.204.108', '2018-04-20 13:55:12', 'pc', '1', '2018-04-20 13:55:12', '2018-04-20 13:55:12');
INSERT INTO `ibid_admin_visit_logs` VALUES ('154', '2', '2', '175.8.204.108', '2018-04-20 14:50:56', 'pc', '1', '2018-04-20 14:50:56', '2018-04-20 14:50:56');
INSERT INTO `ibid_admin_visit_logs` VALUES ('155', '2', '2', '175.8.204.108', '2018-04-20 15:21:50', 'pc', '1', '2018-04-20 15:21:50', '2018-04-20 15:21:50');
INSERT INTO `ibid_admin_visit_logs` VALUES ('156', '2', '2', '0.0.0.0', '2018-04-20 16:04:09', 'pc', '1', '2018-04-20 16:04:09', '2018-04-20 16:04:09');
INSERT INTO `ibid_admin_visit_logs` VALUES ('157', '2', '2', '175.8.204.108', '2018-04-20 17:01:03', 'pc', '1', '2018-04-20 17:01:03', '2018-04-20 17:01:03');
INSERT INTO `ibid_admin_visit_logs` VALUES ('158', '2', '2', '175.8.204.108', '2018-04-20 19:25:44', 'pc', '1', '2018-04-20 19:25:44', '2018-04-20 19:25:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('159', '2', '2', '175.8.204.108', '2018-04-21 08:24:18', 'pc', '1', '2018-04-21 08:24:18', '2018-04-21 08:24:18');
INSERT INTO `ibid_admin_visit_logs` VALUES ('160', '2', '2', '175.8.204.108', '2018-04-21 08:25:47', 'pc', '1', '2018-04-21 08:25:47', '2018-04-21 08:25:47');
INSERT INTO `ibid_admin_visit_logs` VALUES ('161', '2', '2', '175.8.204.108', '2018-04-21 09:04:46', 'pc', '1', '2018-04-21 09:04:46', '2018-04-21 09:04:46');
INSERT INTO `ibid_admin_visit_logs` VALUES ('162', '2', '2', '0.0.0.0', '2018-04-21 09:17:02', 'pc', '1', '2018-04-21 09:17:02', '2018-04-21 09:17:02');
INSERT INTO `ibid_admin_visit_logs` VALUES ('163', '1', '1', '175.8.204.108', '2018-04-21 09:26:44', 'pc', '1', '2018-04-21 09:26:44', '2018-04-21 09:26:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('164', '2', '2', '127.0.0.1', '2018-04-21 10:02:33', 'pc', '1', '2018-04-21 10:02:33', '2018-04-21 10:02:33');
INSERT INTO `ibid_admin_visit_logs` VALUES ('165', '2', '2', '127.0.0.1', '2018-04-21 10:16:38', 'pc', '1', '2018-04-21 10:16:38', '2018-04-21 10:16:38');
INSERT INTO `ibid_admin_visit_logs` VALUES ('166', '2', '2', '0.0.0.0', '2018-04-21 10:35:55', 'pc', '1', '2018-04-21 10:35:55', '2018-04-21 10:35:55');
INSERT INTO `ibid_admin_visit_logs` VALUES ('167', '2', '2', '0.0.0.0', '2018-04-21 10:38:35', 'pc', '1', '2018-04-21 10:38:35', '2018-04-21 10:38:35');
INSERT INTO `ibid_admin_visit_logs` VALUES ('168', '2', '2', '127.0.0.1', '2018-04-21 11:56:53', 'pc', '1', '2018-04-21 11:56:53', '2018-04-21 11:56:53');
INSERT INTO `ibid_admin_visit_logs` VALUES ('169', '2', '2', '175.8.204.108', '2018-04-21 12:00:42', 'pc', '1', '2018-04-21 12:00:42', '2018-04-21 12:00:42');
INSERT INTO `ibid_admin_visit_logs` VALUES ('170', '2', '2', '127.0.0.1', '2018-04-21 14:22:37', 'pc', '1', '2018-04-21 14:22:37', '2018-04-21 14:22:37');
INSERT INTO `ibid_admin_visit_logs` VALUES ('171', '2', '2', '175.8.207.160', '2018-04-21 15:46:40', 'pc', '1', '2018-04-21 15:46:40', '2018-04-21 15:46:40');
INSERT INTO `ibid_admin_visit_logs` VALUES ('172', '2', '2', '175.8.207.160', '2018-04-21 16:35:57', 'pc', '1', '2018-04-21 16:35:57', '2018-04-21 16:35:57');
INSERT INTO `ibid_admin_visit_logs` VALUES ('173', '2', '2', '124.232.147.165', '2018-04-21 16:53:30', 'pc', '1', '2018-04-21 16:53:30', '2018-04-21 16:53:30');
INSERT INTO `ibid_admin_visit_logs` VALUES ('174', '2', '2', '175.8.207.160', '2018-04-21 17:34:07', 'pc', '1', '2018-04-21 17:34:07', '2018-04-21 17:34:07');
INSERT INTO `ibid_admin_visit_logs` VALUES ('175', '2', '2', '127.0.0.1', '2018-04-21 17:45:44', 'pc', '1', '2018-04-21 17:45:44', '2018-04-21 17:45:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('176', '2', '2', '175.8.207.160', '2018-04-21 17:46:44', 'pc', '1', '2018-04-21 17:46:44', '2018-04-21 17:46:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('177', '2', '2', '175.8.207.160', '2018-04-21 18:45:24', 'pc', '1', '2018-04-21 18:45:24', '2018-04-21 18:45:24');
INSERT INTO `ibid_admin_visit_logs` VALUES ('178', '2', '2', '175.8.207.160', '2018-04-21 20:00:46', 'pc', '1', '2018-04-21 20:00:46', '2018-04-21 20:00:46');
INSERT INTO `ibid_admin_visit_logs` VALUES ('179', '2', '2', '175.8.207.160', '2018-04-21 20:08:40', 'pc', '1', '2018-04-21 20:08:40', '2018-04-21 20:08:40');
INSERT INTO `ibid_admin_visit_logs` VALUES ('180', '2', '2', '222.240.234.78', '2018-04-21 21:21:10', 'pc', '1', '2018-04-21 21:21:10', '2018-04-21 21:21:10');
INSERT INTO `ibid_admin_visit_logs` VALUES ('181', '2', '2', '222.240.234.78', '2018-04-21 21:21:31', 'pc', '1', '2018-04-21 21:21:31', '2018-04-21 21:21:31');
INSERT INTO `ibid_admin_visit_logs` VALUES ('182', '2', '2', '175.8.207.160', '2018-04-21 21:22:28', 'pc', '1', '2018-04-21 21:22:28', '2018-04-21 21:22:28');
INSERT INTO `ibid_admin_visit_logs` VALUES ('183', '2', '2', '222.240.234.78', '2018-04-21 22:02:12', 'pc', '1', '2018-04-21 22:02:12', '2018-04-21 22:02:12');
INSERT INTO `ibid_admin_visit_logs` VALUES ('184', '2', '2', '175.8.207.160', '2018-04-22 10:17:06', 'pc', '1', '2018-04-22 10:17:07', '2018-04-22 10:17:07');
INSERT INTO `ibid_admin_visit_logs` VALUES ('185', '2', '2', '175.8.207.160', '2018-04-22 13:51:09', 'pc', '1', '2018-04-22 13:51:09', '2018-04-22 13:51:09');
INSERT INTO `ibid_admin_visit_logs` VALUES ('186', '2', '2', '175.8.207.160', '2018-04-22 13:56:37', 'pc', '1', '2018-04-22 13:56:37', '2018-04-22 13:56:37');
INSERT INTO `ibid_admin_visit_logs` VALUES ('187', '2', '2', '175.8.207.160', '2018-04-22 13:57:43', 'pc', '1', '2018-04-22 13:57:43', '2018-04-22 13:57:43');
INSERT INTO `ibid_admin_visit_logs` VALUES ('188', '2', '2', '175.8.207.160', '2018-04-22 14:00:04', 'pc', '1', '2018-04-22 14:00:04', '2018-04-22 14:00:04');
INSERT INTO `ibid_admin_visit_logs` VALUES ('189', '2', '2', '175.8.207.160', '2018-04-22 17:55:31', 'pc', '1', '2018-04-22 17:55:31', '2018-04-22 17:55:31');
INSERT INTO `ibid_admin_visit_logs` VALUES ('190', '2', '2', '175.8.207.160', '2018-04-22 18:00:53', 'pc', '1', '2018-04-22 18:00:53', '2018-04-22 18:00:53');
INSERT INTO `ibid_admin_visit_logs` VALUES ('191', '2', '2', '222.240.234.78', '2018-04-22 21:47:49', 'pc', '1', '2018-04-22 21:47:49', '2018-04-22 21:47:49');
INSERT INTO `ibid_admin_visit_logs` VALUES ('192', '2', '2', '222.240.234.78', '2018-04-22 21:47:56', 'pc', '1', '2018-04-22 21:47:56', '2018-04-22 21:47:56');
INSERT INTO `ibid_admin_visit_logs` VALUES ('193', '2', '2', '175.8.207.160', '2018-04-23 09:03:50', 'pc', '1', '2018-04-23 09:03:50', '2018-04-23 09:03:50');
INSERT INTO `ibid_admin_visit_logs` VALUES ('194', '2', '2', '175.8.207.160', '2018-04-23 10:09:26', 'pc', '1', '2018-04-23 10:09:26', '2018-04-23 10:09:26');
INSERT INTO `ibid_admin_visit_logs` VALUES ('195', '2', '2', '175.8.207.160', '2018-04-23 10:19:15', 'pc', '1', '2018-04-23 10:19:15', '2018-04-23 10:19:15');
INSERT INTO `ibid_admin_visit_logs` VALUES ('196', '2', '2', '175.8.207.160', '2018-04-23 10:57:37', 'pc', '1', '2018-04-23 10:57:37', '2018-04-23 10:57:37');
INSERT INTO `ibid_admin_visit_logs` VALUES ('197', '2', '2', '175.8.207.160', '2018-04-23 10:57:59', 'pc', '1', '2018-04-23 10:57:59', '2018-04-23 10:57:59');
INSERT INTO `ibid_admin_visit_logs` VALUES ('198', '2', '2', '175.8.207.160', '2018-04-23 10:58:44', 'pc', '1', '2018-04-23 10:58:44', '2018-04-23 10:58:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('199', '2', '2', '175.8.207.160', '2018-04-23 10:59:18', 'pc', '1', '2018-04-23 10:59:18', '2018-04-23 10:59:18');
INSERT INTO `ibid_admin_visit_logs` VALUES ('200', '2', '2', '175.8.207.160', '2018-04-23 11:04:44', 'pc', '1', '2018-04-23 11:04:44', '2018-04-23 11:04:44');
INSERT INTO `ibid_admin_visit_logs` VALUES ('201', '2', '2', '175.8.207.160', '2018-04-23 11:09:04', 'pc', '1', '2018-04-23 11:09:04', '2018-04-23 11:09:04');
INSERT INTO `ibid_admin_visit_logs` VALUES ('202', '2', '2', '175.8.207.160', '2018-04-23 11:10:16', 'pc', '1', '2018-04-23 11:10:16', '2018-04-23 11:10:16');
INSERT INTO `ibid_admin_visit_logs` VALUES ('203', '2', '2', '175.8.207.160', '2018-04-23 11:12:30', 'pc', '1', '2018-04-23 11:12:30', '2018-04-23 11:12:30');
INSERT INTO `ibid_admin_visit_logs` VALUES ('204', '2', '2', '175.8.207.160', '2018-04-23 11:18:40', 'pc', '1', '2018-04-23 11:18:40', '2018-04-23 11:18:40');
INSERT INTO `ibid_admin_visit_logs` VALUES ('205', '2', '2', '175.8.207.160', '2018-04-23 11:31:30', 'pc', '1', '2018-04-23 11:31:30', '2018-04-23 11:31:30');
INSERT INTO `ibid_admin_visit_logs` VALUES ('206', '2', '2', '175.8.207.160', '2018-04-23 11:47:49', 'pc', '1', '2018-04-23 11:47:49', '2018-04-23 11:47:49');
INSERT INTO `ibid_admin_visit_logs` VALUES ('207', '2', '2', '175.8.207.160', '2018-04-23 11:54:35', 'pc', '1', '2018-04-23 11:54:35', '2018-04-23 11:54:35');
INSERT INTO `ibid_admin_visit_logs` VALUES ('208', '2', '2', '113.247.12.81', '2018-04-23 13:41:53', 'pc', '1', '2018-04-23 13:41:53', '2018-04-23 13:41:53');
INSERT INTO `ibid_admin_visit_logs` VALUES ('209', '2', '2', '113.247.12.81', '2018-04-23 13:50:29', 'pc', '1', '2018-04-23 13:50:29', '2018-04-23 13:50:29');
INSERT INTO `ibid_admin_visit_logs` VALUES ('210', '2', '2', '113.247.12.81', '2018-04-23 15:01:04', 'pc', '1', '2018-04-23 15:01:04', '2018-04-23 15:01:04');
INSERT INTO `ibid_admin_visit_logs` VALUES ('211', '2', '2', '113.247.12.81', '2018-04-23 15:03:36', 'pc', '1', '2018-04-23 15:03:36', '2018-04-23 15:03:36');
INSERT INTO `ibid_admin_visit_logs` VALUES ('212', '2', '2', '113.247.12.81', '2018-04-23 15:50:39', 'pc', '1', '2018-04-23 15:50:39', '2018-04-23 15:50:39');
INSERT INTO `ibid_admin_visit_logs` VALUES ('213', '2', '2', '113.247.12.81', '2018-04-23 15:50:50', 'pc', '1', '2018-04-23 15:50:50', '2018-04-23 15:50:50');
INSERT INTO `ibid_admin_visit_logs` VALUES ('214', '2', '2', '127.0.0.1', '2018-04-23 16:50:13', 'pc', '1', '2018-04-23 16:50:13', '2018-04-23 16:50:13');
INSERT INTO `ibid_admin_visit_logs` VALUES ('215', '2', '2', '113.247.12.81', '2018-04-23 16:50:03', 'pc', '1', '2018-04-23 16:50:03', '2018-04-23 16:50:03');
INSERT INTO `ibid_admin_visit_logs` VALUES ('216', '2', '2', '113.247.12.81', '2018-04-24 00:01:13', 'pc', '1', '2018-04-24 00:01:13', '2018-04-24 00:01:13');
INSERT INTO `ibid_admin_visit_logs` VALUES ('217', '2', '2', '113.247.12.81', '2018-04-24 00:02:40', 'pc', '1', '2018-04-24 00:02:40', '2018-04-24 00:02:40');
INSERT INTO `ibid_admin_visit_logs` VALUES ('218', '2', '2', '113.247.12.81', '2018-04-24 09:12:20', 'pc', '1', '2018-04-24 09:12:20', '2018-04-24 09:12:20');
INSERT INTO `ibid_admin_visit_logs` VALUES ('219', '2', '2', '113.247.12.81', '2018-04-24 09:12:32', 'pc', '1', '2018-04-24 09:12:32', '2018-04-24 09:12:32');
INSERT INTO `ibid_admin_visit_logs` VALUES ('220', '2', '2', '113.247.12.81', '2018-04-24 09:15:45', 'pc', '1', '2018-04-24 09:15:45', '2018-04-24 09:15:45');
INSERT INTO `ibid_admin_visit_logs` VALUES ('221', '2', '2', '113.247.12.81', '2018-04-24 09:16:28', 'pc', '1', '2018-04-24 09:16:28', '2018-04-24 09:16:28');
INSERT INTO `ibid_admin_visit_logs` VALUES ('222', '2', '2', '113.247.12.81', '2018-04-24 10:10:49', 'pc', '1', '2018-04-24 10:10:49', '2018-04-24 10:10:49');
INSERT INTO `ibid_admin_visit_logs` VALUES ('223', '2', '2', '113.247.12.81', '2018-04-24 10:21:34', 'pc', '1', '2018-04-24 10:21:34', '2018-04-24 10:21:34');
INSERT INTO `ibid_admin_visit_logs` VALUES ('224', '2', '2', '113.247.12.81', '2018-04-24 10:59:29', 'pc', '1', '2018-04-24 10:59:29', '2018-04-24 10:59:29');
INSERT INTO `ibid_admin_visit_logs` VALUES ('225', '2', '2', '113.246.200.32', '2018-04-24 14:16:29', 'pc', '1', '2018-04-24 14:16:29', '2018-04-24 14:16:29');
INSERT INTO `ibid_admin_visit_logs` VALUES ('226', '2', '2', '127.0.0.1', '2018-04-24 15:21:10', 'pc', '1', '2018-04-24 15:21:10', '2018-04-24 15:21:10');
INSERT INTO `ibid_admin_visit_logs` VALUES ('227', '2', '2', '127.0.0.1', '2018-04-24 15:22:19', 'pc', '1', '2018-04-24 15:22:19', '2018-04-24 15:22:19');
INSERT INTO `ibid_admin_visit_logs` VALUES ('228', '2', '2', '113.246.200.32', '2018-04-24 17:06:20', 'pc', '1', '2018-04-24 17:06:20', '2018-04-24 17:06:20');
INSERT INTO `ibid_admin_visit_logs` VALUES ('229', '2', '2', '113.246.200.32', '2018-04-24 17:42:30', 'pc', '1', '2018-04-24 17:42:30', '2018-04-24 17:42:30');
INSERT INTO `ibid_admin_visit_logs` VALUES ('230', '2', '2', '124.232.147.165', '2018-04-25 08:34:10', 'pc', '1', '2018-04-25 08:34:10', '2018-04-25 08:34:10');
INSERT INTO `ibid_admin_visit_logs` VALUES ('231', '2', '2', '113.246.200.32', '2018-04-25 09:12:34', 'pc', '1', '2018-04-25 09:12:34', '2018-04-25 09:12:34');

-- -----------------------------
-- Table structure for `ibid_admins`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_admins`;
CREATE TABLE `ibid_admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) DEFAULT NULL COMMENT '管理员手机号',
  `name` varchar(50) DEFAULT NULL COMMENT '管理员真实姓名',
  `user_name` varchar(50) DEFAULT NULL COMMENT '管理员用户名',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '管理员昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '管理员头像',
  `telephone` varchar(20) DEFAULT NULL COMMENT '管理员联系电话',
  `qq` varchar(255) DEFAULT NULL COMMENT '管理员qq号',
  `wechat` varchar(255) DEFAULT NULL COMMENT '管理员微信号',
  `email` varchar(50) DEFAULT NULL COMMENT '管理员邮箱',
  `memo` text COMMENT '备注',
  `role_ids` text COMMENT '角色IDs',
  `status` tinyint(1) DEFAULT '1' COMMENT '管理员状态：1正常9黑名单',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_admins`
-- -----------------------------
INSERT INTO `ibid_admins` VALUES ('1', '', '', '', 'yiyun', '', '', '', '', '', '', '[\"3\"]', '1', '1', '2018-04-10 16:40:36', '2018-04-11 16:46:56');
INSERT INTO `ibid_admins` VALUES ('2', '18888888888', '', '', 'admin', '/public/upload/images/1523968929821.jpg', '', '', '', '', '', '[\"3\"]', '1', '1', '2018-04-10 16:40:48', '2018-04-11 16:46:56');
INSERT INTO `ibid_admins` VALUES ('3', '', '', '', 'test', '', '', '', '', '', '', '\"\"', '1', '0', '2018-04-11 10:22:20', '2018-04-11 10:30:41');
INSERT INTO `ibid_admins` VALUES ('4', '', '', '', 'test', '', '', '', '', '', '', '\"\"', '1', '1', '2018-04-11 14:09:07', '2018-04-11 16:46:56');
INSERT INTO `ibid_admins` VALUES ('5', '18999999999', '', '', '', '', '', '', '', '', '', '[3]', '1', '1', '2018-04-23 10:58:22', '2018-04-23 10:58:22');

-- -----------------------------
-- Table structure for `ibid_advertisements`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_advertisements`;
CREATE TABLE `ibid_advertisements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '广告类型',
  `name` varchar(255) NOT NULL COMMENT '广告名称',
  `img` text COMMENT '广告图片',
  `alt` varchar(255) DEFAULT NULL COMMENT '图片alt属性',
  `memo` text COMMENT '备注',
  `position` varchar(50) DEFAULT NULL COMMENT '广告显示位置',
  `href` text COMMENT '链接',
  `is_open_model` tinyint(1) DEFAULT '0' COMMENT '是否开启模型：0否1是',
  `model` varchar(50) DEFAULT NULL COMMENT '绑定模型',
  `model_id` bigint(20) DEFAULT NULL COMMENT '模型ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_advertisements`
-- -----------------------------
INSERT INTO `ibid_advertisements` VALUES ('1', 'wap首页广告', 'wap首页广告', '/public/upload/images/1523973499191.jpg', '', '', '1', '', '0', '', '0', '1', '1', '2018-04-17 21:58:19', '2018-04-17 21:58:19');
INSERT INTO `ibid_advertisements` VALUES ('2', 'wap首页广告', 'wap首页广告1', '/public/upload/images/1523973510890.jpg', '', '', '2', '', '0', '', '0', '1', '1', '2018-04-17 21:58:30', '2018-04-17 21:58:30');
INSERT INTO `ibid_advertisements` VALUES ('3', 'wap首页广告', 'wap首页广告2', '/public/upload/images/1523973523482.jpg', '', '', '2', '', '0', '', '0', '1', '1', '2018-04-17 21:58:43', '2018-04-17 21:58:43');
INSERT INTO `ibid_advertisements` VALUES ('4', 'wap限时折扣广告图', 'wap限时折扣广告图1', '/public/upload/images/1524119343222.jpg', '', '', '', '', '0', '', '0', '1', '1', '2018-04-19 14:29:03', '2018-04-19 14:29:03');

-- -----------------------------
-- Table structure for `ibid_annoncements`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_annoncements`;
CREATE TABLE `ibid_annoncements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '公告标题',
  `author` varchar(50) DEFAULT NULL,
  `intro` text COMMENT '公告简介',
  `thum` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `imgs` text COMMENT '图片集',
  `content` text COMMENT '公告内容',
  `audio_url` text COMMENT '音频链接',
  `video_url` text COMMENT '视频链接',
  `online_time` datetime DEFAULT NULL COMMENT '公告上线时间',
  `offline_time` datetime DEFAULT NULL COMMENT '公告下线时间',
  `issue_time` datetime DEFAULT NULL COMMENT '公告发布时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_annoncements`
-- -----------------------------
INSERT INTO `ibid_annoncements` VALUES ('1', 'wap首页公告', '拥有10亿微信用户的小程序，最大的移动互联网商机，你非做不可 ', '', '', '', '[]', '<p>防守打法</p>', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '1', '2018-04-17 22:00:22', '2018-04-17 22:00:22');
INSERT INTO `ibid_annoncements` VALUES ('2', 'wap首页公告', '会乘电梯、会让路，继菜鸟京东之后，苏宁也推出无人快递车', '', '', '', '[]', '<p>防守打法</p>', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '1', '2018-04-17 22:00:37', '2018-04-17 22:00:37');

-- -----------------------------
-- Table structure for `ibid_article_types`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_article_types`;
CREATE TABLE `ibid_article_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT '0' COMMENT '分类父ID',
  `thum` varchar(255) DEFAULT NULL COMMENT '分类缩略图',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '文章分类的状态：1正常2隐藏',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '分类的状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ibid_articles`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_articles`;
CREATE TABLE `ibid_articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `thum` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `intro` text COMMENT '文章简介',
  `content` text COMMENT '文章内容',
  `author` varchar(50) DEFAULT NULL COMMENT '文章作者',
  `imgs` text COMMENT '文章的图片集',
  `audio_url` text COMMENT '音频链接',
  `video_url` text COMMENT '视频链接',
  `type_id` bigint(20) DEFAULT '0' COMMENT '文章的分类ID',
  `click_num` bigint(20) DEFAULT '0' COMMENT '文章的点击量',
  `status` tinyint(1) DEFAULT '1' COMMENT '1上线2下线',
  `issue_time` varchar(255) DEFAULT NULL COMMENT '文章发布时间',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ibid_attr_names`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_attr_names`;
CREATE TABLE `ibid_attr_names` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attr_template_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品属性模型ID',
  `name` varchar(255) NOT NULL COMMENT '商品属性名称',
  `sort` int(11) DEFAULT '0' COMMENT '商品属性排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_attr_names`
-- -----------------------------
INSERT INTO `ibid_attr_names` VALUES ('1', '1', '产地', '0', '1', '2018-04-17 15:52:22', '2018-04-17 15:52:22');
INSERT INTO `ibid_attr_names` VALUES ('2', '1', '布料', '0', '1', '2018-04-17 15:52:42', '2018-04-17 15:52:42');
INSERT INTO `ibid_attr_names` VALUES ('3', '2', '适用季节', '0', '1', '2018-04-19 11:10:29', '2018-04-19 11:10:29');
INSERT INTO `ibid_attr_names` VALUES ('4', '2', '款式', '0', '1', '2018-04-19 11:13:44', '2018-04-19 11:13:44');
INSERT INTO `ibid_attr_names` VALUES ('5', '2', '面料', '0', '1', '2018-04-19 11:15:35', '2018-04-19 11:15:35');

-- -----------------------------
-- Table structure for `ibid_attr_options`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_attr_options`;
CREATE TABLE `ibid_attr_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attr_template_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品属性模板ID',
  `attr_name_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品属性ID',
  `option` varchar(255) NOT NULL COMMENT '商品属性选项',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_attr_options`
-- -----------------------------
INSERT INTO `ibid_attr_options` VALUES ('1', '1', '1', '中国', '0', '1', '2018-04-17 15:52:22', '2018-04-17 15:52:22');
INSERT INTO `ibid_attr_options` VALUES ('2', '1', '1', '印度', '0', '1', '2018-04-17 15:52:22', '2018-04-17 15:52:22');
INSERT INTO `ibid_attr_options` VALUES ('3', '1', '1', '美国', '0', '1', '2018-04-17 15:52:22', '2018-04-17 15:52:22');
INSERT INTO `ibid_attr_options` VALUES ('4', '1', '2', '晴纶', '0', '1', '2018-04-17 15:52:42', '2018-04-17 15:52:42');
INSERT INTO `ibid_attr_options` VALUES ('5', '1', '2', '毛线', '0', '1', '2018-04-17 15:52:42', '2018-04-17 15:52:42');
INSERT INTO `ibid_attr_options` VALUES ('6', '1', '2', '针织', '0', '1', '2018-04-17 15:52:42', '2018-04-17 15:52:42');
INSERT INTO `ibid_attr_options` VALUES ('7', '2', '3', '春秋', '0', '1', '2018-04-19 11:10:29', '2018-04-19 11:10:29');
INSERT INTO `ibid_attr_options` VALUES ('8', '2', '3', '秋冬', '0', '1', '2018-04-19 11:10:29', '2018-04-19 11:10:29');
INSERT INTO `ibid_attr_options` VALUES ('9', '2', '3', '四季通用', '0', '1', '2018-04-19 11:10:29', '2018-04-19 11:10:29');
INSERT INTO `ibid_attr_options` VALUES ('10', '2', '3', '春夏', '0', '1', '2018-04-19 11:10:29', '2018-04-19 11:10:29');
INSERT INTO `ibid_attr_options` VALUES ('11', '2', '4', '床单式', '0', '1', '2018-04-19 11:13:44', '2018-04-19 11:13:44');
INSERT INTO `ibid_attr_options` VALUES ('12', '2', '4', '床笠式', '0', '1', '2018-04-19 11:13:44', '2018-04-19 11:13:44');
INSERT INTO `ibid_attr_options` VALUES ('13', '2', '5', '纯棉', '0', '1', '2018-04-19 11:15:35', '2018-04-19 11:15:35');
INSERT INTO `ibid_attr_options` VALUES ('14', '2', '5', '丝绵', '0', '1', '2018-04-19 11:15:35', '2018-04-19 11:15:35');
INSERT INTO `ibid_attr_options` VALUES ('15', '2', '5', '莫代尔', '0', '1', '2018-04-19 11:15:35', '2018-04-19 11:15:35');

-- -----------------------------
-- Table structure for `ibid_attr_templates`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_attr_templates`;
CREATE TABLE `ibid_attr_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '商品属性模板名称',
  `intro` text COMMENT '商品属性模板简介',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_attr_templates`
-- -----------------------------
INSERT INTO `ibid_attr_templates` VALUES ('1', '衣服属性模板', '衣服属性模板', '0', '2018-04-17 15:52:05', '2018-04-19 11:03:30');
INSERT INTO `ibid_attr_templates` VALUES ('2', '床品套件', '', '1', '2018-04-19 11:09:24', '2018-04-19 11:09:24');
INSERT INTO `ibid_attr_templates` VALUES ('3', '款式', '', '0', '2018-04-19 11:12:39', '2018-04-19 11:13:26');

-- -----------------------------
-- Table structure for `ibid_bank_cards`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_bank_cards`;
CREATE TABLE `ibid_bank_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bank_name` varchar(255) NOT NULL COMMENT '银行名称',
  `card_number` varchar(255) NOT NULL COMMENT '银行卡号',
  `card_holder` varchar(255) NOT NULL COMMENT '持卡人',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_bank_cards`
-- -----------------------------
INSERT INTO `ibid_bank_cards` VALUES ('1', '1', '中国银行', '1234534654674545', '发生的', '1', '2018-04-17 16:03:00', '2018-04-17 16:03:00');
INSERT INTO `ibid_bank_cards` VALUES ('2', '2', '中国农业银行', '436646646656565235435', '李舟', '0', '2018-04-17 16:34:59', '2018-04-21 10:20:55');
INSERT INTO `ibid_bank_cards` VALUES ('3', '1', '中国建设银行', '56654855355', '咯来咯我哦经历', '1', '2018-04-19 10:22:55', '2018-04-19 10:22:55');
INSERT INTO `ibid_bank_cards` VALUES ('4', '10', '中国建设银行', '6217002870013046899', '刘备', '1', '2018-04-20 09:32:04', '2018-04-20 09:32:04');
INSERT INTO `ibid_bank_cards` VALUES ('5', '9', '中国农业银行', '43886664646466', '罗', '1', '2018-04-20 14:00:11', '2018-04-20 14:00:11');
INSERT INTO `ibid_bank_cards` VALUES ('6', '2', '光大银行', '34655144234', 'dfs', '0', '2018-04-21 18:00:11', '2018-04-23 15:43:55');
INSERT INTO `ibid_bank_cards` VALUES ('7', '2', '中国农业银行', '123456789454', '来来来', '1', '2018-04-23 15:44:11', '2018-04-23 15:44:11');
INSERT INTO `ibid_bank_cards` VALUES ('8', '10', '建设银行', '6217002870013000500', '刘备', '1', '2018-04-23 15:56:06', '2018-04-23 15:56:06');

-- -----------------------------
-- Table structure for `ibid_banners`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_banners`;
CREATE TABLE `ibid_banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '轮播图类别',
  `name` varchar(255) NOT NULL COMMENT '轮播图名称',
  `img` text COMMENT '轮播图图片',
  `alt` varchar(255) DEFAULT NULL COMMENT '图片alt属性',
  `href` text COMMENT '链接',
  `position` varchar(50) DEFAULT NULL COMMENT '轮播图显示位置',
  `memo` text COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '轮播图状态：1上线2下线',
  `is_open_model` tinyint(1) DEFAULT '0' COMMENT '开启模型：0关闭1开启',
  `model` varchar(50) DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL,
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_banners`
-- -----------------------------
INSERT INTO `ibid_banners` VALUES ('1', 'wap首页轮播', 'wap首页轮播1', '/public/upload/images/1524109540179.jpg', '', '', '', '', '1', '0', '', '0', '1', '2018-04-17 15:33:41', '2018-04-17 15:33:41');
INSERT INTO `ibid_banners` VALUES ('2', 'wap首页轮播', 'wap首页轮播2', '/public/upload/images/1524109555478.jpg', '', '', '', '', '1', '0', '', '0', '1', '2018-04-17 15:33:53', '2018-04-17 15:33:53');
INSERT INTO `ibid_banners` VALUES ('3', 'wap领券中心轮播', 'wap领券中心轮播1', '/public/upload/images/1524110063214.jpg', '', '', '', '', '1', '0', '', '0', '1', '2018-04-17 15:59:25', '2018-04-17 15:59:25');
INSERT INTO `ibid_banners` VALUES ('4', 'wap领券中心轮播', 'wap领券中心轮播2', '/public/upload/images/1523951974519.jpg', '', '', '', '', '1', '0', '', '0', '0', '2018-04-17 15:59:34', '2018-04-19 11:50:39');
INSERT INTO `ibid_banners` VALUES ('5', 'pc首页轮播', 'pc轮播', '', '', '', '', '', '1', '0', '', '0', '1', '2018-04-24 17:59:34', '2018-04-24 17:59:34');

-- -----------------------------
-- Table structure for `ibid_carts`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_carts`;
CREATE TABLE `ibid_carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `goods_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `spec_group_id` bigint(20) DEFAULT '0' COMMENT '商品属性信息',
  `num` int(11) unsigned DEFAULT '1' COMMENT '商品的数量',
  `status` tinyint(1) DEFAULT '1' COMMENT '1：正常，2：已购买',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_carts`
-- -----------------------------
INSERT INTO `ibid_carts` VALUES ('1', '1', '40', '158', '1', '1', '0', '2018-04-19 17:03:56', '2018-04-19 17:59:45');
INSERT INTO `ibid_carts` VALUES ('2', '1', '34', '127', '1', '1', '0', '2018-04-19 17:49:57', '2018-04-19 18:00:44');
INSERT INTO `ibid_carts` VALUES ('3', '1', '40', '158', '1', '1', '0', '2018-04-19 18:00:38', '2018-04-19 18:00:44');
INSERT INTO `ibid_carts` VALUES ('4', '1', '40', '158', '1', '1', '0', '2018-04-19 18:00:57', '2018-04-19 18:01:29');
INSERT INTO `ibid_carts` VALUES ('5', '1', '37', '141', '1', '1', '0', '2018-04-19 18:01:02', '2018-04-19 18:01:29');
INSERT INTO `ibid_carts` VALUES ('26', '13', '36', '135', '1', '1', '1', '2018-04-20 12:00:32', '2018-04-20 12:00:32');
INSERT INTO `ibid_carts` VALUES ('8', '2', '40', '158', '2', '1', '0', '2018-04-20 09:06:13', '2018-04-20 10:08:13');
INSERT INTO `ibid_carts` VALUES ('9', '2', '39', '157', '1', '1', '0', '2018-04-20 09:06:25', '2018-04-20 10:08:13');
INSERT INTO `ibid_carts` VALUES ('10', '2', '38', '147', '1', '1', '0', '2018-04-20 09:06:48', '2018-04-20 10:08:13');
INSERT INTO `ibid_carts` VALUES ('11', '2', '37', '141', '1', '1', '0', '2018-04-20 09:46:31', '2018-04-20 10:08:13');
INSERT INTO `ibid_carts` VALUES ('30', '9', '34', '125', '2', '1', '0', '2018-04-20 13:58:01', '2018-04-20 13:58:45');
INSERT INTO `ibid_carts` VALUES ('31', '9', '33', '80', '2', '1', '0', '2018-04-20 14:33:36', '2018-04-21 11:02:03');
INSERT INTO `ibid_carts` VALUES ('32', '9', '34', '125', '4', '1', '0', '2018-04-20 21:24:21', '2018-04-21 11:15:03');
INSERT INTO `ibid_carts` VALUES ('36', '10', '34', '0', '5', '1', '0', '2018-04-21 10:12:53', '2018-04-21 16:17:25');
INSERT INTO `ibid_carts` VALUES ('45', '2', '42', '0', '2', '1', '0', '2018-04-21 11:03:55', '2018-04-23 10:43:40');
INSERT INTO `ibid_carts` VALUES ('46', '9', '33', '80', '1', '1', '0', '2018-04-21 11:15:21', '2018-04-21 11:15:40');
INSERT INTO `ibid_carts` VALUES ('39', '1', '38', '146', '1', '1', '0', '2018-04-21 10:25:58', '2018-04-21 10:29:29');
INSERT INTO `ibid_carts` VALUES ('47', '9', '38', '145', '1', '1', '0', '2018-04-21 11:15:28', '2018-04-21 11:15:37');
INSERT INTO `ibid_carts` VALUES ('48', '9', '34', '121', '1', '1', '0', '2018-04-21 11:15:51', '2018-04-21 11:16:55');
INSERT INTO `ibid_carts` VALUES ('49', '9', '34', '121', '1', '1', '0', '2018-04-21 11:18:22', '2018-04-21 14:51:48');
INSERT INTO `ibid_carts` VALUES ('50', '9', '35', '130', '3', '1', '0', '2018-04-21 11:18:29', '2018-04-21 11:52:05');
INSERT INTO `ibid_carts` VALUES ('86', '9', '40', '158', '1', '1', '0', '2018-04-24 10:12:03', '2018-04-24 10:13:51');
INSERT INTO `ibid_carts` VALUES ('74', '9', '32', '0', '1', '1', '0', '2018-04-23 11:09:02', '2018-04-23 21:34:10');
INSERT INTO `ibid_carts` VALUES ('54', '9', '40', '158', '1', '1', '0', '2018-04-21 13:53:25', '2018-04-21 14:53:43');
INSERT INTO `ibid_carts` VALUES ('73', '10', '41', '0', '1', '1', '0', '2018-04-23 10:23:22', '2018-04-24 21:19:47');
INSERT INTO `ibid_carts` VALUES ('56', '9', '23', '0', '4', '1', '0', '2018-04-21 13:54:42', '2018-04-21 14:51:52');
INSERT INTO `ibid_carts` VALUES ('65', '3', '30', '0', '5', '1', '1', '2018-04-21 20:05:00', '2018-04-21 20:05:00');
INSERT INTO `ibid_carts` VALUES ('97', '2', '32', '92', '1', '1', '1', '2018-04-24 15:08:51', '2018-04-24 15:08:51');
INSERT INTO `ibid_carts` VALUES ('66', '3', '7', '198', '7', '1', '1', '2018-04-21 20:06:28', '2018-04-21 20:25:57');
INSERT INTO `ibid_carts` VALUES ('61', '2', '39', '185', '1', '1', '0', '2018-04-21 16:12:59', '2018-04-23 10:43:40');
INSERT INTO `ibid_carts` VALUES ('72', '10', '42', '0', '3', '1', '0', '2018-04-23 10:23:10', '2018-04-24 21:10:19');
INSERT INTO `ibid_carts` VALUES ('63', '10', '42', '0', '1', '1', '0', '2018-04-21 16:16:47', '2018-04-21 16:18:45');
INSERT INTO `ibid_carts` VALUES ('67', '15', '7', '198', '1', '1', '1', '2018-04-21 20:28:50', '2018-04-23 11:09:40');
INSERT INTO `ibid_carts` VALUES ('92', '1', '24', '0', '1', '1', '1', '2018-04-24 14:49:58', '2018-04-24 14:49:58');
INSERT INTO `ibid_carts` VALUES ('88', '9', '38', '146', '1', '1', '0', '2018-04-24 10:26:30', '2018-04-24 10:26:40');
INSERT INTO `ibid_carts` VALUES ('80', '1', '31', '174', '1', '1', '1', '2018-04-23 15:43:01', '2018-04-24 14:50:06');
INSERT INTO `ibid_carts` VALUES ('89', '9', '40', '158', '1', '1', '0', '2018-04-24 10:33:28', '2018-04-24 10:33:37');
INSERT INTO `ibid_carts` VALUES ('101', '9', '40', '158', '1', '1', '0', '2018-04-24 18:11:16', '2018-04-24 18:11:22');
INSERT INTO `ibid_carts` VALUES ('100', '9', '40', '158', '1', '1', '0', '2018-04-24 17:21:31', '2018-04-24 18:10:08');
INSERT INTO `ibid_carts` VALUES ('98', '2', '31', '173', '2', '1', '0', '2018-04-24 15:08:57', '2018-04-24 15:09:48');
INSERT INTO `ibid_carts` VALUES ('99', '2', '36', '133', '1', '1', '1', '2018-04-24 15:09:58', '2018-04-24 15:12:48');
INSERT INTO `ibid_carts` VALUES ('111', '22', '42', '0', '1', '1', '0', '2018-04-25 08:59:48', '2018-04-25 09:01:02');
INSERT INTO `ibid_carts` VALUES ('113', '22', '42', '0', '2', '1', '0', '2018-04-25 09:05:31', '2018-04-25 09:06:32');
INSERT INTO `ibid_carts` VALUES ('114', '22', '42', '0', '1', '1', '0', '2018-04-25 09:06:39', '2018-04-25 09:07:19');

-- -----------------------------
-- Table structure for `ibid_custom_indexbannergoods`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_custom_indexbannergoods`;
CREATE TABLE `ibid_custom_indexbannergoods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ad_img` text COMMENT '2|广告图',
  `ad_href` text COMMENT '1|广告图链接',
  `goods_ids` text COMMENT '1|商品id集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_custom_indexbannergoods`
-- -----------------------------
INSERT INTO `ibid_custom_indexbannergoods` VALUES ('1', '/public/upload/images/1523951857644.jpg', '/', '1');
INSERT INTO `ibid_custom_indexbannergoods` VALUES ('2', '/public/upload/images/1523951888496.jpg', '/', '1');

-- -----------------------------
-- Table structure for `ibid_custom_pctuijiangoods`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_custom_pctuijiangoods`;
CREATE TABLE `ibid_custom_pctuijiangoods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` text COMMENT '1|商品ID',
  `sort` text COMMENT '1|商品排序',
  `type` text COMMENT '1|类别',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_custom_pctuijiangoods`
-- -----------------------------
INSERT INTO `ibid_custom_pctuijiangoods` VALUES ('1', '37', '1', 'type1');
INSERT INTO `ibid_custom_pctuijiangoods` VALUES ('2', '38', '2', 'type2');
INSERT INTO `ibid_custom_pctuijiangoods` VALUES ('3', '39', '3', 'type3');
INSERT INTO `ibid_custom_pctuijiangoods` VALUES ('4', '40', '4', 'type1');
INSERT INTO `ibid_custom_pctuijiangoods` VALUES ('5', '36', '5', 'type4');
INSERT INTO `ibid_custom_pctuijiangoods` VALUES ('6', '6', '6', 'type5');

-- -----------------------------
-- Table structure for `ibid_custom_userlevel`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_custom_userlevel`;
CREATE TABLE `ibid_custom_userlevel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `money` text COMMENT '1|销售额',
  `56` text COMMENT '1|测试',
  `rrr` text COMMENT '1|飞洒地',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ibid_custom_www`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_custom_www`;
CREATE TABLE `ibid_custom_www` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `money` text COMMENT '1|销售额',
  `money1` text COMMENT '2|销售额1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ibid_dds`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_dds`;
CREATE TABLE `ibid_dds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '数据字典名称',
  `table_name` varchar(20) NOT NULL COMMENT '数据字典数据表名称',
  `intro` text COMMENT '数据字典说明',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_dds`
-- -----------------------------
INSERT INTO `ibid_dds` VALUES ('1', '模型测试1表', 'test', '自定义模型测试表1', '0', '2018-04-02 21:30:44', '2018-04-02 23:10:46');
INSERT INTO `ibid_dds` VALUES ('2', '模型测试表', 'test', '自定义模型测试表', '0', '2018-04-02 21:37:36', '2018-04-02 21:38:25');
INSERT INTO `ibid_dds` VALUES ('3', '模型测试表', 'test', '自定义模型测试表', '0', '2018-04-02 21:38:57', '2018-04-05 17:57:24');
INSERT INTO `ibid_dds` VALUES ('4', '模型测试表', 'userlevel', '自定义模型测试表', '0', '2018-04-02 22:59:36', '2018-04-05 17:57:24');
INSERT INTO `ibid_dds` VALUES ('5', '模型测试表', 'userlevel', '', '0', '2018-04-03 09:50:47', '2018-04-03 14:09:02');
INSERT INTO `ibid_dds` VALUES ('6', 'test', 'test', '', '0', '2018-04-03 10:17:02', '2018-04-03 14:08:57');
INSERT INTO `ibid_dds` VALUES ('7', '方式', 'www', '', '1', '2018-04-03 10:49:02', '2018-04-03 10:49:02');
INSERT INTO `ibid_dds` VALUES ('8', '模型测试表', 'userlevel', '自定义模型测试表', '1', '2018-04-05 17:57:24', '2018-04-05 17:57:24');
INSERT INTO `ibid_dds` VALUES ('9', '首页轮播商品', 'indexbannergoods', '', '1', '2018-04-17 11:33:54', '2018-04-17 11:33:54');
INSERT INTO `ibid_dds` VALUES ('10', 'PC端商品推荐', 'pctuijiangoods', 'PC端为你推荐栏目', '1', '2018-04-21 09:28:46', '2018-04-21 09:28:46');

-- -----------------------------
-- Table structure for `ibid_feedbacks`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_feedbacks`;
CREATE TABLE `ibid_feedbacks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '反馈的标题',
  `content` text COMMENT '反馈的详细说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：预留字段',
  `is_deal` tinyint(1) DEFAULT '0' COMMENT '是否处理：0未处理1已处理',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_feedbacks`
-- -----------------------------
INSERT INTO `ibid_feedbacks` VALUES ('1', '3', '', '', '功能异常', '测试', '1', '1', '1', '2018-04-17 18:09:29', '2018-04-17 21:21:37');
INSERT INTO `ibid_feedbacks` VALUES ('2', '1', '', '', '功能异常', '莫文蔚', '1', '0', '1', '2018-04-18 15:19:58', '2018-04-18 15:19:58');

-- -----------------------------
-- Table structure for `ibid_friendly_links`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_friendly_links`;
CREATE TABLE `ibid_friendly_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '友情链接类型',
  `name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `img` text COMMENT '友情链接图片',
  `alt` varchar(255) DEFAULT NULL COMMENT '友情链接图片alt属性',
  `memo` text COMMENT '友情链接备注',
  `position` varchar(50) DEFAULT NULL COMMENT '友情链接显示位置',
  `href` text COMMENT '链接',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `is_open_model` tinyint(1) DEFAULT '0' COMMENT '开启模型',
  `model` varchar(20) DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL COMMENT '模型ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ibid_goods`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_goods`;
CREATE TABLE `ibid_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_cate_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品分类ID',
  `goods_no` varchar(50) DEFAULT NULL COMMENT '商品编码',
  `goods_code` varchar(50) DEFAULT NULL COMMENT '商品条码',
  `is_virtual` tinyint(1) DEFAULT '0' COMMENT '是否为虚拟商品：0否1是',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `thum` varchar(255) DEFAULT NULL COMMENT '商品缩略图',
  `imgs` text COMMENT '商品的大图',
  `intro` text COMMENT '商品简介',
  `desc` text COMMENT '商品描述',
  `standard` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `stock` bigint(20) unsigned DEFAULT '0' COMMENT '库存数量',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '成本价',
  `sell_price` decimal(10,2) DEFAULT NULL COMMENT '销售价',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `red_price` decimal(10,2) DEFAULT NULL COMMENT '红包价',
  `tags` text COMMENT '商品标签',
  `sell_num` bigint(20) unsigned DEFAULT '0' COMMENT '销售量',
  `click_num` bigint(20) unsigned DEFAULT '0' COMMENT '商品的点击数量',
  `collect_num` bigint(20) unsigned DEFAULT '0' COMMENT '收藏数量',
  `sort` bigint(20) DEFAULT NULL COMMENT '商品排序',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶：0否1是',
  `score` tinyint(1) DEFAULT '5' COMMENT '商品的综合评分',
  `status` tinyint(1) DEFAULT '1' COMMENT '1上架2下架',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_goods`
-- -----------------------------
INSERT INTO `ibid_goods` VALUES ('1', '1', '0', '0', '0', '衣服', '/public/upload/images/1523951669423.jpg', '[\"\\/public\\/upload\\/images\\/1523952062988.jpg\",\"\\/public\\/upload\\/images\\/1523952062250.jpg\",\"\\/public\\/upload\\/images\\/1523952062481.jpg\"]', '', '', '', '100000', '0.00', '0.00', '100.00', '0.00', '0.00', '[\"新品\",\"热销品\",\"精品\"]', '0', '0', '0', '0', '1', '5', '1', '0', '2018-04-17 15:54:29', '2018-04-19 11:03:45');
INSERT INTO `ibid_goods` VALUES ('2', '1', '0', '0', '0', '企鹅皮大衣', '/public/upload/images/1523954787538.jpg', '[\"\\/public\\/upload\\/images\\/1523954788756.jpg\",\"\\/public\\/upload\\/images\\/1523954788772.jpg\",\"\\/public\\/upload\\/images\\/1523954788759.jpg\"]', '冬天就一件', '', '', '100', '0.00', '0.00', '100.00', '0.00', '0.00', '[\"新品\",\"热销品\",\"包邮\",\"清仓\",\"精品\"]', '0', '0', '0', '0', '1', '5', '1', '0', '2018-04-17 16:44:26', '2018-04-19 11:03:45');
INSERT INTO `ibid_goods` VALUES ('3', '9', '0', '0', '0', '测试商品', '/public/upload/images/1524117358303.jpg', '[]', '', '', '', '0', '0.00', '0.00', '100.00', '0.00', '0.00', '[\"新品\",\"热销品\"]', '0', '0', '0', '0', '1', '5', '1', '0', '2018-04-19 13:55:58', '2018-04-19 14:08:13');
INSERT INTO `ibid_goods` VALUES ('4', '9', '0', '0', '0', '唤自然·迷雾雨林四件套', '', '[]', '甄选新疆棉，贡缎细密', '<ul class=\"m-attrList list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"value\" style=\"box-sizing: border-box; color: rgb(153, 153, 153); float: left;\">1.5米床： 被套 200*230cm/ 床单：230*240cm/枕套：48*74cm*2个<br/>1.8米/ 2.0米床：被套 220*240cm/ 床单：260*240cm/ 枕套：48*74cm*2</span></p></li></ul><p><br/></p>', '', '20', '0.00', '0.00', '399.00', '0.00', '0.00', '[\"精品\"]', '1200', '0', '2300', '0', '1', '5', '1', '0', '2018-04-19 14:01:37', '2018-04-19 14:03:08');
INSERT INTO `ibid_goods` VALUES ('5', '9', '0', '0', '0', '唤自然·迷雾雨林四件套', '/public/upload/images/1524118288125.jpg', '[\"\\/public\\/upload\\/images\\/1524118288223.jpg\",\"\\/public\\/upload\\/images\\/1524118288588.jpg\",\"\\/public\\/upload\\/images\\/1524118288965.jpg\"]', '甄选新疆棉，贡缎细密', '<p><ul class=\"m-attrList list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"name\" style=\"width: 105px; text-align: center; display: block; box-sizing: border-box; float: left;\">适用季节</span><span class=\"value\" style=\"text-align: center; color: rgb(153, 153, 153); box-sizing: border-box; float: left;\">四季通用</span></p></li><li><p><span class=\"name\" style=\"width: 105px; text-align: center; display: block; box-sizing: border-box; float: left;\">款式</span><span class=\"value\" style=\"text-align: center; color: rgb(153, 153, 153); box-sizing: border-box; float: left;\">床单式</span></p></li><li><p><span class=\"name\" style=\"width: 105px; text-align: center; display: block; box-sizing: border-box; float: left;\">面料</span><span class=\"value\" style=\"text-align: center; color: rgb(153, 153, 153); box-sizing: border-box; float: left;\">全棉</span></p></li><li><p><span class=\"name\" style=\"width: 105px; text-align: center; display: block; box-sizing: border-box; float: left;\">风格</span><span class=\"value\" style=\"text-align: center; color: rgb(153, 153, 153); box-sizing: border-box; float: left;\">北欧</span></p></li><li><p><span class=\"name\" style=\"width: 105px; text-align: center; display: block; box-sizing: border-box; float: left;\">工艺</span><span class=\"value\" style=\"text-align: center; color: rgb(153, 153, 153); box-sizing: border-box; float: left;\">AB版</span></p></li><li><p><span class=\"name\" style=\"width: 105px; text-align: center; display: block; box-sizing: border-box; float: left;\">图案</span><span class=\"value\" style=\"text-align: center; color: rgb(153, 153, 153); box-sizing: border-box; float: left;\">花植</span></p></li></ul><span class=\"value\" style=\"box-sizing: border-box; color: rgb(153, 153, 153); float: left;\"><br/></span></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><img title=\"1524120452460999.jpg\" alt=\"2.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120452460999.jpg\"/><img title=\"1524120467751722.jpg\" alt=\"1.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120467751722.jpg\"/><img title=\"1524120590521545.jpg\" alt=\"55.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120590521545.jpg\"/></p><p><img title=\"1524120601112553.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120601112553.jpg\"/></p><p><img title=\"1524120601219763.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120601219763.jpg\"/></p><p><img title=\"1524120619108775.jpg\" alt=\"5.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120619108775.jpg\"/><img title=\"1524120628871909.jpg\" alt=\"6.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120628871909.jpg\"/><img title=\"1524120696874836.jpg\" alt=\"7.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120696874836.jpg\"/><img title=\"1524120707547106.jpg\" alt=\"7-1.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120707547106.jpg\"/><img title=\"1524120714111336.jpg\" alt=\"8.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120714111336.jpg\"/><img title=\"1524120722122675.jpg\" alt=\"9.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120722122675.jpg\"/><img title=\"1524120732104610.jpg\" alt=\"10.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120732104610.jpg\"/><img title=\"1524120756113238.jpg\" alt=\"11.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120756113238.jpg\"/><img title=\"1524120804904140.jpg\" alt=\"12.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120804904140.jpg\"/><img title=\"1524120811213867.jpg\" alt=\"13.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120811213867.jpg\"/><img title=\"1524120819955864.jpg\" alt=\"14.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120819955864.jpg\"/><img title=\"1524120842108091.jpg\" alt=\"16.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120842108091.jpg\"/><img title=\"1524120867925914.jpg\" alt=\"17.jpg\" src=\"/public/upload/ueditor/image/20180419/1524120867925914.jpg\"/></p><p><br/></p><p><br/></p><p><br/></p><p style=\"line-height: 16px;\"><br/></p>', '', '20', '0.00', '0.00', '399.00', '0.00', '0.00', '[\"精品\"]', '100', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 14:06:13', '2018-04-19 14:06:13');
INSERT INTO `ibid_goods` VALUES ('6', '10', '0', '0', '0', '超冷感吸放湿双面夏凉被', '/public/upload/images/1524118226375.jpg', '[\"\\/public\\/upload\\/images\\/1524118684869.jpg\",\"\\/public\\/upload\\/images\\/1524118684768.jpg\",\"\\/public\\/upload\\/images\\/1524118684912.jpg\"]', '冷感+亲肤，享受双面睡感', '<ul class=\"m-attrList list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"name\" style=\"box-sizing: border-box; display: block; float: left; width: 105px;\"></span></p></li></ul><p><br/></p>', '', '100', '0.00', '0.00', '299.00', '0.00', '0.00', '[\"新品\",\"包邮\"]', '200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 14:09:55', '2018-04-19 14:09:55');
INSERT INTO `ibid_goods` VALUES ('7', '9', '0', '0', '0', '趣味萌宠定制款四件套', '/public/upload/images/1524118483508.jpg', '[\"\\/public\\/upload\\/images\\/1524118483280.jpg\",\"\\/public\\/upload\\/images\\/1524118483740.jpg\",\"\\/public\\/upload\\/images\\/1524118483305.jpg\"]', '狗年定制款，高支高密棉', '<ul class=\"m-attrList list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"name\" style=\"box-sizing: border-box; display: block; float: left; width: 105px;\"></span></p></li><li><p><span class=\"value\" style=\"box-sizing: border-box; color: rgb(153, 153, 153); float: left;\"></span></p></li></ul><p><br/></p>', '', '20', '0.00', '0.00', '200.00', '0.00', '0.00', '[\"新品\"]', '2000', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 14:14:43', '2018-04-19 14:14:43');
INSERT INTO `ibid_goods` VALUES ('8', '9', '0', '0', '0', '几何印花AB面全棉四件套', '/public/upload/images/1524118863207.jpg', '[\"\\/public\\/upload\\/images\\/1524118863873.jpg\",\"\\/public\\/upload\\/images\\/1524118863718.jpg\",\"\\/public\\/upload\\/images\\/1524118863732.jpg\",\"\\/public\\/upload\\/images\\/1524119073489.jpg\"]', '几何线条，北欧简约风', '<ul class=\"m-attrList list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"name\" style=\"box-sizing: border-box; display: block; float: left; width: 105px;\"></span></p></li></ul><p><br/></p>', '', '20', '0.00', '0.00', '125.00', '0.00', '0.00', '[\"新品\",\"包邮\"]', '5200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 14:21:03', '2018-04-19 14:21:03');
INSERT INTO `ibid_goods` VALUES ('9', '10', '0', '0', '0', '抗菌防螨防漏床垫保护垫', '/public/upload/images/1524119016139.jpg', '[\"\\/public\\/upload\\/images\\/1524119092744.jpg\",\"\\/public\\/upload\\/images\\/1524119016875.jpg\",\"\\/public\\/upload\\/images\\/1524119016297.jpg\",\"\\/public\\/upload\\/images\\/1524119092318.jpg\"]', '保护床垫，防水防渍', '<ul class=\"m-attrList list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"name\" style=\"box-sizing: border-box; display: block; float: left; width: 105px;\"></span></p></li></ul><p><br/></p>', '', '550', '0.00', '0.00', '399.00', '0.00', '0.00', '[\"精品\"]', '1600', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 14:23:36', '2018-04-19 14:23:36');
INSERT INTO `ibid_goods` VALUES ('10', '10', '0', '0', '0', '色织华夫格薄被', '/public/upload/images/1524119276765.jpg', '[\"\\/public\\/upload\\/images\\/1524119248167.jpg\",\"\\/public\\/upload\\/images\\/1524119248904.jpg\",\"\\/public\\/upload\\/images\\/1524119248149.jpg\"]', '凹凸华夫格织法，舒适轻柔', '<ul class=\"m-attrList list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"name\" style=\"box-sizing: border-box; display: block; float: left; width: 105px;\"></span></p></li></ul><p><br/></p>', '', '522', '0.00', '0.00', '169.00', '0.00', '0.00', '[\"新品\"]', '1690', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 14:27:28', '2018-04-19 14:27:28');
INSERT INTO `ibid_goods` VALUES ('11', '11', '0', '0', '0', '自由躺 真皮电动功能沙发', '/public/upload/images/1524119404231.jpg', '[\"\\/public\\/upload\\/images\\/1524119404448.jpg\",\"\\/public\\/upload\\/images\\/1524119404899.jpg\",\"\\/public\\/upload\\/images\\/1524119404897.jpg\"]', '一键自由躺 选款师力荐', '<ul class=\"m-attrList list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"name\" style=\"box-sizing: border-box; display: block; float: left; width: 105px;\"></span></p></li></ul><p><br/></p>', '', '120', '0.00', '0.00', '2499.00', '0.00', '0.00', '[\"热销品\"]', '1200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 14:30:04', '2018-04-19 14:30:04');
INSERT INTO `ibid_goods` VALUES ('12', '11', '0', '0', '0', '羽画 真皮沙发', '/public/upload/images/1524121319327.jpg', '[\"\\/public\\/upload\\/images\\/1524121319721.jpg\",\"\\/public\\/upload\\/images\\/1524121319673.jpg\",\"\\/public\\/upload\\/images\\/1524121319185.jpg\",\"\\/public\\/upload\\/images\\/1524121319179.jpg\",\"\\/public\\/upload\\/images\\/1524121319767.jpg\"]', '全真皮沙发 坐垫独立小弹簧', '', '', '2000', '0.00', '0.00', '6799.00', '0.00', '0.00', '[\"新品\"]', '200000', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:01:59', '2018-04-19 15:01:59');
INSERT INTO `ibid_goods` VALUES ('13', '11', '0', '0', '0', '仕趣系列 储物床', '/public/upload/images/1524121445257.jpg', '[\"\\/public\\/upload\\/images\\/1524121445372.jpg\",\"\\/public\\/upload\\/images\\/1524121445386.jpg\",\"\\/public\\/upload\\/images\\/1524121445565.jpg\",\"\\/public\\/upload\\/images\\/1524121445419.jpg\"]', '气箱储物 软包靠背', '', '', '200', '0.00', '0.00', '6899.00', '0.00', '0.00', '[]', '2000', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:04:05', '2018-04-19 15:04:05');
INSERT INTO `ibid_goods` VALUES ('14', '12', '0', '0', '0', '亚克力化妆品收纳盒', '/public/upload/images/1524121600531.jpg', '[\"\\/public\\/upload\\/images\\/1524121600894.jpg\",\"\\/public\\/upload\\/images\\/1524121600544.jpg\",\"\\/public\\/upload\\/images\\/1524121600175.jpg\",\"\\/public\\/upload\\/images\\/1524121600894.jpg\"]', '97%透光，化妆必备', '', '', '200', '0.00', '0.00', '59.00', '0.00', '0.00', '[\"新品\"]', '120', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:06:41', '2018-04-19 15:06:41');
INSERT INTO `ibid_goods` VALUES ('15', '12', '0', '0', '0', '防滑大衣架 3件装', '/public/upload/images/1524121754779.jpg', '[\"\\/public\\/upload\\/images\\/1524121754912.jpg\",\"\\/public\\/upload\\/images\\/1524121754951.jpg\",\"\\/public\\/upload\\/images\\/1524121754553.jpg\",\"\\/public\\/upload\\/images\\/1524121754848.jpg\"]', '无痕支撑，晾衣平整', '', '', '2000', '0.00', '0.00', '17.90', '0.00', '0.00', '[\"新品\"]', '200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:09:14', '2018-04-19 15:09:14');
INSERT INTO `ibid_goods` VALUES ('16', '12', '0', '0', '0', '红雪松木除味条', '/public/upload/images/1524121890317.jpg', '[\"\\/public\\/upload\\/images\\/1524121890575.jpg\",\"\\/public\\/upload\\/images\\/1524121890336.jpg\",\"\\/public\\/upload\\/images\\/1524121890247.jpg\",\"\\/public\\/upload\\/images\\/1524121891977.jpg\"]', '天然红雪松木，檀香除味', '', '', '1320', '0.00', '0.00', '25.00', '0.00', '0.00', '[\"包邮\"]', '1582', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:11:31', '2018-04-19 15:11:31');
INSERT INTO `ibid_goods` VALUES ('17', '13', '0', '0', '0', '天然红雪松木，檀香除味', '/public/upload/images/1524122105340.jpg', '[\"\\/public\\/upload\\/images\\/1524122105934.jpg\",\"\\/public\\/upload\\/images\\/1524122105265.jpg\",\"\\/public\\/upload\\/images\\/1524122105916.jpg\"]', '40升适中容量，铝质包角，牢固抗摔', '', '', '200', '0.00', '0.00', '331.60', '0.00', '0.00', '[\"精品\",\"新品\"]', '1256', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:15:05', '2018-04-19 15:15:05');
INSERT INTO `ibid_goods` VALUES ('18', '13', '0', '0', '0', '适中容量 铝质包角', '/public/upload/images/1524122242225.jpg', '[\"\\/public\\/upload\\/images\\/1524122243176.jpg\",\"\\/public\\/upload\\/images\\/1524122243367.jpg\",\"\\/public\\/upload\\/images\\/1524122243175.jpg\"]', '28寸充足容量，全家一箱搞定', '', '', '560', '0.00', '0.00', '423.00', '0.00', '0.00', '[\"精品\",\"新品\",\"热销品\",\"包邮\"]', '4500', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:17:23', '2018-04-19 15:17:23');
INSERT INTO `ibid_goods` VALUES ('19', '13', '0', '0', '0', '104升纯PC拉链斜纹拉杆箱', '/public/upload/images/1524122378799.jpg', '[\"\\/public\\/upload\\/images\\/1524122378586.jpg\",\"\\/public\\/upload\\/images\\/1524122378896.jpg\",\"\\/public\\/upload\\/images\\/1524122379793.jpg\",\"\\/public\\/upload\\/images\\/1524122379440.jpg\"]', '26寸大容量，轻便PC减压出行', '', '', '100', '0.00', '0.00', '236.00', '0.00', '0.00', '[]', '520', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:19:39', '2018-04-19 15:19:39');
INSERT INTO `ibid_goods` VALUES ('20', '14', '0', '0', '0', '经典铆钉真皮双肩包', '/public/upload/images/1524122502257.jpg', '[\"\\/public\\/upload\\/images\\/1524122502269.jpg\",\"\\/public\\/upload\\/images\\/1524122502695.jpg\",\"\\/public\\/upload\\/images\\/1524122502130.jpg\",\"\\/public\\/upload\\/images\\/1524122502138.jpg\"]', '头层牛皮，欧美男星热衷款', '', '', '200', '0.00', '0.00', '120.00', '0.00', '0.00', '[\"新品\",\"热销品\"]', '2000', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:21:42', '2018-04-19 15:21:42');
INSERT INTO `ibid_goods` VALUES ('21', '14', '0', '0', '0', '十字纹经典牛皮双肩包', '/public/upload/images/1524122590101.jpg', '[\"\\/public\\/upload\\/images\\/1524122590107.jpg\",\"\\/public\\/upload\\/images\\/1524122590846.jpg\"]', '美国阉牛皮，十年经验打造出的细节之作', '', '', '200', '0.00', '0.00', '599.00', '0.00', '0.00', '[\"精品\",\"新品\",\"热销品\"]', '1250', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:23:10', '2018-04-19 15:23:10');
INSERT INTO `ibid_goods` VALUES ('22', '14', '0', '0', '0', '牛皮复古公文包', '/public/upload/images/1524122680309.jpg', '[\"\\/public\\/upload\\/images\\/1524122680464.jpg\",\"\\/public\\/upload\\/images\\/1524122680183.jpg\",\"\\/public\\/upload\\/images\\/1524122680759.jpg\",\"\\/public\\/upload\\/images\\/1524122680341.jpg\"]', 'MK制造商，定制牛皮优雅尽显', '', '', '10', '0.00', '0.00', '599.00', '0.00', '0.00', '[\"热销品\"]', '10000', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:24:41', '2018-04-19 15:24:41');
INSERT INTO `ibid_goods` VALUES ('23', '15', '0', '0', '0', '巴黎谧 搭扣手提单肩包', '/public/upload/images/1524122756291.jpg', '[\"\\/public\\/upload\\/images\\/1524122757590.jpg\",\"\\/public\\/upload\\/images\\/1524122757598.jpg\",\"\\/public\\/upload\\/images\\/1524122757876.jpg\"]', '1天1人仅手作2只的珍贵品质', '', '', '5', '0.00', '0.00', '452.00', '0.00', '0.00', '[]', '5000', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:25:57', '2018-04-19 15:25:57');
INSERT INTO `ibid_goods` VALUES ('24', '15', '0', '0', '0', '挚爱纽约牛皮水桶包', '/public/upload/images/1524122891438.jpg', '[\"\\/public\\/upload\\/images\\/1524122891708.jpg\",\"\\/public\\/upload\\/images\\/1524122891343.jpg\",\"\\/public\\/upload\\/images\\/1524122891494.jpg\",\"\\/public\\/upload\\/images\\/1524122891345.jpg\"]', '大牌品质，仅售供应商建议价的1/5', '', '', '10', '0.00', '0.00', '223.00', '0.00', '0.00', '[\"新品\",\"包邮\"]', '150', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:28:11', '2018-04-19 15:28:11');
INSERT INTO `ibid_goods` VALUES ('25', '15', '0', '0', '0', '色褶皱感可折叠购物袋', '/public/upload/images/1524123003205.jpg', '[\"\\/public\\/upload\\/images\\/1524123003300.jpg\",\"\\/public\\/upload\\/images\\/1524123003437.jpg\",\"\\/public\\/upload\\/images\\/1524123003749.jpg\"]', '柔和色系，环保与实用主义', '', '', '5', '0.00', '0.00', '100.00', '0.00', '0.00', '[\"热销品\",\"新品\",\"精品\"]', '1200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:30:03', '2018-04-19 15:30:03');
INSERT INTO `ibid_goods` VALUES ('26', '16', '0', '0', '0', '素面爆米花底男款休闲鞋', '/public/upload/images/1524123161720.jpg', '[\"\\/public\\/upload\\/images\\/1524123161442.jpg\",\"\\/public\\/upload\\/images\\/1524123161896.jpg\",\"\\/public\\/upload\\/images\\/1524123162947.jpg\",\"\\/public\\/upload\\/images\\/1524123162674.jpg\"]', '软弹爆米花底，踩在云端的脚感', '', '', '100', '0.00', '0.00', '450.00', '0.00', '0.00', '[]', '1500', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:32:42', '2018-04-19 15:32:42');
INSERT INTO `ibid_goods` VALUES ('27', '16', '0', '0', '0', '男式一脚蹬乐福鞋', '/public/upload/images/1524123472137.jpg', '[\"\\/public\\/upload\\/images\\/1524123472361.jpg\",\"\\/public\\/upload\\/images\\/1524123472697.jpg\",\"\\/public\\/upload\\/images\\/1524123472431.jpg\"]', '穿脱方便，裸足穿依旧舒适', '', '', '20', '0.00', '0.00', '269.00', '0.00', '0.00', '[\"新品\",\"热销品\"]', '1200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:37:52', '2018-04-19 15:37:52');
INSERT INTO `ibid_goods` VALUES ('28', '16', '0', '0', '0', '男式拼接飞织休闲鞋', '/public/upload/images/1524123614735.jpg', '[\"\\/public\\/upload\\/images\\/1524123614340.jpg\",\"\\/public\\/upload\\/images\\/1524123614182.jpg\",\"\\/public\\/upload\\/images\\/1524123614281.jpg\",\"\\/public\\/upload\\/images\\/1524123614373.jpg\"]', '“赤足”的轻松与透气', '', '', '10', '0.00', '0.00', '199.00', '0.00', '0.00', '[\"精品\"]', '1000', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:40:14', '2018-04-19 15:40:14');
INSERT INTO `ibid_goods` VALUES ('29', '17', '0', '0', '0', '轻砂蝴蝶结5cm高跟鞋', '/public/upload/images/1524123815679.jpg', '[\"\\/public\\/upload\\/images\\/1524123815415.jpg\",\"\\/public\\/upload\\/images\\/1524123815598.jpg\",\"\\/public\\/upload\\/images\\/1524123815970.jpg\"]', '进口羊绒鞋面，轻盈磨砂质感', '', '', '10', '0.00', '0.00', '220.00', '0.00', '0.00', '[\"新品\",\"热销品\"]', '1200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:43:36', '2018-04-19 15:43:36');
INSERT INTO `ibid_goods` VALUES ('30', '17', '0', '0', '0', '羊猄皮复古粗跟女鞋', '/public/upload/images/1524124173844.jpg', '[\"\\/public\\/upload\\/images\\/1524123969160.jpg\",\"\\/public\\/upload\\/images\\/1524123969705.jpg\",\"\\/public\\/upload\\/images\\/1524123969507.jpg\",\"\\/public\\/upload\\/images\\/1524124173814.jpg\"]', '时尚小方头，体验不一样的风情', '', '', '11', '0.00', '0.00', '269.00', '0.00', '0.00', '[\"新品\",\"精品\"]', '151', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:46:09', '2018-04-19 15:46:09');
INSERT INTO `ibid_goods` VALUES ('31', '17', '0', '0', '0', '花样年华女士小白鞋', '/public/upload/images/1524124146361.jpg', '[\"\\/public\\/upload\\/images\\/1524124146778.jpg\",\"\\/public\\/upload\\/images\\/1524124146770.jpg\",\"\\/public\\/upload\\/images\\/1524124146911.jpg\",\"\\/public\\/upload\\/images\\/1524124146755.jpg\"]', '人手一双，经典“小白鞋”', '<p>ceshi&nbsp;<img src=\"/public/upload/ueditor/image/20180419/1524127397833525.jpg\" title=\"1524127397833525.jpg\" alt=\"a3c09e0d47c8b58cc597b41a99e07d23.jpg\" width=\"279\" height=\"192\"/></p>', '', '20', '0.00', '0.00', '259.00', '0.00', '0.00', '[\"热销品\"]', '1200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:49:06', '2018-04-19 15:49:06');
INSERT INTO `ibid_goods` VALUES ('32', '18', '0', '0', '0', '女式条纹提花短袖针织衫', '/public/upload/images/1524124362820.jpg', '[\"\\/public\\/upload\\/images\\/1524124362197.jpg\",\"\\/public\\/upload\\/images\\/1524124362602.jpg\",\"\\/public\\/upload\\/images\\/1524124362757.jpg\"]', '超in的条纹小恐龙，带动全身的时髦细胞', '', '', '10', '0.00', '0.00', '126.00', '0.00', '0.00', '[\"热销品\"]', '1200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 15:52:42', '2018-04-19 15:52:42');
INSERT INTO `ibid_goods` VALUES ('33', '18', '0', '0', '0', '男式无缝休闲运动T恤', '/public/upload/images/1524125128744.jpg', '[\"\\/public\\/upload\\/images\\/1524125129977.jpg\",\"\\/public\\/upload\\/images\\/1524125129768.jpg\",\"\\/public\\/upload\\/images\\/1524125129957.jpg\",\"\\/public\\/upload\\/images\\/1524125129857.jpg\"]', 'Adidas制造商，快干透气网结构', '', '', '19', '0.00', '0.00', '126.00', '0.00', '0.00', '[\"热销品\",\"新品\"]', '201', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 16:05:29', '2018-04-19 16:05:29');
INSERT INTO `ibid_goods` VALUES ('34', '18', '0', '0', '0', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '[\"\\/public\\/upload\\/images\\/1524125641525.jpg\",\"\\/public\\/upload\\/images\\/1524125641910.jpg\",\"\\/public\\/upload\\/images\\/1524125641362.jpg\",\"\\/public\\/upload\\/images\\/1524125641174.jpg\",\"\\/public\\/upload\\/images\\/1524125641435.jpg\",\"\\/public\\/upload\\/images\\/1524125641409.jpg\",\"\\/public\\/upload\\/images\\/1524125641903.jpg\"]', '含蓄个性的须边风雅', '', '', '20', '0.00', '0.00', '100.00', '0.00', '0.00', '[\"热销品\",\"新品\"]', '0', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 16:14:01', '2018-04-19 16:14:01');
INSERT INTO `ibid_goods` VALUES ('35', '19', '0', '0', '0', '女式蝴蝶结衬衫', '/public/upload/images/1524125986376.jpg', '[\"\\/public\\/upload\\/images\\/1524125986815.jpg\",\"\\/public\\/upload\\/images\\/1524125986829.jpg\",\"\\/public\\/upload\\/images\\/1524125986783.jpg\",\"\\/public\\/upload\\/images\\/1524125986219.jpg\"]', '优雅也不失浪漫少女梦', '', '', '19', '0.00', '0.00', '120.00', '0.00', '0.00', '[\"热销品\",\"包邮\"]', '1201', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 16:19:46', '2018-04-19 16:19:46');
INSERT INTO `ibid_goods` VALUES ('36', '19', '0', '0', '0', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '[\"\\/public\\/upload\\/images\\/1524126205511.jpg\",\"\\/public\\/upload\\/images\\/1524126205456.jpg\",\"\\/public\\/upload\\/images\\/1524126205937.jpg\"]', '给你四面神奇的动感弹力，商务休闲两不误。', '', '', '9', '0.00', '0.00', '259.00', '0.00', '0.00', '[\"新品\",\"精品\"]', '1201', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods` VALUES ('37', '19', '0', '0', '0', '男式经典牛津纺衬衫', '/public/upload/images/1524294457758.jpg', '[\"\\/public\\/upload\\/images\\/1524293404138.jpg\",\"\\/public\\/upload\\/images\\/1524293404609.jpg\",\"\\/public\\/upload\\/images\\/1524293404806.jpg\",\"\\/public\\/upload\\/images\\/1524293404357.jpg\",\"\\/public\\/upload\\/images\\/1524294457519.jpg\"]', '舒适有风度 感受一气呵成的经典', '<p><img src=\"/public/upload/ueditor/image/20180421/1524293293.jpg\" title=\"1524293293.jpg\" alt=\"1515490803138.jpg\"/></p>', '', '20', '0.00', '0.00', '259.00', '0.00', '0.00', '[\"新品\",\"热销品\"]', '200', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 16:26:28', '2018-04-19 16:26:28');
INSERT INTO `ibid_goods` VALUES ('38', '20', '0', '0', '0', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '[\"\\/public\\/upload\\/images\\/1524126513856.jpg\",\"\\/public\\/upload\\/images\\/1524126513666.jpg\",\"\\/public\\/upload\\/images\\/1524126513870.jpg\",\"\\/public\\/upload\\/images\\/1524126513456.jpg\"]', '无可复制的自然感，舒适一整个季节', '', '', '18', '0.00', '0.00', '156.00', '0.00', '0.00', '[\"包邮\",\"新品\"]', '1002', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 16:28:34', '2018-04-19 16:28:34');
INSERT INTO `ibid_goods` VALUES ('39', '20', '0', '0', '0', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '[\"\\/public\\/upload\\/images\\/1524126803537.jpg\",\"\\/public\\/upload\\/images\\/1524126803404.jpg\",\"\\/public\\/upload\\/images\\/1524126803722.jpg\",\"\\/public\\/upload\\/images\\/1524126803373.jpg\"]', '男式弹力针织修身牛仔裤', '', '', '294', '0.00', '0.00', '258.00', '0.00', '0.00', '[\"热销品\",\"精品\"]', '306', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 16:33:23', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods` VALUES ('40', '20', '0', '0', '0', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '[\"\\/public\\/upload\\/images\\/1524127059296.jpg\",\"\\/public\\/upload\\/images\\/1524127059477.jpg\",\"\\/public\\/upload\\/images\\/1524127059318.jpg\"]', '高腰高挑高热量，火山岩热度不褪', '', '', '27', '0.00', '0.00', '126.00', '0.00', '0.00', '[\"新品\",\"精品\"]', '1263', '0', '0', '0', '1', '5', '1', '1', '2018-04-19 16:37:39', '2018-04-19 16:37:39');
INSERT INTO `ibid_goods` VALUES ('41', '29', '0', '0', '0', '熊', '/public/upload/images/1524279130633.jpg', '[\"\\/public\\/upload\\/images\\/1524279130281.jpg\",\"\\/public\\/upload\\/images\\/1524279130287.jpg\"]', '熊', '', '', '9', '0.00', '0.00', '0.01', '0.00', '0.00', '[\"包邮\"]', '3152', '0', '0', '0', '1', '5', '1', '1', '2018-04-21 10:52:10', '2018-04-21 10:52:10');
INSERT INTO `ibid_goods` VALUES ('42', '29', '0', '0', '0', '鸭子', '/public/upload/images/1524279252200.jpg', '[\"\\/public\\/upload\\/images\\/1524279253737.jpg\",\"\\/public\\/upload\\/images\\/1524279253597.jpg\"]', '鸭子', '', '', '0', '0.00', '0.00', '0.01', '0.00', '0.00', '[\"包邮\"]', '321', '0', '0', '0', '1', '5', '1', '1', '2018-04-21 10:54:13', '2018-04-25 09:06:06');

-- -----------------------------
-- Table structure for `ibid_goods_attrs`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_goods_attrs`;
CREATE TABLE `ibid_goods_attrs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_template_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '属性模板ID',
  `attr_name_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品属性名称ID',
  `attr_option_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '属性项ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_goods_attrs`
-- -----------------------------
INSERT INTO `ibid_goods_attrs` VALUES ('4', '1', '1', '2', '6', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_attrs` VALUES ('3', '1', '1', '1', '2', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_attrs` VALUES ('16', '2', '1', '2', '5', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_attrs` VALUES ('15', '2', '1', '1', '1', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_attrs` VALUES ('17', '7', '2', '3', '9', '1', '2018-04-21 15:48:33', '2018-04-21 15:48:33');
INSERT INTO `ibid_goods_attrs` VALUES ('18', '7', '2', '4', '12', '1', '2018-04-21 15:48:33', '2018-04-21 15:48:33');
INSERT INTO `ibid_goods_attrs` VALUES ('19', '7', '2', '5', '14', '1', '2018-04-21 15:48:33', '2018-04-21 15:48:33');

-- -----------------------------
-- Table structure for `ibid_goods_cates`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_goods_cates`;
CREATE TABLE `ibid_goods_cates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `thum` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `pid` bigint(20) DEFAULT '0' COMMENT '父分类ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序：数值越大越靠前',
  `status` tinyint(4) DEFAULT '1' COMMENT '1正常2禁用',
  `spec_template_id` bigint(20) DEFAULT '0' COMMENT '商品规格模板ID',
  `attr_template_id` bigint(20) DEFAULT '0' COMMENT '商品属性模板ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_goods_cates`
-- -----------------------------
INSERT INTO `ibid_goods_cates` VALUES ('1', '衣服', '', '0', '0', '1', '1', '1', '0', '2018-04-17 15:53:24', '2018-04-19 10:44:34');
INSERT INTO `ibid_goods_cates` VALUES ('2', '居家', '/public/upload/images/1524106857199.jpg', '0', '0', '1', '2', '2', '1', '2018-04-19 10:44:29', '2018-04-19 10:44:29');
INSERT INTO `ibid_goods_cates` VALUES ('3', '配件', '', '0', '0', '1', '0', '0', '1', '2018-04-19 10:44:57', '2018-04-19 10:44:57');
INSERT INTO `ibid_goods_cates` VALUES ('4', '服装', '', '0', '0', '1', '0', '0', '1', '2018-04-19 10:45:39', '2018-04-19 10:45:39');
INSERT INTO `ibid_goods_cates` VALUES ('5', '电器', '', '0', '0', '1', '0', '0', '1', '2018-04-19 10:45:48', '2018-04-19 10:45:48');
INSERT INTO `ibid_goods_cates` VALUES ('6', '洗护', '', '0', '0', '1', '0', '0', '1', '2018-04-19 10:46:03', '2018-04-19 10:46:03');
INSERT INTO `ibid_goods_cates` VALUES ('7', '饮食', '', '0', '0', '1', '0', '0', '1', '2018-04-19 10:46:13', '2018-04-19 10:46:13');
INSERT INTO `ibid_goods_cates` VALUES ('8', '餐厨', '', '0', '0', '1', '0', '0', '1', '2018-04-19 10:46:23', '2018-04-19 10:46:23');
INSERT INTO `ibid_goods_cates` VALUES ('9', '床品', '/public/upload/images/1524108404449.jpg', '2', '0', '1', '2', '2', '1', '2018-04-19 10:47:15', '2018-04-19 10:47:15');
INSERT INTO `ibid_goods_cates` VALUES ('10', '被枕', '/public/upload/images/1524108249489.jpg', '2', '0', '1', '0', '0', '1', '2018-04-19 10:47:37', '2018-04-19 10:47:37');
INSERT INTO `ibid_goods_cates` VALUES ('11', '家具', '/public/upload/images/1524108541843.jpg', '2', '0', '1', '0', '0', '1', '2018-04-19 10:47:48', '2018-04-19 10:47:48');
INSERT INTO `ibid_goods_cates` VALUES ('12', '收纳', '/public/upload/images/1524108640857.jpg', '2', '0', '1', '2', '0', '1', '2018-04-19 10:48:01', '2018-04-19 10:48:01');
INSERT INTO `ibid_goods_cates` VALUES ('13', '行李箱', '/public/upload/images/1524108684871.jpg', '3', '0', '1', '2', '0', '1', '2018-04-19 10:48:19', '2018-04-19 10:48:19');
INSERT INTO `ibid_goods_cates` VALUES ('14', '男士包袋', '/public/upload/images/1524108757307.jpg', '3', '0', '1', '0', '0', '1', '2018-04-19 10:48:33', '2018-04-19 10:48:33');
INSERT INTO `ibid_goods_cates` VALUES ('15', '女士包袋', '/public/upload/images/1524108766525.jpg', '3', '0', '1', '0', '0', '1', '2018-04-19 10:49:07', '2018-04-19 10:49:07');
INSERT INTO `ibid_goods_cates` VALUES ('16', '男鞋', '/public/upload/images/1524108829890.jpg', '3', '0', '1', '2', '0', '1', '2018-04-19 10:49:21', '2018-04-19 10:49:21');
INSERT INTO `ibid_goods_cates` VALUES ('17', '女鞋', '/public/upload/images/1524108840579.jpg', '3', '0', '1', '2', '0', '1', '2018-04-19 10:49:34', '2018-04-19 10:49:34');
INSERT INTO `ibid_goods_cates` VALUES ('18', 'T恤', '/public/upload/images/1524108958659.jpg', '4', '0', '1', '2', '0', '1', '2018-04-19 10:49:49', '2018-04-19 10:49:49');
INSERT INTO `ibid_goods_cates` VALUES ('19', '衬衫', '/public/upload/images/1524109016919.jpg', '4', '0', '1', '2', '0', '1', '2018-04-19 10:49:59', '2018-04-19 10:49:59');
INSERT INTO `ibid_goods_cates` VALUES ('20', '牛仔', '/public/upload/images/1524109049426.jpg', '4', '0', '1', '2', '0', '1', '2018-04-19 10:50:10', '2018-04-19 10:50:10');
INSERT INTO `ibid_goods_cates` VALUES ('21', '生活电器', '', '5', '0', '1', '0', '0', '1', '2018-04-19 10:50:22', '2018-04-19 10:50:22');
INSERT INTO `ibid_goods_cates` VALUES ('22', '厨房电器', '', '5', '0', '1', '0', '0', '1', '2018-04-19 10:50:33', '2018-04-19 10:50:33');
INSERT INTO `ibid_goods_cates` VALUES ('23', '个护健康', '', '5', '0', '1', '0', '0', '1', '2018-04-19 10:50:45', '2018-04-19 10:50:45');
INSERT INTO `ibid_goods_cates` VALUES ('24', '数码', '', '5', '0', '1', '0', '0', '1', '2018-04-19 10:50:58', '2018-04-19 10:50:58');
INSERT INTO `ibid_goods_cates` VALUES ('25', '家庭清洁', '', '6', '0', '1', '0', '0', '1', '2018-04-19 10:51:28', '2018-04-19 10:51:28');
INSERT INTO `ibid_goods_cates` VALUES ('26', '生理用品', '', '6', '0', '1', '0', '0', '1', '2018-04-19 10:51:46', '2018-04-19 10:51:46');
INSERT INTO `ibid_goods_cates` VALUES ('27', '坚果炒货', '', '7', '0', '1', '0', '0', '1', '2018-04-19 10:52:04', '2018-04-19 10:52:04');
INSERT INTO `ibid_goods_cates` VALUES ('28', '酒水饮料', '', '7', '0', '1', '0', '0', '1', '2018-04-19 10:52:24', '2018-04-19 10:52:24');
INSERT INTO `ibid_goods_cates` VALUES ('29', '肉类零食', '', '7', '0', '1', '0', '0', '1', '2018-04-19 10:52:40', '2018-04-19 10:52:40');
INSERT INTO `ibid_goods_cates` VALUES ('30', '水具杯壶', '', '8', '0', '1', '0', '0', '1', '2018-04-19 10:53:02', '2018-04-19 10:53:02');
INSERT INTO `ibid_goods_cates` VALUES ('31', '厨房配件', '', '8', '0', '1', '0', '0', '1', '2018-04-19 10:53:13', '2018-04-19 10:53:13');
INSERT INTO `ibid_goods_cates` VALUES ('32', '清洁保鲜', '', '8', '0', '1', '0', '0', '1', '2018-04-19 10:53:29', '2018-04-19 10:53:29');

-- -----------------------------
-- Table structure for `ibid_goods_collections`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_goods_collections`;
CREATE TABLE `ibid_goods_collections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `goods_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_goods_collections`
-- -----------------------------
INSERT INTO `ibid_goods_collections` VALUES ('3', '1', '40', '1', '2018-04-21 09:05:28', '2018-04-21 09:05:28');
INSERT INTO `ibid_goods_collections` VALUES ('9', '10', '39', '1', '2018-04-21 10:07:20', '2018-04-21 10:07:20');
INSERT INTO `ibid_goods_collections` VALUES ('10', '1', '38', '1', '2018-04-21 10:29:19', '2018-04-21 10:29:19');
INSERT INTO `ibid_goods_collections` VALUES ('23', '1', '31', '1', '2018-04-23 15:44:44', '2018-04-23 15:44:44');
INSERT INTO `ibid_goods_collections` VALUES ('27', '10', '40', '1', '2018-04-24 21:29:16', '2018-04-24 21:29:16');
INSERT INTO `ibid_goods_collections` VALUES ('22', '15', '7', '1', '2018-04-23 11:27:25', '2018-04-23 11:27:25');
INSERT INTO `ibid_goods_collections` VALUES ('15', '2', '42', '1', '2018-04-21 16:10:08', '2018-04-21 16:10:08');
INSERT INTO `ibid_goods_collections` VALUES ('25', '2', '38', '1', '2018-04-23 17:21:51', '2018-04-23 17:21:51');
INSERT INTO `ibid_goods_collections` VALUES ('28', '10', '41', '1', '2018-04-24 21:29:35', '2018-04-24 21:29:35');

-- -----------------------------
-- Table structure for `ibid_goods_comments`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_goods_comments`;
CREATE TABLE `ibid_goods_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `content` text NOT NULL COMMENT '评论正文',
  `imgs` text COMMENT '评论商品时上传的图片',
  `score` varchar(255) NOT NULL COMMENT '商品评分',
  `status` tinyint(1) DEFAULT '1' COMMENT '1待审核2审核未通过（不显示）3审核通过（显示）',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_goods_comments`
-- -----------------------------
INSERT INTO `ibid_goods_comments` VALUES ('1', '2', '42', '38', 'w z j', '[\"\\/public\\/upload\\/images\\/1524478175871.jpg\"]', '4', '1', '1', '2018-04-23 18:09:35', '2018-04-23 18:09:35');
INSERT INTO `ibid_goods_comments` VALUES ('2', '2', '43', '38', '提交', '[\"\\/public\\/upload\\/images\\/1524478240860.jpg\"]', '4', '1', '1', '2018-04-23 18:10:40', '2018-04-23 18:10:40');
INSERT INTO `ibid_goods_comments` VALUES ('3', '2', '44', '38', '我家', '[]', '5', '1', '1', '2018-04-23 18:11:05', '2018-04-23 18:11:05');
INSERT INTO `ibid_goods_comments` VALUES ('4', '2', '39', '41', '解决了', '[]', '4', '1', '1', '2018-04-23 18:12:25', '2018-04-23 18:12:25');
INSERT INTO `ibid_goods_comments` VALUES ('5', '9', '31', '39', '212', '[]', '3', '1', '1', '2018-04-23 22:34:10', '2018-04-23 22:34:10');
INSERT INTO `ibid_goods_comments` VALUES ('6', '9', '35', '34', '212', '[]', '4', '1', '1', '2018-04-23 22:34:26', '2018-04-23 22:34:26');
INSERT INTO `ibid_goods_comments` VALUES ('7', '2', '58', '39', '哈哈', '[]', '4', '1', '1', '2018-04-24 13:52:09', '2018-04-24 13:52:09');
INSERT INTO `ibid_goods_comments` VALUES ('8', '2', '45', '38', '来来来', '[]', '5', '1', '1', '2018-04-24 13:52:38', '2018-04-24 13:52:38');
INSERT INTO `ibid_goods_comments` VALUES ('9', '2', '51', '40', '来来来', '[]', '4', '1', '1', '2018-04-24 13:52:53', '2018-04-24 13:52:53');
INSERT INTO `ibid_goods_comments` VALUES ('10', '9', '92', '40', '212', '[]', '2', '1', '1', '2018-04-24 14:08:35', '2018-04-24 14:08:35');
INSERT INTO `ibid_goods_comments` VALUES ('11', '2', '133', '39', '兔兔', '[]', '5', '1', '1', '2018-04-24 14:57:12', '2018-04-24 14:57:12');
INSERT INTO `ibid_goods_comments` VALUES ('12', '2', '134', '40', '体力卡', '[\"\\/public\\/upload\\/images\\/1524562932862.jpg\"]', '4', '1', '1', '2018-04-24 17:42:12', '2018-04-24 17:42:12');
INSERT INTO `ibid_goods_comments` VALUES ('13', '22', '154', '30', '12', '[]', '3', '1', '1', '2018-04-25 08:45:06', '2018-04-25 08:45:06');
INSERT INTO `ibid_goods_comments` VALUES ('14', '22', '154', '35', '123', '[]', '4', '1', '1', '2018-04-25 08:45:14', '2018-04-25 08:45:14');
INSERT INTO `ibid_goods_comments` VALUES ('15', '22', '155', '41', '测试', '[]', '3', '1', '1', '2018-04-25 09:04:51', '2018-04-25 09:04:51');
INSERT INTO `ibid_goods_comments` VALUES ('16', '22', '155', '40', '测试', '[]', '3', '1', '1', '2018-04-25 09:04:59', '2018-04-25 09:04:59');
INSERT INTO `ibid_goods_comments` VALUES ('17', '22', '156', '38', '测试', '[]', '4', '1', '1', '2018-04-25 09:10:20', '2018-04-25 09:10:20');

-- -----------------------------
-- Table structure for `ibid_goods_keywords`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_goods_keywords`;
CREATE TABLE `ibid_goods_keywords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `search_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_goods_keywords`
-- -----------------------------
INSERT INTO `ibid_goods_keywords` VALUES ('1', '测试', '7', '1', '2018-04-18 09:17:20', '2018-04-18 09:17:20');
INSERT INTO `ibid_goods_keywords` VALUES ('2', '衣服', '33', '1', '2018-04-18 09:17:33', '2018-04-18 09:17:33');
INSERT INTO `ibid_goods_keywords` VALUES ('3', '粑粑', '2', '1', '2018-04-18 14:09:59', '2018-04-18 14:09:59');
INSERT INTO `ibid_goods_keywords` VALUES ('4', '鞋子', '12', '1', '2018-04-18 14:10:18', '2018-04-18 14:10:18');
INSERT INTO `ibid_goods_keywords` VALUES ('5', '888', '7', '1', '2018-04-20 09:46:47', '2018-04-20 09:46:47');
INSERT INTO `ibid_goods_keywords` VALUES ('6', 'jkkj', '5', '1', '2018-04-20 11:22:01', '2018-04-20 11:22:01');
INSERT INTO `ibid_goods_keywords` VALUES ('7', '555666', '3', '1', '2018-04-20 11:23:25', '2018-04-20 11:23:25');
INSERT INTO `ibid_goods_keywords` VALUES ('8', '衣', '399', '1', '2018-04-20 11:27:28', '2018-04-20 11:27:28');
INSERT INTO `ibid_goods_keywords` VALUES ('9', '5465656', '2', '1', '2018-04-20 15:38:16', '2018-04-20 15:38:16');
INSERT INTO `ibid_goods_keywords` VALUES ('10', 'hghhg', '1', '1', '2018-04-20 15:38:50', '2018-04-20 15:38:50');
INSERT INTO `ibid_goods_keywords` VALUES ('11', '656565', '1', '1', '2018-04-20 15:40:51', '2018-04-20 15:40:51');
INSERT INTO `ibid_goods_keywords` VALUES ('12', '56565656', '2', '1', '2018-04-20 15:41:00', '2018-04-20 15:41:00');
INSERT INTO `ibid_goods_keywords` VALUES ('13', '655656', '1', '1', '2018-04-20 15:41:07', '2018-04-20 15:41:07');
INSERT INTO `ibid_goods_keywords` VALUES ('14', '566556', '4', '1', '2018-04-20 15:43:42', '2018-04-20 15:43:42');
INSERT INTO `ibid_goods_keywords` VALUES ('15', '6556656', '9', '1', '2018-04-20 15:44:19', '2018-04-20 15:44:19');
INSERT INTO `ibid_goods_keywords` VALUES ('16', 'uyuyyu', '1', '1', '2018-04-20 15:47:57', '2018-04-20 15:47:57');
INSERT INTO `ibid_goods_keywords` VALUES ('17', 'uuyuyy', '1', '1', '2018-04-20 15:49:29', '2018-04-20 15:49:29');
INSERT INTO `ibid_goods_keywords` VALUES ('18', '65565', '1', '1', '2018-04-20 15:49:45', '2018-04-20 15:49:45');
INSERT INTO `ibid_goods_keywords` VALUES ('19', 'gfgfgf', '1', '1', '2018-04-20 15:49:50', '2018-04-20 15:49:50');
INSERT INTO `ibid_goods_keywords` VALUES ('20', 'fdgfgf', '1', '1', '2018-04-20 15:49:57', '2018-04-20 15:49:57');
INSERT INTO `ibid_goods_keywords` VALUES ('21', 'jhhjhj', '1', '1', '2018-04-20 15:50:02', '2018-04-20 15:50:02');
INSERT INTO `ibid_goods_keywords` VALUES ('22', 'fgfgf', '1', '1', '2018-04-20 15:50:05', '2018-04-20 15:50:05');
INSERT INTO `ibid_goods_keywords` VALUES ('23', 'klklkl', '1', '1', '2018-04-20 15:50:08', '2018-04-20 15:50:08');
INSERT INTO `ibid_goods_keywords` VALUES ('24', 'jkjkjk', '1', '1', '2018-04-20 15:50:11', '2018-04-20 15:50:11');
INSERT INTO `ibid_goods_keywords` VALUES ('25', 'ghghhg', '1', '1', '2018-04-20 15:50:15', '2018-04-20 15:50:15');
INSERT INTO `ibid_goods_keywords` VALUES ('26', 'ghhghg', '1', '1', '2018-04-20 15:50:22', '2018-04-20 15:50:22');
INSERT INTO `ibid_goods_keywords` VALUES ('27', 'hghghg', '1', '1', '2018-04-20 15:50:25', '2018-04-20 15:50:25');
INSERT INTO `ibid_goods_keywords` VALUES ('28', 'gfghhg', '1', '1', '2018-04-20 15:50:31', '2018-04-20 15:50:31');
INSERT INTO `ibid_goods_keywords` VALUES ('29', '565665', '1', '1', '2018-04-20 15:56:03', '2018-04-20 15:56:03');
INSERT INTO `ibid_goods_keywords` VALUES ('30', '六六六', '1', '1', '2018-04-20 17:14:07', '2018-04-20 17:14:07');
INSERT INTO `ibid_goods_keywords` VALUES ('31', '8989', '10', '1', '2018-04-20 22:09:28', '2018-04-20 22:09:28');
INSERT INTO `ibid_goods_keywords` VALUES ('32', '5656', '1', '1', '2018-04-21 15:24:03', '2018-04-21 15:24:03');
INSERT INTO `ibid_goods_keywords` VALUES ('33', '6556', '2', '1', '2018-04-21 15:30:21', '2018-04-21 15:30:21');
INSERT INTO `ibid_goods_keywords` VALUES ('34', '凉鞋女', '10', '1', '2018-04-21 16:08:26', '2018-04-21 16:08:26');
INSERT INTO `ibid_goods_keywords` VALUES ('35', '单鞋男', '17', '1', '2018-04-21 16:08:29', '2018-04-21 16:08:29');
INSERT INTO `ibid_goods_keywords` VALUES ('36', '外套女', '14', '1', '2018-04-21 16:08:32', '2018-04-21 16:08:32');
INSERT INTO `ibid_goods_keywords` VALUES ('37', '长袖', '24', '1', '2018-04-21 16:08:34', '2018-04-21 16:08:34');
INSERT INTO `ibid_goods_keywords` VALUES ('38', '连衣裙', '14', '1', '2018-04-21 16:08:37', '2018-04-21 16:08:37');
INSERT INTO `ibid_goods_keywords` VALUES ('39', '短袖', '56', '1', '2018-04-21 16:08:39', '2018-04-21 16:08:39');
INSERT INTO `ibid_goods_keywords` VALUES ('40', '长裙', '13', '1', '2018-04-21 16:08:50', '2018-04-21 16:08:50');
INSERT INTO `ibid_goods_keywords` VALUES ('41', '短裤', '22', '1', '2018-04-21 16:08:52', '2018-04-21 16:08:52');
INSERT INTO `ibid_goods_keywords` VALUES ('42', '童装童鞋', '7', '1', '2018-04-21 16:14:03', '2018-04-21 16:14:03');
INSERT INTO `ibid_goods_keywords` VALUES ('43', '孕妈瘦身', '13', '1', '2018-04-21 16:14:22', '2018-04-21 16:14:22');
INSERT INTO `ibid_goods_keywords` VALUES ('44', '防任运纹', '1', '1', '2018-04-21 16:15:34', '2018-04-21 16:15:34');
INSERT INTO `ibid_goods_keywords` VALUES ('45', '花王旗舰', '3', '1', '2018-04-21 16:15:48', '2018-04-21 16:15:48');
INSERT INTO `ibid_goods_keywords` VALUES ('46', '卸妆', '16', '1', '2018-04-21 16:15:55', '2018-04-21 16:15:55');
INSERT INTO `ibid_goods_keywords` VALUES ('47', '面膜', '4', '1', '2018-04-21 16:16:00', '2018-04-21 16:16:00');
INSERT INTO `ibid_goods_keywords` VALUES ('48', '洁面', '2', '1', '2018-04-21 16:16:48', '2018-04-21 16:16:48');
INSERT INTO `ibid_goods_keywords` VALUES ('49', '556', '1', '1', '2018-04-21 16:52:33', '2018-04-21 16:52:33');
INSERT INTO `ibid_goods_keywords` VALUES ('50', '秋冬童装', '11', '1', '2018-04-21 22:17:02', '2018-04-21 22:17:02');
INSERT INTO `ibid_goods_keywords` VALUES ('51', '水乳', '1', '1', '2018-04-21 22:31:50', '2018-04-21 22:31:50');
INSERT INTO `ibid_goods_keywords` VALUES ('52', '牛仔裤', '9', '1', '2018-04-22 14:43:42', '2018-04-22 14:43:42');
INSERT INTO `ibid_goods_keywords` VALUES ('53', 'hello', '1', '1', '2018-04-22 14:53:58', '2018-04-22 14:53:58');
INSERT INTO `ibid_goods_keywords` VALUES ('54', '衣服啊衣服', '1', '1', '2018-04-22 14:55:29', '2018-04-22 14:55:29');
INSERT INTO `ibid_goods_keywords` VALUES ('55', '特色', '1', '1', '2018-04-22 14:56:02', '2018-04-22 14:56:02');
INSERT INTO `ibid_goods_keywords` VALUES ('56', '嗯', '1', '1', '2018-04-22 14:56:36', '2018-04-22 14:56:36');
INSERT INTO `ibid_goods_keywords` VALUES ('57', 'hello hello hello', '1', '1', '2018-04-22 14:57:51', '2018-04-22 14:57:51');
INSERT INTO `ibid_goods_keywords` VALUES ('58', '衬衫', '1', '1', '2018-04-22 14:58:53', '2018-04-22 14:58:53');
INSERT INTO `ibid_goods_keywords` VALUES ('59', '有点酷', '1', '1', '2018-04-22 18:16:15', '2018-04-22 18:16:15');
INSERT INTO `ibid_goods_keywords` VALUES ('60', 'Burberry', '6', '1', '2018-04-23 10:06:55', '2018-04-23 10:06:55');
INSERT INTO `ibid_goods_keywords` VALUES ('61', '双肩包', '8', '1', '2018-04-23 10:07:07', '2018-04-23 10:07:07');
INSERT INTO `ibid_goods_keywords` VALUES ('62', '黛安芬', '11', '1', '2018-04-23 10:07:10', '2018-04-23 10:07:10');
INSERT INTO `ibid_goods_keywords` VALUES ('63', 'ochirly', '2', '1', '2018-04-23 10:07:26', '2018-04-23 10:07:26');
INSERT INTO `ibid_goods_keywords` VALUES ('64', 'UGG', '1', '1', '2018-04-23 10:07:39', '2018-04-23 10:07:39');
INSERT INTO `ibid_goods_keywords` VALUES ('65', '母婴', '1', '1', '2018-04-23 10:30:58', '2018-04-23 10:30:58');
INSERT INTO `ibid_goods_keywords` VALUES ('66', '啊', '1', '1', '2018-04-23 16:13:12', '2018-04-23 16:13:12');
INSERT INTO `ibid_goods_keywords` VALUES ('67', '前', '1', '1', '2018-04-23 16:13:24', '2018-04-23 16:13:24');
INSERT INTO `ibid_goods_keywords` VALUES ('68', '你', '1', '1', '2018-04-23 16:13:56', '2018-04-23 16:13:56');
INSERT INTO `ibid_goods_keywords` VALUES ('69', '真的要交货', '1', '1', '2018-04-23 16:15:32', '2018-04-23 16:15:32');
INSERT INTO `ibid_goods_keywords` VALUES ('70', '00', '2', '1', '2018-04-23 20:49:15', '2018-04-23 20:49:15');
INSERT INTO `ibid_goods_keywords` VALUES ('71', '21212', '1', '1', '2018-04-23 21:27:52', '2018-04-23 21:27:52');
INSERT INTO `ibid_goods_keywords` VALUES ('72', '12', '2', '1', '2018-04-23 21:28:11', '2018-04-23 21:28:11');
INSERT INTO `ibid_goods_keywords` VALUES ('73', '000', '1', '1', '2018-04-23 21:28:14', '2018-04-23 21:28:14');
INSERT INTO `ibid_goods_keywords` VALUES ('74', '袖子', '12', '1', '2018-04-23 21:28:40', '2018-04-23 21:28:40');
INSERT INTO `ibid_goods_keywords` VALUES ('75', '为哈喽', '1', '1', '2018-04-24 09:40:58', '2018-04-24 09:40:58');
INSERT INTO `ibid_goods_keywords` VALUES ('76', '鸭子', '1', '1', '2018-04-24 14:11:17', '2018-04-24 14:11:17');
INSERT INTO `ibid_goods_keywords` VALUES ('77', '熊', '6', '1', '2018-04-24 14:11:23', '2018-04-24 14:11:23');
INSERT INTO `ibid_goods_keywords` VALUES ('78', '牛奶', '1', '1', '2018-04-24 14:38:19', '2018-04-24 14:38:19');
INSERT INTO `ibid_goods_keywords` VALUES ('79', '休闲鞋', '2', '1', '2018-04-24 14:38:40', '2018-04-24 14:38:40');
INSERT INTO `ibid_goods_keywords` VALUES ('80', '哈哈', '1', '1', '2018-04-24 16:19:33', '2018-04-24 16:19:33');
INSERT INTO `ibid_goods_keywords` VALUES ('81', '鞋', '4', '1', '2018-04-24 18:06:49', '2018-04-24 18:06:49');

-- -----------------------------
-- Table structure for `ibid_goods_spec_groups`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_goods_spec_groups`;
CREATE TABLE `ibid_goods_spec_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '规格对应的商品id',
  `spec_template_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '规格对应的模板id',
  `spec_option_ids` text NOT NULL COMMENT '规格项组合id',
  `spec_option_group` text NOT NULL COMMENT '商品规格项组合名称',
  `thum` text COMMENT '商品规格组合图片',
  `sell_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品销售价格',
  `market_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品市场价格',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价格',
  `red_price` decimal(10,2) DEFAULT NULL COMMENT '红包价格',
  `stock` int(11) DEFAULT '0' COMMENT '库存数量',
  `weight` decimal(10,2) DEFAULT '0.00' COMMENT '商品重量',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `goods_no` varchar(255) DEFAULT '' COMMENT '商品编码',
  `goods_code` varchar(255) DEFAULT '' COMMENT '商品条码',
  `is_virtual` tinyint(1) DEFAULT '0' COMMENT '是否为虚拟商品：0否1是',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_id` (`goods_id`),
  KEY `idx_sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=232 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_goods_spec_groups`
-- -----------------------------
INSERT INTO `ibid_goods_spec_groups` VALUES ('12', '1', '1', '10_8', '红色_s码', '/public/upload/images/1523951670440.jpg', '100.00', '0.00', '0.00', '0.00', '10000', '0.00', '0', '0', '0', '0', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_groups` VALUES ('11', '1', '1', '9_8', '蓝色_s码', '/public/upload/images/1523951670449.jpg', '100.00', '0.00', '0.00', '0.00', '10000', '0.00', '0', '0', '0', '0', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_groups` VALUES ('10', '1', '1', '10_7', '红色_m码', '/public/upload/images/1523951670447.jpg', '100.00', '0.00', '0.00', '0.00', '10000', '0.00', '0', '0', '0', '0', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_groups` VALUES ('9', '1', '1', '9_7', '蓝色_m码', '/public/upload/images/1523951670200.jpg', '100.00', '0.00', '0.00', '0.00', '10000', '0.00', '0', '0', '0', '0', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_groups` VALUES ('8', '1', '1', '10_6', '红色_L码', '/public/upload/images/1523951670882.jpg', '100.00', '0.00', '0.00', '0.00', '10000', '0.00', '0', '0', '0', '0', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_groups` VALUES ('7', '1', '1', '9_6', '蓝色_L码', '/public/upload/images/1523951670129.jpg', '100.00', '0.00', '0.00', '0.00', '10000', '0.00', '0', '0', '0', '0', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_groups` VALUES ('48', '2', '1', '40_38', '蓝色_S', '/public/upload/images/1523954667430.jpg', '100.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_groups` VALUES ('47', '2', '1', '39_38', '黄色_S', '/public/upload/images/1523954667667.jpg', '100.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_groups` VALUES ('46', '2', '1', '40_37', '蓝色_M', '/public/upload/images/1523954667599.jpg', '100.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_groups` VALUES ('45', '2', '1', '39_37', '黄色_M', '/public/upload/images/1523954667429.jpg', '100.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_groups` VALUES ('44', '2', '1', '40_36', '蓝色_L', '/public/upload/images/1523954667532.jpg', '100.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_groups` VALUES ('43', '2', '1', '39_36', '黄色_L', '/public/upload/images/1523954668188.jpg', '100.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_groups` VALUES ('49', '3', '2', '43_41', '红色_x', '', '1000.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-19 13:55:58', '2018-04-19 13:55:58');
INSERT INTO `ibid_goods_spec_groups` VALUES ('50', '3', '2', '44_41', '蓝色_x', '', '1000.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-19 13:55:58', '2018-04-19 13:55:58');
INSERT INTO `ibid_goods_spec_groups` VALUES ('51', '3', '2', '43_42', '红色_lz', '', '1000.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-19 13:55:58', '2018-04-19 13:55:58');
INSERT INTO `ibid_goods_spec_groups` VALUES ('52', '3', '2', '44_42', '蓝色_lz', '', '1000.00', '0.00', '0.00', '0.00', '100', '0.00', '0', '0', '0', '0', '1', '2018-04-19 13:55:58', '2018-04-19 13:55:58');
INSERT INTO `ibid_goods_spec_groups` VALUES ('175', '31', '2', '294_293', '白色_37码', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:43:28', '2018-04-19 16:43:28');
INSERT INTO `ibid_goods_spec_groups` VALUES ('174', '31', '2', '294_292', '白色_36码', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:43:28', '2018-04-19 16:43:28');
INSERT INTO `ibid_goods_spec_groups` VALUES ('173', '31', '2', '294_291', '白色_35码', '', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:43:28', '2018-04-19 16:43:28');
INSERT INTO `ibid_goods_spec_groups` VALUES ('59', '30', '2', '191_187', '黑色_34码', '', '265.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_groups` VALUES ('60', '30', '2', '192_187', '灰色_34码', '', '265.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_groups` VALUES ('61', '30', '2', '191_188', '黑色_35码', '', '268.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_groups` VALUES ('62', '30', '2', '192_188', '灰色_35码', '', '268.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_groups` VALUES ('63', '30', '2', '191_189', '黑色_36码', '', '269.00', '0.00', '0.00', '0.00', '19', '0.00', '0', '0', '0', '0', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_groups` VALUES ('64', '30', '2', '192_189', '灰色_36码', '', '269.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_groups` VALUES ('65', '30', '2', '191_190', '黑色_37码', '', '266.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_groups` VALUES ('66', '30', '2', '192_190', '灰色_37码', '', '266.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_groups` VALUES ('90', '33', '2', '225_221', '蓝色_L(170-180)', '', '126.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('89', '33', '2', '224_221', '红色_L(170-180)', '', '126.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('88', '33', '2', '223_221', '灰色_L(170-180)', '', '126.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('87', '33', '2', '222_221', '绿色_L(170-180)', '', '126.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('86', '33', '2', '225_220', '蓝色_M(160-170)', '', '136.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('85', '33', '2', '224_220', '红色_M(160-170)', '', '136.00', '0.00', '0.00', '0.00', '19', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('84', '33', '2', '223_220', '灰色_M(160-170)', '', '136.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('83', '33', '2', '222_220', '绿色_M(160-170)', '', '136.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('82', '33', '2', '225_219', '蓝色_XL(180-190)', '', '146.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('81', '33', '2', '224_219', '红色_XL(180-190)', '', '146.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('80', '33', '2', '223_219', '灰色_XL(180-190)', '', '146.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('79', '33', '2', '222_219', '绿色_XL(180-190)', '', '146.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_groups` VALUES ('91', '32', '2', '229_226', '白色条纹_S', '', '126.00', '0.00', '0.00', '0.00', '10', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:47', '2018-04-19 16:08:47');
INSERT INTO `ibid_goods_spec_groups` VALUES ('92', '32', '2', '229_227', '白色条纹_M', '', '126.00', '0.00', '0.00', '0.00', '10', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:47', '2018-04-19 16:08:47');
INSERT INTO `ibid_goods_spec_groups` VALUES ('93', '32', '2', '229_228', '白色条纹_L', '', '126.00', '0.00', '0.00', '0.00', '10', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:08:47', '2018-04-19 16:08:47');
INSERT INTO `ibid_goods_spec_groups` VALUES ('129', '34', '2', '250_247', '白色_XL', '', '130.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('128', '34', '2', '249_247', '藏青色_XL', '', '130.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('127', '34', '2', '248_247', '蓝色_XL', '', '130.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('126', '34', '2', '250_246', '白色_L', '', '120.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('125', '34', '2', '249_246', '藏青色_L', '', '120.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('124', '34', '2', '248_246', '蓝色_L', '', '120.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('123', '34', '2', '250_245', '白色_M', '', '110.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('122', '34', '2', '249_245', '藏青色_M', '', '110.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('121', '34', '2', '248_245', '蓝色_M', '', '110.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('120', '34', '2', '250_244', '白色_S', '', '100.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('119', '34', '2', '249_244', '藏青色_S', '', '100.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('118', '34', '2', '248_244', '蓝色_S', '', '100.00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_groups` VALUES ('130', '35', '2', '254_251', '白色_S', '', '120.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:19:46', '2018-04-19 16:19:46');
INSERT INTO `ibid_goods_spec_groups` VALUES ('131', '35', '2', '254_252', '白色_M', '', '120.00', '0.00', '0.00', '0.00', '19', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:19:46', '2018-04-19 16:19:46');
INSERT INTO `ibid_goods_spec_groups` VALUES ('132', '35', '2', '254_253', '白色_L', '', '120.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:19:46', '2018-04-19 16:19:46');
INSERT INTO `ibid_goods_spec_groups` VALUES ('133', '36', '2', '258_255', '白色_S', '', '259.00', '0.00', '0.00', '0.00', '120', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('134', '36', '2', '259_255', '粉色_S', '', '259.00', '0.00', '0.00', '0.00', '120', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('135', '36', '2', '258_256', '白色_M', '', '259.00', '0.00', '0.00', '0.00', '119', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('136', '36', '2', '259_256', '粉色_M', '', '259.00', '0.00', '0.00', '0.00', '120', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('137', '36', '2', '258_257', '白色_L', '', '259.00', '0.00', '0.00', '0.00', '120', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('138', '36', '2', '259_257', '粉色_L', '', '259.00', '0.00', '0.00', '0.00', '120', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('196', '37', '2', '310_309', '白色_XL', '', '268.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:07:38', '2018-04-21 15:07:38');
INSERT INTO `ibid_goods_spec_groups` VALUES ('195', '37', '2', '311_308', '藏蓝色_L', '', '268.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:07:38', '2018-04-21 15:07:38');
INSERT INTO `ibid_goods_spec_groups` VALUES ('194', '37', '2', '310_308', '白色_L', '', '268.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:07:38', '2018-04-21 15:07:38');
INSERT INTO `ibid_goods_spec_groups` VALUES ('193', '37', '2', '311_307', '藏蓝色_M', '', '268.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:07:38', '2018-04-21 15:07:38');
INSERT INTO `ibid_goods_spec_groups` VALUES ('192', '37', '2', '310_307', '白色_M', '', '268.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:07:38', '2018-04-21 15:07:38');
INSERT INTO `ibid_goods_spec_groups` VALUES ('145', '38', '2', '268_265', '牛仔蓝_M', '', '156.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:28:34', '2018-04-19 16:28:34');
INSERT INTO `ibid_goods_spec_groups` VALUES ('146', '38', '2', '268_266', '牛仔蓝_L', '', '156.00', '0.00', '0.00', '0.00', '18', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:28:34', '2018-04-19 16:28:34');
INSERT INTO `ibid_goods_spec_groups` VALUES ('147', '38', '2', '268_267', '牛仔蓝_XL', '', '156.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:28:34', '2018-04-19 16:28:34');
INSERT INTO `ibid_goods_spec_groups` VALUES ('231', '39', '2', '336_334', '中蓝_35（185/90A）', '', '268.00', '0.00', '0.00', '0.00', '25', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('230', '39', '2', '335_334', '深蓝_35（185/90A）', '', '268.00', '0.00', '0.00', '0.00', '30', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('229', '39', '2', '336_333', '中蓝_34（185/88A）', '', '278.00', '0.00', '0.00', '0.00', '30', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('228', '39', '2', '335_333', '深蓝_34（185/88A）', '', '278.00', '0.00', '0.00', '0.00', '29', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('227', '39', '2', '336_332', '中蓝_33（180/86A）', '', '298.00', '0.00', '0.00', '0.00', '30', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('226', '39', '2', '335_332', '深蓝_33（180/86A）', '', '298.00', '0.00', '0.00', '0.00', '30', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('225', '39', '2', '336_331', '中蓝_32（180/84A）', '', '288.00', '0.00', '0.00', '0.00', '30', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('224', '39', '2', '335_331', '深蓝_32（180/84A）', '', '288.00', '0.00', '0.00', '0.00', '30', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('223', '39', '2', '336_330', '中蓝_31（175/82A）', '', '258.00', '0.00', '0.00', '0.00', '30', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('222', '39', '2', '335_330', '深蓝_31（175/82A）', '', '258.00', '0.00', '0.00', '0.00', '30', '10.00', '0', '0', '0', '0', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_groups` VALUES ('158', '40', '2', '277_276', '深蓝_155/64A', '', '126.00', '0.00', '0.00', '0.00', '27', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:37:39', '2018-04-19 16:37:39');
INSERT INTO `ibid_goods_spec_groups` VALUES ('201', '7', '2', '315_313', '蓝色_1.5m', '', '200.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:48:34', '2018-04-21 15:48:34');
INSERT INTO `ibid_goods_spec_groups` VALUES ('200', '7', '2', '314_313', '黄色_1.5m', '', '200.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:48:34', '2018-04-21 15:48:34');
INSERT INTO `ibid_goods_spec_groups` VALUES ('199', '7', '2', '315_312', '蓝色_1.8m', '', '200.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:48:33', '2018-04-21 15:48:33');
INSERT INTO `ibid_goods_spec_groups` VALUES ('198', '7', '2', '314_312', '黄色_1.8m', '', '200.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:48:33', '2018-04-21 15:48:33');
INSERT INTO `ibid_goods_spec_groups` VALUES ('167', '8', '2', '289_286', '黑色_1.5m', '', '125.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_groups` VALUES ('168', '8', '2', '290_286', '黄色_1.5m', '', '125.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_groups` VALUES ('169', '8', '2', '289_287', '黑色_1.8m', '', '125.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_groups` VALUES ('170', '8', '2', '290_287', '黄色_1.8m', '', '125.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_groups` VALUES ('171', '8', '2', '289_288', '黑色_2.0m', '', '125.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_groups` VALUES ('172', '8', '2', '290_288', '黄色_2.0m', '', '125.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_groups` VALUES ('197', '37', '2', '311_309', '藏蓝色_XL', '', '268.00', '0.00', '0.00', '0.00', '20', '0.00', '0', '0', '0', '0', '1', '2018-04-21 15:07:38', '2018-04-21 15:07:38');

-- -----------------------------
-- Table structure for `ibid_goods_spec_options`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_goods_spec_options`;
CREATE TABLE `ibid_goods_spec_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `spec_template_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '规格模板ID',
  `spec_name_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '规格ID',
  `option` varchar(255) NOT NULL COMMENT '商品规格项',
  `thum` varchar(255) DEFAULT NULL COMMENT '商品规格项图片',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '商品规格项是否显示：0不显示1显示',
  `id_str` varchar(255) NOT NULL COMMENT '前端组合的id字符串',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_goods_spec_options`
-- -----------------------------
INSERT INTO `ibid_goods_spec_options` VALUES ('10', '1', '1', '2', '红色', '', '0', '1', '4', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_options` VALUES ('9', '1', '1', '2', '蓝色', '', '0', '1', '5', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_options` VALUES ('8', '1', '1', '1', 's码', '', '0', '1', '1', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_options` VALUES ('7', '1', '1', '1', 'm码', '', '0', '1', '2', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_options` VALUES ('6', '1', '1', '1', 'L码', '', '0', '1', '3', '1', '2018-04-17 16:01:02', '2018-04-17 16:01:02');
INSERT INTO `ibid_goods_spec_options` VALUES ('40', '2', '1', '2', '蓝色', '', '0', '1', '34', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_options` VALUES ('39', '2', '1', '2', '黄色', '', '0', '1', '35', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_options` VALUES ('38', '2', '1', '1', 'S', '', '0', '1', '31', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_options` VALUES ('37', '2', '1', '1', 'M', '', '0', '1', '32', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_options` VALUES ('36', '2', '1', '1', 'L', '', '0', '1', '33', '1', '2018-04-18 14:11:15', '2018-04-18 14:11:15');
INSERT INTO `ibid_goods_spec_options` VALUES ('41', '3', '2', '3', 'x', '', '0', '1', '1524117361004', '1', '2018-04-19 13:55:58', '2018-04-19 13:55:58');
INSERT INTO `ibid_goods_spec_options` VALUES ('42', '3', '2', '3', 'lz', '', '0', '1', '1524117363631', '1', '2018-04-19 13:55:58', '2018-04-19 13:55:58');
INSERT INTO `ibid_goods_spec_options` VALUES ('43', '3', '2', '4', '红色', '', '0', '1', '1524117354158', '1', '2018-04-19 13:55:58', '2018-04-19 13:55:58');
INSERT INTO `ibid_goods_spec_options` VALUES ('44', '3', '2', '4', '蓝色', '', '0', '1', '1524117366199', '1', '2018-04-19 13:55:58', '2018-04-19 13:55:58');
INSERT INTO `ibid_goods_spec_options` VALUES ('45', '4', '2', '3', '430*430', '', '0', '1', '1524117352577', '1', '2018-04-19 14:01:37', '2018-04-19 14:01:37');
INSERT INTO `ibid_goods_spec_options` VALUES ('46', '4', '2', '4', '蓝色', '', '0', '1', '1524117339393', '1', '2018-04-19 14:01:37', '2018-04-19 14:01:37');
INSERT INTO `ibid_goods_spec_options` VALUES ('90', '5', '2', '4', '蓝色', '', '0', '1', '87', '1', '2018-04-19 15:00:08', '2018-04-19 15:00:08');
INSERT INTO `ibid_goods_spec_options` VALUES ('89', '5', '2', '3', '1.5', '', '0', '1', '85', '1', '2018-04-19 15:00:08', '2018-04-19 15:00:08');
INSERT INTO `ibid_goods_spec_options` VALUES ('88', '5', '2', '3', '1.8', '', '0', '1', '86', '1', '2018-04-19 15:00:08', '2018-04-19 15:00:08');
INSERT INTO `ibid_goods_spec_options` VALUES ('315', '7', '2', '4', '蓝色', '', '0', '1', '284', '1', '2018-04-21 15:48:33', '2018-04-21 15:48:33');
INSERT INTO `ibid_goods_spec_options` VALUES ('314', '7', '2', '4', '黄色', '', '0', '1', '285', '1', '2018-04-21 15:48:33', '2018-04-21 15:48:33');
INSERT INTO `ibid_goods_spec_options` VALUES ('313', '7', '2', '3', '1.5m', '', '0', '1', '282', '1', '2018-04-21 15:48:33', '2018-04-21 15:48:33');
INSERT INTO `ibid_goods_spec_options` VALUES ('312', '7', '2', '3', '1.8m', '', '0', '1', '283', '1', '2018-04-21 15:48:33', '2018-04-21 15:48:33');
INSERT INTO `ibid_goods_spec_options` VALUES ('290', '8', '2', '4', '黄色', '', '0', '1', '65', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_options` VALUES ('289', '8', '2', '4', '黑色', '', '0', '1', '66', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_options` VALUES ('288', '8', '2', '3', '2.0m', '', '0', '1', '62', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_options` VALUES ('287', '8', '2', '3', '1.8m', '', '0', '1', '63', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_options` VALUES ('286', '8', '2', '3', '1.5m', '', '0', '1', '64', '1', '2018-04-19 16:39:59', '2018-04-19 16:39:59');
INSERT INTO `ibid_goods_spec_options` VALUES ('91', '14', '2', '3', '无', '', '0', '1', '1524121573597', '1', '2018-04-19 15:06:41', '2018-04-19 15:06:41');
INSERT INTO `ibid_goods_spec_options` VALUES ('92', '14', '2', '4', '透明', '', '0', '1', '1524121559694', '1', '2018-04-19 15:06:41', '2018-04-19 15:06:41');
INSERT INTO `ibid_goods_spec_options` VALUES ('93', '15', '2', '3', '41*21.2*3.5 cm', '', '0', '1', '1524121717441', '1', '2018-04-19 15:09:14', '2018-04-19 15:09:14');
INSERT INTO `ibid_goods_spec_options` VALUES ('94', '15', '2', '4', '绿色', '', '0', '1', '1524121703741', '1', '2018-04-19 15:09:14', '2018-04-19 15:09:14');
INSERT INTO `ibid_goods_spec_options` VALUES ('95', '15', '2', '4', '粉色', '', '0', '1', '1524121707848', '1', '2018-04-19 15:09:14', '2018-04-19 15:09:14');
INSERT INTO `ibid_goods_spec_options` VALUES ('96', '15', '2', '4', '灰色', '', '0', '1', '1524121713998', '1', '2018-04-19 15:09:14', '2018-04-19 15:09:14');
INSERT INTO `ibid_goods_spec_options` VALUES ('97', '16', '2', '3', '1.1*1.1', '', '0', '1', '1524121866482', '1', '2018-04-19 15:11:31', '2018-04-19 15:11:31');
INSERT INTO `ibid_goods_spec_options` VALUES ('98', '16', '2', '4', '10只装', '', '0', '1', '1524121858418', '1', '2018-04-19 15:11:31', '2018-04-19 15:11:31');
INSERT INTO `ibid_goods_spec_options` VALUES ('99', '17', '2', '3', '40L', '', '0', '1', '1524122085105', '1', '2018-04-19 15:15:05', '2018-04-19 15:15:05');
INSERT INTO `ibid_goods_spec_options` VALUES ('100', '17', '2', '4', '玫红色', '', '0', '1', '1524122011473', '1', '2018-04-19 15:15:05', '2018-04-19 15:15:05');
INSERT INTO `ibid_goods_spec_options` VALUES ('101', '17', '2', '4', '宝石红', '', '0', '1', '1524122016068', '1', '2018-04-19 15:15:05', '2018-04-19 15:15:05');
INSERT INTO `ibid_goods_spec_options` VALUES ('102', '17', '2', '4', '行军绿', '', '0', '1', '1524122019904', '1', '2018-04-19 15:15:05', '2018-04-19 15:15:05');
INSERT INTO `ibid_goods_spec_options` VALUES ('103', '17', '2', '4', '宝石蓝', '', '0', '1', '1524122045808', '1', '2018-04-19 15:15:05', '2018-04-19 15:15:05');
INSERT INTO `ibid_goods_spec_options` VALUES ('104', '17', '2', '4', '草木绿', '', '0', '1', '1524122054455', '1', '2018-04-19 15:15:05', '2018-04-19 15:15:05');
INSERT INTO `ibid_goods_spec_options` VALUES ('124', '18', '2', '4', '草木绿', '', '0', '1', '120', '1', '2018-04-19 15:35:17', '2018-04-19 15:35:17');
INSERT INTO `ibid_goods_spec_options` VALUES ('123', '18', '2', '4', '宝石蓝', '', '0', '1', '121', '1', '2018-04-19 15:35:17', '2018-04-19 15:35:17');
INSERT INTO `ibid_goods_spec_options` VALUES ('122', '18', '2', '3', '112升', '', '0', '1', '119', '1', '2018-04-19 15:35:17', '2018-04-19 15:35:17');
INSERT INTO `ibid_goods_spec_options` VALUES ('108', '19', '2', '3', '45L', '', '0', '1', '1524122363501', '1', '2018-04-19 15:19:39', '2018-04-19 15:19:39');
INSERT INTO `ibid_goods_spec_options` VALUES ('109', '19', '2', '4', '蓝色', '', '0', '1', '1524122338209', '1', '2018-04-19 15:19:39', '2018-04-19 15:19:39');
INSERT INTO `ibid_goods_spec_options` VALUES ('110', '19', '2', '4', '红色', '', '0', '1', '1524122342630', '1', '2018-04-19 15:19:39', '2018-04-19 15:19:39');
INSERT INTO `ibid_goods_spec_options` VALUES ('111', '19', '2', '4', '白色', '', '0', '1', '1524122356295', '1', '2018-04-19 15:19:39', '2018-04-19 15:19:39');
INSERT INTO `ibid_goods_spec_options` VALUES ('112', '26', '2', '3', '38', '', '0', '1', '1524123123857', '1', '2018-04-19 15:32:42', '2018-04-19 15:32:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('113', '26', '2', '3', '39', '', '0', '1', '1524123129035', '1', '2018-04-19 15:32:42', '2018-04-19 15:32:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('114', '26', '2', '3', '40', '', '0', '1', '1524123131952', '1', '2018-04-19 15:32:42', '2018-04-19 15:32:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('115', '26', '2', '3', '41', '', '0', '1', '1524123134928', '1', '2018-04-19 15:32:42', '2018-04-19 15:32:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('116', '26', '2', '3', '42', '', '0', '1', '1524123139215', '1', '2018-04-19 15:32:42', '2018-04-19 15:32:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('117', '26', '2', '4', '黑色', '', '0', '1', '1524123116290', '1', '2018-04-19 15:32:42', '2018-04-19 15:32:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('118', '26', '2', '4', '白色', '', '0', '1', '1524123120321', '1', '2018-04-19 15:32:42', '2018-04-19 15:32:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('125', '27', '2', '3', '39码', '', '0', '1', '1524123444184', '1', '2018-04-19 15:37:52', '2018-04-19 15:37:52');
INSERT INTO `ibid_goods_spec_options` VALUES ('126', '27', '2', '3', '40码', '', '0', '1', '1524123449211', '1', '2018-04-19 15:37:52', '2018-04-19 15:37:52');
INSERT INTO `ibid_goods_spec_options` VALUES ('127', '27', '2', '3', '41码', '', '0', '1', '1524123453126', '1', '2018-04-19 15:37:52', '2018-04-19 15:37:52');
INSERT INTO `ibid_goods_spec_options` VALUES ('128', '27', '2', '3', '42码', '', '0', '1', '1524123458926', '1', '2018-04-19 15:37:52', '2018-04-19 15:37:52');
INSERT INTO `ibid_goods_spec_options` VALUES ('129', '27', '2', '3', '43码', '', '0', '1', '1524123462402', '1', '2018-04-19 15:37:52', '2018-04-19 15:37:52');
INSERT INTO `ibid_goods_spec_options` VALUES ('130', '27', '2', '4', '黑色', '', '0', '1', '1524123378277', '1', '2018-04-19 15:37:52', '2018-04-19 15:37:52');
INSERT INTO `ibid_goods_spec_options` VALUES ('131', '27', '2', '4', '灰色', '', '0', '1', '1524123381965', '1', '2018-04-19 15:37:52', '2018-04-19 15:37:52');
INSERT INTO `ibid_goods_spec_options` VALUES ('218', '28', '2', '4', '黑色', '', '0', '1', '150', '1', '2018-04-19 16:06:23', '2018-04-19 16:06:23');
INSERT INTO `ibid_goods_spec_options` VALUES ('217', '28', '2', '4', '灰色', '', '0', '1', '151', '1', '2018-04-19 16:06:23', '2018-04-19 16:06:23');
INSERT INTO `ibid_goods_spec_options` VALUES ('216', '28', '2', '4', '深蓝', '', '0', '1', '152', '1', '2018-04-19 16:06:23', '2018-04-19 16:06:23');
INSERT INTO `ibid_goods_spec_options` VALUES ('215', '28', '2', '3', '38码', '', '0', '1', '146', '1', '2018-04-19 16:06:23', '2018-04-19 16:06:23');
INSERT INTO `ibid_goods_spec_options` VALUES ('214', '28', '2', '3', '39码', '', '0', '1', '147', '1', '2018-04-19 16:06:23', '2018-04-19 16:06:23');
INSERT INTO `ibid_goods_spec_options` VALUES ('213', '28', '2', '3', '40码', '', '0', '1', '148', '1', '2018-04-19 16:06:23', '2018-04-19 16:06:23');
INSERT INTO `ibid_goods_spec_options` VALUES ('212', '28', '2', '3', '41码', '', '0', '1', '149', '1', '2018-04-19 16:06:23', '2018-04-19 16:06:23');
INSERT INTO `ibid_goods_spec_options` VALUES ('153', '29', '2', '3', '35码', '', '0', '1', '1524123778682', '1', '2018-04-19 15:43:36', '2018-04-19 15:43:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('154', '29', '2', '3', '36码', '', '0', '1', '1524123781419', '1', '2018-04-19 15:43:36', '2018-04-19 15:43:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('155', '29', '2', '3', '37码', '', '0', '1', '1524123784832', '1', '2018-04-19 15:43:36', '2018-04-19 15:43:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('156', '29', '2', '3', '38码', '', '0', '1', '1524123787676', '1', '2018-04-19 15:43:36', '2018-04-19 15:43:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('157', '29', '2', '4', '粉色', '', '0', '1', '1524123771524', '1', '2018-04-19 15:43:36', '2018-04-19 15:43:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('158', '29', '2', '4', '黑色', '', '0', '1', '1524123774323', '1', '2018-04-19 15:43:36', '2018-04-19 15:43:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('192', '30', '2', '4', '灰色', '', '0', '1', '173', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('191', '30', '2', '4', '黑色', '', '0', '1', '174', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('190', '30', '2', '3', '37码', '', '0', '1', '169', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('189', '30', '2', '3', '36码', '', '0', '1', '170', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('188', '30', '2', '3', '35码', '', '0', '1', '171', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('187', '30', '2', '3', '34码', '', '0', '1', '172', '1', '2018-04-19 15:59:42', '2018-04-19 15:59:42');
INSERT INTO `ibid_goods_spec_options` VALUES ('294', '31', '2', '4', '白色', '', '0', '1', '186', '1', '2018-04-19 16:43:28', '2018-04-19 16:43:28');
INSERT INTO `ibid_goods_spec_options` VALUES ('293', '31', '2', '3', '37码', '', '0', '1', '183', '1', '2018-04-19 16:43:28', '2018-04-19 16:43:28');
INSERT INTO `ibid_goods_spec_options` VALUES ('292', '31', '2', '3', '36码', '', '0', '1', '184', '1', '2018-04-19 16:43:28', '2018-04-19 16:43:28');
INSERT INTO `ibid_goods_spec_options` VALUES ('291', '31', '2', '3', '35码', '', '0', '1', '185', '1', '2018-04-19 16:43:28', '2018-04-19 16:43:28');
INSERT INTO `ibid_goods_spec_options` VALUES ('229', '32', '2', '4', '白色条纹', '', '0', '1', '211', '1', '2018-04-19 16:08:47', '2018-04-19 16:08:47');
INSERT INTO `ibid_goods_spec_options` VALUES ('228', '32', '2', '3', 'L', '', '0', '1', '208', '1', '2018-04-19 16:08:47', '2018-04-19 16:08:47');
INSERT INTO `ibid_goods_spec_options` VALUES ('227', '32', '2', '3', 'M', '', '0', '1', '209', '1', '2018-04-19 16:08:47', '2018-04-19 16:08:47');
INSERT INTO `ibid_goods_spec_options` VALUES ('226', '32', '2', '3', 'S', '', '0', '1', '210', '1', '2018-04-19 16:08:47', '2018-04-19 16:08:47');
INSERT INTO `ibid_goods_spec_options` VALUES ('225', '33', '2', '4', '蓝色', '', '0', '1', '204', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_options` VALUES ('224', '33', '2', '4', '红色', '', '0', '1', '205', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_options` VALUES ('223', '33', '2', '4', '灰色', '', '0', '1', '206', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_options` VALUES ('222', '33', '2', '4', '绿色', '', '0', '1', '207', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_options` VALUES ('221', '33', '2', '3', 'L(170-180)', '', '0', '1', '201', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_options` VALUES ('220', '33', '2', '3', 'M(160-170)', '', '0', '1', '202', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_options` VALUES ('219', '33', '2', '3', 'XL(180-190)', '', '0', '1', '203', '1', '2018-04-19 16:08:01', '2018-04-19 16:08:01');
INSERT INTO `ibid_goods_spec_options` VALUES ('250', '34', '2', '4', '白色', '', '0', '1', '241', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('249', '34', '2', '4', '藏青色', '', '0', '1', '242', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('248', '34', '2', '4', '蓝色', '', '0', '1', '243', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('247', '34', '2', '3', 'XL', '', '0', '1', '237', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('246', '34', '2', '3', 'L', '', '0', '1', '238', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('245', '34', '2', '3', 'M', '', '0', '1', '239', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('244', '34', '2', '3', 'S', '', '0', '1', '240', '1', '2018-04-19 16:15:36', '2018-04-19 16:15:36');
INSERT INTO `ibid_goods_spec_options` VALUES ('251', '35', '2', '3', 'S', '', '0', '1', '1524125871103', '1', '2018-04-19 16:19:46', '2018-04-19 16:19:46');
INSERT INTO `ibid_goods_spec_options` VALUES ('252', '35', '2', '3', 'M', '', '0', '1', '1524125874379', '1', '2018-04-19 16:19:46', '2018-04-19 16:19:46');
INSERT INTO `ibid_goods_spec_options` VALUES ('253', '35', '2', '3', 'L', '', '0', '1', '1524125876608', '1', '2018-04-19 16:19:46', '2018-04-19 16:19:46');
INSERT INTO `ibid_goods_spec_options` VALUES ('254', '35', '2', '4', '白色', '', '0', '1', '1524125867218', '1', '2018-04-19 16:19:46', '2018-04-19 16:19:46');
INSERT INTO `ibid_goods_spec_options` VALUES ('255', '36', '2', '3', 'S', '', '0', '1', '1524126162552', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('256', '36', '2', '3', 'M', '', '0', '1', '1524126166383', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('257', '36', '2', '3', 'L', '', '0', '1', '1524126168326', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('258', '36', '2', '4', '白色', '', '0', '1', '1524126155627', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('259', '36', '2', '4', '粉色', '', '0', '1', '1524126159308', '1', '2018-04-19 16:23:25', '2018-04-19 16:23:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('311', '37', '2', '4', '藏蓝色', '', '0', '1', '305', '1', '2018-04-21 15:07:37', '2018-04-21 15:07:37');
INSERT INTO `ibid_goods_spec_options` VALUES ('310', '37', '2', '4', '白色', '', '0', '1', '306', '1', '2018-04-21 15:07:37', '2018-04-21 15:07:37');
INSERT INTO `ibid_goods_spec_options` VALUES ('309', '37', '2', '3', 'XL', '', '0', '1', '302', '1', '2018-04-21 15:07:37', '2018-04-21 15:07:37');
INSERT INTO `ibid_goods_spec_options` VALUES ('308', '37', '2', '3', 'L', '', '0', '1', '303', '1', '2018-04-21 15:07:37', '2018-04-21 15:07:37');
INSERT INTO `ibid_goods_spec_options` VALUES ('307', '37', '2', '3', 'M', '', '0', '1', '304', '1', '2018-04-21 15:07:37', '2018-04-21 15:07:37');
INSERT INTO `ibid_goods_spec_options` VALUES ('265', '38', '2', '3', 'M', '', '0', '1', '1524126487937', '1', '2018-04-19 16:28:34', '2018-04-19 16:28:34');
INSERT INTO `ibid_goods_spec_options` VALUES ('266', '38', '2', '3', 'L', '', '0', '1', '1524126490990', '1', '2018-04-19 16:28:34', '2018-04-19 16:28:34');
INSERT INTO `ibid_goods_spec_options` VALUES ('267', '38', '2', '3', 'XL', '', '0', '1', '1524126493247', '1', '2018-04-19 16:28:34', '2018-04-19 16:28:34');
INSERT INTO `ibid_goods_spec_options` VALUES ('268', '38', '2', '4', '牛仔蓝', '', '0', '1', '1524126475496', '1', '2018-04-19 16:28:34', '2018-04-19 16:28:34');
INSERT INTO `ibid_goods_spec_options` VALUES ('336', '39', '2', '4', '中蓝', '', '0', '1', '328', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('335', '39', '2', '4', '深蓝', '', '0', '1', '329', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('334', '39', '2', '3', '35（185/90A）', '', '0', '1', '323', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('333', '39', '2', '3', '34（185/88A）', '', '0', '1', '324', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('332', '39', '2', '3', '33（180/86A）', '', '0', '1', '325', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('331', '39', '2', '3', '32（180/84A）', '', '0', '1', '326', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('330', '39', '2', '3', '31（175/82A）', '', '0', '1', '327', '1', '2018-04-24 17:10:25', '2018-04-24 17:10:25');
INSERT INTO `ibid_goods_spec_options` VALUES ('276', '40', '2', '3', '155/64A', '', '0', '1', '1524126961754', '1', '2018-04-19 16:37:39', '2018-04-19 16:37:39');
INSERT INTO `ibid_goods_spec_options` VALUES ('277', '40', '2', '4', '深蓝', '', '0', '1', '1524126956963', '1', '2018-04-19 16:37:39', '2018-04-19 16:37:39');

-- -----------------------------
-- Table structure for `ibid_guides`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_guides`;
CREATE TABLE `ibid_guides` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL COMMENT '指导手册类别',
  `title` varchar(100) NOT NULL COMMENT '指导手册标题',
  `thum` varchar(255) DEFAULT NULL COMMENT '指导手册缩略图',
  `intro` varchar(255) DEFAULT NULL COMMENT '指导手册摘要',
  `content` text COMMENT '指导手册详细内容',
  `author` varchar(50) DEFAULT NULL COMMENT '指导手册作者',
  `imgs` text COMMENT '图片集',
  `audio_url` text COMMENT '音频链接',
  `video_url` text COMMENT '视频链接',
  `click_num` bigint(20) DEFAULT '0' COMMENT '文章的点击量',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ibid_market_activities`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_market_activities`;
CREATE TABLE `ibid_market_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT '活动类别',
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `thum` varchar(255) DEFAULT NULL COMMENT '活动缩略图',
  `imgs` text COMMENT '活动图集',
  `intro` text COMMENT '活动简介',
  `content` text COMMENT '活动内容',
  `begin_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL COMMENT '活动结束时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_market_activities`
-- -----------------------------
INSERT INTO `ibid_market_activities` VALUES ('1', 'discount', '限时折扣活动', '', '[]', '', '', '2018-04-17 15:51:28', '2018-04-30 15:51:29', '1', '1', '2018-04-17 15:50:49', '2018-04-17 15:50:49');
INSERT INTO `ibid_market_activities` VALUES ('2', 'coupon', '优惠券活动', '', '[]', '', '', '2018-04-17 15:57:09', '2018-04-30 15:57:10', '1', '1', '2018-04-17 15:56:28', '2018-04-17 15:56:28');
INSERT INTO `ibid_market_activities` VALUES ('3', 'full', '满减活动', '', '[]', '', '', '2018-04-17 15:57:23', '2018-04-30 15:57:24', '1', '1', '2018-04-17 15:56:42', '2018-04-17 15:56:42');
INSERT INTO `ibid_market_activities` VALUES ('4', 'full', '31334', '', '[]', '3324', '<p>234234234<br/></p>', '2017-07-04 11:49:48', '2018-07-07 11:49:48', '1', '1', '2018-04-18 11:49:54', '2018-04-18 11:49:54');
INSERT INTO `ibid_market_activities` VALUES ('5', 'coupon', '4243234', '', '[]', '32132', '<p>423<img src=\"/public/upload/ueditor/image/20180419/1524128101208402.jpg\" title=\"1524128101208402.jpg\" alt=\"f04d869e6f75f18651e4426b56f0c56f.jpg\" width=\"86\" height=\"90\"/></p>', '2018-03-26 11:54:01', '2018-04-28 11:54:06', '1', '1', '2018-04-18 11:54:00', '2018-04-18 11:54:00');

-- -----------------------------
-- Table structure for `ibid_mobile_msgs`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_mobile_msgs`;
CREATE TABLE `ibid_mobile_msgs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `msg` varchar(255) NOT NULL COMMENT '发送的短信内容',
  `code` varchar(255) NOT NULL COMMENT '短信验证码',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '短信发送状态（1发送成功0发送失败）',
  `send_time` datetime NOT NULL COMMENT '短信的发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_mobile_msgs`
-- -----------------------------
INSERT INTO `ibid_mobile_msgs` VALUES ('1', '18175974828', '【网开创】您的验证码是：267980。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '267980', '1', '2018-04-17 16:13:59');
INSERT INTO `ibid_mobile_msgs` VALUES ('2', '18175974828', '【网开创】您的验证码是：605700。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '605700', '1', '2018-04-17 17:43:02');
INSERT INTO `ibid_mobile_msgs` VALUES ('3', '15802577957', '【网开创】您的验证码是：692135。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '692135', '1', '2018-04-18 09:09:43');
INSERT INTO `ibid_mobile_msgs` VALUES ('4', '13170308670', '【网开创】您的验证码是：563842。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '563842', '1', '2018-04-18 09:14:00');
INSERT INTO `ibid_mobile_msgs` VALUES ('5', '13170308670', '【网开创】您的验证码是：634896。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '634896', '1', '2018-04-18 09:21:47');
INSERT INTO `ibid_mobile_msgs` VALUES ('6', '15111463656', '【网开创】您的验证码是：437390。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '437390', '1', '2018-04-18 09:34:18');
INSERT INTO `ibid_mobile_msgs` VALUES ('7', '18112344321', '【网开创】您的验证码是：155014。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '155014', '1', '2018-04-18 09:38:24');
INSERT INTO `ibid_mobile_msgs` VALUES ('8', '18390916324', '【网开创】您的验证码是：452084。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '452084', '1', '2018-04-18 10:01:00');
INSERT INTO `ibid_mobile_msgs` VALUES ('9', '18390916324', '【网开创】您的验证码是：859869。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '859869', '1', '2018-04-18 10:05:15');
INSERT INTO `ibid_mobile_msgs` VALUES ('10', '18390916324', '【网开创】您的验证码是：989260。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '989260', '1', '2018-04-18 10:06:44');
INSERT INTO `ibid_mobile_msgs` VALUES ('11', '13574849891', '【网开创】您的验证码是：866159。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '866159', '1', '2018-04-18 10:15:48');
INSERT INTO `ibid_mobile_msgs` VALUES ('12', '18175974828', '【网开创】您的验证码是：708203。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '708203', '1', '2018-04-18 10:23:17');
INSERT INTO `ibid_mobile_msgs` VALUES ('13', '15802577957', '【网开创】您的验证码是：719354。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '719354', '1', '2018-04-18 13:45:19');
INSERT INTO `ibid_mobile_msgs` VALUES ('14', '17670745968', '【网开创】您的验证码是：566122。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '566122', '1', '2018-04-18 13:52:37');
INSERT INTO `ibid_mobile_msgs` VALUES ('15', '17670745968', '【网开创】您的验证码是：338293。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '338293', '1', '2018-04-18 13:55:36');
INSERT INTO `ibid_mobile_msgs` VALUES ('16', '18390916324', '【网开创】您的验证码是：321868。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '321868', '1', '2018-04-18 13:55:44');
INSERT INTO `ibid_mobile_msgs` VALUES ('17', '18390916324', '【网开创】您的验证码是：896755。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '896755', '1', '2018-04-18 13:56:42');
INSERT INTO `ibid_mobile_msgs` VALUES ('18', '18390916324', '【网开创】您的验证码是：453897。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '453897', '1', '2018-04-18 13:59:05');
INSERT INTO `ibid_mobile_msgs` VALUES ('19', '18390916324', '【网开创】您的验证码是：854623。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '854623', '1', '2018-04-18 14:06:34');
INSERT INTO `ibid_mobile_msgs` VALUES ('20', '18390911268', '【网开创】您的验证码是：958938。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '958938', '1', '2018-04-18 15:50:12');
INSERT INTO `ibid_mobile_msgs` VALUES ('21', '18390911268', '【网开创】您的验证码是：352218。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '352218', '1', '2018-04-18 15:53:35');
INSERT INTO `ibid_mobile_msgs` VALUES ('22', '18390911268', '【网开创】您的验证码是：247436。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '247436', '1', '2018-04-18 15:53:36');
INSERT INTO `ibid_mobile_msgs` VALUES ('23', '18390911268', '【网开创】您的验证码是：368972。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '368972', '1', '2018-04-18 15:54:27');
INSERT INTO `ibid_mobile_msgs` VALUES ('24', '13787024881', '【网开创】您的验证码是：638220。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '638220', '0', '2018-04-18 21:05:38');
INSERT INTO `ibid_mobile_msgs` VALUES ('25', '18175974828', '【网开创】您的验证码是：293579。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '293579', '0', '2018-04-19 10:38:33');
INSERT INTO `ibid_mobile_msgs` VALUES ('26', '17621502221', '【网开创】您的验证码是：512838。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '512838', '0', '2018-04-19 11:52:29');
INSERT INTO `ibid_mobile_msgs` VALUES ('27', '17621502221', '【网开创】您的验证码是：992501。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '992501', '0', '2018-04-19 11:52:30');
INSERT INTO `ibid_mobile_msgs` VALUES ('28', '17621502221', '【网开创】您的验证码是：803125。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '803125', '0', '2018-04-19 11:52:30');
INSERT INTO `ibid_mobile_msgs` VALUES ('29', '17621502221', '【网开创】您的验证码是：897717。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '897717', '0', '2018-04-19 11:55:22');
INSERT INTO `ibid_mobile_msgs` VALUES ('30', '15580841403', '【网开创】您的验证码是：308547。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '308547', '0', '2018-04-21 18:43:21');
INSERT INTO `ibid_mobile_msgs` VALUES ('31', '15580841403', '【网开创】您的验证码是：992776。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '992776', '0', '2018-04-21 18:43:34');
INSERT INTO `ibid_mobile_msgs` VALUES ('32', '15580841403', '【网开创】您的验证码是：366775。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '366775', '1', '2018-04-21 18:54:32');
INSERT INTO `ibid_mobile_msgs` VALUES ('33', '17670745968', '【网开创】您的验证码是：632617。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '632617', '1', '2018-04-21 19:05:12');
INSERT INTO `ibid_mobile_msgs` VALUES ('34', '17670745968', '【网开创】您的验证码是：717733。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '717733', '1', '2018-04-21 19:06:16');
INSERT INTO `ibid_mobile_msgs` VALUES ('35', '17670745968', '【网开创】您的验证码是：225683。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '225683', '1', '2018-04-21 19:17:33');
INSERT INTO `ibid_mobile_msgs` VALUES ('36', '17670745968', '【网开创】您的验证码是：128152。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '128152', '1', '2018-04-21 19:20:49');
INSERT INTO `ibid_mobile_msgs` VALUES ('37', '17670745968', '【网开创】您的验证码是：654617。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '654617', '1', '2018-04-21 19:22:09');
INSERT INTO `ibid_mobile_msgs` VALUES ('38', '17670745968', '【网开创】您的验证码是：778295。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '778295', '1', '2018-04-21 19:22:59');
INSERT INTO `ibid_mobile_msgs` VALUES ('39', '17670745968', '【网开创】您的验证码是：967315。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '967315', '1', '2018-04-21 19:23:18');
INSERT INTO `ibid_mobile_msgs` VALUES ('40', '17670745968', '【网开创】您的验证码是：547994。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '547994', '1', '2018-04-21 19:39:43');
INSERT INTO `ibid_mobile_msgs` VALUES ('41', '17670745968', '【网开创】您的验证码是：794528。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '794528', '1', '2018-04-21 19:40:11');
INSERT INTO `ibid_mobile_msgs` VALUES ('42', '17670745968', '【网开创】您的验证码是：590786。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '590786', '1', '2018-04-21 19:41:40');
INSERT INTO `ibid_mobile_msgs` VALUES ('43', '17670745968', '【网开创】您的验证码是：653958。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '653958', '1', '2018-04-21 19:44:27');
INSERT INTO `ibid_mobile_msgs` VALUES ('44', '17670745968', '【网开创】您的验证码是：118347。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '118347', '1', '2018-04-21 19:45:24');
INSERT INTO `ibid_mobile_msgs` VALUES ('45', '17670745968', '【网开创】您的验证码是：784228。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '784228', '1', '2018-04-21 19:47:14');
INSERT INTO `ibid_mobile_msgs` VALUES ('46', '17670745968', '【网开创】您的验证码是：745007。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '745007', '1', '2018-04-21 19:48:22');
INSERT INTO `ibid_mobile_msgs` VALUES ('47', '18175974828', '【网开创】您的验证码是：280065。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '280065', '1', '2018-04-21 19:50:49');
INSERT INTO `ibid_mobile_msgs` VALUES ('48', '17670745968', '【网开创】您的验证码是：675985。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '675985', '1', '2018-04-21 19:54:49');
INSERT INTO `ibid_mobile_msgs` VALUES ('49', '17670745968', '【网开创】您的验证码是：965887。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '965887', '1', '2018-04-21 19:56:01');
INSERT INTO `ibid_mobile_msgs` VALUES ('50', '17670745968', '【网开创】您的验证码是：557003。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '557003', '1', '2018-04-21 19:58:29');
INSERT INTO `ibid_mobile_msgs` VALUES ('51', '17670745968', '【网开创】您的验证码是：265783。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '265783', '1', '2018-04-21 19:59:06');
INSERT INTO `ibid_mobile_msgs` VALUES ('52', '17670745968', '【网开创】您的验证码是：622537。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '622537', '1', '2018-04-21 20:00:19');
INSERT INTO `ibid_mobile_msgs` VALUES ('53', '18390911268', '【网开创】您的验证码是：869784。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '869784', '1', '2018-04-21 20:00:43');
INSERT INTO `ibid_mobile_msgs` VALUES ('54', '18390911268', '【网开创】您的验证码是：916558。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '916558', '1', '2018-04-21 20:01:06');
INSERT INTO `ibid_mobile_msgs` VALUES ('55', '18390911268', '【网开创】您的验证码是：176162。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '176162', '1', '2018-04-21 20:04:10');
INSERT INTO `ibid_mobile_msgs` VALUES ('56', '18390911268', '【网开创】您的验证码是：560162。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '560162', '1', '2018-04-21 20:04:16');
INSERT INTO `ibid_mobile_msgs` VALUES ('57', '13574849891', '【网开创】您的验证码是：562249。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '562249', '1', '2018-04-21 20:06:36');
INSERT INTO `ibid_mobile_msgs` VALUES ('58', '15802577954', '【网开创】您的验证码是：256939。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '256939', '1', '2018-04-23 15:02:31');
INSERT INTO `ibid_mobile_msgs` VALUES ('59', '15802577954', '【网开创】您的验证码是：740310。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '740310', '1', '2018-04-23 15:04:14');
INSERT INTO `ibid_mobile_msgs` VALUES ('60', '18175974828', '【网开创】您的验证码是：782333。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '782333', '1', '2018-04-23 15:04:32');
INSERT INTO `ibid_mobile_msgs` VALUES ('61', '18175974828', '【网开创】您的验证码是：840725。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '840725', '1', '2018-04-23 15:29:56');
INSERT INTO `ibid_mobile_msgs` VALUES ('62', '15274901730', '【网开创】您的验证码是：699441。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '699441', '1', '2018-04-23 17:00:16');
INSERT INTO `ibid_mobile_msgs` VALUES ('63', '13574849891', '【网开创】您的验证码是：634732。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '634732', '1', '2018-04-23 23:10:21');
INSERT INTO `ibid_mobile_msgs` VALUES ('64', '13574849891', '【网开创】您的验证码是：470184。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '470184', '1', '2018-04-23 23:11:45');
INSERT INTO `ibid_mobile_msgs` VALUES ('65', '13574849891', '【网开创】您的验证码是：525802。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '525802', '1', '2018-04-23 23:12:02');
INSERT INTO `ibid_mobile_msgs` VALUES ('66', '18175974828', '【网开创】您的验证码是：336700。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '336700', '1', '2018-04-24 10:15:28');
INSERT INTO `ibid_mobile_msgs` VALUES ('67', '15802577957', '【网开创】您的验证码是：867532。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '867532', '1', '2018-04-24 10:16:54');
INSERT INTO `ibid_mobile_msgs` VALUES ('68', '18175974828', '【网开创】您的验证码是：466366。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '466366', '1', '2018-04-24 13:57:04');
INSERT INTO `ibid_mobile_msgs` VALUES ('69', '18888888888', '【网开创】您的验证码是：840917。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '840917', '1', '2018-04-24 14:31:29');
INSERT INTO `ibid_mobile_msgs` VALUES ('70', '18390911268', '【网开创】您的验证码是：611660。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '611660', '1', '2018-04-24 14:34:19');
INSERT INTO `ibid_mobile_msgs` VALUES ('71', '18390911268', '【网开创】您的验证码是：639401。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '639401', '1', '2018-04-24 14:34:51');
INSERT INTO `ibid_mobile_msgs` VALUES ('72', '18175974828', '【网开创】您的验证码是：758026。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '758026', '1', '2018-04-24 14:36:08');
INSERT INTO `ibid_mobile_msgs` VALUES ('73', '13574849895', '【网开创】您的验证码是：466613。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '466613', '1', '2018-04-24 16:25:07');
INSERT INTO `ibid_mobile_msgs` VALUES ('74', '13574849895', '【网开创】您的验证码是：486334。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '486334', '1', '2018-04-24 16:25:10');
INSERT INTO `ibid_mobile_msgs` VALUES ('75', '13574849895', '【网开创】您的验证码是：409484。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '409484', '1', '2018-04-24 16:25:12');
INSERT INTO `ibid_mobile_msgs` VALUES ('76', '15802577957', '【网开创】您的验证码是：435577。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '435577', '1', '2018-04-24 16:46:39');

-- -----------------------------
-- Table structure for `ibid_navs`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_navs`;
CREATE TABLE `ibid_navs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '目录名称',
  `thum` varchar(255) DEFAULT NULL COMMENT '类目的缩略图',
  `icon` varchar(255) DEFAULT NULL COMMENT 'icon图标',
  `module` varchar(255) NOT NULL COMMENT '模块名',
  `class` varchar(255) NOT NULL COMMENT '类名',
  `method` varchar(255) NOT NULL COMMENT '方法名',
  `params` varchar(255) DEFAULT NULL COMMENT '其他参数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '父分类目录',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶：0否1是',
  `status` tinyint(1) DEFAULT '1' COMMENT '菜单状态：1显示2隐藏',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_navs`
-- -----------------------------
INSERT INTO `ibid_navs` VALUES ('1', '会员管理', '', 'icon-account', '', '', '', '', '900', '0', '0', '1', '1', '2017-12-06 15:06:14', '2018-04-02 15:46:53');
INSERT INTO `ibid_navs` VALUES ('2', '会员列表', '', '', 'admin', 'users', 'index', '', '0', '1', '0', '1', '1', '2017-12-06 15:11:57', '2017-12-29 09:34:45');
INSERT INTO `ibid_navs` VALUES ('29', '管理员列表', '', '', 'admin', 'admins', 'index', '', '20', '22', '0', '1', '1', '2017-12-11 20:56:47', '2017-12-19 08:55:41');
INSERT INTO `ibid_navs` VALUES ('112', '会员认证', '', '', 'admin', 'user_auths', 'index', '', '0', '1', '0', '1', '1', '2018-04-08 17:33:31', '2018-04-08 17:33:31');
INSERT INTO `ibid_navs` VALUES ('32', '友情链接', '', '', 'admin', 'friendly_links', 'index', '', '50', '37', '0', '1', '1', '2017-12-12 09:20:56', '2017-12-28 17:49:58');
INSERT INTO `ibid_navs` VALUES ('33', '会员访问日志', '', '', 'admin', 'visit_logs', 'user', '', '0', '1', '0', '1', '1', '2017-12-12 09:21:44', '2017-12-29 09:35:01');
INSERT INTO `ibid_navs` VALUES ('34', '自定义模型', '', '', 'admin', 'dds', 'index', '', '12', '22', '0', '1', '1', '2017-12-12 20:19:06', '2018-03-10 09:58:18');
INSERT INTO `ibid_navs` VALUES ('18', '文章管理', '', '', 'admin', 'articles', 'index', '', '90', '37', '0', '1', '1', '2017-12-06 15:23:47', '2017-12-16 10:09:53');
INSERT INTO `ibid_navs` VALUES ('19', '文章分类', '', '', 'admin', 'article_types', 'index', '', '80', '37', '0', '1', '1', '2017-12-06 15:24:19', '2017-12-16 10:12:26');
INSERT INTO `ibid_navs` VALUES ('113', '会员银行卡', '', '', 'admin', 'bank_cards', 'index', '', '0', '1', '0', '1', '1', '2018-04-10 16:52:12', '2018-04-10 16:52:12');
INSERT INTO `ibid_navs` VALUES ('21', '规则列表', '', '', 'admin', 'rules', 'index', '', '50', '37', '0', '1', '1', '2017-12-06 15:25:01', '2017-12-28 17:51:07');
INSERT INTO `ibid_navs` VALUES ('22', '系统管理', '', 'icon-msnui-sys-set', 'admin', 'admins', 'index', '', '350', '0', '0', '1', '1', '2017-12-06 15:25:27', '2018-02-25 23:19:26');
INSERT INTO `ibid_navs` VALUES ('23', '参数配置', '', '', 'admin', 'params', 'index', '', '16', '22', '0', '1', '1', '2017-12-06 15:26:06', '2018-02-25 11:23:01');
INSERT INTO `ibid_navs` VALUES ('24', '菜单配置', '', '', 'admin', 'navs', 'index', '', '15', '22', '0', '1', '1', '2017-12-06 15:26:35', '2018-02-25 11:23:12');
INSERT INTO `ibid_navs` VALUES ('114', '资产管理', '', 'icon-daizhifudingdan', '', '', '', '', '800', '0', '0', '1', '1', '2018-04-11 17:53:54', '2018-04-11 17:53:54');
INSERT INTO `ibid_navs` VALUES ('27', '角色管理', '', '', 'admin', 'roles', 'index', '', '18', '22', '0', '1', '1', '2017-12-06 16:53:05', '2017-12-19 08:55:51');
INSERT INTO `ibid_navs` VALUES ('115', '会员资产列表', '', '', 'admin', 'user_assets', 'index', '', '0', '114', '0', '1', '1', '2018-04-11 17:54:55', '2018-04-11 17:54:55');
INSERT INTO `ibid_navs` VALUES ('36', '数据中台', '', 'icon-iconset0357', 'admin', 'data', 'index', '', '900', '0', '0', '1', '1', '2017-12-14 15:27:53', '2018-02-25 23:18:30');
INSERT INTO `ibid_navs` VALUES ('37', '内容管理', '', 'icon-xiexinzhangjie', 'admin', 'articles', 'index', '', '450', '0', '0', '1', '1', '2017-12-16 10:05:09', '2018-02-25 23:19:14');
INSERT INTO `ibid_navs` VALUES ('38', '广告管理', '', '', 'admin', 'advertisements', 'index', '', '79', '37', '0', '1', '1', '2017-12-16 10:07:15', '2017-12-28 17:50:15');
INSERT INTO `ibid_navs` VALUES ('39', '通知公告', '', '', 'admin', 'annoncements', 'index', '', '78', '37', '0', '1', '1', '2017-12-16 10:08:37', '2017-12-28 17:50:23');
INSERT INTO `ibid_navs` VALUES ('42', '轮播图管理', '', '', 'admin', 'banners', 'index', '', '60', '37', '0', '1', '1', '2017-12-16 10:21:28', '2017-12-28 17:51:13');
INSERT INTO `ibid_navs` VALUES ('43', '商品管理', '', 'icon-all', 'admin', 'goods', 'index', '', '750', '0', '0', '1', '1', '2017-12-16 10:35:43', '2018-02-25 23:18:39');
INSERT INTO `ibid_navs` VALUES ('44', '商品列表', '', '', 'admin', 'goods', 'index', '', '0', '43', '0', '1', '1', '2017-12-16 10:36:26', '2017-12-16 10:36:26');
INSERT INTO `ibid_navs` VALUES ('45', '商品分类', '', '', 'admin', 'goods_cates', 'index', '', '0', '43', '0', '1', '1', '2017-12-16 10:37:57', '2017-12-16 10:37:57');
INSERT INTO `ibid_navs` VALUES ('46', '商品评论', '', '', 'admin', 'goods_comments', 'index', '', '0', '43', '0', '1', '1', '2017-12-16 10:38:42', '2017-12-16 10:38:42');
INSERT INTO `ibid_navs` VALUES ('47', '商品收藏', '', '', 'admin', 'goods_collections', 'index', '', '0', '43', '0', '1', '1', '2017-12-16 10:40:28', '2017-12-16 10:40:28');
INSERT INTO `ibid_navs` VALUES ('48', '订单管理', '', 'icon-icon_order', 'admin', 'orders', 'index', '', '650', '0', '0', '1', '1', '2017-12-16 10:45:06', '2018-02-25 23:19:03');
INSERT INTO `ibid_navs` VALUES ('49', '订单列表', '', '', 'admin', 'orders', 'index', '', '90', '48', '0', '1', '1', '2017-12-16 10:47:03', '2017-12-29 23:09:05');
INSERT INTO `ibid_navs` VALUES ('70', '管理员登录日志', '', '', 'admin', 'visit_logs', 'admin', '', '19', '22', '0', '1', '1', '2017-12-20 21:21:54', '2017-12-20 21:21:54');
INSERT INTO `ibid_navs` VALUES ('116', '资产变动记录', '', '', 'admin', 'user_asset_logs', 'index', '', '0', '114', '0', '1', '1', '2018-04-11 18:02:58', '2018-04-11 18:02:58');
INSERT INTO `ibid_navs` VALUES ('117', '会员积分记录', '', '', 'admin', 'score_logs', 'index', '', '0', '114', '0', '1', '1', '2018-04-11 20:36:36', '2018-04-11 20:36:36');
INSERT INTO `ibid_navs` VALUES ('118', '会员提现记录', '', '', 'admin', 'user_drawcashs', 'index', '', '0', '114', '0', '1', '1', '2018-04-11 20:40:19', '2018-04-11 20:40:19');
INSERT INTO `ibid_navs` VALUES ('75', '会员地址管理', '', '', 'admin', 'addresses', 'index', '', '0', '1', '0', '1', '1', '2017-12-29 22:57:42', '2017-12-29 22:57:42');
INSERT INTO `ibid_navs` VALUES ('76', '发货管理', '', '', 'admin', 'deliver', 'index', '', '80', '48', '0', '1', '1', '2017-12-29 23:08:50', '2017-12-29 23:08:50');
INSERT INTO `ibid_navs` VALUES ('77', '退货管理', '', '', 'admin', 'return_goods', 'index', '', '70', '48', '0', '1', '1', '2017-12-29 23:10:22', '2017-12-29 23:10:22');
INSERT INTO `ibid_navs` VALUES ('78', '物流查询', '', '', 'admin', 'transport', 'index', '', '60', '48', '0', '1', '1', '2017-12-29 23:11:39', '2017-12-29 23:11:39');
INSERT INTO `ibid_navs` VALUES ('81', '分销管理', '', '', '', '', '', '', '500', '0', '0', '2', '0', '2017-12-27 10:49:50', '2018-04-18 16:16:07');
INSERT INTO `ibid_navs` VALUES ('82', '分销商等级', '', '', 'admin', 'commission_levels', 'index', '', '0', '81', '0', '1', '1', '2017-12-27 10:52:40', '2017-12-27 10:52:53');
INSERT INTO `ibid_navs` VALUES ('83', '分销参数配置', '', '', 'admin', 'commission_systems', 'index', '', '0', '81', '0', '1', '1', '2017-12-27 14:11:33', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('119', '会员充值记录', '', '', 'admin', 'user_recharges', 'index', '', '0', '114', '0', '1', '1', '2018-04-11 20:40:44', '2018-04-11 20:40:44');
INSERT INTO `ibid_navs` VALUES ('86', '佣金提现', '', '', 'admin', 'commission_applys', 'index', '', '0', '81', '0', '1', '1', '2018-01-08 22:49:59', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('90', '签收管理', '', '', 'admin', 'sign_for', 'index', '', '0', '48', '0', '1', '1', '2018-02-08 10:52:34', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('91', '基础设置', '', 'icon-shezhi1', 'admin', 'basics', 'index', '', '999', '0', '1', '1', '1', '2018-02-08 17:10:08', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('92', '留言建议', '', 'icon-xinfeng2', 'admin', 'feedbacks', 'index', '', '980', '0', '1', '1', '1', '2018-02-08 17:10:45', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('93', '指导手册', '', 'icon-yewushouce', 'admin', 'guides', 'index', '', '970', '0', '1', '1', '1', '2018-02-08 17:12:07', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('94', '统计板', '', '', 'admin', 'data', 'index', '', '10', '36', '0', '1', '1', '2018-02-23 08:44:28', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('128', '会员通知', '', '', 'admin', 'notices', 'index', '', '0', '1', '0', '1', '1', '2018-04-14 14:15:25', '2018-04-14 14:15:25');
INSERT INTO `ibid_navs` VALUES ('129', '会员优惠券', '', '', 'admin', 'user_coupons', 'index', '', '0', '1', '0', '1', '1', '2018-04-14 20:33:56', '2018-04-14 20:33:56');
INSERT INTO `ibid_navs` VALUES ('100', '商品规格模板', '', '', 'admin', 'spec_templates', 'index', '', '0', '43', '0', '1', '1', '2018-02-23 20:28:11', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('101', '商品属性模板', '', '', 'admin', 'attr_templates', 'index', '', '0', '43', '0', '1', '1', '2018-02-25 11:24:53', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('102', '商品运费模板', '', '', 'admin', 'transport_templates', 'index', '', '0', '43', '0', '1', '1', '2018-02-27 22:57:21', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('103', '七牛云存储', '', '', 'admin', 'qiniu', 'index', '', '10', '22', '0', '1', '1', '2018-03-08 13:50:09', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('104', '数据库备份与恢复', '', '', 'admin', 'databackup', 'index', '', '0', '22', '0', '1', '1', '2018-03-09 09:34:19', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('105', '邮件系统', '', '', 'admin', 'email', 'index', '', '8', '22', '0', '1', '1', '2018-03-10 09:58:06', '2018-04-02 14:11:44');
INSERT INTO `ibid_navs` VALUES ('121', '营销管理', '', 'icon-youhuiquan', 'admin', 'market_activeties', 'index', '', '550', '0', '0', '1', '1', '2018-04-12 17:52:37', '2018-04-12 17:52:37');
INSERT INTO `ibid_navs` VALUES ('122', '活动管理', '', '', 'admin', 'market_activities', 'index', '', '0', '121', '0', '1', '1', '2018-04-12 17:55:09', '2018-04-12 17:55:09');
INSERT INTO `ibid_navs` VALUES ('124', '优惠券管理', '', '', 'admin', 'coupons', 'index', '', '0', '121', '0', '1', '1', '2018-04-13 11:45:26', '2018-04-13 11:45:26');
INSERT INTO `ibid_navs` VALUES ('125', '满减活动', '', '', 'admin', 'full_rules', 'index', '', '0', '121', '0', '1', '1', '2018-04-13 14:14:19', '2018-04-13 14:14:19');
INSERT INTO `ibid_navs` VALUES ('126', '会员等级设置', '', '', 'admin', 'user_levels', 'index', '', '0', '22', '0', '1', '1', '2018-04-13 15:06:15', '2018-04-13 15:06:15');
INSERT INTO `ibid_navs` VALUES ('127', '限时折扣', '', '', 'admin', 'discount_rules', 'index', '', '0', '121', '0', '1', '1', '2018-04-13 15:24:17', '2018-04-13 15:24:17');
INSERT INTO `ibid_navs` VALUES ('130', '电子面单', '', '', 'admin', 'eorder', 'index', '', '0', '48', '0', '1', '1', '2018-04-19 10:42:50', '2018-04-19 10:42:50');

-- -----------------------------
-- Table structure for `ibid_notices`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_notices`;
CREATE TABLE `ibid_notices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `title` varchar(255) NOT NULL COMMENT '消息标题',
  `intro` text COMMENT '消息简介',
  `content` text COMMENT '消息详情',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1显示2隐藏',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ibid_order_goods`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_order_goods`;
CREATE TABLE `ibid_order_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `name` varchar(255) DEFAULT NULL,
  `thum` varchar(255) DEFAULT NULL,
  `intro` text COMMENT '商品简介',
  `standard` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `spec_group_id` bigint(20) DEFAULT '0' COMMENT '商品规格的组合ID',
  `spec_group_info` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `real_price` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品的重量',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '0未评论1已评论',
  `return_goods_status` tinyint(1) DEFAULT '0' COMMENT '退货状态：0未申请退货1申请退货2拒绝退货3已退货',
  `is_return_goods` tinyint(1) DEFAULT '0' COMMENT '是否退货：0否1是',
  `is_return_money` tinyint(1) DEFAULT '0' COMMENT '是否退款：0未退款1已退款',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_order_goods`
-- -----------------------------
INSERT INTO `ibid_order_goods` VALUES ('1', '1', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:43:47', '2018-04-20 11:43:47');
INSERT INTO `ibid_order_goods` VALUES ('2', '2', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:43:50', '2018-04-20 11:43:50');
INSERT INTO `ibid_order_goods` VALUES ('3', '3', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '180', '深蓝_33（180/86A）', '298.00', '', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:44:49', '2018-04-20 11:44:49');
INSERT INTO `ibid_order_goods` VALUES ('4', '4', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '793.80', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:45:42', '2018-04-20 11:45:42');
INSERT INTO `ibid_order_goods` VALUES ('5', '5', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:47:08', '2018-04-20 11:47:09');
INSERT INTO `ibid_order_goods` VALUES ('6', '5', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '156.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:47:08', '2018-04-20 11:47:09');
INSERT INTO `ibid_order_goods` VALUES ('7', '5', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '185', '中蓝_35（185/90A）', '268.00', '268.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:47:08', '2018-04-20 11:47:09');
INSERT INTO `ibid_order_goods` VALUES ('8', '6', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '793.80', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:48:03', '2018-04-20 11:48:03');
INSERT INTO `ibid_order_goods` VALUES ('9', '7', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '793.80', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:52:23', '2018-04-20 11:52:23');
INSERT INTO `ibid_order_goods` VALUES ('10', '8', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '20.00', '0.00', '1', '0', '1', '0', '0', '1', '2018-04-20 11:54:10', '2018-04-20 13:54:54');
INSERT INTO `ibid_order_goods` VALUES ('11', '9', '35', '', '女式蝴蝶结衬衫', '/public/upload/images/1524125986376.jpg', '优雅也不失浪漫少女梦', '', '131', '白色_M', '120.00', '120.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:58:49', '2018-04-20 11:58:49');
INSERT INTO `ibid_order_goods` VALUES ('12', '9', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '156.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:58:49', '2018-04-20 11:58:49');
INSERT INTO `ibid_order_goods` VALUES ('13', '9', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '278.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-20 11:58:49', '2018-04-20 11:58:49');
INSERT INTO `ibid_order_goods` VALUES ('14', '10', '35', '', '女式蝴蝶结衬衫', '/public/upload/images/1524125986376.jpg', '优雅也不失浪漫少女梦', '', '131', '白色_M', '120.00', '109.17', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 12:00:13', '2018-04-20 12:00:13');
INSERT INTO `ibid_order_goods` VALUES ('15', '10', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '141.92', '0.00', '1', '0', '1', '0', '0', '1', '2018-04-20 12:00:13', '2018-04-20 13:54:10');
INSERT INTO `ibid_order_goods` VALUES ('16', '10', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '252.91', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-20 12:00:13', '2018-04-20 12:00:13');
INSERT INTO `ibid_order_goods` VALUES ('17', '11', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '180', '深蓝_33（180/86A）', '298.00', '298.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-20 13:50:24', '2018-04-20 13:50:24');
INSERT INTO `ibid_order_goods` VALUES ('18', '12', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '103.50', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 13:51:01', '2018-04-20 13:51:01');
INSERT INTO `ibid_order_goods` VALUES ('19', '12', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '128.14', '0.00', '1', '0', '3', '1', '0', '1', '2018-04-20 13:51:01', '2018-04-21 10:38:28');
INSERT INTO `ibid_order_goods` VALUES ('20', '12', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '228.36', '10.00', '1', '0', '3', '1', '1', '1', '2018-04-20 13:51:01', '2018-04-21 09:12:59');
INSERT INTO `ibid_order_goods` VALUES ('21', '13', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '147', '牛仔蓝_XL', '156.00', '156.00', '0.00', '1', '0', '3', '1', '1', '1', '2018-04-20 14:21:53', '2018-04-23 10:52:09');
INSERT INTO `ibid_order_goods` VALUES ('22', '14', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '258.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-20 15:05:50', '2018-04-20 15:05:50');
INSERT INTO `ibid_order_goods` VALUES ('23', '15', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 15:11:15', '2018-04-20 15:11:15');
INSERT INTO `ibid_order_goods` VALUES ('24', '16', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 16:23:08', '2018-04-20 16:23:08');
INSERT INTO `ibid_order_goods` VALUES ('25', '17', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 16:41:40', '2018-04-20 16:41:40');
INSERT INTO `ibid_order_goods` VALUES ('26', '18', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-20 17:23:01', '2018-04-20 17:23:01');
INSERT INTO `ibid_order_goods` VALUES ('27', '19', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-21 09:16:39', '2018-04-21 09:16:39');
INSERT INTO `ibid_order_goods` VALUES ('28', '19', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '0', '', '156.00', '156.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-21 09:16:39', '2018-04-21 09:16:39');
INSERT INTO `ibid_order_goods` VALUES ('29', '19', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '183', '中蓝_34（185/88A）', '278.00', '278.00', '10.00', '1', '0', '1', '0', '0', '1', '2018-04-21 09:16:39', '2018-04-21 09:33:55');
INSERT INTO `ibid_order_goods` VALUES ('30', '20', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '20.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-21 10:02:11', '2018-04-21 10:02:11');
INSERT INTO `ibid_order_goods` VALUES ('31', '21', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '209.19', '10.00', '1', '0', '3', '1', '1', '1', '2018-04-21 10:29:50', '2018-04-21 10:34:14');
INSERT INTO `ibid_order_goods` VALUES ('32', '21', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '94.81', '0.00', '1', '0', '3', '1', '1', '1', '2018-04-21 10:29:50', '2018-04-21 10:33:42');
INSERT INTO `ibid_order_goods` VALUES ('33', '22', '36', '', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '135', '白色_M', '259.00', '240.04', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-21 10:35:55', '2018-04-21 10:40:07');
INSERT INTO `ibid_order_goods` VALUES ('34', '22', '37', '', '男式经典牛津纺衬衫', '/public/upload/images/1524126388465.jpg', '舒适有风度 感受一气呵成的经典', '', '141', '白色_L', '268.00', '248.38', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-21 10:35:55', '2018-04-21 10:40:00');
INSERT INTO `ibid_order_goods` VALUES ('35', '22', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '144.58', '0.00', '1', '1', '3', '1', '0', '1', '2018-04-21 10:35:55', '2018-04-21 10:39:49');
INSERT INTO `ibid_order_goods` VALUES ('36', '23', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '1', '3', '1', '1', '1', '2018-04-21 10:57:51', '2018-04-21 16:10:39');
INSERT INTO `ibid_order_goods` VALUES ('37', '23', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '1', '3', '1', '1', '1', '2018-04-21 10:57:51', '2018-04-21 11:52:56');
INSERT INTO `ibid_order_goods` VALUES ('38', '24', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-21 11:55:35', '2018-04-21 14:16:15');
INSERT INTO `ibid_order_goods` VALUES ('39', '25', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-21 14:38:03', '2018-04-21 23:40:26');
INSERT INTO `ibid_order_goods` VALUES ('40', '26', '24', '', '挚爱纽约牛皮水桶包', '/public/upload/images/1524122891438.jpg', '大牌品质，仅售供应商建议价的1/5', '', '0', '', '223.00', '223.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-21 16:50:40', '2018-04-21 16:50:40');
INSERT INTO `ibid_order_goods` VALUES ('41', '27', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '184', '深蓝_35（185/90A）', '268.00', '268.00', '10.00', '1', '1', '0', '0', '0', '1', '2018-04-21 17:59:24', '2018-04-23 10:21:11');
INSERT INTO `ibid_order_goods` VALUES ('42', '28', '35', '', '女式蝴蝶结衬衫', '/public/upload/images/1524125986376.jpg', '优雅也不失浪漫少女梦', '', '131', '白色_M', '120.00', '480.00', '0.00', '4', '0', '0', '0', '0', '1', '2018-04-21 18:02:21', '2018-04-21 18:02:21');
INSERT INTO `ibid_order_goods` VALUES ('43', '28', '13', '', '仕趣系列 储物床', '/public/upload/images/1524121445257.jpg', '气箱储物 软包靠背', '', '0', '', '6899.00', '6899.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-21 18:02:21', '2018-04-21 18:02:21');
INSERT INTO `ibid_order_goods` VALUES ('44', '29', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-21 18:07:02', '2018-04-21 18:07:02');
INSERT INTO `ibid_order_goods` VALUES ('45', '30', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-21 18:07:38', '2018-04-21 18:07:38');
INSERT INTO `ibid_order_goods` VALUES ('46', '31', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '1112.00', '10.00', '4', '1', '0', '0', '0', '1', '2018-04-21 21:01:42', '2018-04-23 22:34:10');
INSERT INTO `ibid_order_goods` VALUES ('47', '32', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '20.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-22 17:54:21', '2018-04-22 17:54:21');
INSERT INTO `ibid_order_goods` VALUES ('48', '33', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '278.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-22 17:54:36', '2018-04-22 17:54:36');
INSERT INTO `ibid_order_goods` VALUES ('49', '34', '34', '', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '125', '藏青色_L', '120.00', '120.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-22 17:54:51', '2018-04-22 17:54:51');
INSERT INTO `ibid_order_goods` VALUES ('50', '35', '34', '', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '125', '藏青色_L', '120.00', '120.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-22 17:56:07', '2018-04-23 22:34:26');
INSERT INTO `ibid_order_goods` VALUES ('51', '36', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-22 21:47:12', '2018-04-22 22:49:03');
INSERT INTO `ibid_order_goods` VALUES ('52', '37', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-22 23:01:02', '2018-04-22 23:03:00');
INSERT INTO `ibid_order_goods` VALUES ('53', '38', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-22 23:05:38', '2018-04-22 23:05:38');
INSERT INTO `ibid_order_goods` VALUES ('54', '38', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-22 23:05:38', '2018-04-22 23:05:38');
INSERT INTO `ibid_order_goods` VALUES ('55', '39', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-23 09:42:22', '2018-04-23 18:12:25');
INSERT INTO `ibid_order_goods` VALUES ('56', '40', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-23 10:23:43', '2018-04-23 10:24:28');
INSERT INTO `ibid_order_goods` VALUES ('57', '40', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '3', '1', '0', '0', '0', '1', '2018-04-23 10:23:43', '2018-04-23 10:24:22');
INSERT INTO `ibid_order_goods` VALUES ('58', '41', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '3', '1', '1', '1', '2018-04-23 15:09:05', '2018-04-23 15:21:29');
INSERT INTO `ibid_order_goods` VALUES ('59', '41', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '3', '1', '1', '1', '2018-04-23 15:09:05', '2018-04-23 15:18:26');
INSERT INTO `ibid_order_goods` VALUES ('60', '42', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '106.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-23 15:25:23', '2018-04-23 18:09:35');
INSERT INTO `ibid_order_goods` VALUES ('61', '43', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '106.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-23 15:25:35', '2018-04-23 18:10:40');
INSERT INTO `ibid_order_goods` VALUES ('62', '44', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '106.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-23 15:25:40', '2018-04-23 18:11:05');
INSERT INTO `ibid_order_goods` VALUES ('63', '45', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '106.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-23 15:26:51', '2018-04-24 13:52:38');
INSERT INTO `ibid_order_goods` VALUES ('64', '46', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '106.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 15:31:02', '2018-04-23 15:31:02');
INSERT INTO `ibid_order_goods` VALUES ('65', '47', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '176', '深蓝_31（175/82A）', '258.00', '258.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-23 15:41:46', '2018-04-23 15:41:46');
INSERT INTO `ibid_order_goods` VALUES ('66', '48', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '76.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 15:45:33', '2018-04-23 15:45:33');
INSERT INTO `ibid_order_goods` VALUES ('67', '49', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '76.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 15:45:49', '2018-04-23 15:45:49');
INSERT INTO `ibid_order_goods` VALUES ('68', '50', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '20.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-23 15:46:27', '2018-04-23 15:46:27');
INSERT INTO `ibid_order_goods` VALUES ('69', '51', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '63.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-23 15:50:54', '2018-04-24 13:52:53');
INSERT INTO `ibid_order_goods` VALUES ('70', '52', '7', '', '趣味萌宠定制款四件套', '', '狗年定制款，高支高密棉', '', '199', '蓝色_1.8m', '200.00', '', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 16:01:52', '2018-04-23 16:01:52');
INSERT INTO `ibid_order_goods` VALUES ('71', '53', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '3', '1', '1', '1', '2018-04-23 16:05:03', '2018-04-23 16:05:40');
INSERT INTO `ibid_order_goods` VALUES ('72', '54', '7', '', '趣味萌宠定制款四件套', '/public/upload/images/1524118483508.jpg', '狗年定制款，高支高密棉', '', '199', '蓝色_1.8m', '200.00', '200.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 16:11:53', '2018-04-23 16:11:53');
INSERT INTO `ibid_order_goods` VALUES ('73', '55', '7', '', '趣味萌宠定制款四件套', '/public/upload/images/1524118483508.jpg', '狗年定制款，高支高密棉', '', '199', '蓝色_1.8m', '200.00', '200.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 16:12:11', '2018-04-23 16:12:11');
INSERT INTO `ibid_order_goods` VALUES ('74', '56', '7', '', '趣味萌宠定制款四件套', '/public/upload/images/1524118483508.jpg', '狗年定制款，高支高密棉', '', '199', '蓝色_1.8m', '200.00', '200.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 16:12:29', '2018-04-23 16:12:29');
INSERT INTO `ibid_order_goods` VALUES ('75', '57', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '185', '中蓝_35（185/90A）', '268.00', '268.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-23 17:17:19', '2018-04-23 17:17:19');
INSERT INTO `ibid_order_goods` VALUES ('76', '58', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '213.94', '10.00', '1', '1', '0', '0', '0', '1', '2018-04-23 17:22:24', '2018-04-24 13:52:09');
INSERT INTO `ibid_order_goods` VALUES ('77', '58', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '120.06', '0.00', '1', '0', '3', '1', '1', '1', '2018-04-23 17:22:24', '2018-04-24 10:53:30');
INSERT INTO `ibid_order_goods` VALUES ('78', '59', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 17:47:55', '2018-04-23 17:47:55');
INSERT INTO `ibid_order_goods` VALUES ('79', '60', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 17:48:26', '2018-04-23 17:48:26');
INSERT INTO `ibid_order_goods` VALUES ('80', '61', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '156.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:36:48', '2018-04-23 20:36:48');
INSERT INTO `ibid_order_goods` VALUES ('81', '62', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:43:14', '2018-04-23 20:43:14');
INSERT INTO `ibid_order_goods` VALUES ('82', '63', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:43:51', '2018-04-23 20:43:51');
INSERT INTO `ibid_order_goods` VALUES ('83', '64', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:46:21', '2018-04-23 20:46:21');
INSERT INTO `ibid_order_goods` VALUES ('84', '65', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:50:50', '2018-04-23 20:50:50');
INSERT INTO `ibid_order_goods` VALUES ('85', '66', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:52:57', '2018-04-23 20:52:57');
INSERT INTO `ibid_order_goods` VALUES ('86', '67', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:53:06', '2018-04-23 20:53:06');
INSERT INTO `ibid_order_goods` VALUES ('87', '68', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:53:59', '2018-04-23 20:53:59');
INSERT INTO `ibid_order_goods` VALUES ('88', '69', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:54:31', '2018-04-23 20:54:31');
INSERT INTO `ibid_order_goods` VALUES ('89', '70', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:56:09', '2018-04-23 20:56:09');
INSERT INTO `ibid_order_goods` VALUES ('90', '71', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:57:51', '2018-04-23 20:57:51');
INSERT INTO `ibid_order_goods` VALUES ('91', '72', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 20:58:12', '2018-04-23 20:58:12');
INSERT INTO `ibid_order_goods` VALUES ('92', '73', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:00:01', '2018-04-23 21:00:01');
INSERT INTO `ibid_order_goods` VALUES ('93', '74', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:00:32', '2018-04-23 21:00:32');
INSERT INTO `ibid_order_goods` VALUES ('94', '75', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:07:17', '2018-04-23 21:07:17');
INSERT INTO `ibid_order_goods` VALUES ('95', '76', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:07:30', '2018-04-23 21:07:30');
INSERT INTO `ibid_order_goods` VALUES ('96', '77', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:08:20', '2018-04-23 21:08:20');
INSERT INTO `ibid_order_goods` VALUES ('97', '78', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:08:56', '2018-04-23 21:08:56');
INSERT INTO `ibid_order_goods` VALUES ('98', '79', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:17:49', '2018-04-23 21:17:49');
INSERT INTO `ibid_order_goods` VALUES ('99', '80', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:18:20', '2018-04-23 21:18:20');
INSERT INTO `ibid_order_goods` VALUES ('100', '81', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:18:20', '2018-04-23 21:18:20');
INSERT INTO `ibid_order_goods` VALUES ('101', '82', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '278.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:24:13', '2018-04-23 21:24:13');
INSERT INTO `ibid_order_goods` VALUES ('102', '83', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:26:44', '2018-04-23 21:26:44');
INSERT INTO `ibid_order_goods` VALUES ('103', '84', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:27:15', '2018-04-23 21:27:15');
INSERT INTO `ibid_order_goods` VALUES ('104', '85', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:37:53', '2018-04-23 21:37:53');
INSERT INTO `ibid_order_goods` VALUES ('105', '86', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:39:15', '2018-04-23 21:39:15');
INSERT INTO `ibid_order_goods` VALUES ('106', '87', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:39:27', '2018-04-23 21:39:27');
INSERT INTO `ibid_order_goods` VALUES ('107', '88', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:39:43', '2018-04-23 21:39:43');
INSERT INTO `ibid_order_goods` VALUES ('108', '89', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 21:40:31', '2018-04-23 21:40:31');
INSERT INTO `ibid_order_goods` VALUES ('109', '90', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '278.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-23 22:30:45', '2018-04-23 22:30:45');
INSERT INTO `ibid_order_goods` VALUES ('110', '90', '33', '', '男式无缝休闲运动T恤', '/public/upload/images/1524125128744.jpg', 'Adidas制造商，快干透气网结构', '', '87', '绿色_L(170-180)', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 22:30:45', '2018-04-23 22:30:45');
INSERT INTO `ibid_order_goods` VALUES ('111', '91', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 22:39:59', '2018-04-23 22:39:59');
INSERT INTO `ibid_order_goods` VALUES ('112', '92', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-23 22:43:22', '2018-04-24 14:08:35');
INSERT INTO `ibid_order_goods` VALUES ('113', '93', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-23 23:00:32', '2018-04-23 23:00:32');
INSERT INTO `ibid_order_goods` VALUES ('114', '94', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '468.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-04-24 00:01:35', '2018-04-24 00:01:35');
INSERT INTO `ibid_order_goods` VALUES ('115', '95', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '468.00', '0.00', '3', '0', '0', '0', '0', '1', '2018-04-24 10:20:11', '2018-04-24 10:20:11');
INSERT INTO `ibid_order_goods` VALUES ('116', '96', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '278.00', '10.00', '1', '0', '3', '1', '1', '1', '2018-04-24 10:27:55', '2018-04-24 10:28:40');
INSERT INTO `ibid_order_goods` VALUES ('117', '97', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '185', '中蓝_35（185/90A）', '268.00', '268.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-24 10:29:57', '2018-04-24 10:29:57');
INSERT INTO `ibid_order_goods` VALUES ('118', '98', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 10:31:12', '2018-04-24 10:31:12');
INSERT INTO `ibid_order_goods` VALUES ('119', '99', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 10:31:59', '2018-04-24 10:31:59');
INSERT INTO `ibid_order_goods` VALUES ('120', '100', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 10:32:19', '2018-04-24 10:32:19');
INSERT INTO `ibid_order_goods` VALUES ('121', '101', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 10:33:51', '2018-04-24 10:33:51');
INSERT INTO `ibid_order_goods` VALUES ('122', '102', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 10:34:14', '2018-04-24 10:34:14');
INSERT INTO `ibid_order_goods` VALUES ('123', '103', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '3', '1', '1', '1', '2018-04-24 10:36:54', '2018-04-24 10:37:52');
INSERT INTO `ibid_order_goods` VALUES ('124', '104', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '3', '1', '1', '1', '2018-04-24 10:38:27', '2018-04-24 10:39:09');
INSERT INTO `ibid_order_goods` VALUES ('125', '105', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '156.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 13:41:41', '2018-04-24 13:41:41');
INSERT INTO `ibid_order_goods` VALUES ('126', '106', '36', '', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '135', '白色_M', '259.00', '259.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 13:42:04', '2018-04-24 13:42:04');
INSERT INTO `ibid_order_goods` VALUES ('127', '107', '34', '', '男式丝光棉轻商务须边领T恤', '/public/upload/images/1524125640237.jpg', '含蓄个性的须边风雅', '', '125', '藏青色_L', '120.00', '120.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 13:42:35', '2018-04-24 13:42:35');
INSERT INTO `ibid_order_goods` VALUES ('128', '108', '33', '', '男式无缝休闲运动T恤', '/public/upload/images/1524125128744.jpg', 'Adidas制造商，快干透气网结构', '', '80', '灰色_XL(180-190)', '146.00', '146.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 13:42:45', '2018-04-24 13:42:45');
INSERT INTO `ibid_order_goods` VALUES ('129', '109', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '0', '', '156.00', '156.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 13:43:29', '2018-04-24 13:43:29');
INSERT INTO `ibid_order_goods` VALUES ('130', '110', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '278.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-24 13:43:56', '2018-04-24 13:43:56');
INSERT INTO `ibid_order_goods` VALUES ('131', '111', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 13:59:01', '2018-04-24 13:59:01');
INSERT INTO `ibid_order_goods` VALUES ('132', '112', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:12:43', '2018-04-24 14:12:43');
INSERT INTO `ibid_order_goods` VALUES ('133', '113', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:14:53', '2018-04-24 14:14:53');
INSERT INTO `ibid_order_goods` VALUES ('134', '114', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '3', '1', '1', '1', '2018-04-24 14:15:21', '2018-04-24 14:17:15');
INSERT INTO `ibid_order_goods` VALUES ('135', '115', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:16:02', '2018-04-24 14:16:02');
INSERT INTO `ibid_order_goods` VALUES ('136', '116', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:17:39', '2018-04-24 14:17:39');
INSERT INTO `ibid_order_goods` VALUES ('137', '117', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:17:55', '2018-04-24 14:17:55');
INSERT INTO `ibid_order_goods` VALUES ('138', '118', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:18:29', '2018-04-24 14:18:29');
INSERT INTO `ibid_order_goods` VALUES ('139', '119', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:19:05', '2018-04-24 14:19:05');
INSERT INTO `ibid_order_goods` VALUES ('140', '120', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:19:22', '2018-04-24 14:19:22');
INSERT INTO `ibid_order_goods` VALUES ('141', '121', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:19:42', '2018-04-24 14:19:42');
INSERT INTO `ibid_order_goods` VALUES ('142', '122', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:19:50', '2018-04-24 14:19:50');
INSERT INTO `ibid_order_goods` VALUES ('143', '123', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:20:56', '2018-04-24 14:20:56');
INSERT INTO `ibid_order_goods` VALUES ('144', '124', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:21:13', '2018-04-24 14:21:13');
INSERT INTO `ibid_order_goods` VALUES ('145', '125', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:21:46', '2018-04-24 14:21:46');
INSERT INTO `ibid_order_goods` VALUES ('146', '126', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:22:01', '2018-04-24 14:22:01');
INSERT INTO `ibid_order_goods` VALUES ('147', '127', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:22:42', '2018-04-24 14:22:42');
INSERT INTO `ibid_order_goods` VALUES ('148', '128', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:23:26', '2018-04-24 14:23:26');
INSERT INTO `ibid_order_goods` VALUES ('149', '129', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:24:26', '2018-04-24 14:24:26');
INSERT INTO `ibid_order_goods` VALUES ('150', '130', '42', '', '鸭子', '/public/upload/images/1524279252200.jpg', '鸭子', '', '0', '', '0.01', '0.01', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:24:50', '2018-04-24 14:24:50');
INSERT INTO `ibid_order_goods` VALUES ('151', '131', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '145', '牛仔蓝_M', '156.00', '156.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:36:40', '2018-04-24 14:36:40');
INSERT INTO `ibid_order_goods` VALUES ('152', '132', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 14:55:20', '2018-04-24 14:55:21');
INSERT INTO `ibid_order_goods` VALUES ('153', '133', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '185', '中蓝_35（185/90A）', '268.00', '268.00', '10.00', '1', '1', '0', '0', '0', '1', '2018-04-24 14:56:08', '2018-04-24 14:57:12');
INSERT INTO `ibid_order_goods` VALUES ('154', '133', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '3', '1', '0', '1', '2018-04-24 14:56:08', '2018-04-24 14:57:38');
INSERT INTO `ibid_order_goods` VALUES ('155', '134', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-24 15:00:47', '2018-04-24 17:42:12');
INSERT INTO `ibid_order_goods` VALUES ('156', '134', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '147', '牛仔蓝_XL', '156.00', '156.00', '0.00', '1', '0', '1', '0', '0', '1', '2018-04-24 15:00:47', '2018-04-24 15:03:32');
INSERT INTO `ibid_order_goods` VALUES ('157', '135', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '0', '', '126.00', '63.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 15:50:57', '2018-04-24 15:50:57');
INSERT INTO `ibid_order_goods` VALUES ('158', '136', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '182', '深蓝_34（185/88A）', '278.00', '20.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-24 15:52:43', '2018-04-24 15:52:43');
INSERT INTO `ibid_order_goods` VALUES ('159', '137', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.02', '0.00', '2', '0', '0', '0', '0', '1', '2018-04-24 16:12:12', '2018-04-24 16:12:12');
INSERT INTO `ibid_order_goods` VALUES ('160', '138', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '223', '中蓝_31（175/82A）', '258.00', '185.00', '10.00', '5', '0', '0', '0', '0', '1', '2018-04-24 17:12:14', '2018-04-24 17:12:14');
INSERT INTO `ibid_order_goods` VALUES ('161', '139', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '228', '深蓝_34（185/88A）', '278.00', '1390.00', '10.00', '5', '0', '0', '0', '0', '1', '2018-04-24 17:13:16', '2018-04-24 17:13:16');
INSERT INTO `ibid_order_goods` VALUES ('162', '140', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '228', '深蓝_34（185/88A）', '278.00', '690.00', '10.00', '5', '0', '0', '0', '0', '1', '2018-04-24 17:13:57', '2018-04-24 17:13:57');
INSERT INTO `ibid_order_goods` VALUES ('163', '141', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '228', '深蓝_34（185/88A）', '278.00', '2780.00', '10.00', '10', '0', '0', '0', '0', '1', '2018-04-24 17:24:30', '2018-04-24 17:24:30');
INSERT INTO `ibid_order_goods` VALUES ('164', '142', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '231', '中蓝_35（185/90A）', '268.00', '1340.00', '10.00', '5', '0', '0', '0', '0', '1', '2018-04-24 17:30:05', '2018-04-24 17:30:05');
INSERT INTO `ibid_order_goods` VALUES ('165', '143', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '147', '牛仔蓝_XL', '156.00', '156.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 17:44:22', '2018-04-24 17:44:22');
INSERT INTO `ibid_order_goods` VALUES ('166', '144', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '156.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 18:08:28', '2018-04-24 18:08:28');
INSERT INTO `ibid_order_goods` VALUES ('167', '145', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '-5.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 21:35:52', '2018-04-24 21:35:52');
INSERT INTO `ibid_order_goods` VALUES ('168', '146', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '58.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-24 21:36:04', '2018-04-24 21:36:04');
INSERT INTO `ibid_order_goods` VALUES ('169', '147', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '223', '中蓝_31（175/82A）', '258.00', '258.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-24 21:44:18', '2018-04-24 21:44:18');
INSERT INTO `ibid_order_goods` VALUES ('170', '148', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '230', '深蓝_35（185/90A）', '268.00', '268.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-24 22:20:43', '2018-04-24 22:20:43');
INSERT INTO `ibid_order_goods` VALUES ('171', '149', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '230', '深蓝_35（185/90A）', '268.00', '268.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-24 22:22:57', '2018-04-24 22:22:58');
INSERT INTO `ibid_order_goods` VALUES ('172', '150', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '230', '深蓝_35（185/90A）', '268.00', '129.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-24 22:23:16', '2018-04-24 22:23:16');
INSERT INTO `ibid_order_goods` VALUES ('173', '151', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '230', '深蓝_35（185/90A）', '268.00', '129.00', '10.00', '1', '0', '0', '0', '0', '1', '2018-04-24 22:23:24', '2018-04-24 22:23:24');
INSERT INTO `ibid_order_goods` VALUES ('174', '152', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '0', '0', '0', '1', '2018-04-25 08:24:26', '2018-04-25 08:24:26');
INSERT INTO `ibid_order_goods` VALUES ('175', '153', '36', '', '男式动感超弹衬衫', '/public/upload/images/1524126205949.jpg', '给你四面神奇的动感弹力，商务休闲两不误。', '', '135', '白色_M', '259.00', '259.00', '0.00', '1', '0', '3', '1', '0', '1', '2018-04-25 08:25:27', '2018-04-25 08:36:56');
INSERT INTO `ibid_order_goods` VALUES ('176', '153', '39', '', '男式弹力针织修身牛仔裤', '/public/upload/images/1524126803314.jpg', '男式弹力针织修身牛仔裤', '', '228', '深蓝_34（185/88A）', '278.00', '278.00', '10.00', '1', '0', '3', '1', '0', '1', '2018-04-25 08:25:27', '2018-04-25 08:37:01');
INSERT INTO `ibid_order_goods` VALUES ('177', '154', '35', '', '女式蝴蝶结衬衫', '/public/upload/images/1524125986376.jpg', '优雅也不失浪漫少女梦', '', '131', '白色_M', '120.00', '120.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-25 08:26:27', '2018-04-25 08:45:14');
INSERT INTO `ibid_order_goods` VALUES ('178', '154', '30', '', '羊猄皮复古粗跟女鞋', '/public/upload/images/1524124173844.jpg', '时尚小方头，体验不一样的风情', '', '63', '黑色_36码', '269.00', '269.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-25 08:26:27', '2018-04-25 08:45:06');
INSERT INTO `ibid_order_goods` VALUES ('179', '154', '33', '', '男式无缝休闲运动T恤', '/public/upload/images/1524125128744.jpg', 'Adidas制造商，快干透气网结构', '', '85', '红色_M(160-170)', '136.00', '136.00', '0.00', '1', '0', '1', '0', '0', '1', '2018-04-25 08:26:27', '2018-04-25 08:39:29');
INSERT INTO `ibid_order_goods` VALUES ('180', '155', '41', '', '熊', '/public/upload/images/1524279130633.jpg', '熊', '', '0', '', '0.01', '0.01', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-25 09:01:09', '2018-04-25 09:04:51');
INSERT INTO `ibid_order_goods` VALUES ('181', '155', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-25 09:01:09', '2018-04-25 09:04:59');
INSERT INTO `ibid_order_goods` VALUES ('182', '156', '38', '', '男式长绒棉牛仔衬衣', '/public/upload/images/1524126513569.jpg', '无可复制的自然感，舒适一整个季节', '', '146', '牛仔蓝_L', '156.00', '156.00', '0.00', '1', '1', '0', '0', '0', '1', '2018-04-25 09:07:25', '2018-04-25 09:10:20');
INSERT INTO `ibid_order_goods` VALUES ('183', '156', '40', '', '女式火山岩冬季保暖牛仔裤', '/public/upload/images/1524127059579.jpg', '高腰高挑高热量，火山岩热度不褪', '', '158', '深蓝_155/64A', '126.00', '126.00', '0.00', '1', '0', '1', '0', '0', '1', '2018-04-25 09:07:25', '2018-04-25 09:07:39');

-- -----------------------------
-- Table structure for `ibid_orders`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_orders`;
CREATE TABLE `ibid_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '会员ID',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `market_activity_type` varchar(20) DEFAULT '0' COMMENT '营销活动类别：full || discount || coupon',
  `market_activity_id` bigint(20) DEFAULT '0' COMMENT '营销活动ID',
  `market_reduce_money` decimal(10,2) DEFAULT '0.00' COMMENT '营销活动减少的金额',
  `goods_money` decimal(10,2) DEFAULT NULL COMMENT '商品的总价',
  `freight_money` decimal(10,2) DEFAULT NULL COMMENT '运费的总价',
  `total_money` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `mobile` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `consignee_name` varchar(100) DEFAULT NULL COMMENT '收货人',
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `memo` text COMMENT '订单备注',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '是否支付：0未支付1已支付',
  `pay_type` tinyint(1) DEFAULT NULL COMMENT '支付方式：1支付宝2微信3钱包',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `is_app_pay` tinyint(1) DEFAULT '0' COMMENT '是否是APP的支付：0否1是',
  `deliver_tip_num` bigint(20) DEFAULT '0' COMMENT '提醒发货的次数',
  `last_deliver_tip_time` datetime DEFAULT NULL COMMENT '最近一次的提醒发货时间',
  `deliver_time` datetime DEFAULT NULL COMMENT '发货时间',
  `transport_type` varchar(20) DEFAULT NULL,
  `express_type` varchar(255) DEFAULT NULL COMMENT '快递方式',
  `express_no` varchar(255) DEFAULT NULL COMMENT '快递编号',
  `confirm_receipt_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `cancel_reason` text COMMENT '订单取消原因',
  `cancel_time` datetime DEFAULT NULL COMMENT '订单的取消时间',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评价',
  `is_has_return_goods` tinyint(1) DEFAULT '0' COMMENT '是否还有退货中的商品：0没有1有',
  `is_all_return_goods` tinyint(1) DEFAULT '0' COMMENT '是否全部退货：0否1是',
  `status` tinyint(1) DEFAULT '1' COMMENT '订单状态：1待付款2已付款待发货3已发货待收货4已确认收货9已取消',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`,`order_no`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_orders`
-- -----------------------------
INSERT INTO `ibid_orders` VALUES ('1', '2', 'N2018042011434768206', 'discount', '1', '106.00', '126.00', '8.00', '28.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '2018-04-20 13:52:03', '0', '0', '', '9', '1', '2018-04-20 11:43:47', '2018-04-20 13:52:03');
INSERT INTO `ibid_orders` VALUES ('2', '2', 'N2018042011435096430', 'discount', '1', '106.00', '126.00', '8.00', '28.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '2018-04-20 13:51:54', '0', '0', '', '9', '1', '2018-04-20 11:43:50', '2018-04-20 13:51:54');
INSERT INTO `ibid_orders` VALUES ('3', '1', 'N2018042011444938368', 'discount', '2', '278.00', '298.00', '8.00', '28.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-20 11:44:49', '2018-04-20 11:44:49');
INSERT INTO `ibid_orders` VALUES ('4', '2', 'N2018042011454269059', 'discount', '1', '106.00', '126.00', '8.00', '28.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-20 11:45:47', '', '0', '', '2018-04-23 16:27:24', '0', 'yuantong', '21411111', '2018-04-23 16:27:45', '', '', '0', '0', '', '4', '1', '2018-04-20 11:45:42', '2018-04-23 16:27:45');
INSERT INTO `ibid_orders` VALUES ('5', '2', 'N2018042011470867806', '0', '0', '', '550.00', '8.00', '558.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-20 11:47:15', '', '0', '', '2018-04-23 16:27:12', '0', 'yunda', '1111111', '2018-04-23 16:27:51', '', '', '0', '0', '', '4', '1', '2018-04-20 11:47:08', '2018-04-23 16:27:51');
INSERT INTO `ibid_orders` VALUES ('6', '2', 'N2018042011480370172', 'discount', '1', '106.00', '126.00', '8.00', '28.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-20 11:48:15', '', '0', '', '2018-04-23 16:27:02', '0', 'tiantian', '11111111', '2018-04-23 16:27:54', '', '', '0', '0', '', '4', '1', '2018-04-20 11:48:03', '2018-04-23 16:27:54');
INSERT INTO `ibid_orders` VALUES ('7', '2', 'N2018042011522316883', 'discount', '1', '106.00', '126.00', '8.00', '28.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '2018-04-20 13:51:42', '0', '0', '', '9', '1', '2018-04-20 11:52:23', '2018-04-20 13:51:42');
INSERT INTO `ibid_orders` VALUES ('8', '2', 'N2018042011541031981', 'discount', '1', '106.00', '126.00', '8.00', '28.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-20 11:54:31', '', '0', '', '2018-04-23 16:26:36', '0', 'tiantian', '2222222222', '2018-04-23 16:28:02', '', '', '0', '1', '', '4', '1', '2018-04-20 11:54:10', '2018-04-23 16:28:02');
INSERT INTO `ibid_orders` VALUES ('9', '2', 'N2018042011584902171', '0', '0', '', '554.00', '8.00', '562.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-20 11:58:56', '', '0', '', '2018-04-23 16:26:54', '0', 'tiantian', '1111111111', '2018-04-23 16:27:57', '', '', '0', '0', '', '4', '1', '2018-04-20 11:58:49', '2018-04-23 16:27:57');
INSERT INTO `ibid_orders` VALUES ('10', '2', 'N2018042012001382980', 'full', '1', '50.00', '554.00', '8.00', '512.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-20 12:00:19', '', '0', '', '2018-04-23 16:26:45', '0', 'shentong', '111111', '2018-04-23 16:28:00', '', '', '0', '1', '', '4', '1', '2018-04-20 12:00:13', '2018-04-23 16:28:00');
INSERT INTO `ibid_orders` VALUES ('11', '13', 'N2018042013502420847', '0', '0', '', '298.00', '8.00', '306.00', '18390912268', 'Bbbb', '内蒙古自治区', '鄂尔多斯市', '康巴什区', '咯OK了', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-20 13:50:24', '2018-04-20 13:50:24');
INSERT INTO `ibid_orders` VALUES ('12', '2', 'N2018042013510125003', 'coupon', '7', '100.00', '560.00', '8.00', '468.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-20 13:51:08', '', '0', '', '2018-04-21 10:37:57', '0', 'EMS', '414141414141', '2018-04-21 10:38:55', '', '', '0', '1', '', '4', '1', '2018-04-20 13:51:01', '2018-04-21 10:38:55');
INSERT INTO `ibid_orders` VALUES ('13', '2', 'N2018042014215332189', '0', '0', '', '156.00', '8.00', '164.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-20 14:22:05', '', '0', '', '', '', '', '', '', '', '', '0', '1', '', '4', '1', '2018-04-20 14:21:53', '2018-04-23 10:52:05');
INSERT INTO `ibid_orders` VALUES ('14', '1', 'N2018042015055044973', 'coupon', '3', '20.00', '278.00', '8.00', '266.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '2018-04-21 09:58:00', '0', '0', '', '9', '1', '2018-04-20 15:05:50', '2018-04-21 09:58:00');
INSERT INTO `ibid_orders` VALUES ('15', '1', 'N2018042015111567375', '0', '0', '', '126.00', '8.00', '134.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '2018-04-21 09:57:56', '0', '0', '', '9', '1', '2018-04-20 15:11:15', '2018-04-21 09:57:56');
INSERT INTO `ibid_orders` VALUES ('16', '10', 'N2018042016230814544', '0', '0', '', '126.00', '8.00', '134.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-20 16:23:08', '2018-04-20 16:23:08');
INSERT INTO `ibid_orders` VALUES ('17', '10', 'N2018042016413902002', '0', '0', '', '126.00', '8.00', '134.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-20 16:41:39', '2018-04-20 16:41:40');
INSERT INTO `ibid_orders` VALUES ('18', '2', 'N2018042017230158378', '0', '0', '', '126.00', '8.00', '134.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '2018-04-20 17:25:29', '0', '0', '', '9', '1', '2018-04-20 17:23:01', '2018-04-20 17:25:29');
INSERT INTO `ibid_orders` VALUES ('19', '2', 'N2018042109163848164', '0', '0', '', '560.00', '8.00', '568.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-21 09:16:45', '', '0', '', '2018-04-21 10:31:40', '0', 'SF', '11213131321651', '2018-04-21 10:39:12', '', '', '0', '1', '', '4', '1', '2018-04-21 09:16:38', '2018-04-21 10:39:12');
INSERT INTO `ibid_orders` VALUES ('20', '2', 'N2018042110021104013', 'discount', '3', '136.00', '156.00', '8.00', '28.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '', '0', '', '', '', '', '', '', '', '2018-04-21 10:02:26', '0', '0', '', '9', '1', '2018-04-21 10:02:11', '2018-04-21 10:02:26');
INSERT INTO `ibid_orders` VALUES ('21', '1', 'N2018042110295053987', 'coupon', '17', '100.00', '404.00', '8.00', '312.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-21 10:30:04', '', '0', '', '2018-04-21 10:31:10', '0', 'SF', '1515151515151515', '', '', '', '0', '1', '', '4', '1', '2018-04-21 10:29:50', '2018-04-21 10:34:11');
INSERT INTO `ibid_orders` VALUES ('22', '2', 'N2018042110355525254', 'full', '1', '50.00', '683.00', '8.00', '641.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-21 10:36:02', '', '0', '', '2018-04-21 10:37:19', '0', 'HHTT', '134135113112345', '2018-04-21 10:39:18', '', '', '1', '1', '', '4', '1', '2018-04-21 10:35:55', '2018-04-21 10:40:07');
INSERT INTO `ibid_orders` VALUES ('23', '2', 'N2018042110575192742', '0', '0', '', '0.02', '0.01', '0.03', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '2', '2018-04-21 10:58:28', '', '1', '2018-04-21 10:59:34', '', '', '', '', '', '', '', '1', '1', '', '4', '1', '2018-04-21 10:57:51', '2018-04-21 16:10:39');
INSERT INTO `ibid_orders` VALUES ('24', '3', 'N2018042111553545991', '0', '0', '', '0.01', '0.01', '0.02', '15580841403', '易云', '湖南省', '长沙市', '芙蓉区', '测试', '', '1', '3', '2018-04-21 11:56:14', '', '1', '2018-04-21 11:56:23', '2018-04-21 12:00:54', '0', 'EMS', '34352345', '2018-04-21 12:05:25', '', '', '1', '0', '', '4', '1', '2018-04-21 11:55:35', '2018-04-21 14:16:15');
INSERT INTO `ibid_orders` VALUES ('25', '3', 'N2018042114380374048', '0', '0', '', '0.01', '0.01', '0.02', '15580841403', '易云', '湖南省', '长沙市', '芙蓉区', '测试', '', '1', '3', '2018-04-21 14:38:41', '', '0', '', '2018-04-21 14:39:16', '0', 'EMS', '4554', '2018-04-21 14:39:31', '', '', '1', '0', '', '4', '1', '2018-04-21 14:38:03', '2018-04-21 23:40:26');
INSERT INTO `ibid_orders` VALUES ('26', '9', 'N2018042116504013328', '0', '0', '', '223.00', '0.01', '223.01', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '1', '3', '2018-04-21 20:10:46', '0', '1', '2018-04-21 20:22:34', '2018-04-21 20:23:13', '0', 'STO', 'N2018042116504013328', '2018-04-21 20:23:29', '', '', '0', '0', '', '4', '1', '2018-04-21 16:50:40', '2018-04-21 20:23:29');
INSERT INTO `ibid_orders` VALUES ('27', '10', 'N2018042117592494796', '0', '0', '', '268.00', '0.01', '268.01', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '1', '3', '2018-04-23 10:19:03', '0', '0', '', '2018-04-23 10:19:32', '0', 'shunfeng', '111111111', '2018-04-24 11:38:32', '', '', '0', '0', '', '4', '1', '2018-04-21 17:59:24', '2018-04-24 11:38:32');
INSERT INTO `ibid_orders` VALUES ('28', '9', 'N2018042118022184256', '0', '0', '', '7379.00', '0.01', '7379.01', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '2018-04-21 19:47:58', '0', '0', '', '9', '1', '2018-04-21 18:02:21', '2018-04-21 19:47:58');
INSERT INTO `ibid_orders` VALUES ('29', '2', 'N2018042118070248166', '0', '0', '', '126.00', '0.01', '126.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '2018-04-21 18:07:10', '0', '0', '', '9', '1', '2018-04-21 18:07:02', '2018-04-21 18:07:10');
INSERT INTO `ibid_orders` VALUES ('30', '1', 'N2018042118073801965', '0', '0', '', '126.00', '0.01', '126.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '2018-04-21 18:07:47', '0', '0', '', '9', '1', '2018-04-21 18:07:38', '2018-04-21 18:07:47');
INSERT INTO `ibid_orders` VALUES ('31', '9', 'N2018042121014119415', '0', '0', '', '1112.00', '0.01', '1112.01', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '1', '3', '2018-04-21 21:01:48', '0', '1', '2018-04-22 16:05:48', '2018-04-23 16:26:24', '0', 'shunfeng', '1111111', '2018-04-23 17:55:55', '', '', '1', '0', '', '4', '1', '2018-04-21 21:01:41', '2018-04-23 22:34:10');
INSERT INTO `ibid_orders` VALUES ('32', '9', 'N2018042217542196331', 'discount', '3', '136.00', '156.00', '0.01', '20.01', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-22 17:54:21', '2018-04-22 17:54:21');
INSERT INTO `ibid_orders` VALUES ('33', '9', 'N2018042217543662004', '0', '0', '', '278.00', '0.01', '278.01', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-22 17:54:36', '2018-04-22 17:54:36');
INSERT INTO `ibid_orders` VALUES ('34', '9', 'N2018042217545183251', '0', '0', '', '120.00', '0.01', '120.01', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '2018-04-22 18:40:39', '0', '0', '', '9', '1', '2018-04-22 17:54:51', '2018-04-22 18:40:39');
INSERT INTO `ibid_orders` VALUES ('35', '9', 'N2018042217560778921', '0', '0', '', '120.00', '0.01', '120.01', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '1', '3', '2018-04-22 17:56:14', '0', '0', '', '2018-04-22 17:56:39', '0', 'HTKY', 'N2018042217560778921', '2018-04-22 18:40:48', '', '', '1', '0', '', '4', '1', '2018-04-22 17:56:07', '2018-04-23 22:34:26');
INSERT INTO `ibid_orders` VALUES ('36', '3', 'N2018042221471223569', '0', '0', '', '0.01', '0.01', '0.02', '15580841403', '易云', '湖南省', '长沙市', '芙蓉区', '测试', '', '1', '3', '2018-04-22 21:47:20', '0', '0', '', '2018-04-22 21:48:22', '0', 'huitongkuaidi', 'gfgf7767', '2018-04-22 21:48:56', '', '', '1', '0', '', '4', '1', '2018-04-22 21:47:12', '2018-04-22 22:49:03');
INSERT INTO `ibid_orders` VALUES ('37', '3', 'N2018042223010175153', '0', '0', '', '0.01', '0.01', '0.02', '15580841403', '易云', '湖南省', '长沙市', '芙蓉区', '测试', '', '1', '3', '2018-04-22 23:01:10', '0', '0', '', '2018-04-22 23:01:30', '0', 'ems', '64545', '2018-04-22 23:01:43', '', '', '1', '0', '', '4', '1', '2018-04-22 23:01:01', '2018-04-22 23:03:00');
INSERT INTO `ibid_orders` VALUES ('38', '3', 'N2018042223053803157', '0', '0', '', '0.02', '0.01', '0.03', '15580841403', '易云', '湖南省', '长沙市', '芙蓉区', '测试', '', '1', '3', '2018-04-22 23:05:47', '0', '0', '', '2018-04-22 23:06:45', '0', 'huitongkuaidi', '566556', '2018-04-22 23:08:22', '', '', '0', '0', '', '4', '1', '2018-04-22 23:05:38', '2018-04-22 23:08:22');
INSERT INTO `ibid_orders` VALUES ('39', '2', 'N2018042309422214927', '0', '0', '', '0.01', '0.01', '0.02', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 16:21:04', '0', '0', '', '2018-04-23 16:25:22', '0', 'ems', '11111111', '2018-04-23 16:32:44', '', '', '1', '0', '', '4', '1', '2018-04-23 09:42:22', '2018-04-23 18:12:25');
INSERT INTO `ibid_orders` VALUES ('40', '10', 'N2018042310234200400', '0', '0', '', '0.04', '0.01', '0.01', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '1', '3', '2018-04-23 10:23:52', '0', '0', '', '2018-04-23 10:23:56', '0', 'shunfeng', '2131231', '2018-04-23 10:24:15', '', '', '0', '0', '', '4', '1', '2018-04-23 10:23:42', '2018-04-23 10:24:28');
INSERT INTO `ibid_orders` VALUES ('41', '2', 'N2018042315090539417', '0', '0', '', '0.02', '0.00', '0.02', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '2', '2018-04-23 15:09:23', '1', '0', '', '2018-04-23 15:20:48', '0', 'ems', '3222615554484', '', '', '', '0', '1', '', '4', '1', '2018-04-23 15:09:05', '2018-04-23 15:21:24');
INSERT INTO `ibid_orders` VALUES ('42', '2', 'N2018042315252316644', 'full', '1', '50.00', '156.00', '0.00', '106.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 16:24:09', '0', '0', '', '2018-04-23 16:24:36', '0', 'shentong', '11111111111111111', '2018-04-23 16:32:52', '', '', '1', '0', '', '4', '1', '2018-04-23 15:25:23', '2018-04-23 18:09:35');
INSERT INTO `ibid_orders` VALUES ('43', '2', 'N2018042315253504362', 'full', '1', '50.00', '156.00', '0.00', '106.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 16:23:50', '0', '0', '', '2018-04-23 16:24:54', '0', 'shentong', '1111111111111111111111', '2018-04-23 16:32:49', '', '', '1', '0', '', '4', '1', '2018-04-23 15:25:35', '2018-04-23 18:10:40');
INSERT INTO `ibid_orders` VALUES ('44', '2', 'N2018042315254092616', 'full', '1', '50.00', '156.00', '0.00', '106.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 16:23:32', '0', '0', '', '2018-04-23 16:25:03', '0', 'ems', '111111111111111', '2018-04-23 16:32:46', '', '', '1', '0', '', '4', '1', '2018-04-23 15:25:40', '2018-04-23 18:11:05');
INSERT INTO `ibid_orders` VALUES ('45', '2', 'N2018042315265183509', 'full', '1', '50.00', '156.00', '0.00', '106.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 16:20:48', '0', '0', '', '2018-04-23 16:25:38', '0', 'shunfeng', '1111111111111', '2018-04-23 16:32:42', '', '', '1', '0', '', '4', '1', '2018-04-23 15:26:51', '2018-04-24 13:52:38');
INSERT INTO `ibid_orders` VALUES ('46', '2', 'N2018042315310289153', 'full', '1', '50.00', '156.00', '0.00', '106.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 15:44:46', '0', '0', '', '2018-04-23 16:26:15', '0', 'shunfeng', '1111111111111', '2018-04-23 16:28:10', '', '', '0', '0', '', '4', '1', '2018-04-23 15:31:02', '2018-04-23 16:28:10');
INSERT INTO `ibid_orders` VALUES ('47', '3', 'N2018042315414698145', '0', '0', '', '258.00', '0.00', '258.00', '15580841403', '易云', '湖南省', '长沙市', '芙蓉区', '测试', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-23 15:41:46', '2018-04-23 15:41:46');
INSERT INTO `ibid_orders` VALUES ('48', '2', 'N2018042315453351190', 'coupon', '19', '50.00', '126.00', '0.00', '76.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 15:46:09', '0', '0', '', '2018-04-23 16:26:06', '0', 'ems', '1111111111', '2018-04-23 16:28:13', '', '', '0', '0', '', '4', '1', '2018-04-23 15:45:33', '2018-04-23 16:28:13');
INSERT INTO `ibid_orders` VALUES ('49', '2', 'N2018042315454925929', 'full', '1', '50.00', '126.00', '0.00', '76.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 15:50:12', '0', '0', '', '2018-04-23 16:25:57', '0', 'ems', '11111111111', '2018-04-23 16:28:15', '', '', '0', '0', '', '4', '1', '2018-04-23 15:45:49', '2018-04-23 16:28:15');
INSERT INTO `ibid_orders` VALUES ('50', '1', 'N2018042315462761715', 'discount', '2', '258.00', '278.00', '0.00', '20.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-23 15:46:27', '2018-04-23 15:46:27');
INSERT INTO `ibid_orders` VALUES ('51', '2', 'N2018042315505461452', 'coupon', '21', '63.00', '126.00', '0.00', '63.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 16:20:32', '0', '0', '', '2018-04-23 16:25:47', '0', 'shunfeng', '11111111111', '2018-04-23 16:28:19', '', '', '1', '0', '', '4', '1', '2018-04-23 15:50:54', '2018-04-24 13:52:53');
INSERT INTO `ibid_orders` VALUES ('52', '15', 'N2018042316015207671', '0', '0', '', '200.00', '0.00', '0.01', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-23 16:01:52', '2018-04-23 16:01:52');
INSERT INTO `ibid_orders` VALUES ('53', '2', 'N2018042316050334036', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '1', '2018-04-23 16:05:16', '1', '0', '', '', '', '', '', '', '', '', '0', '1', '', '4', '1', '2018-04-23 16:05:03', '2018-04-23 16:05:35');
INSERT INTO `ibid_orders` VALUES ('54', '9', 'N2018042316115381315', '0', '0', '', '200.00', '0.00', '200.00', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '1', '3', '2018-04-23 17:53:08', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 16:11:53', '2018-04-23 17:53:08');
INSERT INTO `ibid_orders` VALUES ('55', '9', 'N2018042316121092889', '0', '0', '', '200.00', '0.00', '200.00', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '1', '3', '2018-04-23 17:53:39', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 16:12:10', '2018-04-23 17:53:39');
INSERT INTO `ibid_orders` VALUES ('56', '9', 'N2018042316122978480', '0', '0', '', '200.00', '0.00', '200.00', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '1', '3', '2018-04-23 17:43:27', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 16:12:29', '2018-04-23 17:43:27');
INSERT INTO `ibid_orders` VALUES ('57', '9', 'N2018042317171995010', '0', '0', '', '268.00', '10.00', '278.00', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '1', '3', '2018-04-23 17:43:05', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 17:17:19', '2018-04-23 17:43:05');
INSERT INTO `ibid_orders` VALUES ('58', '2', 'N2018042317222430475', 'coupon', '22', '100.00', '434.00', '10.00', '344.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 17:22:34', '0', '0', '', '2018-04-23 17:23:22', '0', 'tiantian', '88888888777777', '2018-04-24 11:10:36', '', '', '0', '1', '', '4', '1', '2018-04-23 17:22:24', '2018-04-24 11:10:36');
INSERT INTO `ibid_orders` VALUES ('59', '2', 'N2018042317475572147', '0', '0', '', '126.00', '0.00', '126.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 17:48:02', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 17:47:55', '2018-04-23 17:48:02');
INSERT INTO `ibid_orders` VALUES ('60', '2', 'N2018042317482632941', '0', '0', '', '126.00', '0.00', '126.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '信息填写错误,重新下单', '2018-04-23 20:36:50', '0', '0', '', '9', '1', '2018-04-23 17:48:26', '2018-04-23 20:36:50');
INSERT INTO `ibid_orders` VALUES ('61', '9', 'N2018042320364889784', '0', '0', '', '156.00', '0.00', '156.00', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '1', '3', '2018-04-23 20:36:58', '0', '1', '2018-04-24 10:22:48', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 20:36:48', '2018-04-24 10:22:48');
INSERT INTO `ibid_orders` VALUES ('62', '2', 'N2018042320431489123', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '我不想买了', '2018-04-24 13:39:20', '0', '0', '', '9', '1', '2018-04-23 20:43:14', '2018-04-24 13:39:20');
INSERT INTO `ibid_orders` VALUES ('63', '2', 'N2018042320435057117', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 20:43:54', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 20:43:50', '2018-04-23 20:43:54');
INSERT INTO `ibid_orders` VALUES ('64', '2', 'N2018042320462103481', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '我不想买了', '2018-04-24 13:39:11', '0', '0', '', '9', '1', '2018-04-23 20:46:21', '2018-04-24 13:39:11');
INSERT INTO `ibid_orders` VALUES ('65', '2', 'N2018042320505043324', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 20:50:54', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 20:50:50', '2018-04-23 20:50:54');
INSERT INTO `ibid_orders` VALUES ('66', '2', 'N2018042320525791496', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 20:53:00', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 20:52:57', '2018-04-23 20:53:00');
INSERT INTO `ibid_orders` VALUES ('67', '2', 'N2018042320530603371', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 11:05:40', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 20:53:06', '2018-04-24 11:05:40');
INSERT INTO `ibid_orders` VALUES ('68', '2', 'N2018042320535989083', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '2', '2018-04-23 20:54:09', '1', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 20:53:59', '2018-04-23 20:54:09');
INSERT INTO `ibid_orders` VALUES ('69', '2', 'N2018042320543161293', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '我不想买了', '2018-04-24 10:55:44', '0', '0', '', '9', '1', '2018-04-23 20:54:31', '2018-04-24 10:55:44');
INSERT INTO `ibid_orders` VALUES ('70', '2', 'N2018042320560933334', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 20:56:13', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 20:56:09', '2018-04-23 20:56:13');
INSERT INTO `ibid_orders` VALUES ('71', '2', 'N2018042320575146499', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 20:57:55', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 20:57:51', '2018-04-23 20:57:55');
INSERT INTO `ibid_orders` VALUES ('72', '2', 'N2018042320581212956', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 20:58:16', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 20:58:12', '2018-04-23 20:58:16');
INSERT INTO `ibid_orders` VALUES ('73', '2', 'N2018042321000142273', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:00:05', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:00:01', '2018-04-23 21:00:05');
INSERT INTO `ibid_orders` VALUES ('74', '2', 'N2018042321003219068', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '哦您了', '2018-04-24 10:55:19', '0', '0', '', '9', '1', '2018-04-23 21:00:32', '2018-04-24 10:55:19');
INSERT INTO `ibid_orders` VALUES ('75', '2', 'N2018042321071744803', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:07:20', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:07:17', '2018-04-23 21:07:20');
INSERT INTO `ibid_orders` VALUES ('76', '2', 'N2018042321073081298', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:07:34', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:07:30', '2018-04-23 21:07:34');
INSERT INTO `ibid_orders` VALUES ('77', '2', 'N2018042321082001826', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:08:24', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:08:20', '2018-04-23 21:08:24');
INSERT INTO `ibid_orders` VALUES ('78', '2', 'N2018042321085609680', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:09:00', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:08:56', '2018-04-23 21:09:00');
INSERT INTO `ibid_orders` VALUES ('79', '2', 'N2018042321174966453', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:17:53', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:17:49', '2018-04-23 21:17:53');
INSERT INTO `ibid_orders` VALUES ('80', '2', 'N2018042321182028325', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:18:23', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:18:20', '2018-04-23 21:18:23');
INSERT INTO `ibid_orders` VALUES ('81', '2', 'N2018042321182060705', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 10:55:08', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:18:20', '2018-04-24 10:55:08');
INSERT INTO `ibid_orders` VALUES ('82', '2', 'N2018042321241341396', '0', '0', '', '278.00', '0.00', '278.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:24:17', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:24:13', '2018-04-23 21:24:17');
INSERT INTO `ibid_orders` VALUES ('83', '2', 'N2018042321264445090', '0', '0', '', '126.00', '0.00', '126.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:26:48', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:26:44', '2018-04-23 21:26:48');
INSERT INTO `ibid_orders` VALUES ('84', '2', 'N2018042321271500836', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 10:54:48', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:27:15', '2018-04-24 10:54:48');
INSERT INTO `ibid_orders` VALUES ('85', '2', 'N2018042321375229917', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:37:56', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:37:52', '2018-04-23 21:37:56');
INSERT INTO `ibid_orders` VALUES ('86', '2', 'N2018042321391526867', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:39:18', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:39:15', '2018-04-23 21:39:18');
INSERT INTO `ibid_orders` VALUES ('87', '2', 'N2018042321392712337', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-23 21:39:31', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:39:27', '2018-04-23 21:39:31');
INSERT INTO `ibid_orders` VALUES ('88', '2', 'N2018042321394304233', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '2', '2018-04-23 21:39:55', '1', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:39:43', '2018-04-23 21:39:55');
INSERT INTO `ibid_orders` VALUES ('89', '2', 'N2018042321403173354', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '1', '2018-04-23 21:40:42', '1', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 21:40:31', '2018-04-23 21:40:42');
INSERT INTO `ibid_orders` VALUES ('90', '9', 'N2018042322304571446', '0', '0', '', '404.00', '0.00', '404.00', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-23 22:30:45', '2018-04-23 22:30:45');
INSERT INTO `ibid_orders` VALUES ('91', '9', 'N2018042322395980940', '0', '0', '', '126.00', '0.00', '126.00', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '1', '3', '2018-04-23 22:40:07', '0', '1', '2018-04-24 10:22:46', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-23 22:39:59', '2018-04-24 10:22:46');
INSERT INTO `ibid_orders` VALUES ('92', '9', 'N2018042322432285550', '0', '0', '', '126.00', '0.00', '126.00', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '1', '3', '2018-04-23 22:44:07', '0', '1', '2018-04-23 22:44:17', '2018-04-23 22:44:41', '0', 'ems', 'N2018042322432285550', '2018-04-23 22:44:56', '', '', '1', '0', '', '4', '1', '2018-04-23 22:43:22', '2018-04-24 14:08:35');
INSERT INTO `ibid_orders` VALUES ('93', '9', 'N2018042323003295761', '0', '0', '', '126.00', '0.00', '126.00', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '1', '3', '2018-04-24 10:59:01', '0', '0', '', '2018-04-24 10:59:49', '0', 'yunda', '3832104700825', '', '', '', '0', '0', '', '3', '1', '2018-04-23 23:00:32', '2018-04-24 11:02:09');
INSERT INTO `ibid_orders` VALUES ('94', '9', 'N2018042400013588603', '0', '0', '', '468.00', '0.00', '468.00', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '1', '3', '2018-04-24 00:01:46', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 00:01:35', '2018-04-24 00:01:46');
INSERT INTO `ibid_orders` VALUES ('95', '9', 'N2018042410201151387', '0', '0', '', '468.00', '0.00', '468.00', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '1', '3', '2018-04-24 10:20:22', '0', '1', '2018-04-24 10:22:49', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 10:20:11', '2018-04-24 10:22:49');
INSERT INTO `ibid_orders` VALUES ('96', '1', 'N2018042410275538593', '0', '0', '', '278.00', '0.00', '278.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 10:28:13', '0', '0', '', '', '', '', '', '', '', '', '0', '1', '', '4', '1', '2018-04-24 10:27:55', '2018-04-24 10:28:36');
INSERT INTO `ibid_orders` VALUES ('97', '1', 'N2018042410295726110', '0', '0', '', '268.00', '0.00', '268.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-24 10:29:57', '2018-04-24 10:29:57');
INSERT INTO `ibid_orders` VALUES ('98', '2', 'N2018042410311274457', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '我不想买了', '2018-04-24 10:51:20', '0', '0', '', '9', '1', '2018-04-24 10:31:12', '2018-04-24 10:51:20');
INSERT INTO `ibid_orders` VALUES ('99', '1', 'N2018042410315947497', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 10:32:06', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 10:31:59', '2018-04-24 10:32:06');
INSERT INTO `ibid_orders` VALUES ('100', '1', 'N2018042410321915975', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-24 10:32:19', '2018-04-24 10:32:19');
INSERT INTO `ibid_orders` VALUES ('101', '1', 'N2018042410335103317', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '信息填写错误,重新下单', '2018-04-24 10:55:22', '0', '0', '', '9', '1', '2018-04-24 10:33:51', '2018-04-24 10:55:22');
INSERT INTO `ibid_orders` VALUES ('102', '1', 'N2018042410341448803', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '商家缺货', '2018-04-24 10:37:31', '0', '0', '', '9', '1', '2018-04-24 10:34:14', '2018-04-24 10:37:31');
INSERT INTO `ibid_orders` VALUES ('103', '3', 'N2018042410365490219', '0', '0', '', '0.01', '0.00', '0.01', '15580841403', '易云', '湖南省', '长沙市', '芙蓉区', '测试', '', '1', '1', '2018-04-24 10:37:11', '1', '0', '', '', '', '', '', '', '', '', '0', '1', '', '4', '1', '2018-04-24 10:36:54', '2018-04-24 10:37:49');
INSERT INTO `ibid_orders` VALUES ('104', '3', 'N2018042410382777388', '0', '0', '', '0.01', '0.00', '0.01', '15580841403', '易云', '湖南省', '长沙市', '芙蓉区', '测试', '', '1', '2', '2018-04-24 10:38:40', '1', '0', '', '', '', '', '', '', '', '', '0', '1', '', '4', '1', '2018-04-24 10:38:27', '2018-04-24 10:39:03');
INSERT INTO `ibid_orders` VALUES ('105', '2', 'N2018042413414151815', '0', '0', '', '156.00', '0.00', '156.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 13:41:44', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 13:41:41', '2018-04-24 13:41:44');
INSERT INTO `ibid_orders` VALUES ('106', '2', 'N2018042413420412160', '0', '0', '', '259.00', '0.00', '259.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 13:42:09', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 13:42:04', '2018-04-24 13:42:09');
INSERT INTO `ibid_orders` VALUES ('107', '2', 'N2018042413423584760', '0', '0', '', '120.00', '0.00', '120.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 13:43:02', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 13:42:35', '2018-04-24 13:43:02');
INSERT INTO `ibid_orders` VALUES ('108', '2', 'N2018042413424441862', '0', '0', '', '146.00', '0.00', '146.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 13:42:55', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 13:42:44', '2018-04-24 13:42:55');
INSERT INTO `ibid_orders` VALUES ('109', '2', 'N2018042413432950577', '0', '0', '', '156.00', '0.00', '156.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 13:43:35', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 13:43:29', '2018-04-24 13:43:35');
INSERT INTO `ibid_orders` VALUES ('110', '2', 'N2018042413435695868', '0', '0', '', '278.00', '0.00', '278.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 13:44:03', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 13:43:56', '2018-04-24 13:44:03');
INSERT INTO `ibid_orders` VALUES ('111', '2', 'N2018042413590100551', '0', '0', '', '126.00', '0.00', '126.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '信息填写错误,重新下单', '2018-04-24 15:00:28', '0', '0', '', '9', '1', '2018-04-24 13:59:01', '2018-04-24 15:00:28');
INSERT INTO `ibid_orders` VALUES ('112', '1', 'N2018042414124371839', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:12:47', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:12:43', '2018-04-24 14:12:47');
INSERT INTO `ibid_orders` VALUES ('113', '1', 'N2018042414145328384', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:15:00', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:14:53', '2018-04-24 14:15:00');
INSERT INTO `ibid_orders` VALUES ('114', '2', 'N2018042414152175314', '0', '0', '', '0.01', '0.00', '0.01', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '2', '2018-04-24 14:15:32', '1', '0', '', '', '', '', '', '', '', '', '0', '1', '', '4', '1', '2018-04-24 14:15:21', '2018-04-24 14:17:10');
INSERT INTO `ibid_orders` VALUES ('115', '1', 'N2018042414160203313', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:16:05', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:16:02', '2018-04-24 14:16:05');
INSERT INTO `ibid_orders` VALUES ('116', '1', 'N2018042414173982339', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-24 14:17:39', '2018-04-24 14:17:39');
INSERT INTO `ibid_orders` VALUES ('117', '1', 'N2018042414175504243', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-24 14:17:55', '2018-04-24 14:17:55');
INSERT INTO `ibid_orders` VALUES ('118', '1', 'N2018042414182938570', '0', '0', '', '126.00', '0.00', '126.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-24 14:18:29', '2018-04-24 14:18:29');
INSERT INTO `ibid_orders` VALUES ('119', '1', 'N2018042414190559011', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-24 14:19:05', '2018-04-24 14:19:05');
INSERT INTO `ibid_orders` VALUES ('120', '1', 'N2018042414192239243', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:19:31', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:19:22', '2018-04-24 14:19:31');
INSERT INTO `ibid_orders` VALUES ('121', '1', 'N2018042414194276451', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-24 14:19:42', '2018-04-24 14:19:42');
INSERT INTO `ibid_orders` VALUES ('122', '1', 'N2018042414195002040', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-24 14:19:50', '2018-04-24 14:19:50');
INSERT INTO `ibid_orders` VALUES ('123', '1', 'N2018042414205659338', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:21:00', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:20:56', '2018-04-24 14:21:00');
INSERT INTO `ibid_orders` VALUES ('124', '1', 'N2018042414211314948', '0', '0', '', '0.01', '0.00', '0.01', '13568524558', '默默', '山西省', '阳泉市', '盂县', '陌路了', '', '1', '3', '2018-04-24 14:21:17', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:21:13', '2018-04-24 14:21:17');
INSERT INTO `ibid_orders` VALUES ('125', '1', 'N2018042414214613635', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:21:48', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:21:46', '2018-04-24 14:21:48');
INSERT INTO `ibid_orders` VALUES ('126', '1', 'N2018042414220132718', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:22:07', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:22:01', '2018-04-24 14:22:07');
INSERT INTO `ibid_orders` VALUES ('127', '1', 'N2018042414224211135', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:22:45', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:22:42', '2018-04-24 14:22:45');
INSERT INTO `ibid_orders` VALUES ('128', '1', 'N2018042414232692733', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:23:29', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:23:26', '2018-04-24 14:23:29');
INSERT INTO `ibid_orders` VALUES ('129', '1', 'N2018042414242696714', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:24:29', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:24:26', '2018-04-24 14:24:29');
INSERT INTO `ibid_orders` VALUES ('130', '1', 'N2018042414244928421', '0', '0', '', '0.01', '0.00', '0.01', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '1', '3', '2018-04-24 14:24:55', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '2', '1', '2018-04-24 14:24:49', '2018-04-24 14:24:55');
INSERT INTO `ibid_orders` VALUES ('131', '1', 'N2018042414363988959', '0', '0', '', '156.00', '0.00', '156.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '', '1', '1', '2018-04-24 14:36:39', '2018-04-24 14:36:40');
INSERT INTO `ibid_orders` VALUES ('132', '2', 'N2018042414552013709', '0', '0', '', '126.00', '0.00', '126.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 14:55:34', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '2', '1', '2018-04-24 14:55:20', '2018-04-24 14:55:34');
INSERT INTO `ibid_orders` VALUES ('133', '2', 'N2018042414560862757', '0', '0', '', '394.00', '0.00', '394.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 14:56:12', '0', '0', '', '2018-04-24 14:56:37', '0', 'shunfeng', '123456654321', '2018-04-24 14:57:02', '', '', '0', '1', '0', '4', '1', '2018-04-24 14:56:08', '2018-04-24 14:57:02');
INSERT INTO `ibid_orders` VALUES ('134', '2', 'N2018042415004746291', '0', '0', '', '282.00', '0.00', '282.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 15:00:51', '0', '0', '', '2018-04-24 15:08:08', '0', 'ems', '2123213131231', '2018-04-24 17:41:49', '', '', '0', '1', '0', '4', '1', '2018-04-24 15:00:47', '2018-04-24 17:41:49');
INSERT INTO `ibid_orders` VALUES ('135', '1', 'N2018042415505737891', 'coupon', '32', '63.00', '126.00', '0.00', '63.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 15:50:57', '2018-04-24 15:50:57');
INSERT INTO `ibid_orders` VALUES ('136', '1', 'N2018042415524313348', 'discount', '2', '258.00', '278.00', '0.00', '20.00', '18888888888', '的方式', '吉林省', '通化市', '柳河县', '防守打法知足', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 15:52:43', '2018-04-24 15:52:43');
INSERT INTO `ibid_orders` VALUES ('137', '9', 'N2018042416121206756', '0', '0', '', '0.02', '0.00', '0.02', '13574849891', '罗铸', '天津市', '市辖区', '河北区', 'hhhdj', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 16:12:12', '2018-04-24 16:12:12');
INSERT INTO `ibid_orders` VALUES ('138', '2', 'N2018042417121454974', 'coupon', '29', '1105.00', '1290.00', '10.00', '195.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '商家缺货', '2018-04-24 17:13:32', '0', '0', '0', '9', '1', '2018-04-24 17:12:14', '2018-04-24 17:13:32');
INSERT INTO `ibid_orders` VALUES ('139', '2', 'N2018042417131650836', '0', '0', '', '1390.00', '10.00', '1400.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '0', '', '', '0', '0', '', '', '', '', '', '', '信息填写错误,重新下单', '2018-04-24 17:13:30', '0', '0', '0', '9', '1', '2018-04-24 17:13:16', '2018-04-24 17:13:30');
INSERT INTO `ibid_orders` VALUES ('140', '2', 'N2018042417135758178', 'coupon', '23', '700.00', '1390.00', '10.00', '700.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 17:14:37', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '2', '1', '2018-04-24 17:13:57', '2018-04-24 17:14:37');
INSERT INTO `ibid_orders` VALUES ('141', '2', 'N2018042417243080405', '0', '0', '', '2780.00', '10.00', '2790.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 17:24:34', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '2', '1', '2018-04-24 17:24:30', '2018-04-24 17:24:34');
INSERT INTO `ibid_orders` VALUES ('142', '2', 'N2018042417300554474', '0', '0', '', '1340.00', '10.00', '1350.00', '18175974828', '李舟', '北京市', '市辖区', '朝阳区', '哦明敏', '', '1', '3', '2018-04-24 17:34:17', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '2', '1', '2018-04-24 17:30:05', '2018-04-24 17:34:17');
INSERT INTO `ibid_orders` VALUES ('143', '10', 'N2018042417442278536', '0', '0', '', '156.00', '10.00', '166.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 17:44:22', '2018-04-24 17:44:22');
INSERT INTO `ibid_orders` VALUES ('144', '9', 'N2018042418082831784', '0', '0', '', '156.00', '10.00', '166.00', '13574849891', '2323', '安徽省', '阜阳市', '市辖区', '1212', '', '1', '3', '2018-04-24 18:08:57', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '2', '1', '2018-04-24 18:08:28', '2018-04-24 18:08:57');
INSERT INTO `ibid_orders` VALUES ('145', '10', 'N2018042421355245188', 'coupon', '26', '5.01', '0.01', '10.00', '5.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 21:35:52', '2018-04-24 21:35:52');
INSERT INTO `ibid_orders` VALUES ('146', '10', 'N2018042421360431607', 'coupon', '27', '68.00', '126.00', '10.00', '68.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 21:36:04', '2018-04-24 21:36:04');
INSERT INTO `ibid_orders` VALUES ('147', '10', 'N2018042421441809439', '0', '0', '', '258.00', '10.00', '268.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 21:44:18', '2018-04-24 21:44:18');
INSERT INTO `ibid_orders` VALUES ('148', '10', 'N2018042422204379626', '0', '0', '', '268.00', '10.00', '278.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 22:20:43', '2018-04-24 22:20:43');
INSERT INTO `ibid_orders` VALUES ('149', '10', 'N2018042422225743338', '0', '0', '', '268.00', '10.00', '278.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 22:22:57', '2018-04-24 22:22:58');
INSERT INTO `ibid_orders` VALUES ('150', '10', 'N2018042422231681009', 'coupon', '26', '139.00', '268.00', '10.00', '139.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 22:23:16', '2018-04-24 22:23:16');
INSERT INTO `ibid_orders` VALUES ('151', '10', 'N2018042422232484503', 'coupon', '27', '139.00', '268.00', '10.00', '139.00', '17670745968', '刘备', '湖南省', '长沙市', '长沙县', '湘绣城', '', '0', '', '', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '1', '1', '2018-04-24 22:23:24', '2018-04-24 22:23:24');
INSERT INTO `ibid_orders` VALUES ('152', '22', 'N2018042508242558513', '0', '0', '', '126.00', '10.00', '136.00', '15500000000', '测试', '天津市', '市辖区', '南开区', '测试', '', '1', '3', '2018-04-25 08:24:43', '0', '0', '', '', '', '', '', '', '', '', '0', '0', '0', '2', '1', '2018-04-25 08:24:25', '2018-04-25 08:24:43');
INSERT INTO `ibid_orders` VALUES ('153', '22', 'N2018042508252610449', '0', '0', '', '537.00', '10.00', '547.00', '15500000000', '测试', '天津市', '市辖区', '南开区', '测试', '', '1', '3', '2018-04-25 08:25:30', '0', '0', '', '2018-04-25 08:35:32', '0', 'huitongkuaidi', '3434', '', '', '', '0', '1', '1', '4', '1', '2018-04-25 08:25:26', '2018-04-25 08:37:01');
INSERT INTO `ibid_orders` VALUES ('154', '22', 'N2018042508262722147', '0', '0', '', '525.00', '10.00', '535.00', '15500000000', '测试', '天津市', '市辖区', '南开区', '测试', '', '1', '3', '2018-04-25 08:38:57', '0', '0', '', '2018-04-25 08:40:04', '0', 'huitongkuaidi', '454', '2018-04-25 08:44:37', '', '', '0', '1', '0', '4', '1', '2018-04-25 08:26:27', '2018-04-25 08:44:37');
INSERT INTO `ibid_orders` VALUES ('155', '22', 'N2018042509010989498', '0', '0', '', '126.01', '10.00', '136.01', '15500000000', '测试', '天津市', '市辖区', '南开区', '测试', '', '1', '3', '2018-04-25 09:01:12', '0', '0', '', '2018-04-25 09:04:12', '0', 'huitongkuaidi', '34', '2018-04-25 09:04:25', '', '', '1', '0', '0', '4', '1', '2018-04-25 09:01:09', '2018-04-25 09:04:59');
INSERT INTO `ibid_orders` VALUES ('156', '22', 'N2018042509072585656', '0', '0', '', '282.00', '10.00', '292.00', '15500000000', '测试', '天津市', '市辖区', '南开区', '测试', '', '1', '3', '2018-04-25 09:07:28', '0', '0', '', '2018-04-25 09:07:57', '0', 'huitongkuaidi', '1232', '2018-04-25 09:08:06', '', '', '1', '1', '0', '4', '1', '2018-04-25 09:07:25', '2018-04-25 09:10:20');

-- -----------------------------
-- Table structure for `ibid_qiniu_files`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_qiniu_files`;
CREATE TABLE `ibid_qiniu_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL COMMENT '文件名称',
  `file_type` varchar(255) NOT NULL COMMENT '文件类型',
  `file_size` varchar(255) NOT NULL COMMENT '文件大小',
  `key` varchar(255) NOT NULL COMMENT '七牛生成的文件key',
  `file_url` varchar(255) NOT NULL COMMENT '七牛外链',
  `desc` text COMMENT '文件说明',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_qiniu_files`
-- -----------------------------
INSERT INTO `ibid_qiniu_files` VALUES ('1', 'Penguins', 'jpg', '759.60KB', '5aa0cfa082a79.jpg', 'http://oyfr0gkd3.bkt.clouddn.com/5aa0cfa082a79.jpg', '', '0', '2018-03-08 13:52:33', '2018-04-02 17:55:42');
INSERT INTO `ibid_qiniu_files` VALUES ('2', 'Hydrangeas', 'jpg', '581.33KB', '5aa1e4492bc84.jpg', 'http://oyfr0gkd3.bkt.clouddn.com/5aa1e4492bc84.jpg', '', '0', '2018-03-09 09:32:58', '2018-04-02 17:55:42');
INSERT INTO `ibid_qiniu_files` VALUES ('3', 'ad6', 'png', '5.61KB', '5ac1fe18ddec8.png', 'http://oyfr0gkd3.bkt.clouddn.com/5ac1fe18ddec8.png', '', '0', '2018-04-02 17:55:37', '2018-04-02 17:55:42');
INSERT INTO `ibid_qiniu_files` VALUES ('4', 'ad8', 'png', '5.35KB', '5ac1fe5233068.png', 'http://oyfr0gkd3.bkt.clouddn.com/5ac1fe5233068.png', '', '0', '2018-04-02 17:56:34', '2018-04-05 17:57:20');
INSERT INTO `ibid_qiniu_files` VALUES ('5', 'banner7', 'png', '370.09KB', '5ac1fe8034008.png', 'http://oyfr0gkd3.bkt.clouddn.com/5ac1fe8034008.png', '', '0', '2018-04-02 17:57:20', '2018-04-02 17:58:48');
INSERT INTO `ibid_qiniu_files` VALUES ('6', '文件名称1', 'png', '3.06KB', '5ac1fedd497c8.png', 'http://oyfr0gkd3.bkt.clouddn.com/5ac1fedd497c8.png', '测试1', '0', '2018-04-02 17:58:53', '2018-04-23 16:35:16');
INSERT INTO `ibid_qiniu_files` VALUES ('7', '1516859085567', 'png', '163.74KB', '5ac2f539915c8.png', 'http://oyfr0gkd3.bkt.clouddn.com/5ac2f539915c8.png', '', '0', '2018-04-03 11:30:01', '2018-04-23 16:35:16');
INSERT INTO `ibid_qiniu_files` VALUES ('8', 'ad3', 'png', '31.61KB', '5ace20a5660d0.png', 'http://oyfr0gkd3.bkt.clouddn.com/5ace20a5660d0.png', '', '0', '2018-04-11 22:50:14', '2018-04-23 16:35:16');
INSERT INTO `ibid_qiniu_files` VALUES ('9', 'banner3', 'png', '566.85KB', '5ad5abe048310.png', 'http://oyfr0gkd3.bkt.clouddn.com/5ad5abe048310.png', '', '0', '2018-04-17 16:10:09', '2018-04-23 16:35:16');
INSERT INTO `ibid_qiniu_files` VALUES ('10', '74e9a83a86781e4932c0abc094990357c0512fd1cf534-TgXsxx_fw658', 'png', '116.47KB', '5add9a2164660.png', 'http://oyfr0gkd3.bkt.clouddn.com/5add9a2164660.png', '', '0', '2018-04-23 16:32:44', '2018-04-23 16:35:16');

-- -----------------------------
-- Table structure for `ibid_return_goods`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_return_goods`;
CREATE TABLE `ibid_return_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '会员ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单商品ID：为0表示整笔订单退货',
  `return_order_no` varchar(255) NOT NULL COMMENT '退货单号',
  `return_money` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `imgs` text,
  `return_type` varchar(255) DEFAULT NULL COMMENT '退货类别',
  `return_reason` text COMMENT '申请退货理由',
  `deal_time` datetime DEFAULT NULL COMMENT '管理员退货处理时间',
  `is_return_money` tinyint(1) DEFAULT '0' COMMENT '是否已退款：0否1是',
  `return_money_time` datetime DEFAULT NULL COMMENT '退款时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '订单状态：1申请中2已拒绝3已同意',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_return_goods`
-- -----------------------------
INSERT INTO `ibid_return_goods` VALUES ('1', '2', '2', '4', 'G2018041716580431507', '100.00', '[\"\\/public\\/upload\\/images\\/1523955484405.jpg\"]', '1', '哈哈哈', '2018-04-17 16:58:50', '1', '2018-04-17 16:58:55', '3', '1', '2018-04-17 16:58:04', '2018-04-17 16:58:55');
INSERT INTO `ibid_return_goods` VALUES ('2', '2', '4', '7', 'G2018041810575330710', '0.01', '[\"\\/public\\/upload\\/images\\/1524020273277.jpg\"]', '1', '444554', '2018-04-19 10:44:46', '1', '2018-04-19 10:44:52', '3', '1', '2018-04-18 10:57:53', '2018-04-19 10:44:52');
INSERT INTO `ibid_return_goods` VALUES ('3', '2', '15', '19', 'G2018041910443439445', '0.01', '[\"\\/public\\/upload\\/images\\/1524105874257.jpg\"]', '1', 'KKK里好', '2018-04-19 10:59:57', '1', '2018-04-19 11:00:07', '3', '1', '2018-04-19 10:44:34', '2018-04-19 11:00:07');
INSERT INTO `ibid_return_goods` VALUES ('4', '3', '18', '22', 'G2018041918010048695', '0.01', '[]', '1', '123', '2018-04-19 18:01:08', '1', '2018-04-20 00:03:27', '3', '1', '2018-04-19 18:01:00', '2018-04-20 00:03:27');
INSERT INTO `ibid_return_goods` VALUES ('5', '3', '28', '39', 'G2018042000315325717', '0.01', '[]', '1', '1122', '2018-04-20 00:32:06', '1', '2018-04-20 00:32:10', '3', '1', '2018-04-20 00:31:53', '2018-04-20 00:32:10');
INSERT INTO `ibid_return_goods` VALUES ('6', '2', '29', '42', 'G2018042009082602829', '126.00', '[]', '1', '名字', '2018-04-20 09:08:39', '1', '2018-04-20 09:08:44', '3', '1', '2018-04-20 09:08:26', '2018-04-20 09:08:44');
INSERT INTO `ibid_return_goods` VALUES ('7', '2', '34', '50', 'G2018042009481279199', '0.01', '[]', '1', '推荐', '2018-04-20 09:48:44', '1', '2018-04-20 09:48:47', '3', '1', '2018-04-20 09:48:12', '2018-04-20 09:48:47');
INSERT INTO `ibid_return_goods` VALUES ('8', '2', '35', '51', 'G2018042009501868826', '0.01', '[\"\\/public\\/upload\\/images\\/1524189018821.jpg\"]', '1', '明年', '2018-04-20 09:50:28', '1', '2018-04-20 09:50:32', '3', '1', '2018-04-20 09:50:18', '2018-04-20 09:50:32');
INSERT INTO `ibid_return_goods` VALUES ('9', '1', '27', '38', 'G2018042009531969660', '0.01', '[\"\\/public\\/upload\\/images\\/1524189199285.jpg\"]', '1', 'Hjjj', '', '0', '', '1', '1', '2018-04-20 09:53:19', '2018-04-20 09:53:19');
INSERT INTO `ibid_return_goods` VALUES ('10', '2', '12', '20', 'G2018042013524693486', '278.00', '[\"\\/public\\/upload\\/images\\/1524203566823.jpg\"]', '1', '444575', '2018-04-21 09:12:11', '1', '2018-04-21 09:12:59', '3', '1', '2018-04-20 13:52:46', '2018-04-21 09:12:59');
INSERT INTO `ibid_return_goods` VALUES ('11', '2', '10', '15', 'G2018042013541053331', '156.00', '[\"\\/public\\/upload\\/images\\/1524203650601.jpg\"]', '1', '好厉害', '', '0', '', '1', '1', '2018-04-20 13:54:10', '2018-04-20 13:54:10');
INSERT INTO `ibid_return_goods` VALUES ('12', '2', '8', '10', 'G2018042013545426357', '28.00', '[]', '1', '时候', '', '0', '', '1', '1', '2018-04-20 13:54:54', '2018-04-20 13:54:54');
INSERT INTO `ibid_return_goods` VALUES ('13', '2', '12', '19', 'G2018042017255907234', '156.00', '[]', '1', 'Molly', '2018-04-21 10:38:28', '0', '', '3', '1', '2018-04-20 17:25:59', '2018-04-21 10:38:28');
INSERT INTO `ibid_return_goods` VALUES ('14', '2', '19', '29', 'G2018042109335512917', '278.00', '[\"\\/public\\/upload\\/images\\/1524274434484.jpg\",\"\\/public\\/upload\\/images\\/1524274434981.jpg\"]', '1', '你英语', '', '0', '', '1', '1', '2018-04-21 09:33:55', '2018-04-21 09:33:55');
INSERT INTO `ibid_return_goods` VALUES ('15', '1', '21', '32', 'G2018042110323741461', '94.81', '[\"\\/public\\/upload\\/images\\/1524277957745.jpg\"]', '1', '改了啊', '2018-04-21 10:33:24', '1', '2018-04-21 10:33:42', '3', '1', '2018-04-21 10:32:37', '2018-04-21 10:33:42');
INSERT INTO `ibid_return_goods` VALUES ('16', '1', '21', '31', 'G2018042110340030266', '209.19', '[\"\\/public\\/upload\\/images\\/1524278040920.jpg\"]', '1', '吐司', '2018-04-21 10:34:11', '1', '2018-04-21 10:34:14', '3', '1', '2018-04-21 10:34:00', '2018-04-21 10:34:14');
INSERT INTO `ibid_return_goods` VALUES ('17', '2', '22', '35', 'G2018042110362091694', '144.58', '[\"\\/public\\/upload\\/images\\/1524278180217.jpg\"]', '1', '考虑兔兔', '2018-04-21 10:36:35', '0', '', '3', '1', '2018-04-21 10:36:20', '2018-04-21 10:36:35');
INSERT INTO `ibid_return_goods` VALUES ('18', '2', '23', '37', 'G2018042110590570135', '0.01', '[]', '1', '来来来', '2018-04-21 10:59:20', '1', '2018-04-21 10:59:25', '3', '1', '2018-04-21 10:59:05', '2018-04-21 10:59:25');
INSERT INTO `ibid_return_goods` VALUES ('19', '2', '23', '36', 'G2018042111032326085', '0.01', '[]', '1', '明年', '2018-04-21 11:03:32', '1', '2018-04-21 11:03:37', '3', '1', '2018-04-21 11:03:23', '2018-04-21 11:03:37');
INSERT INTO `ibid_return_goods` VALUES ('20', '2', '13', '21', 'G2018042310511979814', '164.00', '[]', '1', 'fgvcv', '2018-04-23 10:52:05', '1', '2018-04-23 10:52:09', '3', '1', '2018-04-23 10:51:19', '2018-04-23 10:52:09');
INSERT INTO `ibid_return_goods` VALUES ('21', '2', '41', '59', 'G2018042315180279880', '0.01', '[\"\\/public\\/upload\\/images\\/1524467882585.jpg\"]', '1', '行吗', '2018-04-23 15:18:20', '1', '2018-04-23 15:18:26', '3', '1', '2018-04-23 15:18:02', '2018-04-23 15:18:26');
INSERT INTO `ibid_return_goods` VALUES ('22', '2', '41', '58', 'G2018042315211224741', '0.01', '[]', '1', '了', '2018-04-23 15:21:24', '1', '2018-04-23 15:21:29', '3', '1', '2018-04-23 15:21:12', '2018-04-23 15:21:29');
INSERT INTO `ibid_return_goods` VALUES ('23', '2', '53', '71', 'G2018042316052546521', '0.01', '[]', '1', '收拾收拾', '2018-04-23 16:05:35', '1', '2018-04-23 16:05:40', '3', '1', '2018-04-23 16:05:25', '2018-04-23 16:05:40');
INSERT INTO `ibid_return_goods` VALUES ('24', '2', '58', '77', 'G2018042317224161462', '120.06', '[]', '1', '旅途', '2018-04-24 10:53:26', '1', '2018-04-24 10:53:29', '3', '1', '2018-04-23 17:22:41', '2018-04-24 10:53:29');
INSERT INTO `ibid_return_goods` VALUES ('25', '1', '96', '116', 'G2018042410282167820', '278.00', '[]', '1', '测试', '2018-04-24 10:28:36', '1', '2018-04-24 10:28:40', '3', '1', '2018-04-24 10:28:21', '2018-04-24 10:28:40');
INSERT INTO `ibid_return_goods` VALUES ('26', '3', '103', '123', 'G2018042410372622518', '0.01', '[]', '1', '测试', '2018-04-24 10:37:48', '1', '2018-04-24 10:37:52', '3', '1', '2018-04-24 10:37:26', '2018-04-24 10:37:52');
INSERT INTO `ibid_return_goods` VALUES ('27', '3', '104', '124', 'G2018042410385433662', '0.01', '[]', '1', '测试', '2018-04-24 10:39:02', '1', '2018-04-24 10:39:09', '3', '1', '2018-04-24 10:38:54', '2018-04-24 10:39:09');
INSERT INTO `ibid_return_goods` VALUES ('28', '2', '114', '134', 'G2018042414165904845', '0.01', '[\"\\/public\\/upload\\/images\\/1524550619153.jpg\"]', '1', '嘻嘻嘻', '2018-04-24 14:17:10', '1', '2018-04-24 14:17:15', '3', '1', '2018-04-24 14:16:59', '2018-04-24 14:17:15');
INSERT INTO `ibid_return_goods` VALUES ('29', '2', '133', '154', 'G2018042414565323849', '126.00', '[]', '1', '天津来咯啦咯啦', '2018-04-24 14:57:38', '0', '', '3', '1', '2018-04-24 14:56:53', '2018-04-24 14:57:38');
INSERT INTO `ibid_return_goods` VALUES ('30', '2', '134', '156', 'G2018042415033235044', '156.00', '[]', '1', '兔兔', '', '0', '', '1', '1', '2018-04-24 15:03:32', '2018-04-24 15:03:32');
INSERT INTO `ibid_return_goods` VALUES ('31', '22', '153', '176', 'G2018042508265196013', '278.00', '[]', '1', '测试', '2018-04-25 08:37:01', '0', '', '3', '1', '2018-04-25 08:26:51', '2018-04-25 08:37:01');
INSERT INTO `ibid_return_goods` VALUES ('32', '22', '153', '175', 'G2018042508362820316', '259.00', '[]', '1', '123', '2018-04-25 08:36:56', '0', '', '3', '1', '2018-04-25 08:36:28', '2018-04-25 08:36:56');
INSERT INTO `ibid_return_goods` VALUES ('33', '22', '154', '179', 'G2018042508392931510', '136.00', '[]', '1', '123', '', '0', '', '1', '1', '2018-04-25 08:39:29', '2018-04-25 08:39:29');
INSERT INTO `ibid_return_goods` VALUES ('34', '22', '156', '183', 'G2018042509073964354', '126.00', '[]', '1', '测试', '', '0', '', '1', '1', '2018-04-25 09:07:39', '2018-04-25 09:07:39');

-- -----------------------------
-- Table structure for `ibid_role_api_powers`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_role_api_powers`;
CREATE TABLE `ibid_role_api_powers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `module` varchar(255) NOT NULL COMMENT '模块名称',
  `create` tinyint(1) DEFAULT '1' COMMENT '新建权限：0禁止1允许',
  `update` tinyint(1) DEFAULT '1' COMMENT '更新权限：0禁止1允许',
  `read` tinyint(1) DEFAULT '1' COMMENT '查看权限：0禁止1允许',
  `delete` tinyint(1) DEFAULT '1' COMMENT '删除权限：0禁止1允许',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_role_api_powers`
-- -----------------------------
INSERT INTO `ibid_role_api_powers` VALUES ('1', '1', 'users', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('2', '1', 'modules', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('3', '1', 'annoncements', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('4', '1', 'articles', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('5', '1', 'rules', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('6', '1', 'roles', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('7', '1', 'params', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('8', '1', 'navs', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('9', '1', 'datadict_keys', '1', '1', '1', '1', '1', '2017-12-11 17:25:09', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('10', '2', 'users', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('11', '2', 'modules', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('12', '2', 'annoncements', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('13', '2', 'articles', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('14', '2', 'rules', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('15', '2', 'roles', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('16', '2', 'params', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('17', '2', 'navs', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('18', '2', 'datadict_keys', '1', '1', '1', '1', '1', '2017-12-11 17:26:01', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('19', '1', 'admins', '1', '1', '1', '1', '1', '2017-12-11 21:30:18', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('20', '1', 'article_types', '1', '1', '1', '1', '1', '2017-12-11 22:03:22', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('21', '1', 'visit_logs', '1', '1', '1', '1', '1', '2017-12-12 09:42:14', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('22', '1', 'advertisements', '1', '1', '1', '1', '1', '2017-12-12 15:33:24', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('23', '1', 'friendly_links', '1', '1', '1', '1', '1', '2017-12-12 16:53:12', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('24', '1', 'dds', '1', '1', '1', '1', '1', '2017-12-12 20:42:10', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('25', '1', 'data_counts', '1', '1', '1', '1', '1', '2017-12-19 18:15:37', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('26', '1', 'resources', '1', '1', '1', '1', '1', '2017-12-20 09:55:41', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('27', '1', 'banners', '1', '1', '1', '1', '1', '2017-12-20 10:10:03', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('28', '1', 'courses', '1', '1', '1', '1', '1', '2017-12-20 15:51:08', '2017-12-20 17:29:54');
INSERT INTO `ibid_role_api_powers` VALUES ('29', '1', 'course_types', '1', '1', '1', '1', '1', '2017-12-20 17:13:09', '2017-12-20 17:29:54');
INSERT INTO `ibid_role_api_powers` VALUES ('30', '1', 'course_boxs', '1', '1', '1', '1', '1', '2017-12-20 17:29:54', '2017-12-20 17:29:54');
INSERT INTO `ibid_role_api_powers` VALUES ('31', '1', 'systems', '1', '1', '1', '1', '1', '2017-12-20 21:29:28', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('32', '1', 'shops', '1', '1', '1', '1', '1', '2017-12-21 15:43:58', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('33', '1', 'coupons', '1', '1', '1', '1', '1', '2017-12-23 14:01:48', '2018-03-10 09:59:10');
INSERT INTO `ibid_role_api_powers` VALUES ('34', '1', 'orders', '1', '1', '1', '1', '1', '2017-12-25 10:32:21', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('35', '3', 'users', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('36', '3', 'modules', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('37', '3', 'annoncements', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('38', '3', 'admins', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('39', '3', 'article_types', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('40', '3', 'articles', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('41', '3', 'rules', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('42', '3', 'roles', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('43', '3', 'params', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('44', '3', 'navs', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('45', '3', 'datadict_keys', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('46', '3', 'visit_logs', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('47', '3', 'advertisements', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('48', '3', 'friendly_links', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('49', '3', 'dds', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('50', '3', 'data_counts', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('51', '3', 'resources', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('52', '3', 'banners', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('53', '3', 'systems', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('54', '3', 'shops', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('55', '3', 'coupons', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('56', '3', 'orders', '1', '1', '1', '1', '1', '2017-12-25 10:56:02', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('57', '1', 'addresses', '1', '1', '1', '1', '1', '2017-12-25 11:31:53', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('58', '3', 'addresses', '1', '1', '1', '1', '1', '2017-12-25 11:32:06', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('59', '3', 'carts', '1', '1', '1', '1', '1', '2017-12-25 11:45:43', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('60', '3', 'goods', '1', '1', '1', '1', '1', '2017-12-25 14:21:28', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('61', '3', 'goods_comments', '1', '1', '1', '1', '1', '2017-12-25 14:21:28', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('62', '3', 'goods_collections', '1', '1', '1', '1', '1', '2017-12-25 14:21:28', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('63', '1', 'carts', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('64', '1', 'goods', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('65', '1', 'goods_comments', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('66', '1', 'goods_collections', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('67', '1', 'goods_cates', '1', '1', '1', '1', '1', '2017-12-25 14:49:33', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('68', '2', 'admins', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('69', '2', 'article_types', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('70', '2', 'visit_logs', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('71', '2', 'advertisements', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('72', '2', 'friendly_links', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('73', '2', 'dds', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('74', '2', 'data_counts', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('75', '2', 'resources', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('76', '2', 'banners', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('77', '2', 'systems', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('78', '2', 'shops', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('79', '2', 'coupons', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('80', '2', 'orders', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('81', '2', 'addresses', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('82', '2', 'carts', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('83', '2', 'goods', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('84', '2', 'goods_comments', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('85', '2', 'goods_collections', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('86', '2', 'goods_cates', '1', '1', '1', '1', '1', '2017-12-25 14:49:39', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('87', '3', 'goods_cates', '1', '1', '1', '1', '1', '2017-12-25 14:49:45', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('88', '1', 'querys', '1', '1', '1', '1', '1', '2017-12-25 15:24:19', '2017-12-25 15:24:19');
INSERT INTO `ibid_role_api_powers` VALUES ('89', '2', 'querys', '1', '1', '1', '1', '1', '2017-12-25 15:24:25', '2017-12-25 15:24:25');
INSERT INTO `ibid_role_api_powers` VALUES ('90', '3', 'querys', '1', '1', '1', '1', '1', '2017-12-25 15:24:32', '2017-12-25 15:24:32');
INSERT INTO `ibid_role_api_powers` VALUES ('91', '3', 'query', '1', '1', '1', '1', '1', '2017-12-25 15:44:11', '2017-12-25 16:14:08');
INSERT INTO `ibid_role_api_powers` VALUES ('92', '2', 'query', '1', '1', '1', '1', '1', '2017-12-25 15:44:17', '2018-01-10 19:36:05');
INSERT INTO `ibid_role_api_powers` VALUES ('93', '1', 'query', '1', '1', '1', '1', '1', '2017-12-25 15:44:25', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('94', '1', 'commissions', '1', '1', '1', '1', '1', '2017-12-27 17:51:46', '2017-12-27 17:51:46');
INSERT INTO `ibid_role_api_powers` VALUES ('95', '1', 'commission_levels', '1', '1', '1', '1', '1', '2017-12-27 17:53:11', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('96', '1', 'commission_systems', '1', '1', '1', '1', '1', '2017-12-27 17:54:11', '2017-12-28 09:31:15');
INSERT INTO `ibid_role_api_powers` VALUES ('97', '3', 'commission_levels', '1', '1', '1', '1', '1', '2018-01-05 09:32:48', '2018-01-05 10:01:18');
INSERT INTO `ibid_role_api_powers` VALUES ('98', '1', 'commission_applys', '1', '1', '1', '1', '1', '2018-01-11 11:55:06', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('99', '1', 'coupon_types', '1', '1', '1', '1', '1', '2018-01-11 11:55:46', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('100', '1', 'asstes_supervise', '1', '1', '1', '1', '1', '2018-01-15 14:03:31', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('101', '1', 'feedbacks', '1', '1', '1', '1', '1', '2018-02-09 10:47:49', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('102', '1', 'basics', '1', '1', '1', '1', '1', '2018-02-22 10:21:31', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('103', '1', 'guides', '1', '1', '1', '1', '1', '2018-02-22 11:52:38', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('104', '1', 'spec_models', '1', '1', '1', '1', '1', '2018-02-23 18:41:32', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('105', '1', 'specs', '1', '1', '1', '1', '1', '2018-02-23 18:41:32', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('106', '1', 'attr_models', '1', '1', '1', '1', '1', '2018-02-25 11:35:53', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('107', '1', 'attrs', '1', '1', '1', '1', '1', '2018-02-25 11:35:53', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('108', '1', 'transport_models', '1', '1', '1', '1', '1', '2018-02-28 08:49:41', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('109', '1', 'qiniu', '1', '1', '1', '1', '1', '2018-03-08 13:50:42', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('110', '1', 'databackup', '1', '1', '1', '1', '1', '2018-03-09 09:34:33', '2018-03-10 09:59:11');
INSERT INTO `ibid_role_api_powers` VALUES ('111', '1', 'email', '1', '1', '1', '1', '1', '2018-03-10 09:59:11', '2018-03-10 09:59:11');

-- -----------------------------
-- Table structure for `ibid_role_nav_powers`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_role_nav_powers`;
CREATE TABLE `ibid_role_nav_powers` (
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `nav_ids` text NOT NULL COMMENT '菜单IDs',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_role_nav_powers`
-- -----------------------------
INSERT INTO `ibid_role_nav_powers` VALUES ('2', '[91,92,93,36,94,1,112,75,33,2,43,102,101,100,47,46,45,44,48,49,76,77,78,130,90,37,18,19,38,39,42,32,21,22,29,70,27,23,24,34,103,105,104]', '1', '2018-04-04 10:57:01', '2018-04-19 10:43:29');
INSERT INTO `ibid_role_nav_powers` VALUES ('3', '[91,92,93,36,94,1,129,128,113,112,75,33,2,114,119,118,117,116,115,43,102,101,100,47,46,45,44,48,49,76,77,78,130,90,121,127,125,124,122,37,18,19,38,39,42,32,21,22,29,70,27,23,24,34,103,105,126,104]', '1', '2018-04-04 10:57:34', '2018-04-19 10:43:16');
INSERT INTO `ibid_role_nav_powers` VALUES ('4', '[]', '1', '2018-04-05 17:57:18', '2018-04-05 17:57:18');

-- -----------------------------
-- Table structure for `ibid_roles`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_roles`;
CREATE TABLE `ibid_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `intro` varchar(255) DEFAULT NULL COMMENT '角色简介',
  `type` text NOT NULL COMMENT 'user用户类角色admin管理员角色',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_roles`
-- -----------------------------
INSERT INTO `ibid_roles` VALUES ('1', '会员', '会员通用角色', 'user', '1', '2018-04-04 10:55:37', '2018-04-04 10:55:37');
INSERT INTO `ibid_roles` VALUES ('2', '普通管理员', '普通管理员发', 'admin', '1', '2018-04-04 10:57:01', '2018-04-04 10:57:01');
INSERT INTO `ibid_roles` VALUES ('3', '超级管理员', '超级管理员', 'admin', '1', '2018-04-04 10:57:34', '2018-04-04 10:57:34');
INSERT INTO `ibid_roles` VALUES ('4', '运营管理员', '运营管理员的介绍', 'admin', '0', '2018-04-05 17:57:18', '2018-04-05 17:57:18');

-- -----------------------------
-- Table structure for `ibid_rules`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_rules`;
CREATE TABLE `ibid_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '规则分类',
  `title` varchar(255) NOT NULL COMMENT '规则标题',
  `thum` varchar(255) DEFAULT NULL COMMENT '规则缩略图',
  `intro` text COMMENT '规则简介',
  `content` text COMMENT '规则详情',
  `author` varchar(50) DEFAULT NULL COMMENT '文章作者',
  `imgs` text COMMENT '文章的图片集',
  `audio_url` text COMMENT '音频链接',
  `video_url` text COMMENT '视频链接',
  `click_num` bigint(20) DEFAULT '0' COMMENT '文章的点击量',
  `status` tinyint(1) DEFAULT '1' COMMENT '1上线2下线',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ibid_score_logs`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_score_logs`;
CREATE TABLE `ibid_score_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `change_type` varchar(255) NOT NULL COMMENT '积分变动类别',
  `change_num` decimal(10,2) NOT NULL COMMENT '积分变动数量',
  `intro` text NOT NULL COMMENT '积分日志简介',
  `desc` text COMMENT '积分日志详情',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_score_logs`
-- -----------------------------
INSERT INTO `ibid_score_logs` VALUES ('1', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 15:58:46', '1', '2018-04-17 15:58:46', '2018-04-17 15:58:46');
INSERT INTO `ibid_score_logs` VALUES ('2', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 16:14:28', '1', '2018-04-17 16:14:28', '2018-04-17 16:14:28');
INSERT INTO `ibid_score_logs` VALUES ('3', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 16:22:55', '1', '2018-04-17 16:22:55', '2018-04-17 16:22:55');
INSERT INTO `ibid_score_logs` VALUES ('4', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 16:48:34', '1', '2018-04-17 16:48:34', '2018-04-17 16:48:34');
INSERT INTO `ibid_score_logs` VALUES ('5', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 16:48:51', '1', '2018-04-17 16:48:51', '2018-04-17 16:48:51');
INSERT INTO `ibid_score_logs` VALUES ('6', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 16:54:26', '1', '2018-04-17 16:54:26', '2018-04-17 16:54:26');
INSERT INTO `ibid_score_logs` VALUES ('7', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 17:43:22', '1', '2018-04-17 17:43:22', '2018-04-17 17:43:22');
INSERT INTO `ibid_score_logs` VALUES ('8', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 17:57:50', '1', '2018-04-17 17:57:50', '2018-04-17 17:57:50');
INSERT INTO `ibid_score_logs` VALUES ('9', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 17:57:59', '1', '2018-04-17 17:57:59', '2018-04-17 17:57:59');
INSERT INTO `ibid_score_logs` VALUES ('10', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 17:58:10', '1', '2018-04-17 17:58:10', '2018-04-17 17:58:10');
INSERT INTO `ibid_score_logs` VALUES ('11', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 17:58:21', '1', '2018-04-17 17:58:21', '2018-04-17 17:58:21');
INSERT INTO `ibid_score_logs` VALUES ('12', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-17 18:08:00', '1', '2018-04-17 18:08:00', '2018-04-17 18:08:00');
INSERT INTO `ibid_score_logs` VALUES ('13', '4', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:10:30', '1', '2018-04-18 09:10:30', '2018-04-18 09:10:30');
INSERT INTO `ibid_score_logs` VALUES ('14', '5', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:14:16', '1', '2018-04-18 09:14:16', '2018-04-18 09:14:16');
INSERT INTO `ibid_score_logs` VALUES ('15', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:16:31', '1', '2018-04-18 09:16:31', '2018-04-18 09:16:31');
INSERT INTO `ibid_score_logs` VALUES ('16', '4', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:17:42', '1', '2018-04-18 09:17:42', '2018-04-18 09:17:42');
INSERT INTO `ibid_score_logs` VALUES ('17', '6', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:34:43', '1', '2018-04-18 09:34:43', '2018-04-18 09:34:43');
INSERT INTO `ibid_score_logs` VALUES ('18', '5', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:36:34', '1', '2018-04-18 09:36:34', '2018-04-18 09:36:34');
INSERT INTO `ibid_score_logs` VALUES ('19', '5', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:37:38', '1', '2018-04-18 09:37:38', '2018-04-18 09:37:38');
INSERT INTO `ibid_score_logs` VALUES ('20', '7', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:38:47', '1', '2018-04-18 09:38:47', '2018-04-18 09:38:47');
INSERT INTO `ibid_score_logs` VALUES ('21', '6', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:47:52', '1', '2018-04-18 09:47:52', '2018-04-18 09:47:52');
INSERT INTO `ibid_score_logs` VALUES ('22', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 09:49:21', '1', '2018-04-18 09:49:21', '2018-04-18 09:49:21');
INSERT INTO `ibid_score_logs` VALUES ('23', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 10:05:02', '1', '2018-04-18 10:05:02', '2018-04-18 10:05:02');
INSERT INTO `ibid_score_logs` VALUES ('24', '8', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 10:08:34', '1', '2018-04-18 10:08:34', '2018-04-18 10:08:34');
INSERT INTO `ibid_score_logs` VALUES ('25', '8', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 10:14:59', '1', '2018-04-18 10:14:59', '2018-04-18 10:14:59');
INSERT INTO `ibid_score_logs` VALUES ('26', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 10:16:12', '1', '2018-04-18 10:16:12', '2018-04-18 10:16:12');
INSERT INTO `ibid_score_logs` VALUES ('27', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 10:22:04', '1', '2018-04-18 10:22:04', '2018-04-18 10:22:04');
INSERT INTO `ibid_score_logs` VALUES ('28', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 10:29:02', '1', '2018-04-18 10:29:02', '2018-04-18 10:29:02');
INSERT INTO `ibid_score_logs` VALUES ('29', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 10:35:18', '1', '2018-04-18 10:35:18', '2018-04-18 10:35:18');
INSERT INTO `ibid_score_logs` VALUES ('30', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 10:35:49', '1', '2018-04-18 10:35:49', '2018-04-18 10:35:49');
INSERT INTO `ibid_score_logs` VALUES ('31', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 10:47:45', '1', '2018-04-18 10:47:45', '2018-04-18 10:47:45');
INSERT INTO `ibid_score_logs` VALUES ('32', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 11:58:20', '1', '2018-04-18 11:58:20', '2018-04-18 11:58:20');
INSERT INTO `ibid_score_logs` VALUES ('33', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 11:58:24', '1', '2018-04-18 11:58:24', '2018-04-18 11:58:24');
INSERT INTO `ibid_score_logs` VALUES ('34', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 13:38:30', '1', '2018-04-18 13:38:30', '2018-04-18 13:38:30');
INSERT INTO `ibid_score_logs` VALUES ('35', '4', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 13:39:08', '1', '2018-04-18 13:39:08', '2018-04-18 13:39:08');
INSERT INTO `ibid_score_logs` VALUES ('36', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 13:52:55', '1', '2018-04-18 13:52:55', '2018-04-18 13:52:55');
INSERT INTO `ibid_score_logs` VALUES ('37', '11', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 13:59:33', '1', '2018-04-18 13:59:33', '2018-04-18 13:59:33');
INSERT INTO `ibid_score_logs` VALUES ('38', '11', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 14:00:33', '1', '2018-04-18 14:00:33', '2018-04-18 14:00:33');
INSERT INTO `ibid_score_logs` VALUES ('39', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 14:47:30', '1', '2018-04-18 14:47:30', '2018-04-18 14:47:30');
INSERT INTO `ibid_score_logs` VALUES ('40', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 14:51:10', '1', '2018-04-18 14:51:10', '2018-04-18 14:51:10');
INSERT INTO `ibid_score_logs` VALUES ('41', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 14:54:35', '1', '2018-04-18 14:54:35', '2018-04-18 14:54:35');
INSERT INTO `ibid_score_logs` VALUES ('42', '12', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 15:15:01', '1', '2018-04-18 15:15:01', '2018-04-18 15:15:01');
INSERT INTO `ibid_score_logs` VALUES ('43', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 15:19:49', '1', '2018-04-18 15:19:49', '2018-04-18 15:19:49');
INSERT INTO `ibid_score_logs` VALUES ('44', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 15:45:16', '1', '2018-04-18 15:45:16', '2018-04-18 15:45:16');
INSERT INTO `ibid_score_logs` VALUES ('45', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 15:48:58', '1', '2018-04-18 15:48:58', '2018-04-18 15:48:58');
INSERT INTO `ibid_score_logs` VALUES ('46', '13', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 15:50:30', '1', '2018-04-18 15:50:30', '2018-04-18 15:50:30');
INSERT INTO `ibid_score_logs` VALUES ('47', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 15:58:10', '1', '2018-04-18 15:58:10', '2018-04-18 15:58:10');
INSERT INTO `ibid_score_logs` VALUES ('48', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 16:24:30', '1', '2018-04-18 16:24:30', '2018-04-18 16:24:30');
INSERT INTO `ibid_score_logs` VALUES ('49', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-18 21:05:36', '1', '2018-04-18 21:05:36', '2018-04-18 21:05:36');
INSERT INTO `ibid_score_logs` VALUES ('50', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 09:29:05', '1', '2018-04-19 09:29:05', '2018-04-19 09:29:05');
INSERT INTO `ibid_score_logs` VALUES ('51', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 09:38:39', '1', '2018-04-19 09:38:39', '2018-04-19 09:38:39');
INSERT INTO `ibid_score_logs` VALUES ('52', '14', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 09:39:25', '1', '2018-04-19 09:39:25', '2018-04-19 09:39:25');
INSERT INTO `ibid_score_logs` VALUES ('53', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 10:30:17', '1', '2018-04-19 10:30:17', '2018-04-19 10:30:17');
INSERT INTO `ibid_score_logs` VALUES ('54', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 10:31:14', '1', '2018-04-19 10:31:14', '2018-04-19 10:31:14');
INSERT INTO `ibid_score_logs` VALUES ('55', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 10:37:47', '1', '2018-04-19 10:37:47', '2018-04-19 10:37:47');
INSERT INTO `ibid_score_logs` VALUES ('56', '11', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 10:57:06', '1', '2018-04-19 10:57:06', '2018-04-19 10:57:06');
INSERT INTO `ibid_score_logs` VALUES ('57', '11', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 11:02:27', '1', '2018-04-19 11:02:27', '2018-04-19 11:02:27');
INSERT INTO `ibid_score_logs` VALUES ('58', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 11:47:48', '1', '2018-04-19 11:47:48', '2018-04-19 11:47:48');
INSERT INTO `ibid_score_logs` VALUES ('59', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 11:51:55', '1', '2018-04-19 11:51:55', '2018-04-19 11:51:55');
INSERT INTO `ibid_score_logs` VALUES ('60', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 11:58:27', '1', '2018-04-19 11:58:27', '2018-04-19 11:58:27');
INSERT INTO `ibid_score_logs` VALUES ('61', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 14:17:24', '1', '2018-04-19 14:17:24', '2018-04-19 14:17:24');
INSERT INTO `ibid_score_logs` VALUES ('62', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 14:17:25', '1', '2018-04-19 14:17:25', '2018-04-19 14:17:25');
INSERT INTO `ibid_score_logs` VALUES ('63', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 14:19:33', '1', '2018-04-19 14:19:33', '2018-04-19 14:19:33');
INSERT INTO `ibid_score_logs` VALUES ('64', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 14:48:17', '1', '2018-04-19 14:48:17', '2018-04-19 14:48:17');
INSERT INTO `ibid_score_logs` VALUES ('65', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 15:47:51', '1', '2018-04-19 15:47:51', '2018-04-19 15:47:51');
INSERT INTO `ibid_score_logs` VALUES ('66', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 15:57:26', '1', '2018-04-19 15:57:26', '2018-04-19 15:57:26');
INSERT INTO `ibid_score_logs` VALUES ('67', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 15:59:30', '1', '2018-04-19 15:59:30', '2018-04-19 15:59:30');
INSERT INTO `ibid_score_logs` VALUES ('68', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 19:41:54', '1', '2018-04-19 19:41:54', '2018-04-19 19:41:54');
INSERT INTO `ibid_score_logs` VALUES ('69', '16', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 22:30:46', '1', '2018-04-19 22:30:46', '2018-04-19 22:30:46');
INSERT INTO `ibid_score_logs` VALUES ('70', '17', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 22:31:34', '1', '2018-04-19 22:31:34', '2018-04-19 22:31:34');
INSERT INTO `ibid_score_logs` VALUES ('71', '18', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 22:32:08', '1', '2018-04-19 22:32:08', '2018-04-19 22:32:08');
INSERT INTO `ibid_score_logs` VALUES ('72', '19', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 22:32:31', '1', '2018-04-19 22:32:31', '2018-04-19 22:32:31');
INSERT INTO `ibid_score_logs` VALUES ('73', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 22:51:06', '1', '2018-04-19 22:51:06', '2018-04-19 22:51:06');
INSERT INTO `ibid_score_logs` VALUES ('74', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 22:51:28', '1', '2018-04-19 22:51:28', '2018-04-19 22:51:28');
INSERT INTO `ibid_score_logs` VALUES ('75', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 22:51:29', '1', '2018-04-19 22:51:29', '2018-04-19 22:51:29');
INSERT INTO `ibid_score_logs` VALUES ('76', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-19 22:51:30', '1', '2018-04-19 22:51:30', '2018-04-19 22:51:30');
INSERT INTO `ibid_score_logs` VALUES ('77', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 09:04:50', '1', '2018-04-20 09:04:50', '2018-04-20 09:04:50');
INSERT INTO `ibid_score_logs` VALUES ('78', '4', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 09:17:37', '1', '2018-04-20 09:17:37', '2018-04-20 09:17:37');
INSERT INTO `ibid_score_logs` VALUES ('79', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 09:31:32', '1', '2018-04-20 09:31:32', '2018-04-20 09:31:32');
INSERT INTO `ibid_score_logs` VALUES ('80', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 09:40:40', '1', '2018-04-20 09:40:40', '2018-04-20 09:40:40');
INSERT INTO `ibid_score_logs` VALUES ('81', '4', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 09:40:01', '1', '2018-04-20 09:40:01', '2018-04-20 09:40:01');
INSERT INTO `ibid_score_logs` VALUES ('82', '20', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 09:43:18', '1', '2018-04-20 09:43:18', '2018-04-20 09:43:18');
INSERT INTO `ibid_score_logs` VALUES ('83', '16', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 09:44:10', '1', '2018-04-20 09:44:10', '2018-04-20 09:44:10');
INSERT INTO `ibid_score_logs` VALUES ('84', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 10:19:04', '1', '2018-04-20 10:19:04', '2018-04-20 10:19:04');
INSERT INTO `ibid_score_logs` VALUES ('85', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 10:30:38', '1', '2018-04-20 10:30:38', '2018-04-20 10:30:38');
INSERT INTO `ibid_score_logs` VALUES ('86', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 10:33:13', '1', '2018-04-20 10:33:13', '2018-04-20 10:33:13');
INSERT INTO `ibid_score_logs` VALUES ('87', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 13:40:46', '1', '2018-04-20 13:40:46', '2018-04-20 13:40:46');
INSERT INTO `ibid_score_logs` VALUES ('88', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 13:57:19', '1', '2018-04-20 13:57:19', '2018-04-20 13:57:19');
INSERT INTO `ibid_score_logs` VALUES ('89', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 14:02:44', '1', '2018-04-20 14:02:44', '2018-04-20 14:02:44');
INSERT INTO `ibid_score_logs` VALUES ('90', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 14:10:29', '1', '2018-04-20 14:10:29', '2018-04-20 14:10:29');
INSERT INTO `ibid_score_logs` VALUES ('91', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 14:10:30', '1', '2018-04-20 14:10:30', '2018-04-20 14:10:30');
INSERT INTO `ibid_score_logs` VALUES ('92', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 14:34:19', '1', '2018-04-20 14:34:19', '2018-04-20 14:34:19');
INSERT INTO `ibid_score_logs` VALUES ('93', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 15:50:48', '1', '2018-04-20 15:50:48', '2018-04-20 15:50:48');
INSERT INTO `ibid_score_logs` VALUES ('94', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 15:51:33', '1', '2018-04-20 15:51:33', '2018-04-20 15:51:33');
INSERT INTO `ibid_score_logs` VALUES ('95', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 16:11:53', '1', '2018-04-20 16:11:53', '2018-04-20 16:11:53');
INSERT INTO `ibid_score_logs` VALUES ('96', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 16:49:53', '1', '2018-04-20 16:49:53', '2018-04-20 16:49:53');
INSERT INTO `ibid_score_logs` VALUES ('97', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 18:01:31', '1', '2018-04-20 18:01:31', '2018-04-20 18:01:31');
INSERT INTO `ibid_score_logs` VALUES ('98', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 18:01:50', '1', '2018-04-20 18:01:50', '2018-04-20 18:01:50');
INSERT INTO `ibid_score_logs` VALUES ('99', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 18:12:38', '1', '2018-04-20 18:12:38', '2018-04-20 18:12:38');
INSERT INTO `ibid_score_logs` VALUES ('100', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 18:12:39', '1', '2018-04-20 18:12:39', '2018-04-20 18:12:39');
INSERT INTO `ibid_score_logs` VALUES ('101', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-20 19:59:30', '1', '2018-04-20 19:59:30', '2018-04-20 19:59:30');
INSERT INTO `ibid_score_logs` VALUES ('102', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 08:57:41', '1', '2018-04-21 08:57:41', '2018-04-21 08:57:41');
INSERT INTO `ibid_score_logs` VALUES ('103', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 09:05:12', '1', '2018-04-21 09:05:12', '2018-04-21 09:05:12');
INSERT INTO `ibid_score_logs` VALUES ('104', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 09:15:41', '1', '2018-04-21 09:15:41', '2018-04-21 09:15:41');
INSERT INTO `ibid_score_logs` VALUES ('105', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 09:11:45', '1', '2018-04-21 09:11:45', '2018-04-21 09:11:45');
INSERT INTO `ibid_score_logs` VALUES ('106', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 09:30:20', '1', '2018-04-21 09:30:20', '2018-04-21 09:30:20');
INSERT INTO `ibid_score_logs` VALUES ('107', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 09:33:24', '1', '2018-04-21 09:33:24', '2018-04-21 09:33:24');
INSERT INTO `ibid_score_logs` VALUES ('108', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 09:48:51', '1', '2018-04-21 09:48:51', '2018-04-21 09:48:51');
INSERT INTO `ibid_score_logs` VALUES ('109', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 09:50:06', '1', '2018-04-21 09:50:06', '2018-04-21 09:50:06');
INSERT INTO `ibid_score_logs` VALUES ('110', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 10:36:04', '1', '2018-04-21 10:36:04', '2018-04-21 10:36:04');
INSERT INTO `ibid_score_logs` VALUES ('111', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 10:47:56', '1', '2018-04-21 10:47:56', '2018-04-21 10:47:56');
INSERT INTO `ibid_score_logs` VALUES ('112', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 11:42:51', '1', '2018-04-21 11:42:51', '2018-04-21 11:42:51');
INSERT INTO `ibid_score_logs` VALUES ('113', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 11:52:33', '1', '2018-04-21 11:52:33', '2018-04-21 11:52:33');
INSERT INTO `ibid_score_logs` VALUES ('114', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 11:54:56', '1', '2018-04-21 11:54:56', '2018-04-21 11:54:56');
INSERT INTO `ibid_score_logs` VALUES ('115', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 14:23:17', '1', '2018-04-21 14:23:17', '2018-04-21 14:23:17');
INSERT INTO `ibid_score_logs` VALUES ('116', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 14:45:21', '1', '2018-04-21 14:45:21', '2018-04-21 14:45:21');
INSERT INTO `ibid_score_logs` VALUES ('117', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 15:10:05', '1', '2018-04-21 15:10:05', '2018-04-21 15:10:05');
INSERT INTO `ibid_score_logs` VALUES ('118', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 15:54:05', '1', '2018-04-21 15:54:05', '2018-04-21 15:54:05');
INSERT INTO `ibid_score_logs` VALUES ('119', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 15:59:42', '1', '2018-04-21 15:59:42', '2018-04-21 15:59:42');
INSERT INTO `ibid_score_logs` VALUES ('120', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 17:01:14', '1', '2018-04-21 17:01:14', '2018-04-21 17:01:14');
INSERT INTO `ibid_score_logs` VALUES ('121', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 17:59:13', '1', '2018-04-21 17:59:13', '2018-04-21 17:59:13');
INSERT INTO `ibid_score_logs` VALUES ('122', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 18:48:42', '1', '2018-04-21 18:48:42', '2018-04-21 18:48:42');
INSERT INTO `ibid_score_logs` VALUES ('123', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 19:56:26', '1', '2018-04-21 19:56:26', '2018-04-21 19:56:26');
INSERT INTO `ibid_score_logs` VALUES ('124', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 19:57:37', '1', '2018-04-21 19:57:37', '2018-04-21 19:57:37');
INSERT INTO `ibid_score_logs` VALUES ('125', '13', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 20:00:58', '1', '2018-04-21 20:00:58', '2018-04-21 20:00:58');
INSERT INTO `ibid_score_logs` VALUES ('126', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 20:04:35', '1', '2018-04-21 20:04:35', '2018-04-21 20:04:35');
INSERT INTO `ibid_score_logs` VALUES ('127', '13', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 20:04:02', '1', '2018-04-21 20:04:02', '2018-04-21 20:04:02');
INSERT INTO `ibid_score_logs` VALUES ('128', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 20:06:16', '1', '2018-04-21 20:06:16', '2018-04-21 20:06:16');
INSERT INTO `ibid_score_logs` VALUES ('129', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 20:28:39', '1', '2018-04-21 20:28:39', '2018-04-21 20:28:39');
INSERT INTO `ibid_score_logs` VALUES ('130', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 20:45:54', '1', '2018-04-21 20:45:54', '2018-04-21 20:45:54');
INSERT INTO `ibid_score_logs` VALUES ('131', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 22:58:36', '1', '2018-04-21 22:58:36', '2018-04-21 22:58:36');
INSERT INTO `ibid_score_logs` VALUES ('132', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 23:17:23', '1', '2018-04-21 23:17:23', '2018-04-21 23:17:23');
INSERT INTO `ibid_score_logs` VALUES ('133', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 23:17:32', '1', '2018-04-21 23:17:32', '2018-04-21 23:17:32');
INSERT INTO `ibid_score_logs` VALUES ('134', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 23:19:04', '1', '2018-04-21 23:19:04', '2018-04-21 23:19:04');
INSERT INTO `ibid_score_logs` VALUES ('135', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 23:21:36', '1', '2018-04-21 23:21:36', '2018-04-21 23:21:36');
INSERT INTO `ibid_score_logs` VALUES ('136', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 23:31:44', '1', '2018-04-21 23:31:44', '2018-04-21 23:31:44');
INSERT INTO `ibid_score_logs` VALUES ('137', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 23:33:30', '1', '2018-04-21 23:33:30', '2018-04-21 23:33:30');
INSERT INTO `ibid_score_logs` VALUES ('138', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 23:33:46', '1', '2018-04-21 23:33:46', '2018-04-21 23:33:46');
INSERT INTO `ibid_score_logs` VALUES ('139', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 23:34:41', '1', '2018-04-21 23:34:41', '2018-04-21 23:34:41');
INSERT INTO `ibid_score_logs` VALUES ('140', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-21 23:35:42', '1', '2018-04-21 23:35:42', '2018-04-21 23:35:42');
INSERT INTO `ibid_score_logs` VALUES ('141', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 10:35:04', '1', '2018-04-22 10:35:04', '2018-04-22 10:35:04');
INSERT INTO `ibid_score_logs` VALUES ('142', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 11:44:03', '1', '2018-04-22 11:44:03', '2018-04-22 11:44:03');
INSERT INTO `ibid_score_logs` VALUES ('143', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 11:55:12', '1', '2018-04-22 11:55:12', '2018-04-22 11:55:12');
INSERT INTO `ibid_score_logs` VALUES ('144', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 20:25:30', '1', '2018-04-22 20:25:30', '2018-04-22 20:25:30');
INSERT INTO `ibid_score_logs` VALUES ('145', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 20:25:32', '1', '2018-04-22 20:25:32', '2018-04-22 20:25:32');
INSERT INTO `ibid_score_logs` VALUES ('146', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 20:40:36', '1', '2018-04-22 20:40:36', '2018-04-22 20:40:36');
INSERT INTO `ibid_score_logs` VALUES ('147', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 21:45:32', '1', '2018-04-22 21:45:32', '2018-04-22 21:45:32');
INSERT INTO `ibid_score_logs` VALUES ('148', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 21:54:21', '1', '2018-04-22 21:54:21', '2018-04-22 21:54:21');
INSERT INTO `ibid_score_logs` VALUES ('149', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 21:54:27', '1', '2018-04-22 21:54:27', '2018-04-22 21:54:27');
INSERT INTO `ibid_score_logs` VALUES ('150', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-22 21:54:33', '1', '2018-04-22 21:54:33', '2018-04-22 21:54:33');
INSERT INTO `ibid_score_logs` VALUES ('151', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 09:04:41', '1', '2018-04-23 09:04:41', '2018-04-23 09:04:41');
INSERT INTO `ibid_score_logs` VALUES ('152', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 09:38:11', '1', '2018-04-23 09:38:11', '2018-04-23 09:38:11');
INSERT INTO `ibid_score_logs` VALUES ('153', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 09:38:57', '1', '2018-04-23 09:38:57', '2018-04-23 09:38:57');
INSERT INTO `ibid_score_logs` VALUES ('154', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 09:41:15', '1', '2018-04-23 09:41:15', '2018-04-23 09:41:15');
INSERT INTO `ibid_score_logs` VALUES ('155', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 09:43:26', '1', '2018-04-23 09:43:26', '2018-04-23 09:43:26');
INSERT INTO `ibid_score_logs` VALUES ('156', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 09:47:56', '1', '2018-04-23 09:47:56', '2018-04-23 09:47:56');
INSERT INTO `ibid_score_logs` VALUES ('157', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 10:13:46', '1', '2018-04-23 10:13:46', '2018-04-23 10:13:46');
INSERT INTO `ibid_score_logs` VALUES ('158', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 10:28:09', '1', '2018-04-23 10:28:09', '2018-04-23 10:28:09');
INSERT INTO `ibid_score_logs` VALUES ('159', '14', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 10:56:12', '1', '2018-04-23 10:56:12', '2018-04-23 10:56:12');
INSERT INTO `ibid_score_logs` VALUES ('160', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 10:57:05', '1', '2018-04-23 10:57:05', '2018-04-23 10:57:05');
INSERT INTO `ibid_score_logs` VALUES ('161', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 11:03:54', '1', '2018-04-23 11:03:54', '2018-04-23 11:03:54');
INSERT INTO `ibid_score_logs` VALUES ('162', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 11:57:15', '1', '2018-04-23 11:57:15', '2018-04-23 11:57:15');
INSERT INTO `ibid_score_logs` VALUES ('163', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 11:58:52', '1', '2018-04-23 11:58:52', '2018-04-23 11:58:52');
INSERT INTO `ibid_score_logs` VALUES ('164', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 13:45:58', '1', '2018-04-23 13:45:58', '2018-04-23 13:45:58');
INSERT INTO `ibid_score_logs` VALUES ('165', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 13:51:50', '1', '2018-04-23 13:51:50', '2018-04-23 13:51:50');
INSERT INTO `ibid_score_logs` VALUES ('166', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 13:57:32', '1', '2018-04-23 13:57:32', '2018-04-23 13:57:32');
INSERT INTO `ibid_score_logs` VALUES ('167', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 14:19:15', '1', '2018-04-23 14:19:15', '2018-04-23 14:19:15');
INSERT INTO `ibid_score_logs` VALUES ('168', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 14:55:19', '1', '2018-04-23 14:55:19', '2018-04-23 14:55:19');
INSERT INTO `ibid_score_logs` VALUES ('169', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 15:06:03', '1', '2018-04-23 15:06:03', '2018-04-23 15:06:03');
INSERT INTO `ibid_score_logs` VALUES ('170', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 15:11:47', '1', '2018-04-23 15:11:47', '2018-04-23 15:11:47');
INSERT INTO `ibid_score_logs` VALUES ('171', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 15:29:28', '1', '2018-04-23 15:29:28', '2018-04-23 15:29:28');
INSERT INTO `ibid_score_logs` VALUES ('172', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 15:29:38', '1', '2018-04-23 15:29:38', '2018-04-23 15:29:38');
INSERT INTO `ibid_score_logs` VALUES ('173', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 15:38:29', '1', '2018-04-23 15:38:29', '2018-04-23 15:38:29');
INSERT INTO `ibid_score_logs` VALUES ('174', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 15:39:37', '1', '2018-04-23 15:39:37', '2018-04-23 15:39:37');
INSERT INTO `ibid_score_logs` VALUES ('175', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 15:42:28', '1', '2018-04-23 15:42:28', '2018-04-23 15:42:28');
INSERT INTO `ibid_score_logs` VALUES ('176', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 15:55:28', '1', '2018-04-23 15:55:28', '2018-04-23 15:55:28');
INSERT INTO `ibid_score_logs` VALUES ('177', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 16:42:19', '1', '2018-04-23 16:42:19', '2018-04-23 16:42:19');
INSERT INTO `ibid_score_logs` VALUES ('178', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 16:59:40', '1', '2018-04-23 16:59:40', '2018-04-23 16:59:40');
INSERT INTO `ibid_score_logs` VALUES ('179', '21', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 17:00:39', '1', '2018-04-23 17:00:39', '2018-04-23 17:00:39');
INSERT INTO `ibid_score_logs` VALUES ('180', '21', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 17:02:38', '1', '2018-04-23 17:02:38', '2018-04-23 17:02:38');
INSERT INTO `ibid_score_logs` VALUES ('181', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 17:13:36', '1', '2018-04-23 17:13:36', '2018-04-23 17:13:36');
INSERT INTO `ibid_score_logs` VALUES ('182', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 17:54:21', '1', '2018-04-23 17:54:21', '2018-04-23 17:54:21');
INSERT INTO `ibid_score_logs` VALUES ('183', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 17:54:39', '1', '2018-04-23 17:54:39', '2018-04-23 17:54:39');
INSERT INTO `ibid_score_logs` VALUES ('184', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-23 18:02:36', '1', '2018-04-23 18:02:36', '2018-04-23 18:02:36');
INSERT INTO `ibid_score_logs` VALUES ('185', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 00:00:48', '1', '2018-04-24 00:00:48', '2018-04-24 00:00:48');
INSERT INTO `ibid_score_logs` VALUES ('186', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 09:33:07', '1', '2018-04-24 09:33:07', '2018-04-24 09:33:07');
INSERT INTO `ibid_score_logs` VALUES ('187', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 09:34:54', '1', '2018-04-24 09:34:54', '2018-04-24 09:34:54');
INSERT INTO `ibid_score_logs` VALUES ('188', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 09:44:48', '1', '2018-04-24 09:44:48', '2018-04-24 09:44:48');
INSERT INTO `ibid_score_logs` VALUES ('189', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 10:04:26', '1', '2018-04-24 10:04:26', '2018-04-24 10:04:26');
INSERT INTO `ibid_score_logs` VALUES ('190', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 10:20:27', '1', '2018-04-24 10:20:27', '2018-04-24 10:20:27');
INSERT INTO `ibid_score_logs` VALUES ('191', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 10:31:37', '1', '2018-04-24 10:31:37', '2018-04-24 10:31:37');
INSERT INTO `ibid_score_logs` VALUES ('192', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 10:36:43', '1', '2018-04-24 10:36:43', '2018-04-24 10:36:43');
INSERT INTO `ibid_score_logs` VALUES ('193', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 11:46:44', '1', '2018-04-24 11:46:44', '2018-04-24 11:46:44');
INSERT INTO `ibid_score_logs` VALUES ('194', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 11:55:40', '1', '2018-04-24 11:55:40', '2018-04-24 11:55:40');
INSERT INTO `ibid_score_logs` VALUES ('195', '15', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 12:01:48', '1', '2018-04-24 12:01:48', '2018-04-24 12:01:48');
INSERT INTO `ibid_score_logs` VALUES ('196', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 13:38:15', '1', '2018-04-24 13:38:15', '2018-04-24 13:38:15');
INSERT INTO `ibid_score_logs` VALUES ('197', '2', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 13:57:47', '1', '2018-04-24 13:57:47', '2018-04-24 13:57:47');
INSERT INTO `ibid_score_logs` VALUES ('198', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 14:00:36', '1', '2018-04-24 14:00:36', '2018-04-24 14:00:36');
INSERT INTO `ibid_score_logs` VALUES ('199', '3', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 14:09:56', '1', '2018-04-24 14:09:56', '2018-04-24 14:09:56');
INSERT INTO `ibid_score_logs` VALUES ('200', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 14:45:21', '1', '2018-04-24 14:45:21', '2018-04-24 14:45:21');
INSERT INTO `ibid_score_logs` VALUES ('201', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 15:39:14', '1', '2018-04-24 15:39:14', '2018-04-24 15:39:14');
INSERT INTO `ibid_score_logs` VALUES ('202', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 15:43:34', '1', '2018-04-24 15:43:34', '2018-04-24 15:43:34');
INSERT INTO `ibid_score_logs` VALUES ('203', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 16:14:13', '1', '2018-04-24 16:14:13', '2018-04-24 16:14:13');
INSERT INTO `ibid_score_logs` VALUES ('204', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 16:14:13', '1', '2018-04-24 16:14:13', '2018-04-24 16:14:13');
INSERT INTO `ibid_score_logs` VALUES ('205', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 16:17:36', '1', '2018-04-24 16:17:36', '2018-04-24 16:17:36');
INSERT INTO `ibid_score_logs` VALUES ('206', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 16:17:51', '1', '2018-04-24 16:17:51', '2018-04-24 16:17:51');
INSERT INTO `ibid_score_logs` VALUES ('207', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 16:33:35', '1', '2018-04-24 16:33:35', '2018-04-24 16:33:35');
INSERT INTO `ibid_score_logs` VALUES ('208', '10', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 21:04:57', '1', '2018-04-24 21:04:57', '2018-04-24 21:04:57');
INSERT INTO `ibid_score_logs` VALUES ('209', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 23:29:30', '1', '2018-04-24 23:29:30', '2018-04-24 23:29:30');
INSERT INTO `ibid_score_logs` VALUES ('210', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-24 23:38:35', '1', '2018-04-24 23:38:35', '2018-04-24 23:38:35');
INSERT INTO `ibid_score_logs` VALUES ('211', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-25 00:04:36', '1', '2018-04-25 00:04:36', '2018-04-25 00:04:36');
INSERT INTO `ibid_score_logs` VALUES ('212', '22', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-25 08:21:14', '1', '2018-04-25 08:21:14', '2018-04-25 08:21:14');
INSERT INTO `ibid_score_logs` VALUES ('213', '22', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-25 08:24:11', '1', '2018-04-25 08:24:11', '2018-04-25 08:24:11');
INSERT INTO `ibid_score_logs` VALUES ('214', '1', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-25 09:01:57', '1', '2018-04-25 09:01:57', '2018-04-25 09:01:57');
INSERT INTO `ibid_score_logs` VALUES ('215', '9', 'login', '1.00', '会员登录', '会员登录，登录时间2018-04-25 09:11:22', '1', '2018-04-25 09:11:22', '2018-04-25 09:11:22');

-- -----------------------------
-- Table structure for `ibid_spec_names`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_spec_names`;
CREATE TABLE `ibid_spec_names` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `spec_template_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品规格模板ID',
  `name` varchar(255) DEFAULT NULL COMMENT '商品规格名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_spec_names`
-- -----------------------------
INSERT INTO `ibid_spec_names` VALUES ('1', '1', '大小', '0', '1', '2018-04-17 15:51:46', '2018-04-17 15:51:46');
INSERT INTO `ibid_spec_names` VALUES ('2', '1', '颜色', '0', '1', '2018-04-17 15:51:54', '2018-04-17 15:51:54');
INSERT INTO `ibid_spec_names` VALUES ('3', '2', '尺寸', '0', '1', '2018-04-19 11:04:42', '2018-04-19 11:04:42');
INSERT INTO `ibid_spec_names` VALUES ('4', '2', '颜色', '0', '1', '2018-04-19 11:04:49', '2018-04-19 11:04:49');

-- -----------------------------
-- Table structure for `ibid_spec_templates`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_spec_templates`;
CREATE TABLE `ibid_spec_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '商品规格模板名称',
  `intro` text COMMENT '商品规格模板简介',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_spec_templates`
-- -----------------------------
INSERT INTO `ibid_spec_templates` VALUES ('1', '衣服规格模板', '衣服规格模板', '0', '2018-04-17 15:51:36', '2018-04-19 11:04:05');
INSERT INTO `ibid_spec_templates` VALUES ('2', '颜色尺寸', '', '1', '2018-04-19 11:04:20', '2018-04-19 11:04:20');

-- -----------------------------
-- Table structure for `ibid_transport_templates`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_transport_templates`;
CREATE TABLE `ibid_transport_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '商品运费模板名称',
  `intro` text COMMENT '商品运费模板简介',
  `basic_weight` decimal(10,2) NOT NULL COMMENT '基本重量',
  `basic_price` decimal(10,2) NOT NULL COMMENT '基本运费',
  `add_weight` decimal(10,2) NOT NULL COMMENT '增加的重量',
  `add_price` decimal(10,2) NOT NULL COMMENT '增加的运费',
  `area_codes` text COMMENT '地区codes',
  `status` tinyint(1) DEFAULT '1' COMMENT '模板状态：1启用2关闭',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_transport_templates`
-- -----------------------------
INSERT INTO `ibid_transport_templates` VALUES ('1', '运费基础模板', '运费基础模板', '1.00', '10.00', '1.00', '1.00', '[\"110000\",\"110100\",\"110101\",\"110102\",\"110105\",\"110106\",\"110107\",\"110108\",\"110109\",\"110111\",\"110112\",\"110113\",\"110114\",\"110115\",\"110116\",\"110117\",\"110118\",\"110119\",\"120000\",\"120100\",\"120101\",\"120102\",\"120103\",\"120104\",\"120105\",\"120106\",\"120110\",\"120111\",\"120112\",\"120113\",\"120114\",\"120115\",\"120116\",\"120117\",\"120118\",\"120119\",\"130000\",\"130100\",\"130101\",\"130102\",\"130104\",\"130105\",\"130107\",\"130108\",\"130109\",\"130110\",\"130111\",\"130121\",\"130123\",\"130125\",\"130126\",\"130127\",\"130128\",\"130129\",\"130130\",\"130131\",\"130132\",\"130133\",\"130183\",\"130184\",\"130200\",\"130201\",\"130202\",\"130203\",\"130204\",\"130205\",\"130207\",\"130208\",\"130209\",\"130223\",\"130224\",\"130225\",\"130227\",\"130229\",\"130281\",\"130283\",\"130300\",\"130301\",\"130302\",\"130303\",\"130304\",\"130306\",\"130321\",\"130322\",\"130324\",\"130400\",\"130401\",\"130402\",\"130403\",\"130404\",\"130406\",\"130421\",\"130423\",\"130424\",\"130425\",\"130426\",\"130427\",\"130428\",\"130429\",\"130430\",\"130431\",\"130432\",\"130433\",\"130434\",\"130435\",\"130481\",\"130500\",\"130501\",\"130502\",\"130503\",\"130521\",\"130522\",\"130523\",\"130524\",\"130525\",\"130526\",\"130527\",\"130528\",\"130529\",\"130530\",\"130531\",\"130532\",\"130533\",\"130534\",\"130535\",\"130581\",\"130582\",\"130600\",\"130601\",\"130602\",\"130606\",\"130607\",\"130608\",\"130609\",\"130623\",\"130624\",\"130626\",\"130627\",\"130628\",\"130629\",\"130630\",\"130631\",\"130632\",\"130633\",\"130634\",\"130635\",\"130636\",\"130637\",\"130638\",\"130681\",\"130683\",\"130684\",\"130700\",\"130701\",\"130702\",\"130703\",\"130705\",\"130706\",\"130708\",\"130709\",\"130722\",\"130723\",\"130724\",\"130725\",\"130726\",\"130727\",\"130728\",\"130730\",\"130731\",\"130732\",\"130800\",\"130801\",\"130802\",\"130803\",\"130804\",\"130821\",\"130822\",\"130823\",\"130824\",\"130825\",\"130826\",\"130827\",\"130828\",\"130900\",\"130901\",\"130902\",\"130903\",\"130921\",\"130922\",\"130923\",\"130924\",\"130925\",\"130926\",\"130927\",\"130928\",\"130929\",\"130930\",\"130981\",\"130982\",\"130983\",\"130984\",\"131000\",\"131001\",\"131002\",\"131003\",\"131022\",\"131023\",\"131024\",\"131025\",\"131026\",\"131028\",\"131081\",\"131082\",\"131100\",\"131101\",\"131102\",\"131103\",\"131121\",\"131122\",\"131123\",\"131124\",\"131125\",\"131126\",\"131127\",\"131128\",\"131182\",\"139000\",\"139001\",\"139002\",\"140000\",\"140100\",\"140101\",\"140105\",\"140106\",\"140107\",\"140108\",\"140109\",\"140110\",\"140121\",\"140122\",\"140123\",\"140181\",\"140200\",\"140201\",\"140202\",\"140203\",\"140211\",\"140212\",\"140221\",\"140222\",\"140223\",\"140224\",\"140225\",\"140226\",\"140227\",\"140300\",\"140301\",\"140302\",\"140303\",\"140311\",\"140321\",\"140322\",\"140400\",\"140401\",\"140402\",\"140411\",\"140421\",\"140423\",\"140424\",\"140425\",\"140426\",\"140427\",\"140428\",\"140429\",\"140430\",\"140431\",\"140481\",\"140500\",\"140501\",\"140502\",\"140521\",\"140522\",\"140524\",\"140525\",\"140581\",\"140600\",\"140601\",\"140602\",\"140603\",\"140621\",\"140622\",\"140623\",\"140624\",\"140700\",\"140701\",\"140702\",\"140721\",\"140722\",\"140723\",\"140724\",\"140725\",\"140726\",\"140727\",\"140728\",\"140729\",\"140781\",\"140800\",\"140801\",\"140802\",\"140821\",\"140822\",\"140823\",\"140824\",\"140825\",\"140826\",\"140827\",\"140828\",\"140829\",\"140830\",\"140881\",\"140882\",\"140900\",\"140901\",\"140902\",\"140921\",\"140922\",\"140923\",\"140924\",\"140925\",\"140926\",\"140927\",\"140928\",\"140929\",\"140930\",\"140931\",\"140932\",\"140981\",\"141000\",\"141001\",\"141002\",\"141021\",\"141022\",\"141023\",\"141024\",\"141025\",\"141026\",\"141027\",\"141028\",\"141029\",\"141030\",\"141031\",\"141032\",\"141033\",\"141034\",\"141081\",\"141082\",\"141100\",\"141101\",\"141102\",\"141121\",\"141122\",\"141123\",\"141124\",\"141125\",\"141126\",\"141127\",\"141128\",\"141129\",\"141130\",\"141181\",\"141182\",\"150000\",\"150100\",\"150101\",\"150102\",\"150103\",\"150104\",\"150105\",\"150121\",\"150122\",\"150123\",\"150124\",\"150125\",\"150200\",\"150201\",\"150202\",\"150203\",\"150204\",\"150205\",\"150206\",\"150207\",\"150221\",\"150222\",\"150223\",\"150300\",\"150301\",\"150302\",\"150303\",\"150304\",\"150400\",\"150401\",\"150402\",\"150403\",\"150404\",\"150421\",\"150422\",\"150423\",\"150424\",\"150425\",\"150426\",\"150428\",\"150429\",\"150430\",\"150500\",\"150501\",\"150502\",\"150521\",\"150522\",\"150523\",\"150524\",\"150525\",\"150526\",\"150581\",\"150600\",\"150601\",\"150602\",\"150603\",\"150621\",\"150622\",\"150623\",\"150624\",\"150625\",\"150626\",\"150627\",\"150700\",\"150701\",\"150702\",\"150703\",\"150721\",\"150722\",\"150723\",\"150724\",\"150725\",\"150726\",\"150727\",\"150781\",\"150782\",\"150783\",\"150784\",\"150785\",\"150800\",\"150801\",\"150802\",\"150821\",\"150822\",\"150823\",\"150824\",\"150825\",\"150826\",\"150900\",\"150901\",\"150902\",\"150921\",\"150922\",\"150923\",\"150924\",\"150925\",\"150926\",\"150927\",\"150928\",\"150929\",\"150981\",\"152200\",\"152201\",\"152202\",\"152221\",\"152222\",\"152223\",\"152224\",\"152500\",\"152501\",\"152502\",\"152522\",\"152523\",\"152524\",\"152525\",\"152526\",\"152527\",\"152528\",\"152529\",\"152530\",\"152531\",\"152900\",\"152921\",\"152922\",\"152923\",\"210000\",\"210100\",\"210101\",\"210102\",\"210103\",\"210104\",\"210105\",\"210106\",\"210111\",\"210112\",\"210113\",\"210114\",\"210115\",\"210123\",\"210124\",\"210181\",\"210200\",\"210201\",\"210202\",\"210203\",\"210204\",\"210211\",\"210212\",\"210213\",\"210214\",\"210224\",\"210281\",\"210283\",\"210300\",\"210301\",\"210302\",\"210303\",\"210304\",\"210311\",\"210321\",\"210323\",\"210381\",\"210400\",\"210401\",\"210402\",\"210403\",\"210404\",\"210411\",\"210421\",\"210422\",\"210423\",\"210500\",\"210501\",\"210502\",\"210503\",\"210504\",\"210505\",\"210521\",\"210522\",\"210600\",\"210601\",\"210602\",\"210603\",\"210604\",\"210624\",\"210681\",\"210682\",\"210700\",\"210701\",\"210702\",\"210703\",\"210711\",\"210726\",\"210727\",\"210781\",\"210782\",\"210800\",\"210801\",\"210802\",\"210803\",\"210804\",\"210811\",\"210881\",\"210882\",\"210900\",\"210901\",\"210902\",\"210903\",\"210904\",\"210905\",\"210911\",\"210921\",\"210922\",\"211000\",\"211001\",\"211002\",\"211003\",\"211004\",\"211005\",\"211011\",\"211021\",\"211081\",\"211100\",\"211101\",\"211102\",\"211103\",\"211104\",\"211122\",\"211200\",\"211201\",\"211202\",\"211204\",\"211221\",\"211223\",\"211224\",\"211281\",\"211282\",\"211300\",\"211301\",\"211302\",\"211303\",\"211321\",\"211322\",\"211324\",\"211381\",\"211382\",\"211400\",\"211401\",\"211402\",\"211403\",\"211404\",\"211421\",\"211422\",\"211481\",\"220000\",\"220100\",\"220101\",\"220102\",\"220103\",\"220104\",\"220105\",\"220106\",\"220112\",\"220113\",\"220122\",\"220182\",\"220183\",\"220200\",\"220201\",\"220202\",\"220203\",\"220204\",\"220211\",\"220221\",\"220281\",\"220282\",\"220283\",\"220284\",\"220300\",\"220301\",\"220302\",\"220303\",\"220322\",\"220323\",\"220381\",\"220382\",\"220400\",\"220401\",\"220402\",\"220403\",\"220421\",\"220422\",\"220500\",\"220501\",\"220502\",\"220503\",\"220521\",\"220523\",\"220524\",\"220581\",\"220582\",\"220600\",\"220601\",\"220602\",\"220605\",\"220621\",\"220622\",\"220623\",\"220681\",\"220700\",\"220701\",\"220702\",\"220721\",\"220722\",\"220723\",\"220781\",\"220800\",\"220801\",\"220802\",\"220821\",\"220822\",\"220881\",\"220882\",\"222400\",\"222401\",\"222402\",\"222403\",\"222404\",\"222405\",\"222406\",\"222424\",\"222426\",\"230000\",\"230100\",\"230101\",\"230102\",\"230103\",\"230104\",\"230108\",\"230109\",\"230110\",\"230111\",\"230112\",\"230113\",\"230123\",\"230124\",\"230125\",\"230126\",\"230127\",\"230128\",\"230129\",\"230183\",\"230184\",\"230200\",\"230201\",\"230202\",\"230203\",\"230204\",\"230205\",\"230206\",\"230207\",\"230208\",\"230221\",\"230223\",\"230224\",\"230225\",\"230227\",\"230229\",\"230230\",\"230231\",\"230281\",\"230300\",\"230301\",\"230302\",\"230303\",\"230304\",\"230305\",\"230306\",\"230307\",\"230321\",\"230381\",\"230382\",\"230400\",\"230401\",\"230402\",\"230403\",\"230404\",\"230405\",\"230406\",\"230407\",\"230421\",\"230422\",\"230500\",\"230501\",\"230502\",\"230503\",\"230505\",\"230506\",\"230521\",\"230522\",\"230523\",\"230524\",\"230600\",\"230601\",\"230602\",\"230603\",\"230604\",\"230605\",\"230606\",\"230621\",\"230622\",\"230623\",\"230624\",\"230700\",\"230701\",\"230702\",\"230703\",\"230704\",\"230705\",\"230706\",\"230707\",\"230708\",\"230709\",\"230710\",\"230711\",\"230712\",\"230713\",\"230714\",\"230715\",\"230716\",\"230722\",\"230781\",\"230800\",\"230801\",\"230803\",\"230804\",\"230805\",\"230811\",\"230822\",\"230826\",\"230828\",\"230881\",\"230882\",\"230883\",\"230900\",\"230901\",\"230902\",\"230903\",\"230904\",\"230921\",\"231000\",\"231001\",\"231002\",\"231003\",\"231004\",\"231005\",\"231025\",\"231081\",\"231083\",\"231084\",\"231085\",\"231086\",\"231100\",\"231101\",\"231102\",\"231121\",\"231123\",\"231124\",\"231181\",\"231182\",\"231200\",\"231201\",\"231202\",\"231221\",\"231222\",\"231223\",\"231224\",\"231225\",\"231226\",\"231281\",\"231282\",\"231283\",\"232700\",\"232721\",\"232722\",\"232723\",\"310000\",\"310100\",\"310101\",\"310104\",\"310105\",\"310106\",\"310107\",\"310109\",\"310110\",\"310112\",\"310113\",\"310114\",\"310115\",\"310116\",\"310117\",\"310118\",\"310120\",\"310151\",\"320000\",\"320100\",\"320101\",\"320102\",\"320104\",\"320105\",\"320106\",\"320111\",\"320113\",\"320114\",\"320115\",\"320116\",\"320117\",\"320118\",\"320200\",\"320201\",\"320205\",\"320206\",\"320211\",\"320213\",\"320214\",\"320281\",\"320282\",\"320300\",\"320301\",\"320302\",\"320303\",\"320305\",\"320311\",\"320312\",\"320321\",\"320322\",\"320324\",\"320381\",\"320382\",\"320400\",\"320401\",\"320402\",\"320404\",\"320411\",\"320412\",\"320413\",\"320481\",\"320500\",\"320501\",\"320505\",\"320506\",\"320507\",\"320508\",\"320509\",\"320581\",\"320582\",\"320583\",\"320585\",\"320600\",\"320601\",\"320602\",\"320611\",\"320612\",\"320621\",\"320623\",\"320681\",\"320682\",\"320684\",\"320700\",\"320701\",\"320703\",\"320706\",\"320707\",\"320722\",\"320723\",\"320724\",\"320800\",\"320801\",\"320803\",\"320804\",\"320812\",\"320813\",\"320826\",\"320830\",\"320831\",\"320900\",\"320901\",\"320902\",\"320903\",\"320904\",\"320921\",\"320922\",\"320923\",\"320924\",\"320925\",\"320981\",\"321000\",\"321001\",\"321002\",\"321003\",\"321012\",\"321023\",\"321081\",\"321084\",\"321100\",\"321101\",\"321102\",\"321111\",\"321112\",\"321181\",\"321182\",\"321183\",\"321200\",\"321201\",\"321202\",\"321203\",\"321204\",\"321281\",\"321282\",\"321283\",\"321300\",\"321301\",\"321302\",\"321311\",\"321322\",\"321323\",\"321324\",\"330000\",\"330100\",\"330101\",\"330102\",\"330103\",\"330104\",\"330105\",\"330106\",\"330108\",\"330109\",\"330110\",\"330111\",\"330122\",\"330127\",\"330182\",\"330185\",\"330200\",\"330201\",\"330203\",\"330204\",\"330205\",\"330206\",\"330211\",\"330212\",\"330225\",\"330226\",\"330281\",\"330282\",\"330283\",\"330300\",\"330301\",\"330302\",\"330303\",\"330304\",\"330305\",\"330324\",\"330326\",\"330327\",\"330328\",\"330329\",\"330381\",\"330382\",\"330400\",\"330401\",\"330402\",\"330411\",\"330421\",\"330424\",\"330481\",\"330482\",\"330483\",\"330500\",\"330501\",\"330502\",\"330503\",\"330521\",\"330522\",\"330523\",\"330600\",\"330601\",\"330602\",\"330603\",\"330604\",\"330624\",\"330681\",\"330683\",\"330700\",\"330701\",\"330702\",\"330703\",\"330723\",\"330726\",\"330727\",\"330781\",\"330782\",\"330783\",\"330784\",\"330800\",\"330801\",\"330802\",\"330803\",\"330822\",\"330824\",\"330825\",\"330881\",\"330900\",\"330901\",\"330902\",\"330903\",\"330921\",\"330922\",\"331000\",\"331001\",\"331002\",\"331003\",\"331004\",\"331021\",\"331022\",\"331023\",\"331024\",\"331081\",\"331082\",\"331100\",\"331101\",\"331102\",\"331121\",\"331122\",\"331123\",\"331124\",\"331125\",\"331126\",\"331127\",\"331181\",\"340000\",\"340100\",\"340101\",\"340102\",\"340103\",\"340104\",\"340111\",\"340121\",\"340122\",\"340123\",\"340124\",\"340181\",\"340200\",\"340201\",\"340202\",\"340203\",\"340207\",\"340208\",\"340221\",\"340222\",\"340223\",\"340225\",\"340300\",\"340301\",\"340302\",\"340303\",\"340304\",\"340311\",\"340321\",\"340322\",\"340323\",\"340400\",\"340401\",\"340402\",\"340403\",\"340404\",\"340405\",\"340406\",\"340421\",\"340422\",\"340500\",\"340501\",\"340503\",\"340504\",\"340506\",\"340521\",\"340522\",\"340523\",\"340600\",\"340601\",\"340602\",\"340603\",\"340604\",\"340621\",\"340700\",\"340701\",\"340705\",\"340706\",\"340711\",\"340722\",\"340800\",\"340801\",\"340802\",\"340803\",\"340811\",\"340822\",\"340824\",\"340825\",\"340826\",\"340827\",\"340828\",\"340881\",\"341000\",\"341001\",\"341002\",\"341003\",\"341004\",\"341021\",\"341022\",\"341023\",\"341024\",\"341100\",\"341101\",\"341102\",\"341103\",\"341122\",\"341124\",\"341125\",\"341126\",\"341181\",\"341182\",\"341200\",\"341201\",\"341202\",\"341203\",\"341204\",\"341221\",\"341222\",\"341225\",\"341226\",\"341282\",\"341300\",\"341301\",\"341302\",\"341321\",\"341322\",\"341323\",\"341324\",\"341500\",\"341501\",\"341502\",\"341503\",\"341504\",\"341522\",\"341523\",\"341524\",\"341525\",\"341600\",\"341601\",\"341602\",\"341621\",\"341622\",\"341623\",\"341700\",\"341701\",\"341702\",\"341721\",\"341722\",\"341723\",\"341800\",\"341801\",\"341802\",\"341821\",\"341822\",\"341823\",\"341824\",\"341825\",\"341881\",\"350000\",\"350100\",\"350101\",\"350102\",\"350103\",\"350104\",\"350105\",\"350111\",\"350121\",\"350122\",\"350123\",\"350124\",\"350125\",\"350128\",\"350181\",\"350182\",\"350200\",\"350201\",\"350203\",\"350205\",\"350206\",\"350211\",\"350212\",\"350213\",\"350300\",\"350301\",\"350302\",\"350303\",\"350304\",\"350305\",\"350322\",\"350400\",\"350401\",\"350402\",\"350403\",\"350421\",\"350423\",\"350424\",\"350425\",\"350426\",\"350427\",\"350428\",\"350429\",\"350430\",\"350481\",\"350500\",\"350501\",\"350502\",\"350503\",\"350504\",\"350505\",\"350521\",\"350524\",\"350525\",\"350526\",\"350527\",\"350581\",\"350582\",\"350583\",\"350600\",\"350601\",\"350602\",\"350603\",\"350622\",\"350623\",\"350624\",\"350625\",\"350626\",\"350627\",\"350628\",\"350629\",\"350681\",\"350700\",\"350701\",\"350702\",\"350703\",\"350721\",\"350722\",\"350723\",\"350724\",\"350725\",\"350781\",\"350782\",\"350783\",\"350800\",\"350801\",\"350802\",\"350803\",\"350821\",\"350823\",\"350824\",\"350825\",\"350881\",\"350900\",\"350901\",\"350902\",\"350921\",\"350922\",\"350923\",\"350924\",\"350925\",\"350926\",\"350981\",\"350982\",\"360000\",\"360100\",\"360101\",\"360102\",\"360103\",\"360104\",\"360105\",\"360111\",\"360112\",\"360121\",\"360123\",\"360124\",\"360200\",\"360201\",\"360202\",\"360203\",\"360222\",\"360281\",\"360300\",\"360301\",\"360302\",\"360313\",\"360321\",\"360322\",\"360323\",\"360400\",\"360401\",\"360402\",\"360403\",\"360421\",\"360423\",\"360424\",\"360425\",\"360426\",\"360428\",\"360429\",\"360430\",\"360481\",\"360482\",\"360483\",\"360500\",\"360501\",\"360502\",\"360521\",\"360600\",\"360601\",\"360602\",\"360622\",\"360681\",\"360700\",\"360701\",\"360702\",\"360703\",\"360721\",\"360722\",\"360723\",\"360724\",\"360725\",\"360726\",\"360727\",\"360728\",\"360729\",\"360730\",\"360731\",\"360732\",\"360733\",\"360734\",\"360735\",\"360781\",\"360800\",\"360801\",\"360802\",\"360803\",\"360821\",\"360822\",\"360823\",\"360824\",\"360825\",\"360826\",\"360827\",\"360828\",\"360829\",\"360830\",\"360881\",\"360900\",\"360901\",\"360902\",\"360921\",\"360922\",\"360923\",\"360924\",\"360925\",\"360926\",\"360981\",\"360982\",\"360983\",\"361000\",\"361001\",\"361002\",\"361021\",\"361022\",\"361023\",\"361024\",\"361025\",\"361026\",\"361027\",\"361028\",\"361029\",\"361030\",\"361100\",\"361101\",\"361102\",\"361103\",\"361121\",\"361123\",\"361124\",\"361125\",\"361126\",\"361127\",\"361128\",\"361129\",\"361130\",\"361181\",\"370000\",\"370100\",\"370101\",\"370102\",\"370103\",\"370104\",\"370105\",\"370112\",\"370113\",\"370124\",\"370125\",\"370126\",\"370181\",\"370200\",\"370201\",\"370202\",\"370203\",\"370211\",\"370212\",\"370213\",\"370214\",\"370281\",\"370282\",\"370283\",\"370285\",\"370300\",\"370301\",\"370302\",\"370303\",\"370304\",\"370305\",\"370306\",\"370321\",\"370322\",\"370323\",\"370400\",\"370401\",\"370402\",\"370403\",\"370404\",\"370405\",\"370406\",\"370481\",\"370500\",\"370501\",\"370502\",\"370503\",\"370505\",\"370522\",\"370523\",\"370600\",\"370601\",\"370602\",\"370611\",\"370612\",\"370613\",\"370634\",\"370681\",\"370682\",\"370683\",\"370684\",\"370685\",\"370686\",\"370687\",\"370700\",\"370701\",\"370702\",\"370703\",\"370704\",\"370705\",\"370724\",\"370725\",\"370781\",\"370782\",\"370783\",\"370784\",\"370785\",\"370786\",\"370800\",\"370801\",\"370811\",\"370812\",\"370826\",\"370827\",\"370828\",\"370829\",\"370830\",\"370831\",\"370832\",\"370881\",\"370883\",\"370900\",\"370901\",\"370902\",\"370911\",\"370921\",\"370923\",\"370982\",\"370983\",\"371000\",\"371001\",\"371002\",\"371003\",\"371082\",\"371083\",\"371100\",\"371101\",\"371102\",\"371103\",\"371121\",\"371122\",\"371200\",\"371201\",\"371202\",\"371203\",\"371300\",\"371301\",\"371302\",\"371311\",\"371312\",\"371321\",\"371322\",\"371323\",\"371324\",\"371325\",\"371326\",\"371327\",\"371328\",\"371329\",\"371400\",\"371401\",\"371402\",\"371403\",\"371422\",\"371423\",\"371424\",\"371425\",\"371426\",\"371427\",\"371428\",\"371481\",\"371482\",\"371500\",\"371501\",\"371502\",\"371521\",\"371522\",\"371523\",\"371524\",\"371525\",\"371526\",\"371581\",\"371600\",\"371601\",\"371602\",\"371603\",\"371621\",\"371622\",\"371623\",\"371625\",\"371626\",\"371700\",\"371701\",\"371702\",\"371703\",\"371721\",\"371722\",\"371723\",\"371724\",\"371725\",\"371726\",\"371728\",\"410000\",\"410100\",\"410101\",\"410102\",\"410103\",\"410104\",\"410105\",\"410106\",\"410108\",\"410122\",\"410181\",\"410182\",\"410183\",\"410184\",\"410185\",\"410200\",\"410201\",\"410202\",\"410203\",\"410204\",\"410205\",\"410211\",\"410212\",\"410221\",\"410222\",\"410223\",\"410225\",\"410300\",\"410301\",\"410302\",\"410303\",\"410304\",\"410305\",\"410306\",\"410311\",\"410322\",\"410323\",\"410324\",\"410325\",\"410326\",\"410327\",\"410328\",\"410329\",\"410381\",\"410400\",\"410401\",\"410402\",\"410403\",\"410404\",\"410411\",\"410421\",\"410422\",\"410423\",\"410425\",\"410481\",\"410482\",\"410500\",\"410501\",\"410502\",\"410503\",\"410505\",\"410506\",\"410522\",\"410523\",\"410526\",\"410527\",\"410581\",\"410600\",\"410601\",\"410602\",\"410603\",\"410611\",\"410621\",\"410622\",\"410700\",\"410701\",\"410702\",\"410703\",\"410704\",\"410711\",\"410721\",\"410724\",\"410725\",\"410726\",\"410727\",\"410728\",\"410781\",\"410782\",\"410800\",\"410801\",\"410802\",\"410803\",\"410804\",\"410811\",\"410821\",\"410822\",\"410823\",\"410825\",\"410882\",\"410883\",\"410900\",\"410901\",\"410902\",\"410922\",\"410923\",\"410926\",\"410927\",\"410928\",\"411000\",\"411001\",\"411002\",\"411023\",\"411024\",\"411025\",\"411081\",\"411082\",\"411100\",\"411101\",\"411102\",\"411103\",\"411104\",\"411121\",\"411122\",\"411200\",\"411201\",\"411202\",\"411203\",\"411221\",\"411224\",\"411281\",\"411282\",\"411300\",\"411301\",\"411302\",\"411303\",\"411321\",\"411322\",\"411323\",\"411324\",\"411325\",\"411326\",\"411327\",\"411328\",\"411329\",\"411330\",\"411381\",\"411400\",\"411401\",\"411402\",\"411403\",\"411421\",\"411422\",\"411423\",\"411424\",\"411425\",\"411426\",\"411481\",\"411500\",\"411501\",\"411502\",\"411503\",\"411521\",\"411522\",\"411523\",\"411524\",\"411525\",\"411526\",\"411527\",\"411528\",\"411600\",\"411601\",\"411602\",\"411621\",\"411622\",\"411623\",\"411624\",\"411625\",\"411626\",\"411627\",\"411628\",\"411681\",\"411700\",\"411701\",\"411702\",\"411721\",\"411722\",\"411723\",\"411724\",\"411725\",\"411726\",\"411727\",\"411728\",\"411729\",\"419000\",\"419001\",\"420000\",\"420100\",\"420101\",\"420102\",\"420103\",\"420104\",\"420105\",\"420106\",\"420107\",\"420111\",\"420112\",\"420113\",\"420114\",\"420115\",\"420116\",\"420117\",\"420200\",\"420201\",\"420202\",\"420203\",\"420204\",\"420205\",\"420222\",\"420281\",\"420300\",\"420301\",\"420302\",\"420303\",\"420304\",\"420322\",\"420323\",\"420324\",\"420325\",\"420381\",\"420500\",\"420501\",\"420502\",\"420503\",\"420504\",\"420505\",\"420506\",\"420525\",\"420526\",\"420527\",\"420528\",\"420529\",\"420581\",\"420582\",\"420583\",\"420600\",\"420601\",\"420602\",\"420606\",\"420607\",\"420624\",\"420625\",\"420626\",\"420682\",\"420683\",\"420684\",\"420700\",\"420701\",\"420702\",\"420703\",\"420704\",\"420800\",\"420801\",\"420802\",\"420804\",\"420821\",\"420822\",\"420881\",\"420900\",\"420901\",\"420902\",\"420921\",\"420922\",\"420923\",\"420981\",\"420982\",\"420984\",\"421000\",\"421001\",\"421002\",\"421003\",\"421022\",\"421023\",\"421024\",\"421081\",\"421083\",\"421087\",\"421100\",\"421101\",\"421102\",\"421121\",\"421122\",\"421123\",\"421124\",\"421125\",\"421126\",\"421127\",\"421181\",\"421182\",\"421200\",\"421201\",\"421202\",\"421221\",\"421222\",\"421223\",\"421224\",\"421281\",\"421300\",\"421301\",\"421303\",\"421321\",\"421381\",\"422800\",\"422801\",\"422802\",\"422822\",\"422823\",\"422825\",\"422826\",\"422827\",\"422828\",\"429000\",\"429004\",\"429005\",\"429006\",\"429021\",\"430000\",\"430100\",\"430101\",\"430102\",\"430103\",\"430104\",\"430105\",\"430111\",\"430112\",\"430121\",\"430124\",\"430181\",\"430200\",\"430201\",\"430202\",\"430203\",\"430204\",\"430211\",\"430221\",\"430223\",\"430224\",\"430225\",\"430281\",\"430300\",\"430301\",\"430302\",\"430304\",\"430321\",\"430381\",\"430382\",\"430400\",\"430401\",\"430405\",\"430406\",\"430407\",\"430408\",\"430412\",\"430421\",\"430422\",\"430423\",\"430424\",\"430426\",\"430481\",\"430482\",\"430500\",\"430501\",\"430502\",\"430503\",\"430511\",\"430521\",\"430522\",\"430523\",\"430524\",\"430525\",\"430527\",\"430528\",\"430529\",\"430581\",\"430600\",\"430601\",\"430602\",\"430603\",\"430611\",\"430621\",\"430623\",\"430624\",\"430626\",\"430681\",\"430682\",\"430700\",\"430701\",\"430702\",\"430703\",\"430721\",\"430722\",\"430723\",\"430724\",\"430725\",\"430726\",\"430781\",\"430800\",\"430801\",\"430802\",\"430811\",\"430821\",\"430822\",\"430900\",\"430901\",\"430902\",\"430903\",\"430921\",\"430922\",\"430923\",\"430981\",\"431000\",\"431001\",\"431002\",\"431003\",\"431021\",\"431022\",\"431023\",\"431024\",\"431025\",\"431026\",\"431027\",\"431028\",\"431081\",\"431100\",\"431101\",\"431102\",\"431103\",\"431121\",\"431122\",\"431123\",\"431124\",\"431125\",\"431126\",\"431127\",\"431128\",\"431129\",\"431200\",\"431201\",\"431202\",\"431221\",\"431222\",\"431223\",\"431224\",\"431225\",\"431226\",\"431227\",\"431228\",\"431229\",\"431230\",\"431281\",\"431300\",\"431301\",\"431302\",\"431321\",\"431322\",\"431381\",\"431382\",\"433100\",\"433101\",\"433122\",\"433123\",\"433124\",\"433125\",\"433126\",\"433127\",\"433130\",\"440000\",\"440100\",\"440101\",\"440103\",\"440104\",\"440105\",\"440106\",\"440111\",\"440112\",\"440113\",\"440114\",\"440115\",\"440117\",\"440118\",\"440200\",\"440201\",\"440203\",\"440204\",\"440205\",\"440222\",\"440224\",\"440229\",\"440232\",\"440233\",\"440281\",\"440282\",\"440300\",\"440301\",\"440303\",\"440304\",\"440305\",\"440306\",\"440307\",\"440308\",\"440400\",\"440401\",\"440402\",\"440403\",\"440404\",\"440500\",\"440501\",\"440507\",\"440511\",\"440512\",\"440513\",\"440514\",\"440515\",\"440523\",\"440600\",\"440601\",\"440604\",\"440605\",\"440606\",\"440607\",\"440608\",\"440700\",\"440701\",\"440703\",\"440704\",\"440705\",\"440781\",\"440783\",\"440784\",\"440785\",\"440800\",\"440801\",\"440802\",\"440803\",\"440804\",\"440811\",\"440823\",\"440825\",\"440881\",\"440882\",\"440883\",\"440900\",\"440901\",\"440902\",\"440904\",\"440981\",\"440982\",\"440983\",\"441200\",\"441201\",\"441202\",\"441203\",\"441204\",\"441223\",\"441224\",\"441225\",\"441226\",\"441284\",\"441300\",\"441301\",\"441302\",\"441303\",\"441322\",\"441323\",\"441324\",\"441400\",\"441401\",\"441402\",\"441403\",\"441422\",\"441423\",\"441424\",\"441426\",\"441427\",\"441481\",\"441500\",\"441501\",\"441502\",\"441521\",\"441523\",\"441581\",\"441600\",\"441601\",\"441602\",\"441621\",\"441622\",\"441623\",\"441624\",\"441625\",\"441700\",\"441701\",\"441702\",\"441704\",\"441721\",\"441781\",\"441800\",\"441801\",\"441802\",\"441803\",\"441821\",\"441823\",\"441825\",\"441826\",\"441881\",\"441882\",\"441900\",\"442000\",\"445100\",\"445101\",\"445102\",\"445103\",\"445122\",\"445200\",\"445201\",\"445202\",\"445203\",\"445222\",\"445224\",\"445281\",\"445300\",\"445301\",\"445302\",\"445303\",\"445321\",\"445322\",\"445381\",\"450000\",\"450100\",\"450101\",\"450102\",\"450103\",\"450105\",\"450107\",\"450108\",\"450109\",\"450110\",\"450123\",\"450124\",\"450125\",\"450126\",\"450127\",\"450200\",\"450201\",\"450202\",\"450203\",\"450204\",\"450205\",\"450206\",\"450222\",\"450223\",\"450224\",\"450225\",\"450226\",\"450300\",\"450301\",\"450302\",\"450303\",\"450304\",\"450305\",\"450311\",\"450312\",\"450321\",\"450323\",\"450324\",\"450325\",\"450326\",\"450327\",\"450328\",\"450329\",\"450330\",\"450331\",\"450332\",\"450400\",\"450401\",\"450403\",\"450405\",\"450406\",\"450421\",\"450422\",\"450423\",\"450481\",\"450500\",\"450501\",\"450502\",\"450503\",\"450512\",\"450521\",\"450600\",\"450601\",\"450602\",\"450603\",\"450621\",\"450681\",\"450700\",\"450701\",\"450702\",\"450703\",\"450721\",\"450722\",\"450800\",\"450801\",\"450802\",\"450803\",\"450804\",\"450821\",\"450881\",\"450900\",\"450901\",\"450902\",\"450903\",\"450921\",\"450922\",\"450923\",\"450924\",\"450981\",\"451000\",\"451001\",\"451002\",\"451021\",\"451022\",\"451023\",\"451024\",\"451026\",\"451027\",\"451028\",\"451029\",\"451030\",\"451031\",\"451081\",\"451100\",\"451101\",\"451102\",\"451103\",\"451121\",\"451122\",\"451123\",\"451200\",\"451201\",\"451202\",\"451221\",\"451222\",\"451223\",\"451224\",\"451225\",\"451226\",\"451227\",\"451228\",\"451229\",\"451281\",\"451300\",\"451301\",\"451302\",\"451321\",\"451322\",\"451323\",\"451324\",\"451381\",\"451400\",\"451401\",\"451402\",\"451421\",\"451422\",\"451423\",\"451424\",\"451425\",\"451481\",\"460000\",\"460100\",\"460101\",\"460105\",\"460106\",\"460107\",\"460108\",\"460200\",\"460201\",\"460202\",\"460203\",\"460204\",\"460205\",\"460300\",\"460400\",\"469000\",\"469001\",\"469002\",\"469005\",\"469006\",\"469007\",\"469021\",\"469022\",\"469023\",\"469024\",\"469025\",\"469026\",\"469027\",\"469028\",\"469029\",\"469030\",\"500000\",\"500100\",\"500101\",\"500102\",\"500103\",\"500104\",\"500105\",\"500106\",\"500107\",\"500108\",\"500109\",\"500110\",\"500111\",\"500112\",\"500113\",\"500114\",\"500115\",\"500116\",\"500117\",\"500118\",\"500119\",\"500120\",\"500151\",\"500152\",\"500153\",\"500154\",\"500200\",\"500228\",\"500229\",\"500230\",\"500231\",\"500232\",\"500233\",\"500235\",\"500236\",\"500237\",\"500238\",\"500240\",\"500241\",\"500242\",\"500243\",\"510000\",\"510100\",\"510101\",\"510104\",\"510105\",\"510106\",\"510107\",\"510108\",\"510112\",\"510113\",\"510114\",\"510115\",\"510116\",\"510121\",\"510124\",\"510129\",\"510131\",\"510132\",\"510181\",\"510182\",\"510183\",\"510184\",\"510185\",\"510300\",\"510301\",\"510302\",\"510303\",\"510304\",\"510311\",\"510321\",\"510322\",\"510400\",\"510401\",\"510402\",\"510403\",\"510411\",\"510421\",\"510422\",\"510500\",\"510501\",\"510502\",\"510503\",\"510504\",\"510521\",\"510522\",\"510524\",\"510525\",\"510600\",\"510601\",\"510603\",\"510623\",\"510626\",\"510681\",\"510682\",\"510683\",\"510700\",\"510701\",\"510703\",\"510704\",\"510705\",\"510722\",\"510723\",\"510725\",\"510726\",\"510727\",\"510781\",\"510800\",\"510801\",\"510802\",\"510811\",\"510812\",\"510821\",\"510822\",\"510823\",\"510824\",\"510900\",\"510901\",\"510903\",\"510904\",\"510921\",\"510922\",\"510923\",\"511000\",\"511001\",\"511002\",\"511011\",\"511024\",\"511025\",\"511028\",\"511100\",\"511101\",\"511102\",\"511111\",\"511112\",\"511113\",\"511123\",\"511124\",\"511126\",\"511129\",\"511132\",\"511133\",\"511181\",\"511300\",\"511301\",\"511302\",\"511303\",\"511304\",\"511321\",\"511322\",\"511323\",\"511324\",\"511325\",\"511381\",\"511400\",\"511401\",\"511402\",\"511403\",\"511421\",\"511423\",\"511424\",\"511425\",\"511500\",\"511501\",\"511502\",\"511503\",\"511521\",\"511523\",\"511524\",\"511525\",\"511526\",\"511527\",\"511528\",\"511529\",\"511600\",\"511601\",\"511602\",\"511603\",\"511621\",\"511622\",\"511623\",\"511681\",\"511700\",\"511701\",\"511702\",\"511703\",\"511722\",\"511723\",\"511724\",\"511725\",\"511781\",\"511800\",\"511801\",\"511802\",\"511803\",\"511822\",\"511823\",\"511824\",\"511825\",\"511826\",\"511827\",\"511900\",\"511901\",\"511902\",\"511903\",\"511921\",\"511922\",\"511923\",\"512000\",\"512001\",\"512002\",\"512021\",\"512022\",\"513200\",\"513201\",\"513221\",\"513222\",\"513223\",\"513224\",\"513225\",\"513226\",\"513227\",\"513228\",\"513230\",\"513231\",\"513232\",\"513233\",\"513300\",\"513301\",\"513322\",\"513323\",\"513324\",\"513325\",\"513326\",\"513327\",\"513328\",\"513329\",\"513330\",\"513331\",\"513332\",\"513333\",\"513334\",\"513335\",\"513336\",\"513337\",\"513338\",\"513400\",\"513401\",\"513422\",\"513423\",\"513424\",\"513425\",\"513426\",\"513427\",\"513428\",\"513429\",\"513430\",\"513431\",\"513432\",\"513433\",\"513434\",\"513435\",\"513436\",\"513437\",\"520000\",\"520100\",\"520101\",\"520102\",\"520103\",\"520111\",\"520112\",\"520113\",\"520115\",\"520121\",\"520122\",\"520123\",\"520181\",\"520200\",\"520201\",\"520203\",\"520221\",\"520222\",\"520300\",\"520301\",\"520302\",\"520303\",\"520304\",\"520322\",\"520323\",\"520324\",\"520325\",\"520326\",\"520327\",\"520328\",\"520329\",\"520330\",\"520381\",\"520382\",\"520400\",\"520401\",\"520402\",\"520403\",\"520422\",\"520423\",\"520424\",\"520425\",\"520500\",\"520501\",\"520502\",\"520521\",\"520522\",\"520523\",\"520524\",\"520525\",\"520526\",\"520527\",\"520600\",\"520601\",\"520602\",\"520603\",\"520621\",\"520622\",\"520623\",\"520624\",\"520625\",\"520626\",\"520627\",\"520628\",\"522300\",\"522301\",\"522322\",\"522323\",\"522324\",\"522325\",\"522326\",\"522327\",\"522328\",\"522600\",\"522601\",\"522622\",\"522623\",\"522624\",\"522625\",\"522626\",\"522627\",\"522628\",\"522629\",\"522630\",\"522631\",\"522632\",\"522633\",\"522634\",\"522635\",\"522636\",\"522700\",\"522701\",\"522702\",\"522722\",\"522723\",\"522725\",\"522726\",\"522727\",\"522728\",\"522729\",\"522730\",\"522731\",\"522732\",\"530000\",\"530100\",\"530101\",\"530102\",\"530103\",\"530111\",\"530112\",\"530113\",\"530114\",\"530122\",\"530124\",\"530125\",\"530126\",\"530127\",\"530128\",\"530129\",\"530181\",\"530300\",\"530301\",\"530302\",\"530303\",\"530321\",\"530322\",\"530323\",\"530324\",\"530325\",\"530326\",\"530381\",\"530400\",\"530401\",\"530402\",\"530403\",\"530422\",\"530423\",\"530424\",\"530425\",\"530426\",\"530427\",\"530428\",\"530500\",\"530501\",\"530502\",\"530521\",\"530523\",\"530524\",\"530581\",\"530600\",\"530601\",\"530602\",\"530621\",\"530622\",\"530623\",\"530624\",\"530625\",\"530626\",\"530627\",\"530628\",\"530629\",\"530630\",\"530700\",\"530701\",\"530702\",\"530721\",\"530722\",\"530723\",\"530724\",\"530800\",\"530801\",\"530802\",\"530821\",\"530822\",\"530823\",\"530824\",\"530825\",\"530826\",\"530827\",\"530828\",\"530829\",\"530900\",\"530901\",\"530902\",\"530921\",\"530922\",\"530923\",\"530924\",\"530925\",\"530926\",\"530927\",\"532300\",\"532301\",\"532322\",\"532323\",\"532324\",\"532325\",\"532326\",\"532327\",\"532328\",\"532329\",\"532331\",\"532500\",\"532501\",\"532502\",\"532503\",\"532504\",\"532523\",\"532524\",\"532525\",\"532527\",\"532528\",\"532529\",\"532530\",\"532531\",\"532532\",\"532600\",\"532601\",\"532622\",\"532623\",\"532624\",\"532625\",\"532626\",\"532627\",\"532628\",\"532800\",\"532801\",\"532822\",\"532823\",\"532900\",\"532901\",\"532922\",\"532923\",\"532924\",\"532925\",\"532926\",\"532927\",\"532928\",\"532929\",\"532930\",\"532931\",\"532932\",\"533100\",\"533102\",\"533103\",\"533122\",\"533123\",\"533124\",\"533300\",\"533301\",\"533323\",\"533324\",\"533325\",\"533400\",\"533401\",\"533422\",\"533423\",\"540000\",\"540100\",\"540101\",\"540102\",\"540103\",\"540121\",\"540122\",\"540123\",\"540124\",\"540126\",\"540127\",\"540200\",\"540202\",\"540221\",\"540222\",\"540223\",\"540224\",\"540225\",\"540226\",\"540227\",\"540228\",\"540229\",\"540230\",\"540231\",\"540232\",\"540233\",\"540234\",\"540235\",\"540236\",\"540237\",\"540300\",\"540302\",\"540321\",\"540322\",\"540323\",\"540324\",\"540325\",\"540326\",\"540327\",\"540328\",\"540329\",\"540330\",\"540400\",\"540402\",\"540421\",\"540422\",\"540423\",\"540424\",\"540425\",\"540426\",\"540500\",\"540501\",\"540502\",\"540521\",\"540522\",\"540523\",\"540524\",\"540525\",\"540526\",\"540527\",\"540528\",\"540529\",\"540530\",\"540531\",\"542400\",\"542421\",\"542422\",\"542423\",\"542424\",\"542425\",\"542426\",\"542427\",\"542428\",\"542429\",\"542430\",\"542431\",\"542500\",\"542521\",\"542522\",\"542523\",\"542524\",\"542525\",\"542526\",\"542527\",\"610000\",\"610100\",\"610101\",\"610102\",\"610103\",\"610104\",\"610111\",\"610112\",\"610113\",\"610114\",\"610115\",\"610116\",\"610117\",\"610122\",\"610124\",\"610125\",\"610200\",\"610201\",\"610202\",\"610203\",\"610204\",\"610222\",\"610300\",\"610301\",\"610302\",\"610303\",\"610304\",\"610322\",\"610323\",\"610324\",\"610326\",\"610327\",\"610328\",\"610329\",\"610330\",\"610331\",\"610400\",\"610401\",\"610402\",\"610403\",\"610404\",\"610422\",\"610423\",\"610424\",\"610425\",\"610426\",\"610427\",\"610428\",\"610429\",\"610430\",\"610431\",\"610481\",\"610500\",\"610501\",\"610502\",\"610503\",\"610522\",\"610523\",\"610524\",\"610525\",\"610526\",\"610527\",\"610528\",\"610581\",\"610582\",\"610600\",\"610601\",\"610602\",\"610603\",\"610621\",\"610622\",\"610623\",\"610625\",\"610626\",\"610627\",\"610628\",\"610629\",\"610630\",\"610631\",\"610632\",\"610700\",\"610701\",\"610702\",\"610721\",\"610722\",\"610723\",\"610724\",\"610725\",\"610726\",\"610727\",\"610728\",\"610729\",\"610730\",\"610800\",\"610801\",\"610802\",\"610803\",\"610821\",\"610822\",\"610824\",\"610825\",\"610826\",\"610827\",\"610828\",\"610829\",\"610830\",\"610831\",\"610900\",\"610901\",\"610902\",\"610921\",\"610922\",\"610923\",\"610924\",\"610925\",\"610926\",\"610927\",\"610928\",\"610929\",\"611000\",\"611001\",\"611002\",\"611021\",\"611022\",\"611023\",\"611024\",\"611025\",\"611026\",\"620000\",\"620100\",\"620101\",\"620102\",\"620103\",\"620104\",\"620105\",\"620111\",\"620121\",\"620122\",\"620123\",\"620200\",\"620201\",\"620300\",\"620301\",\"620302\",\"620321\",\"620400\",\"620401\",\"620402\",\"620403\",\"620421\",\"620422\",\"620423\",\"620500\",\"620501\",\"620502\",\"620503\",\"620521\",\"620522\",\"620523\",\"620524\",\"620525\",\"620600\",\"620601\",\"620602\",\"620621\",\"620622\",\"620623\",\"620700\",\"620701\",\"620702\",\"620721\",\"620722\",\"620723\",\"620724\",\"620725\",\"620800\",\"620801\",\"620802\",\"620821\",\"620822\",\"620823\",\"620824\",\"620825\",\"620826\",\"620900\",\"620901\",\"620902\",\"620921\",\"620922\",\"620923\",\"620924\",\"620981\",\"620982\",\"621000\",\"621001\",\"621002\",\"621021\",\"621022\",\"621023\",\"621024\",\"621025\",\"621026\",\"621027\",\"621100\",\"621101\",\"621102\",\"621121\",\"621122\",\"621123\",\"621124\",\"621125\",\"621126\",\"621200\",\"621201\",\"621202\",\"621221\",\"621222\",\"621223\",\"621224\",\"621225\",\"621226\",\"621227\",\"621228\",\"622900\",\"622901\",\"622921\",\"622922\",\"622923\",\"622924\",\"622925\",\"622926\",\"622927\",\"623000\",\"623001\",\"623021\",\"623022\",\"623023\",\"623024\",\"623025\",\"623026\",\"623027\",\"630000\",\"630100\",\"630101\",\"630102\",\"630103\",\"630104\",\"630105\",\"630121\",\"630122\",\"630123\",\"630200\",\"630202\",\"630203\",\"630222\",\"630223\",\"630224\",\"630225\",\"632200\",\"632221\",\"632222\",\"632223\",\"632224\",\"632300\",\"632321\",\"632322\",\"632323\",\"632324\",\"632500\",\"632521\",\"632522\",\"632523\",\"632524\",\"632525\",\"632600\",\"632621\",\"632622\",\"632623\",\"632624\",\"632625\",\"632626\",\"632700\",\"632701\",\"632722\",\"632723\",\"632724\",\"632725\",\"632726\",\"632800\",\"632801\",\"632802\",\"632821\",\"632822\",\"632823\",\"640000\",\"640100\",\"640101\",\"640104\",\"640105\",\"640106\",\"640121\",\"640122\",\"640181\",\"640200\",\"640201\",\"640202\",\"640205\",\"640221\",\"640300\",\"640301\",\"640302\",\"640303\",\"640323\",\"640324\",\"640381\",\"640400\",\"640401\",\"640402\",\"640422\",\"640423\",\"640424\",\"640425\",\"640500\",\"640501\",\"640502\",\"640521\",\"640522\",\"650000\",\"650100\",\"650101\",\"650102\",\"650103\",\"650104\",\"650105\",\"650106\",\"650107\",\"650109\",\"650121\",\"650200\",\"650201\",\"650202\",\"650203\",\"650204\",\"650205\",\"650400\",\"650402\",\"650421\",\"650422\",\"650500\",\"650502\",\"650521\",\"650522\",\"652300\",\"652301\",\"652302\",\"652323\",\"652324\",\"652325\",\"652327\",\"652328\",\"652700\",\"652701\",\"652702\",\"652722\",\"652723\",\"652800\",\"652801\",\"652822\",\"652823\",\"652824\",\"652825\",\"652826\",\"652827\",\"652828\",\"652829\",\"652900\",\"652901\",\"652922\",\"652923\",\"652924\",\"652925\",\"652926\",\"652927\",\"652928\",\"652929\",\"653000\",\"653001\",\"653022\",\"653023\",\"653024\",\"653100\",\"653101\",\"653121\",\"653122\",\"653123\",\"653124\",\"653125\",\"653126\",\"653127\",\"653128\",\"653129\",\"653130\",\"653131\",\"653200\",\"653201\",\"653221\",\"653222\",\"653223\",\"653224\",\"653225\",\"653226\",\"653227\",\"654000\",\"654002\",\"654003\",\"654004\",\"654021\",\"654022\",\"654023\",\"654024\",\"654025\",\"654026\",\"654027\",\"654028\",\"654200\",\"654201\",\"654202\",\"654221\",\"654223\",\"654224\",\"654225\",\"654226\",\"654300\",\"654301\",\"654321\",\"654322\",\"654323\",\"654324\",\"654325\",\"654326\",\"659000\",\"659001\",\"659002\",\"659003\",\"659004\",\"659006\",\"710000\",\"710100\",\"710101\",\"810000\",\"810100\",\"810101\",\"820000\",\"820100\",\"820101\"]', '1', '1', '2018-04-17 15:53:03', '2018-04-17 15:53:03');

-- -----------------------------
-- Table structure for `ibid_user_accounts`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_accounts`;
CREATE TABLE `ibid_user_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(50) NOT NULL COMMENT '登录的唯一标识符',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `pay_password` varchar(255) DEFAULT NULL COMMENT '支付密码',
  `qq_openid` varchar(255) DEFAULT NULL COMMENT 'qq的appid',
  `wechat_openid` varchar(255) DEFAULT NULL COMMENT '微信的appid',
  `user_id` bigint(20) DEFAULT '0' COMMENT '用户ID',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态:1正常0已删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_accounts`
-- -----------------------------
INSERT INTO `ibid_user_accounts` VALUES ('1', '18888888888', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '6A68B0BC42579A3DA75B3A3072567B03', '', '1', '1', '2018-04-17 15:58:46', '2018-04-23 17:54:36');
INSERT INTO `ibid_user_accounts` VALUES ('2', '15802577957', 'e6297b585db794e177808f8953b46669', 'edfbc90d1c56d046d983a1c5fe053996', '', 'oOVUO1SBGoYj8nQPktUxmryM5JTw', '2', '1', '2018-04-17 16:14:28', '2018-04-24 16:47:13');
INSERT INTO `ibid_user_accounts` VALUES ('3', '15580841403', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '3', '1', '2018-04-17 18:08:00', '2018-04-19 15:50:30');
INSERT INTO `ibid_user_accounts` VALUES ('4', '15802577957', 'e6297b585db794e177808f8953b46669', 'fbbcb3cd19d39b943e1ee052c4fbed0e', '', '', '4', '0', '2018-04-18 09:10:30', '2018-04-24 16:45:31');
INSERT INTO `ibid_user_accounts` VALUES ('5', '13170308670', '58ea7ee5188b7ea946b66cff50bf5e82', '58ea7ee5188b7ea946b66cff50bf5e82', '', '', '5', '1', '2018-04-18 09:14:16', '2018-04-18 09:22:33');
INSERT INTO `ibid_user_accounts` VALUES ('6', '15111463656', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '6', '1', '2018-04-18 09:34:43', '2018-04-18 09:34:43');
INSERT INTO `ibid_user_accounts` VALUES ('7', '18112344321', 'e6297b585db794e177808f8953b46669', '', '', '', '7', '0', '2018-04-18 09:38:47', '2018-04-18 09:53:05');
INSERT INTO `ibid_user_accounts` VALUES ('8', '18390916324', 'b5305e8c4c5e08c246943fe736701525', '', '', 'oNGLot6yK7NjXdCCbnEdbL2gSqCQ', '8', '0', '2018-04-18 10:08:34', '2018-04-18 13:58:41');
INSERT INTO `ibid_user_accounts` VALUES ('9', '13574849891', 'b5305e8c4c5e08c246943fe736701525', 'b5305e8c4c5e08c246943fe736701525', '', '', '9', '1', '2018-04-18 10:16:12', '2018-04-23 23:12:07');
INSERT INTO `ibid_user_accounts` VALUES ('10', '17670745968', 'ad876092c713c304e4eabbd8f7b16f49', '48f9ce599c5f49aaff86250921df153b', '', '', '10', '1', '2018-04-18 13:52:55', '2018-04-23 12:00:30');
INSERT INTO `ibid_user_accounts` VALUES ('11', '18390916324', '66dc06c66d531adc998fa5f82f8f0d0a', 'b5305e8c4c5e08c246943fe736701525', '', '', '11', '1', '2018-04-18 13:59:33', '2018-04-18 14:07:03');
INSERT INTO `ibid_user_accounts` VALUES ('12', '18399999999', 'e6297b585db794e177808f8953b46669', '', '', '', '12', '1', '2018-04-18 15:15:01', '2018-04-18 15:15:01');
INSERT INTO `ibid_user_accounts` VALUES ('13', '18788888888', 'e6297b585db794e177808f8953b46669', 'e6297b585db794e177808f8953b46669', '', '', '13', '1', '2018-04-18 15:50:30', '2018-04-21 20:30:57');
INSERT INTO `ibid_user_accounts` VALUES ('14', '15580841409', 'b5305e8c4c5e08c246943fe736701525', '', '', '', '14', '1', '2018-04-19 09:39:25', '2018-04-19 09:39:25');
INSERT INTO `ibid_user_accounts` VALUES ('15', '17621502221', 'e6297b585db794e177808f8953b46669', '', '', '', '15', '1', '2018-04-19 11:58:27', '2018-04-19 11:58:27');
INSERT INTO `ibid_user_accounts` VALUES ('16', '17621502222', 'e6297b585db794e177808f8953b46669', '', '', '', '16', '1', '2018-04-19 22:30:46', '2018-04-19 22:30:46');
INSERT INTO `ibid_user_accounts` VALUES ('17', '17621502223', 'e6297b585db794e177808f8953b46669', '', '', '', '17', '1', '2018-04-19 22:31:34', '2018-04-19 22:31:34');
INSERT INTO `ibid_user_accounts` VALUES ('18', '17621503333', 'e6297b585db794e177808f8953b46669', '', '', '', '18', '1', '2018-04-19 22:32:08', '2018-04-19 22:32:08');
INSERT INTO `ibid_user_accounts` VALUES ('19', '17621506666', 'e6297b585db794e177808f8953b46669', '', '', '', '19', '1', '2018-04-19 22:32:31', '2018-04-19 22:32:31');
INSERT INTO `ibid_user_accounts` VALUES ('20', '17621502224', 'e6297b585db794e177808f8953b46669', '', '', '', '20', '1', '2018-04-20 09:43:18', '2018-04-20 09:43:18');
INSERT INTO `ibid_user_accounts` VALUES ('21', '15274901730', 'fbbcb3cd19d39b943e1ee052c4fbed0e', '', '', '', '21', '1', '2018-04-23 17:00:39', '2018-04-23 17:00:39');
INSERT INTO `ibid_user_accounts` VALUES ('22', '15500000000', 'b5305e8c4c5e08c246943fe736701525', 'e6297b585db794e177808f8953b46669', '', '', '22', '1', '2018-04-25 08:21:14', '2018-04-25 08:24:38');

-- -----------------------------
-- Table structure for `ibid_user_asset_logs`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_asset_logs`;
CREATE TABLE `ibid_user_asset_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `asset_type` varchar(255) NOT NULL COMMENT '资产类别',
  `change_type` varchar(255) NOT NULL COMMENT '资产变动类别',
  `change_money` decimal(10,2) NOT NULL COMMENT '资产变动金额',
  `intro` text NOT NULL COMMENT '资产日志简介',
  `desc` text COMMENT '资产日志详情',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_asset_logs`
-- -----------------------------
INSERT INTO `ibid_user_asset_logs` VALUES ('1', '10', 'money', 'user_pay', '0.01', '购物支付【N2018041813552469962】', '会员购物扣款，订单号：N2018041813552469962', '1', '2018-04-18 13:56:54', '2018-04-18 13:56:54');
INSERT INTO `ibid_user_asset_logs` VALUES ('2', '1', 'money', 'user_pay', '0.01', '购物支付【N2018041816283070264】', '会员购物扣款，订单号：N2018041816283070264', '1', '2018-04-18 16:30:00', '2018-04-18 16:30:00');
INSERT INTO `ibid_user_asset_logs` VALUES ('3', '2', 'money', 'user_money_recharge', '10000.00', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-04-19 10:31:43', '2018-04-19 10:31:43');
INSERT INTO `ibid_user_asset_logs` VALUES ('4', '1', 'money', 'user_drawcash', '25.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-19 10:31:45', '2018-04-19 10:31:45');
INSERT INTO `ibid_user_asset_logs` VALUES ('5', '2', 'money', 'user_drawcash', '500.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-19 10:32:00', '2018-04-19 10:32:00');
INSERT INTO `ibid_user_asset_logs` VALUES ('6', '2', 'money', 'user_drawcash', '500.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-19 10:32:14', '2018-04-19 10:32:14');
INSERT INTO `ibid_user_asset_logs` VALUES ('7', '2', 'money', 'user_drawcash', '500.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-19 10:32:26', '2018-04-19 10:32:26');
INSERT INTO `ibid_user_asset_logs` VALUES ('8', '1', 'money', 'user_drawcash', '2.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-19 10:32:29', '2018-04-19 10:32:29');
INSERT INTO `ibid_user_asset_logs` VALUES ('9', '2', 'money', 'user_pay', '0.01', '购物支付【N2018041910382492331】', '会员购物扣款，订单号：N2018041910382492331', '1', '2018-04-19 10:39:43', '2018-04-19 10:39:43');
INSERT INTO `ibid_user_asset_logs` VALUES ('10', '2', 'money', 'user_pay_return', '0.01', '订单退款【G2018041910443439445】', '会员申请订单退款，退款订单号：G2018041910443439445', '1', '2018-04-19 11:00:07', '2018-04-19 11:00:07');
INSERT INTO `ibid_user_asset_logs` VALUES ('11', '3', 'money', 'user_pay', '0.01', '购物支付【N2018041915501526096】', '会员购物扣款，订单号：N2018041915501526096', '1', '2018-04-19 15:52:06', '2018-04-19 15:52:06');
INSERT INTO `ibid_user_asset_logs` VALUES ('12', '3', 'money', 'user_pay', '0.01', '购物支付【N2018041915523878573】', '会员购物扣款，订单号：N2018041915523878573', '1', '2018-04-19 15:52:45', '2018-04-19 15:52:45');
INSERT INTO `ibid_user_asset_logs` VALUES ('13', '1', 'money', 'user_pay', '0.01', '购物支付【N2018041922254816260】', '会员购物扣款，订单号：N2018041922254816260', '1', '2018-04-19 22:25:55', '2018-04-19 22:25:55');
INSERT INTO `ibid_user_asset_logs` VALUES ('14', '1', 'money', 'user_pay', '0.01', '购物支付【N2018041922355082735】', '会员购物扣款，订单号：N2018041922355082735', '1', '2018-04-19 22:36:14', '2018-04-19 22:36:14');
INSERT INTO `ibid_user_asset_logs` VALUES ('15', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042009073999745】', '会员购物扣款，订单号：N2018042009073999745', '1', '2018-04-20 09:07:46', '2018-04-20 09:07:46');
INSERT INTO `ibid_user_asset_logs` VALUES ('16', '2', 'money', 'user_pay_return', '126.00', '订单退款【G2018042009082602829】', '会员申请订单退款，退款订单号：G2018042009082602829', '1', '2018-04-20 09:08:44', '2018-04-20 09:08:44');
INSERT INTO `ibid_user_asset_logs` VALUES ('17', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042009213838295】', '会员购物扣款，订单号：N2018042009213838295', '1', '2018-04-20 09:21:47', '2018-04-20 09:21:47');
INSERT INTO `ibid_user_asset_logs` VALUES ('18', '2', 'money', 'user_money_recharge', '10000.00', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-04-20 09:54:18', '2018-04-20 09:54:18');
INSERT INTO `ibid_user_asset_logs` VALUES ('19', '2', 'money', 'user_pay', '28.00', '购物支付【N2018042011004032942】', '会员购物扣款，订单号：N2018042011004032942', '1', '2018-04-20 11:00:53', '2018-04-20 11:00:53');
INSERT INTO `ibid_user_asset_logs` VALUES ('20', '2', 'money', 'user_pay', '266.00', '购物支付【N2018042011012843763】', '会员购物扣款，订单号：N2018042011012843763', '1', '2018-04-20 11:02:13', '2018-04-20 11:02:13');
INSERT INTO `ibid_user_asset_logs` VALUES ('21', '2', 'money', 'user_pay', '28.00', '购物支付【N2018042011075139652】', '会员购物扣款，订单号：N2018042011075139652', '1', '2018-04-20 11:07:57', '2018-04-20 11:07:57');
INSERT INTO `ibid_user_asset_logs` VALUES ('22', '1', 'money', 'user_pay', '164.00', '购物支付【N2018042011310156419】', '会员购物扣款，订单号：N2018042011310156419', '1', '2018-04-20 11:31:07', '2018-04-20 11:31:07');
INSERT INTO `ibid_user_asset_logs` VALUES ('23', '2', 'money', 'user_pay', '710.00', '购物支付【N2018042011384470391】', '会员购物扣款，订单号：N2018042011384470391', '1', '2018-04-20 11:38:50', '2018-04-20 11:38:50');
INSERT INTO `ibid_user_asset_logs` VALUES ('24', '2', 'money', 'user_pay', '28.00', '购物支付【N2018042011391323660】', '会员购物扣款，订单号：N2018042011391323660', '1', '2018-04-20 11:39:19', '2018-04-20 11:39:19');
INSERT INTO `ibid_user_asset_logs` VALUES ('25', '1', 'money', 'user_money_recharge', '0.01', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-04-20 11:44:11', '2018-04-20 11:44:11');
INSERT INTO `ibid_user_asset_logs` VALUES ('26', '2', 'money', 'user_pay', '28.00', '购物支付【N2018042011454269059】', '会员购物扣款，订单号：N2018042011454269059', '1', '2018-04-20 11:45:47', '2018-04-20 11:45:47');
INSERT INTO `ibid_user_asset_logs` VALUES ('27', '2', 'money', 'user_pay', '558.00', '购物支付【N2018042011470867806】', '会员购物扣款，订单号：N2018042011470867806', '1', '2018-04-20 11:47:15', '2018-04-20 11:47:15');
INSERT INTO `ibid_user_asset_logs` VALUES ('28', '2', 'money', 'user_pay', '28.00', '购物支付【N2018042011480370172】', '会员购物扣款，订单号：N2018042011480370172', '1', '2018-04-20 11:48:15', '2018-04-20 11:48:15');
INSERT INTO `ibid_user_asset_logs` VALUES ('29', '2', 'money', 'user_pay', '28.00', '购物支付【N2018042011541031981】', '会员购物扣款，订单号：N2018042011541031981', '1', '2018-04-20 11:54:31', '2018-04-20 11:54:31');
INSERT INTO `ibid_user_asset_logs` VALUES ('30', '2', 'money', 'user_pay', '562.00', '购物支付【N2018042011584902171】', '会员购物扣款，订单号：N2018042011584902171', '1', '2018-04-20 11:58:56', '2018-04-20 11:58:56');
INSERT INTO `ibid_user_asset_logs` VALUES ('31', '13', 'money', 'user_money_recharge', '0.01', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-04-20 11:59:56', '2018-04-20 11:59:56');
INSERT INTO `ibid_user_asset_logs` VALUES ('32', '2', 'money', 'user_pay', '512.00', '购物支付【N2018042012001382980】', '会员购物扣款，订单号：N2018042012001382980', '1', '2018-04-20 12:00:19', '2018-04-20 12:00:19');
INSERT INTO `ibid_user_asset_logs` VALUES ('33', '2', 'money', 'user_pay', '468.00', '购物支付【N2018042013510125003】', '会员购物扣款，订单号：N2018042013510125003', '1', '2018-04-20 13:51:08', '2018-04-20 13:51:08');
INSERT INTO `ibid_user_asset_logs` VALUES ('34', '2', 'money', 'user_pay', '164.00', '购物支付【N2018042014215332189】', '会员购物扣款，订单号：N2018042014215332189', '1', '2018-04-20 14:22:05', '2018-04-20 14:22:05');
INSERT INTO `ibid_user_asset_logs` VALUES ('35', '2', 'money', 'user_pay_return', '278.00', '订单退款【G2018042013524693486】', '会员申请订单退款，退款订单号：G2018042013524693486', '1', '2018-04-21 09:12:59', '2018-04-21 09:12:59');
INSERT INTO `ibid_user_asset_logs` VALUES ('36', '2', 'money', 'user_pay', '568.00', '购物支付【N2018042109163848164】', '会员购物扣款，订单号：N2018042109163848164', '1', '2018-04-21 09:16:45', '2018-04-21 09:16:45');
INSERT INTO `ibid_user_asset_logs` VALUES ('37', '1', 'money', 'user_pay', '312.00', '购物支付【N2018042110295053987】', '会员购物扣款，订单号：N2018042110295053987', '1', '2018-04-21 10:30:04', '2018-04-21 10:30:04');
INSERT INTO `ibid_user_asset_logs` VALUES ('38', '1', 'money', 'user_pay_return', '94.81', '订单退款【G2018042110323741461】', '会员申请订单退款，退款订单号：G2018042110323741461', '1', '2018-04-21 10:33:42', '2018-04-21 10:33:42');
INSERT INTO `ibid_user_asset_logs` VALUES ('39', '1', 'money', 'user_pay_return', '209.19', '订单退款【G2018042110340030266】', '会员申请订单退款，退款订单号：G2018042110340030266', '1', '2018-04-21 10:34:15', '2018-04-21 10:34:15');
INSERT INTO `ibid_user_asset_logs` VALUES ('40', '2', 'money', 'user_pay', '641.00', '购物支付【N2018042110355525254】', '会员购物扣款，订单号：N2018042110355525254', '1', '2018-04-21 10:36:02', '2018-04-21 10:36:02');
INSERT INTO `ibid_user_asset_logs` VALUES ('41', '3', 'money', 'user_pay', '0.02', '购物支付【N2018042111553545991】', '会员购物扣款，订单号：N2018042111553545991', '1', '2018-04-21 11:56:14', '2018-04-21 11:56:14');
INSERT INTO `ibid_user_asset_logs` VALUES ('42', '3', 'money', 'user_pay', '0.02', '购物支付【N2018042114380374048】', '会员购物扣款，订单号：N2018042114380374048', '1', '2018-04-21 14:38:41', '2018-04-21 14:38:41');
INSERT INTO `ibid_user_asset_logs` VALUES ('43', '10', 'money', 'user_money_recharge', '1.00', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-04-21 18:06:44', '2018-04-21 18:06:44');
INSERT INTO `ibid_user_asset_logs` VALUES ('44', '10', 'money', 'user_money_recharge', '1.00', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-04-21 18:09:36', '2018-04-21 18:09:36');
INSERT INTO `ibid_user_asset_logs` VALUES ('45', '10', 'money', 'user_money_recharge', '1.00', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-04-21 18:10:02', '2018-04-21 18:10:02');
INSERT INTO `ibid_user_asset_logs` VALUES ('46', '10', 'money', 'user_drawcash', '0.01', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-21 18:27:01', '2018-04-21 18:27:01');
INSERT INTO `ibid_user_asset_logs` VALUES ('47', '10', 'money', 'user_drawcash', '0.01', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-21 18:27:24', '2018-04-21 18:27:24');
INSERT INTO `ibid_user_asset_logs` VALUES ('48', '10', 'money', 'user_drawcash', '0.01', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-21 18:27:30', '2018-04-21 18:27:30');
INSERT INTO `ibid_user_asset_logs` VALUES ('49', '10', 'money', 'user_drawcash', '0.01', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-21 18:27:46', '2018-04-21 18:27:46');
INSERT INTO `ibid_user_asset_logs` VALUES ('50', '10', 'money', 'user_drawcash', '1.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-21 18:27:30', '2018-04-21 18:27:30');
INSERT INTO `ibid_user_asset_logs` VALUES ('51', '10', 'money', 'user_drawcash', '1.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-21 18:28:24', '2018-04-21 18:28:24');
INSERT INTO `ibid_user_asset_logs` VALUES ('52', '9', 'money', 'user_pay', '223.01', '购物支付【N2018042116504013328】', '会员购物扣款，订单号：N2018042116504013328', '1', '2018-04-21 20:10:46', '2018-04-21 20:10:46');
INSERT INTO `ibid_user_asset_logs` VALUES ('53', '9', 'money', 'user_pay', '1112.01', '购物支付【N2018042121014119415】', '会员购物扣款，订单号：N2018042121014119415', '1', '2018-04-21 21:01:48', '2018-04-21 21:01:48');
INSERT INTO `ibid_user_asset_logs` VALUES ('54', '9', 'money', 'user_pay', '120.01', '购物支付【N2018042217560778921】', '会员购物扣款，订单号：N2018042217560778921', '1', '2018-04-22 17:56:14', '2018-04-22 17:56:14');
INSERT INTO `ibid_user_asset_logs` VALUES ('55', '3', 'money', 'user_pay', '0.02', '购物支付【N2018042221471223569】', '会员购物扣款，订单号：N2018042221471223569', '1', '2018-04-22 21:47:20', '2018-04-22 21:47:20');
INSERT INTO `ibid_user_asset_logs` VALUES ('56', '3', 'money', 'user_pay', '0.02', '购物支付【N2018042223010175153】', '会员购物扣款，订单号：N2018042223010175153', '1', '2018-04-22 23:01:10', '2018-04-22 23:01:10');
INSERT INTO `ibid_user_asset_logs` VALUES ('57', '3', 'money', 'user_pay', '0.03', '购物支付【N2018042223053803157】', '会员购物扣款，订单号：N2018042223053803157', '1', '2018-04-22 23:05:47', '2018-04-22 23:05:47');
INSERT INTO `ibid_user_asset_logs` VALUES ('58', '9', 'money', 'user_money_recharge', '1.00', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-04-23 10:12:06', '2018-04-23 10:12:06');
INSERT INTO `ibid_user_asset_logs` VALUES ('59', '10', 'money', 'user_pay', '268.01', '购物支付【N2018042117592494796】', '会员购物扣款，订单号：N2018042117592494796', '1', '2018-04-23 10:19:03', '2018-04-23 10:19:03');
INSERT INTO `ibid_user_asset_logs` VALUES ('60', '10', 'money', 'user_pay', '0.01', '购物支付【N2018042310234200400】', '会员购物扣款，订单号：N2018042310234200400', '1', '2018-04-23 10:23:52', '2018-04-23 10:23:52');
INSERT INTO `ibid_user_asset_logs` VALUES ('61', '2', 'money', 'user_pay_return', '164.00', '订单退款【G2018042310511979814】', '会员申请订单退款，退款订单号：G2018042310511979814', '1', '2018-04-23 10:52:10', '2018-04-23 10:52:10');
INSERT INTO `ibid_user_asset_logs` VALUES ('62', '2', 'money', 'user_money_recharge', '0.10', '会员钱包充值', '会员通过第三方对钱包进行充值', '1', '2018-04-23 15:31:46', '2018-04-23 15:31:46');
INSERT INTO `ibid_user_asset_logs` VALUES ('63', '2', 'money', 'user_pay', '106.00', '购物支付【N2018042315310289153】', '会员购物扣款，订单号：N2018042315310289153', '1', '2018-04-23 15:44:46', '2018-04-23 15:44:46');
INSERT INTO `ibid_user_asset_logs` VALUES ('64', '2', 'money', 'user_pay', '76.00', '购物支付【N2018042315453351190】', '会员购物扣款，订单号：N2018042315453351190', '1', '2018-04-23 15:46:09', '2018-04-23 15:46:09');
INSERT INTO `ibid_user_asset_logs` VALUES ('65', '2', 'money', 'user_pay', '76.00', '购物支付【N2018042315454925929】', '会员购物扣款，订单号：N2018042315454925929', '1', '2018-04-23 15:50:12', '2018-04-23 15:50:12');
INSERT INTO `ibid_user_asset_logs` VALUES ('66', '2', 'money', 'user_pay', '63.00', '购物支付【N2018042315505461452】', '会员购物扣款，订单号：N2018042315505461452', '1', '2018-04-23 16:20:32', '2018-04-23 16:20:32');
INSERT INTO `ibid_user_asset_logs` VALUES ('67', '2', 'money', 'user_pay', '106.00', '购物支付【N2018042315265183509】', '会员购物扣款，订单号：N2018042315265183509', '1', '2018-04-23 16:20:48', '2018-04-23 16:20:48');
INSERT INTO `ibid_user_asset_logs` VALUES ('68', '2', 'money', 'user_pay', '0.02', '购物支付【N2018042309422214927】', '会员购物扣款，订单号：N2018042309422214927', '1', '2018-04-23 16:21:04', '2018-04-23 16:21:04');
INSERT INTO `ibid_user_asset_logs` VALUES ('69', '2', 'money', 'user_pay', '106.00', '购物支付【N2018042315254092616】', '会员购物扣款，订单号：N2018042315254092616', '1', '2018-04-23 16:23:32', '2018-04-23 16:23:32');
INSERT INTO `ibid_user_asset_logs` VALUES ('70', '2', 'money', 'user_pay', '106.00', '购物支付【N2018042315253504362】', '会员购物扣款，订单号：N2018042315253504362', '1', '2018-04-23 16:23:50', '2018-04-23 16:23:50');
INSERT INTO `ibid_user_asset_logs` VALUES ('71', '2', 'money', 'user_pay', '106.00', '购物支付【N2018042315252316644】', '会员购物扣款，订单号：N2018042315252316644', '1', '2018-04-23 16:24:09', '2018-04-23 16:24:09');
INSERT INTO `ibid_user_asset_logs` VALUES ('72', '2', 'money', 'user_pay', '344.00', '购物支付【N2018042317222430475】', '会员购物扣款，订单号：N2018042317222430475', '1', '2018-04-23 17:22:34', '2018-04-23 17:22:34');
INSERT INTO `ibid_user_asset_logs` VALUES ('73', '9', 'money', 'user_pay', '278.00', '购物支付【N2018042317171995010】', '会员购物扣款，订单号：N2018042317171995010', '1', '2018-04-23 17:43:05', '2018-04-23 17:43:05');
INSERT INTO `ibid_user_asset_logs` VALUES ('74', '9', 'money', 'user_pay', '200.00', '购物支付【N2018042316122978480】', '会员购物扣款，订单号：N2018042316122978480', '1', '2018-04-23 17:43:27', '2018-04-23 17:43:27');
INSERT INTO `ibid_user_asset_logs` VALUES ('75', '2', 'money', 'user_pay', '126.00', '购物支付【N2018042317475572147】', '会员购物扣款，订单号：N2018042317475572147', '1', '2018-04-23 17:48:02', '2018-04-23 17:48:02');
INSERT INTO `ibid_user_asset_logs` VALUES ('76', '9', 'money', 'user_pay', '200.00', '购物支付【N2018042316115381315】', '会员购物扣款，订单号：N2018042316115381315', '1', '2018-04-23 17:53:08', '2018-04-23 17:53:08');
INSERT INTO `ibid_user_asset_logs` VALUES ('77', '9', 'money', 'user_pay', '200.00', '购物支付【N2018042316121092889】', '会员购物扣款，订单号：N2018042316121092889', '1', '2018-04-23 17:53:39', '2018-04-23 17:53:39');
INSERT INTO `ibid_user_asset_logs` VALUES ('78', '9', 'money', 'user_pay', '156.00', '购物支付【N2018042320364889784】', '会员购物扣款，订单号：N2018042320364889784', '1', '2018-04-23 20:36:58', '2018-04-23 20:36:58');
INSERT INTO `ibid_user_asset_logs` VALUES ('79', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042320435057117】', '会员购物扣款，订单号：N2018042320435057117', '1', '2018-04-23 20:43:54', '2018-04-23 20:43:54');
INSERT INTO `ibid_user_asset_logs` VALUES ('80', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042320505043324】', '会员购物扣款，订单号：N2018042320505043324', '1', '2018-04-23 20:50:54', '2018-04-23 20:50:54');
INSERT INTO `ibid_user_asset_logs` VALUES ('81', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042320525791496】', '会员购物扣款，订单号：N2018042320525791496', '1', '2018-04-23 20:53:00', '2018-04-23 20:53:00');
INSERT INTO `ibid_user_asset_logs` VALUES ('82', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042320560933334】', '会员购物扣款，订单号：N2018042320560933334', '1', '2018-04-23 20:56:13', '2018-04-23 20:56:13');
INSERT INTO `ibid_user_asset_logs` VALUES ('83', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042320575146499】', '会员购物扣款，订单号：N2018042320575146499', '1', '2018-04-23 20:57:55', '2018-04-23 20:57:55');
INSERT INTO `ibid_user_asset_logs` VALUES ('84', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042320581212956】', '会员购物扣款，订单号：N2018042320581212956', '1', '2018-04-23 20:58:16', '2018-04-23 20:58:16');
INSERT INTO `ibid_user_asset_logs` VALUES ('85', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321000142273】', '会员购物扣款，订单号：N2018042321000142273', '1', '2018-04-23 21:00:05', '2018-04-23 21:00:05');
INSERT INTO `ibid_user_asset_logs` VALUES ('86', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321071744803】', '会员购物扣款，订单号：N2018042321071744803', '1', '2018-04-23 21:07:20', '2018-04-23 21:07:20');
INSERT INTO `ibid_user_asset_logs` VALUES ('87', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321073081298】', '会员购物扣款，订单号：N2018042321073081298', '1', '2018-04-23 21:07:34', '2018-04-23 21:07:34');
INSERT INTO `ibid_user_asset_logs` VALUES ('88', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321082001826】', '会员购物扣款，订单号：N2018042321082001826', '1', '2018-04-23 21:08:24', '2018-04-23 21:08:24');
INSERT INTO `ibid_user_asset_logs` VALUES ('89', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321085609680】', '会员购物扣款，订单号：N2018042321085609680', '1', '2018-04-23 21:09:00', '2018-04-23 21:09:00');
INSERT INTO `ibid_user_asset_logs` VALUES ('90', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321174966453】', '会员购物扣款，订单号：N2018042321174966453', '1', '2018-04-23 21:17:53', '2018-04-23 21:17:53');
INSERT INTO `ibid_user_asset_logs` VALUES ('91', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321182028325】', '会员购物扣款，订单号：N2018042321182028325', '1', '2018-04-23 21:18:23', '2018-04-23 21:18:23');
INSERT INTO `ibid_user_asset_logs` VALUES ('92', '2', 'money', 'user_pay', '278.00', '购物支付【N2018042321241341396】', '会员购物扣款，订单号：N2018042321241341396', '1', '2018-04-23 21:24:17', '2018-04-23 21:24:17');
INSERT INTO `ibid_user_asset_logs` VALUES ('93', '2', 'money', 'user_pay', '126.00', '购物支付【N2018042321264445090】', '会员购物扣款，订单号：N2018042321264445090', '1', '2018-04-23 21:26:48', '2018-04-23 21:26:48');
INSERT INTO `ibid_user_asset_logs` VALUES ('94', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321375229917】', '会员购物扣款，订单号：N2018042321375229917', '1', '2018-04-23 21:37:56', '2018-04-23 21:37:56');
INSERT INTO `ibid_user_asset_logs` VALUES ('95', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321391526867】', '会员购物扣款，订单号：N2018042321391526867', '1', '2018-04-23 21:39:18', '2018-04-23 21:39:18');
INSERT INTO `ibid_user_asset_logs` VALUES ('96', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321392712337】', '会员购物扣款，订单号：N2018042321392712337', '1', '2018-04-23 21:39:31', '2018-04-23 21:39:31');
INSERT INTO `ibid_user_asset_logs` VALUES ('97', '9', 'money', 'user_pay', '126.00', '购物支付【N2018042322395980940】', '会员购物扣款，订单号：N2018042322395980940', '1', '2018-04-23 22:40:07', '2018-04-23 22:40:07');
INSERT INTO `ibid_user_asset_logs` VALUES ('98', '9', 'money', 'user_pay', '126.00', '购物支付【N2018042322432285550】', '会员购物扣款，订单号：N2018042322432285550', '1', '2018-04-23 22:44:07', '2018-04-23 22:44:07');
INSERT INTO `ibid_user_asset_logs` VALUES ('99', '9', 'money', 'user_pay', '468.00', '购物支付【N2018042400013588603】', '会员购物扣款，订单号：N2018042400013588603', '1', '2018-04-24 00:01:46', '2018-04-24 00:01:46');
INSERT INTO `ibid_user_asset_logs` VALUES ('100', '9', 'money', 'user_pay', '468.00', '购物支付【N2018042410201151387】', '会员购物扣款，订单号：N2018042410201151387', '1', '2018-04-24 10:20:22', '2018-04-24 10:20:22');
INSERT INTO `ibid_user_asset_logs` VALUES ('101', '1', 'money', 'user_pay', '278.00', '购物支付【N2018042410275538593】', '会员购物扣款，订单号：N2018042410275538593', '1', '2018-04-24 10:28:13', '2018-04-24 10:28:13');
INSERT INTO `ibid_user_asset_logs` VALUES ('102', '1', 'money', 'user_pay_return', '278.00', '订单退款【G2018042410282167820】', '会员申请订单退款，退款订单号：G2018042410282167820', '1', '2018-04-24 10:28:40', '2018-04-24 10:28:40');
INSERT INTO `ibid_user_asset_logs` VALUES ('103', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042410315947497】', '会员购物扣款，订单号：N2018042410315947497', '1', '2018-04-24 10:32:06', '2018-04-24 10:32:06');
INSERT INTO `ibid_user_asset_logs` VALUES ('104', '2', 'money', 'user_pay_return', '120.06', '订单退款【G2018042317224161462】', '会员申请订单退款，退款订单号：G2018042317224161462', '1', '2018-04-24 10:53:30', '2018-04-24 10:53:30');
INSERT INTO `ibid_user_asset_logs` VALUES ('105', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321271500836】', '会员购物扣款，订单号：N2018042321271500836', '1', '2018-04-24 10:54:48', '2018-04-24 10:54:48');
INSERT INTO `ibid_user_asset_logs` VALUES ('106', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042321182060705】', '会员购物扣款，订单号：N2018042321182060705', '1', '2018-04-24 10:55:08', '2018-04-24 10:55:08');
INSERT INTO `ibid_user_asset_logs` VALUES ('107', '9', 'money', 'user_pay', '126.00', '购物支付【N2018042323003295761】', '会员购物扣款，订单号：N2018042323003295761', '1', '2018-04-24 10:59:01', '2018-04-24 10:59:01');
INSERT INTO `ibid_user_asset_logs` VALUES ('108', '1', 'money', 'user_drawcash', '25.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-24 10:59:31', '2018-04-24 10:59:31');
INSERT INTO `ibid_user_asset_logs` VALUES ('109', '2', 'money', 'user_drawcash', '1.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-24 11:03:49', '2018-04-24 11:03:49');
INSERT INTO `ibid_user_asset_logs` VALUES ('110', '2', 'money', 'user_drawcash', '100.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-24 11:04:06', '2018-04-24 11:04:06');
INSERT INTO `ibid_user_asset_logs` VALUES ('111', '2', 'money', 'user_pay', '0.01', '购物支付【N2018042320530603371】', '会员购物扣款，订单号：N2018042320530603371', '1', '2018-04-24 11:05:40', '2018-04-24 11:05:40');
INSERT INTO `ibid_user_asset_logs` VALUES ('112', '2', 'money', 'user_pay', '156.00', '购物支付【N2018042413414151815】', '会员购物扣款，订单号：N2018042413414151815', '1', '2018-04-24 13:41:44', '2018-04-24 13:41:44');
INSERT INTO `ibid_user_asset_logs` VALUES ('113', '2', 'money', 'user_pay', '259.00', '购物支付【N2018042413420412160】', '会员购物扣款，订单号：N2018042413420412160', '1', '2018-04-24 13:42:09', '2018-04-24 13:42:09');
INSERT INTO `ibid_user_asset_logs` VALUES ('114', '2', 'money', 'user_pay', '146.00', '购物支付【N2018042413424441862】', '会员购物扣款，订单号：N2018042413424441862', '1', '2018-04-24 13:42:55', '2018-04-24 13:42:55');
INSERT INTO `ibid_user_asset_logs` VALUES ('115', '2', 'money', 'user_pay', '120.00', '购物支付【N2018042413423584760】', '会员购物扣款，订单号：N2018042413423584760', '1', '2018-04-24 13:43:02', '2018-04-24 13:43:02');
INSERT INTO `ibid_user_asset_logs` VALUES ('116', '2', 'money', 'user_pay', '156.00', '购物支付【N2018042413432950577】', '会员购物扣款，订单号：N2018042413432950577', '1', '2018-04-24 13:43:35', '2018-04-24 13:43:35');
INSERT INTO `ibid_user_asset_logs` VALUES ('117', '2', 'money', 'user_pay', '278.00', '购物支付【N2018042413435695868】', '会员购物扣款，订单号：N2018042413435695868', '1', '2018-04-24 13:44:03', '2018-04-24 13:44:03');
INSERT INTO `ibid_user_asset_logs` VALUES ('118', '1', 'money', 'user_drawcash', '2.00', '会员申请提现扣款', '会员申请提现，系统自动扣款', '1', '2018-04-24 14:09:28', '2018-04-24 14:09:28');
INSERT INTO `ibid_user_asset_logs` VALUES ('119', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414124371839】', '会员购物扣款，订单号：N2018042414124371839', '1', '2018-04-24 14:12:47', '2018-04-24 14:12:47');
INSERT INTO `ibid_user_asset_logs` VALUES ('120', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414145328384】', '会员购物扣款，订单号：N2018042414145328384', '1', '2018-04-24 14:15:00', '2018-04-24 14:15:00');
INSERT INTO `ibid_user_asset_logs` VALUES ('121', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414160203313】', '会员购物扣款，订单号：N2018042414160203313', '1', '2018-04-24 14:16:05', '2018-04-24 14:16:05');
INSERT INTO `ibid_user_asset_logs` VALUES ('122', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414192239243】', '会员购物扣款，订单号：N2018042414192239243', '1', '2018-04-24 14:19:31', '2018-04-24 14:19:31');
INSERT INTO `ibid_user_asset_logs` VALUES ('123', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414205659338】', '会员购物扣款，订单号：N2018042414205659338', '1', '2018-04-24 14:21:00', '2018-04-24 14:21:00');
INSERT INTO `ibid_user_asset_logs` VALUES ('124', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414211314948】', '会员购物扣款，订单号：N2018042414211314948', '1', '2018-04-24 14:21:17', '2018-04-24 14:21:17');
INSERT INTO `ibid_user_asset_logs` VALUES ('125', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414214613635】', '会员购物扣款，订单号：N2018042414214613635', '1', '2018-04-24 14:21:48', '2018-04-24 14:21:48');
INSERT INTO `ibid_user_asset_logs` VALUES ('126', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414220132718】', '会员购物扣款，订单号：N2018042414220132718', '1', '2018-04-24 14:22:07', '2018-04-24 14:22:07');
INSERT INTO `ibid_user_asset_logs` VALUES ('127', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414224211135】', '会员购物扣款，订单号：N2018042414224211135', '1', '2018-04-24 14:22:45', '2018-04-24 14:22:45');
INSERT INTO `ibid_user_asset_logs` VALUES ('128', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414232692733】', '会员购物扣款，订单号：N2018042414232692733', '1', '2018-04-24 14:23:29', '2018-04-24 14:23:29');
INSERT INTO `ibid_user_asset_logs` VALUES ('129', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414242696714】', '会员购物扣款，订单号：N2018042414242696714', '1', '2018-04-24 14:24:29', '2018-04-24 14:24:29');
INSERT INTO `ibid_user_asset_logs` VALUES ('130', '1', 'money', 'user_pay', '0.01', '购物支付【N2018042414244928421】', '会员购物扣款，订单号：N2018042414244928421', '1', '2018-04-24 14:24:55', '2018-04-24 14:24:55');
INSERT INTO `ibid_user_asset_logs` VALUES ('131', '2', 'money', 'user_pay', '126.00', '购物支付【N2018042414552013709】', '会员购物扣款，订单号：N2018042414552013709', '1', '2018-04-24 14:55:34', '2018-04-24 14:55:34');
INSERT INTO `ibid_user_asset_logs` VALUES ('132', '2', 'money', 'user_pay', '394.00', '购物支付【N2018042414560862757】', '会员购物扣款，订单号：N2018042414560862757', '1', '2018-04-24 14:56:12', '2018-04-24 14:56:12');
INSERT INTO `ibid_user_asset_logs` VALUES ('133', '2', 'money', 'user_pay', '282.00', '购物支付【N2018042415004746291】', '会员购物扣款，订单号：N2018042415004746291', '1', '2018-04-24 15:00:51', '2018-04-24 15:00:51');
INSERT INTO `ibid_user_asset_logs` VALUES ('134', '2', 'money', 'user_pay', '700.00', '购物支付【N2018042417135758178】', '会员购物扣款，订单号：N2018042417135758178', '1', '2018-04-24 17:14:37', '2018-04-24 17:14:37');
INSERT INTO `ibid_user_asset_logs` VALUES ('135', '2', 'money', 'user_pay', '2790.00', '购物支付【N2018042417243080405】', '会员购物扣款，订单号：N2018042417243080405', '1', '2018-04-24 17:24:34', '2018-04-24 17:24:34');
INSERT INTO `ibid_user_asset_logs` VALUES ('136', '2', 'money', 'user_pay', '1350.00', '购物支付【N2018042417300554474】', '会员购物扣款，订单号：N2018042417300554474', '1', '2018-04-24 17:34:17', '2018-04-24 17:34:17');
INSERT INTO `ibid_user_asset_logs` VALUES ('137', '9', 'money', 'user_pay', '166.00', '购物支付【N2018042418082831784】', '会员购物扣款，订单号：N2018042418082831784', '1', '2018-04-24 18:08:57', '2018-04-24 18:08:57');
INSERT INTO `ibid_user_asset_logs` VALUES ('138', '22', 'money', 'user_pay', '136.00', '购物支付【N2018042508242558513】', '会员购物扣款，订单号：N2018042508242558513', '1', '2018-04-25 08:24:43', '2018-04-25 08:24:43');
INSERT INTO `ibid_user_asset_logs` VALUES ('139', '22', 'money', 'user_pay', '547.00', '购物支付【N2018042508252610449】', '会员购物扣款，订单号：N2018042508252610449', '1', '2018-04-25 08:25:30', '2018-04-25 08:25:30');
INSERT INTO `ibid_user_asset_logs` VALUES ('140', '22', 'money', 'user_pay', '535.00', '购物支付【N2018042508262722147】', '会员购物扣款，订单号：N2018042508262722147', '1', '2018-04-25 08:38:57', '2018-04-25 08:38:57');
INSERT INTO `ibid_user_asset_logs` VALUES ('141', '22', 'money', 'user_pay', '136.01', '购物支付【N2018042509010989498】', '会员购物扣款，订单号：N2018042509010989498', '1', '2018-04-25 09:01:13', '2018-04-25 09:01:13');
INSERT INTO `ibid_user_asset_logs` VALUES ('142', '22', 'money', 'user_pay', '292.00', '购物支付【N2018042509072585656】', '会员购物扣款，订单号：N2018042509072585656', '1', '2018-04-25 09:07:28', '2018-04-25 09:07:28');

-- -----------------------------
-- Table structure for `ibid_user_assets`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_assets`;
CREATE TABLE `ibid_user_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `score` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_assets`
-- -----------------------------
INSERT INTO `ibid_user_assets` VALUES ('1', '1', '999972.87', '44.00', '1', '2018-04-17 15:58:46', '2018-04-17 15:58:46');
INSERT INTO `ibid_user_assets` VALUES ('2', '2', '991806.95', '42.00', '1', '2018-04-17 16:14:28', '2018-04-17 16:14:28');
INSERT INTO `ibid_user_assets` VALUES ('3', '3', '999999.93', '31.00', '1', '2018-04-17 18:08:00', '2018-04-17 18:08:00');
INSERT INTO `ibid_user_assets` VALUES ('4', '4', '1000000.00', '5.00', '1', '2018-04-18 09:10:30', '2018-04-18 09:10:30');
INSERT INTO `ibid_user_assets` VALUES ('5', '5', '1000000.00', '3.00', '1', '2018-04-18 09:14:16', '2018-04-18 09:14:16');
INSERT INTO `ibid_user_assets` VALUES ('6', '6', '1000000.00', '2.00', '1', '2018-04-18 09:34:43', '2018-04-18 09:34:43');
INSERT INTO `ibid_user_assets` VALUES ('7', '7', '1000000.00', '1.00', '1', '2018-04-18 09:38:47', '2018-04-18 09:38:47');
INSERT INTO `ibid_user_assets` VALUES ('8', '8', '1000000.00', '2.00', '1', '2018-04-18 10:08:34', '2018-04-18 10:08:34');
INSERT INTO `ibid_user_assets` VALUES ('9', '9', '996031.97', '22.00', '1', '2018-04-18 10:16:12', '2018-04-18 10:16:12');
INSERT INTO `ibid_user_assets` VALUES ('10', '10', '999731.98', '32.00', '1', '2018-04-18 13:52:55', '2018-04-18 13:52:55');
INSERT INTO `ibid_user_assets` VALUES ('11', '11', '1000000.00', '4.00', '1', '2018-04-18 13:59:33', '2018-04-18 13:59:33');
INSERT INTO `ibid_user_assets` VALUES ('12', '12', '1000000.00', '1.00', '1', '2018-04-18 15:15:01', '2018-04-18 15:15:01');
INSERT INTO `ibid_user_assets` VALUES ('13', '13', '1000000.00', '3.00', '1', '2018-04-18 15:50:30', '2018-04-18 15:50:30');
INSERT INTO `ibid_user_assets` VALUES ('14', '14', '1000000.00', '2.00', '1', '2018-04-19 09:39:25', '2018-04-19 09:39:25');
INSERT INTO `ibid_user_assets` VALUES ('15', '15', '1000000.00', '11.00', '1', '2018-04-19 11:58:27', '2018-04-19 11:58:27');
INSERT INTO `ibid_user_assets` VALUES ('16', '16', '1000000.00', '2.00', '1', '2018-04-19 22:30:46', '2018-04-19 22:30:46');
INSERT INTO `ibid_user_assets` VALUES ('17', '17', '1000000.00', '1.00', '1', '2018-04-19 22:31:34', '2018-04-19 22:31:34');
INSERT INTO `ibid_user_assets` VALUES ('18', '18', '1000000.00', '1.00', '1', '2018-04-19 22:32:08', '2018-04-19 22:32:08');
INSERT INTO `ibid_user_assets` VALUES ('19', '19', '1000000.00', '1.00', '1', '2018-04-19 22:32:31', '2018-04-19 22:32:31');
INSERT INTO `ibid_user_assets` VALUES ('20', '20', '1000000.00', '1.00', '1', '2018-04-20 09:43:18', '2018-04-20 09:43:18');
INSERT INTO `ibid_user_assets` VALUES ('21', '21', '0.00', '2.00', '1', '2018-04-23 17:00:39', '2018-04-23 17:00:39');
INSERT INTO `ibid_user_assets` VALUES ('22', '22', '998353.99', '2.00', '1', '2018-04-25 08:21:14', '2018-04-25 08:21:14');

-- -----------------------------
-- Table structure for `ibid_user_auths`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_auths`;
CREATE TABLE `ibid_user_auths` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(255) DEFAULT NULL COMMENT '用户身份证号',
  `id_card_front_img` varchar(255) DEFAULT NULL COMMENT '身份证正面照',
  `id_card_back_img` varchar(255) DEFAULT NULL COMMENT '身份证反面照',
  `imgs` text COMMENT '其他认证提交的图片数据',
  `status` tinyint(1) DEFAULT '0' COMMENT '用户认证状态：0未认证1待审核2审核未通过3审核通过',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_auths`
-- -----------------------------
INSERT INTO `ibid_user_auths` VALUES ('1', '2', '', '', '/public/upload/images/1524216604401.jpg', '/public/upload/images/1524216604921.jpg', '[]', '3', '1', '2018-04-17 16:26:16', '2018-04-20 17:30:05');
INSERT INTO `ibid_user_auths` VALUES ('2', '4', '', '', '/public/upload/images/1524029970352.jpg', '/public/upload/images/1524029970285.jpg', '[]', '1', '1', '2018-04-18 13:39:31', '2018-04-18 13:39:31');
INSERT INTO `ibid_user_auths` VALUES ('3', '1', '', '', '/public/upload/images/1524041388779.jpg', '/public/upload/images/1524041388532.jpg', '[]', '1', '1', '2018-04-18 16:43:54', '2018-04-18 16:49:48');
INSERT INTO `ibid_user_auths` VALUES ('4', '15', '12312', '3123123', '/public/upload/images/1524554410674.jpg', '/public/upload/images/1524551842303.jpg', '[]', '3', '1', '2018-04-24 14:37:22', '2018-04-24 15:21:58');

-- -----------------------------
-- Table structure for `ibid_user_coupons`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_coupons`;
CREATE TABLE `ibid_user_coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL COMMENT '优惠券编号',
  `activity_coupon_id` bigint(20) NOT NULL COMMENT '优惠券ID',
  `market_activity_id` bigint(20) NOT NULL COMMENT '营销活动ID',
  `coupon_no` varchar(255) NOT NULL COMMENT '优惠券编号',
  `coupon_type` varchar(20) NOT NULL COMMENT '优惠券类别：discount打折券full满减券',
  `expiry_time` datetime NOT NULL COMMENT '到期时间',
  `reach_money` decimal(10,2) NOT NULL COMMENT '满多少元后可用',
  `change_value` decimal(10,2) NOT NULL COMMENT '优惠值：discount打折值full满减金额',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1未使用2已使用',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_coupons`
-- -----------------------------
INSERT INTO `ibid_user_coupons` VALUES ('1', '2', '1', '2', 'U2018042010554927465', 'full', '2018-04-21 10:52:54', '100.00', '20.00', '2', '0', '2018-04-20 10:55:49', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('2', '2', '2', '2', 'U2018042010555042484', 'discount', '2018-04-20 11:00:16', '100.00', '2.00', '2', '0', '2018-04-20 10:55:50', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('3', '1', '1', '2', 'U2018042011272091490', 'full', '2018-04-21 10:52:54', '100.00', '20.00', '2', '0', '2018-04-20 11:27:20', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('4', '2', '3', '2', 'U2018042013412200006', 'full', '2018-04-21 11:49:50', '10.00', '1.00', '1', '0', '2018-04-20 13:41:22', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('5', '2', '7', '2', 'U2018042013484889252', 'discount', '2018-04-20 14:00:00', '100.00', '50.00', '1', '0', '2018-04-20 13:48:48', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('6', '2', '6', '2', 'U2018042013484984592', 'discount', '2018-04-20 14:00:00', '200.00', '5.00', '1', '0', '2018-04-20 13:48:49', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('7', '2', '5', '2', 'U2018042013485166097', 'full', '2018-04-20 14:00:00', '200.00', '100.00', '2', '0', '2018-04-20 13:48:51', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('8', '2', '4', '2', 'U2018042013485204754', 'full', '2018-04-20 14:00:00', '100.00', '50.00', '1', '0', '2018-04-20 13:48:52', '2018-04-23 15:48:23');
INSERT INTO `ibid_user_coupons` VALUES ('9', '9', '7', '2', 'U2018042013593179979', 'discount', '2018-04-20 14:00:00', '100.00', '5.00', '1', '0', '2018-04-20 13:59:31', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('10', '9', '6', '2', 'U2018042013593391557', 'discount', '2018-04-20 14:00:00', '200.00', '5.00', '1', '0', '2018-04-20 13:59:33', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('11', '3', '6', '2', 'U2018042016135581603', 'discount', '2018-04-30 14:00:00', '200.00', '5.00', '1', '0', '2018-04-20 16:13:55', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('12', '3', '4', '2', 'U2018042016140131500', 'full', '2018-04-30 14:00:00', '100.00', '50.00', '1', '0', '2018-04-20 16:14:01', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('13', '3', '5', '2', 'U2018042016332756068', 'full', '2018-04-30 14:00:00', '200.00', '100.00', '1', '0', '2018-04-20 16:33:27', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('14', '3', '7', '2', 'U2018042018021975601', 'discount', '2018-04-30 14:00:00', '100.00', '5.00', '1', '0', '2018-04-20 18:02:19', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('15', '1', '7', '2', 'U2018042109563897263', 'discount', '2018-04-30 14:00:00', '100.00', '5.00', '1', '0', '2018-04-21 09:56:38', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('16', '1', '6', '2', 'U2018042109563906320', 'discount', '2018-04-30 14:00:00', '200.00', '5.00', '1', '0', '2018-04-21 09:56:39', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('17', '1', '5', '2', 'U2018042109564078426', 'full', '2018-04-30 14:00:00', '200.00', '100.00', '2', '0', '2018-04-21 09:56:40', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('18', '1', '4', '2', 'U2018042109564047969', 'full', '2018-04-30 14:00:00', '100.00', '50.00', '1', '0', '2018-04-21 09:56:40', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('19', '2', '8', '2', 'U2018042315250015173', 'full', '2018-04-30 15:24:46', '100.00', '50.00', '2', '0', '2018-04-23 15:25:00', '2018-04-23 15:48:28');
INSERT INTO `ibid_user_coupons` VALUES ('20', '2', '8', '2', 'U2018042315495181542', 'full', '2018-04-30 15:24:46', '100.00', '50.00', '1', '1', '2018-04-23 15:49:51', '2018-04-23 15:49:51');
INSERT INTO `ibid_user_coupons` VALUES ('21', '2', '7', '2', 'U2018042315495355426', 'discount', '2018-04-30 14:00:00', '100.00', '5.00', '2', '1', '2018-04-23 15:49:53', '2018-04-23 15:50:54');
INSERT INTO `ibid_user_coupons` VALUES ('22', '2', '5', '2', 'U2018042315495462348', 'full', '2018-04-30 14:00:00', '200.00', '100.00', '2', '1', '2018-04-23 15:49:54', '2018-04-23 17:22:24');
INSERT INTO `ibid_user_coupons` VALUES ('23', '2', '6', '2', 'U2018042315495584576', 'discount', '2018-04-30 14:00:00', '200.00', '5.00', '2', '1', '2018-04-23 15:49:55', '2018-04-24 17:13:57');
INSERT INTO `ibid_user_coupons` VALUES ('24', '2', '4', '2', 'U2018042315495670002', 'full', '2018-04-30 14:00:00', '100.00', '50.00', '1', '1', '2018-04-23 15:49:56', '2018-04-23 15:49:56');
INSERT INTO `ibid_user_coupons` VALUES ('25', '9', '8', '2', 'U2018042318152211426', 'full', '2018-04-30 15:24:46', '100.00', '50.00', '1', '1', '2018-04-23 18:15:22', '2018-04-23 18:15:22');
INSERT INTO `ibid_user_coupons` VALUES ('26', '10', '7', '2', 'U2018042318152493559', 'discount', '2018-04-30 14:00:00', '100.00', '5.00', '2', '1', '2018-04-23 18:15:24', '2018-04-24 22:23:16');
INSERT INTO `ibid_user_coupons` VALUES ('27', '10', '6', '2', 'U2018042318152524382', 'discount', '2018-04-30 14:00:00', '200.00', '5.00', '2', '1', '2018-04-23 18:15:25', '2018-04-24 22:23:24');
INSERT INTO `ibid_user_coupons` VALUES ('28', '9', '5', '2', 'U2018042320324379457', 'full', '2018-04-30 14:00:00', '200.00', '100.00', '1', '1', '2018-04-23 20:32:43', '2018-04-23 20:32:43');
INSERT INTO `ibid_user_coupons` VALUES ('29', '2', '9', '2', 'U2018042410121763700', 'discount', '2018-04-25 10:12:20', '1000.00', '8.50', '2', '1', '2018-04-24 10:12:17', '2018-04-24 17:12:14');
INSERT INTO `ibid_user_coupons` VALUES ('30', '1', '8', '2', 'U2018042415434721696', 'full', '2018-04-30 15:24:46', '100.00', '50.00', '1', '1', '2018-04-24 15:43:47', '2018-04-24 15:43:47');
INSERT INTO `ibid_user_coupons` VALUES ('31', '1', '7', '2', 'U2018042415434945073', 'discount', '2018-04-30 14:00:00', '100.00', '5.00', '1', '1', '2018-04-24 15:43:49', '2018-04-24 15:43:49');
INSERT INTO `ibid_user_coupons` VALUES ('32', '1', '6', '2', 'U2018042415435054756', 'discount', '2018-04-30 14:00:00', '200.00', '5.00', '2', '1', '2018-04-24 15:43:50', '2018-04-24 15:50:57');
INSERT INTO `ibid_user_coupons` VALUES ('33', '1', '4', '2', 'U2018042415435091422', 'full', '2018-04-30 14:00:00', '100.00', '50.00', '1', '1', '2018-04-24 15:43:50', '2018-04-24 15:43:50');
INSERT INTO `ibid_user_coupons` VALUES ('34', '1', '5', '2', 'U2018042415435179452', 'full', '2018-04-30 14:00:00', '200.00', '100.00', '1', '1', '2018-04-24 15:43:51', '2018-04-24 15:43:51');

-- -----------------------------
-- Table structure for `ibid_user_discounts`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_discounts`;
CREATE TABLE `ibid_user_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `activity_discount_rule_id` bigint(20) NOT NULL COMMENT '享受的折扣活动规则ID',
  `use_num` int(11) NOT NULL DEFAULT '0' COMMENT '已被购买的数量',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_discounts`
-- -----------------------------
INSERT INTO `ibid_user_discounts` VALUES ('1', '2', '1', '1', '1', '2018-04-20 11:00:40', '2018-04-20 11:00:40');
INSERT INTO `ibid_user_discounts` VALUES ('2', '2', '3', '1', '1', '2018-04-20 11:07:51', '2018-04-20 11:07:51');
INSERT INTO `ibid_user_discounts` VALUES ('3', '2', '3', '1', '1', '2018-04-20 11:39:13', '2018-04-20 11:39:13');
INSERT INTO `ibid_user_discounts` VALUES ('4', '2', '1', '1', '1', '2018-04-20 11:43:47', '2018-04-20 11:43:47');
INSERT INTO `ibid_user_discounts` VALUES ('5', '2', '1', '1', '1', '2018-04-20 11:43:50', '2018-04-20 11:43:50');
INSERT INTO `ibid_user_discounts` VALUES ('6', '1', '2', '1', '1', '2018-04-20 11:44:49', '2018-04-20 11:44:49');
INSERT INTO `ibid_user_discounts` VALUES ('7', '2', '1', '1', '1', '2018-04-20 11:45:42', '2018-04-20 11:45:42');
INSERT INTO `ibid_user_discounts` VALUES ('8', '2', '1', '1', '1', '2018-04-20 11:48:03', '2018-04-20 11:48:03');
INSERT INTO `ibid_user_discounts` VALUES ('9', '2', '1', '1', '1', '2018-04-20 11:52:23', '2018-04-20 11:52:23');
INSERT INTO `ibid_user_discounts` VALUES ('10', '2', '1', '1', '1', '2018-04-20 11:54:10', '2018-04-20 11:54:10');
INSERT INTO `ibid_user_discounts` VALUES ('11', '2', '3', '1', '1', '2018-04-21 10:02:11', '2018-04-21 10:02:11');
INSERT INTO `ibid_user_discounts` VALUES ('12', '10', '3', '1', '1', '2018-04-22 17:54:21', '2018-04-22 17:54:21');
INSERT INTO `ibid_user_discounts` VALUES ('13', '1', '2', '1', '1', '2018-04-23 15:46:27', '2018-04-23 15:46:27');
INSERT INTO `ibid_user_discounts` VALUES ('14', '1', '2', '1', '1', '2018-04-24 15:52:43', '2018-04-24 15:52:43');

-- -----------------------------
-- Table structure for `ibid_user_drawcashs`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_drawcashs`;
CREATE TABLE `ibid_user_drawcashs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `order_no` varchar(255) NOT NULL COMMENT '提现订单号',
  `asset_type` varchar(255) NOT NULL COMMENT '提现资产类型',
  `type` varchar(255) NOT NULL COMMENT '提现类别',
  `money` decimal(10,2) NOT NULL COMMENT '提现金额',
  `bank_card_id` bigint(20) NOT NULL,
  `bank_name` varchar(255) NOT NULL COMMENT '提现至银行的名称',
  `card_number` varchar(255) NOT NULL COMMENT '提现至银行卡号',
  `card_holder` varchar(255) NOT NULL COMMENT '持卡人姓名',
  `status` tinyint(1) DEFAULT '1' COMMENT '充值状态：1待审核2拒绝提现3提现通过',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_drawcashs`
-- -----------------------------
INSERT INTO `ibid_user_drawcashs` VALUES ('1', '1', 'D2018041910314501233', 'money', 'withdrawToBankCard', '25.00', '1', '中国银行', '1234534654674545', '发生的', '1', '1', '2018-04-19 10:31:45', '2018-04-19 10:31:45');
INSERT INTO `ibid_user_drawcashs` VALUES ('2', '2', 'D2018041910320028705', 'money', 'withdrawToBankCard', '500.00', '2', '中国农业银行', '436646646656565235435', '李舟', '1', '1', '2018-04-19 10:32:00', '2018-04-19 10:32:00');
INSERT INTO `ibid_user_drawcashs` VALUES ('3', '2', 'D2018041910321467178', 'money', 'withdrawToBankCard', '500.00', '2', '中国农业银行', '436646646656565235435', '李舟', '1', '1', '2018-04-19 10:32:14', '2018-04-19 10:32:14');
INSERT INTO `ibid_user_drawcashs` VALUES ('4', '2', 'D2018041910322627156', 'money', 'withdrawToBankCard', '500.00', '2', '中国农业银行', '436646646656565235435', '李舟', '3', '1', '2018-04-19 10:32:26', '2018-04-20 17:11:32');
INSERT INTO `ibid_user_drawcashs` VALUES ('5', '1', 'D2018041910322985390', 'money', 'withdrawToBankCard', '2.00', '1', '中国银行', '1234534654674545', '发生的', '3', '1', '2018-04-19 10:32:29', '2018-04-20 16:06:05');
INSERT INTO `ibid_user_drawcashs` VALUES ('6', '10', 'D2018042118270156931', 'money', 'user_drawcash', '0.01', '4', '中国建设银行', '6217002870013046899', '刘备', '1', '1', '2018-04-21 18:27:01', '2018-04-21 18:27:01');
INSERT INTO `ibid_user_drawcashs` VALUES ('7', '10', 'D2018042118272473464', 'money', 'withdrawToBankCard', '0.01', '4', '中国建设银行', '6217002870013046899', '刘备', '1', '1', '2018-04-21 18:27:24', '2018-04-21 18:27:24');
INSERT INTO `ibid_user_drawcashs` VALUES ('8', '10', 'D2018042118273084246', 'money', 'user_drawcash', '0.01', '4', '中国建设银行', '6217002870013046899', '刘备', '1', '1', '2018-04-21 18:27:30', '2018-04-21 18:27:30');
INSERT INTO `ibid_user_drawcashs` VALUES ('9', '10', 'D2018042118274614419', 'money', 'withdrawToBankCard', '0.01', '4', '中国建设银行', '6217002870013046899', '刘备', '1', '1', '2018-04-21 18:27:46', '2018-04-21 18:27:46');
INSERT INTO `ibid_user_drawcashs` VALUES ('10', '10', 'D2018042118273051964', 'money', 'withdrawToBankCard', '1.00', '4', '中国建设银行', '6217002870013046899', '刘备', '1', '1', '2018-04-21 18:27:30', '2018-04-21 18:27:30');
INSERT INTO `ibid_user_drawcashs` VALUES ('11', '10', 'D2018042118282470038', 'money', 'withdrawToBankCard', '1.00', '4', '中国建设银行', '6217002870013046899', '刘备', '1', '1', '2018-04-21 18:28:24', '2018-04-21 18:28:24');
INSERT INTO `ibid_user_drawcashs` VALUES ('12', '1', 'D2018042410593108994', 'money', 'withdrawToBankCard', '25.00', '3', '中国建设银行', '56654855355', '咯来咯我哦经历', '1', '1', '2018-04-24 10:59:31', '2018-04-24 10:59:31');
INSERT INTO `ibid_user_drawcashs` VALUES ('13', '2', 'D2018042411034972620', 'money', 'withdrawToBankCard', '1.00', '7', '中国农业银行', '123456789454', '来来来', '1', '1', '2018-04-24 11:03:49', '2018-04-24 11:03:49');
INSERT INTO `ibid_user_drawcashs` VALUES ('14', '2', 'D2018042411040635328', 'money', 'withdrawToBankCard', '100.00', '7', '中国农业银行', '123456789454', '来来来', '3', '1', '2018-04-24 11:04:06', '2018-04-24 16:44:50');
INSERT INTO `ibid_user_drawcashs` VALUES ('15', '1', 'D2018042414092877294', 'money', 'withdrawToBankCard', '2.00', '1', '中国银行', '1234534654674545', '发生的', '3', '1', '2018-04-24 14:09:28', '2018-04-24 16:44:46');

-- -----------------------------
-- Table structure for `ibid_user_goods_keywords`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_goods_keywords`;
CREATE TABLE `ibid_user_goods_keywords` (
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `keywords` text COMMENT '历史搜索关键词',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_goods_keywords`
-- -----------------------------
INSERT INTO `ibid_user_goods_keywords` VALUES ('4', '[\"鞋子\",\"测试\"]', '1', '2018-04-18 14:10:06', '2018-04-18 14:10:18');
INSERT INTO `ibid_user_goods_keywords` VALUES ('9', '[\"单鞋男\",\"鞋\",\"衣服\",\"熊\"]', '1', '2018-04-23 20:49:15', '2018-04-24 23:30:02');
INSERT INTO `ibid_user_goods_keywords` VALUES ('3', '[\"凉鞋女\",\"单鞋男\",\"短裤\",\"短袖\",\"连衣裙\"]', '1', '2018-04-20 09:41:01', '2018-04-21 16:55:34');
INSERT INTO `ibid_user_goods_keywords` VALUES ('1', '[\"休闲鞋\",\"牛仔裤\",\"牛奶\"]', '1', '2018-04-24 14:38:19', '2018-04-24 14:38:52');
INSERT INTO `ibid_user_goods_keywords` VALUES ('2', '[\"Burberry\",\"哈哈\"]', '1', '2018-04-24 16:19:33', '2018-04-24 16:21:45');

-- -----------------------------
-- Table structure for `ibid_user_levels`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_levels`;
CREATE TABLE `ibid_user_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '级别名称',
  `min_score` decimal(10,2) NOT NULL COMMENT '当前等级的最小积分数',
  `intro` text COMMENT '级别简介',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1上线2下线',
  `data_state` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_levels`
-- -----------------------------
INSERT INTO `ibid_user_levels` VALUES ('1', '青铜会员', '10.00', '', '1', '1', '2018-04-17 15:55:03', '2018-04-17 15:55:03');
INSERT INTO `ibid_user_levels` VALUES ('2', '白银会员', '20.00', '', '1', '1', '2018-04-17 15:55:11', '2018-04-17 15:55:11');
INSERT INTO `ibid_user_levels` VALUES ('3', '黄金会员', '40.00', '', '1', '1', '2018-04-17 15:55:26', '2018-04-17 15:55:26');
INSERT INTO `ibid_user_levels` VALUES ('4', '普通会员', '0.00', '', '1', '1', '2018-04-17 20:42:51', '2018-04-17 20:42:51');

-- -----------------------------
-- Table structure for `ibid_user_recharges`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_recharges`;
CREATE TABLE `ibid_user_recharges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `order_no` varchar(255) NOT NULL COMMENT '充值订单号',
  `asset_type` varchar(255) NOT NULL COMMENT '充值资产类型',
  `type` varchar(255) NOT NULL COMMENT '充值类别',
  `money` decimal(10,2) NOT NULL COMMENT '充值金额',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '是否支付：0未支付1已支付',
  `pay_type` varchar(255) DEFAULT NULL COMMENT '支付类别',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `is_app_pay` tinyint(1) DEFAULT '0' COMMENT '是否是APP内的支付，0否1是',
  `status` tinyint(1) DEFAULT '1' COMMENT '充值状态：1待确认2未通过3已通过',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0异常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_recharges`
-- -----------------------------
INSERT INTO `ibid_user_recharges` VALUES ('1', '2', 'R2018041716173690897', 'money', '1', '10.00', '0', '', '', '', '1', '1', '2018-04-17 16:17:36', '2018-04-17 16:17:36');
INSERT INTO `ibid_user_recharges` VALUES ('2', '2', 'R2018041716285789608', 'money', '1', '10.00', '0', '', '', '', '1', '1', '2018-04-17 16:28:57', '2018-04-17 16:28:57');
INSERT INTO `ibid_user_recharges` VALUES ('3', '2', 'R2018041716291905198', 'money', '1', '10.00', '0', '', '', '', '1', '1', '2018-04-17 16:29:19', '2018-04-17 16:29:19');
INSERT INTO `ibid_user_recharges` VALUES ('4', '2', 'R2018041716294611749', 'money', '1', '10000.00', '1', '2', '2018-04-17 16:29:54', '', '3', '1', '2018-04-17 16:29:46', '2018-04-17 16:29:54');
INSERT INTO `ibid_user_recharges` VALUES ('5', '2', 'R2018041716311969990', 'money', '1', '10000.00', '1', '1', '2018-04-17 16:31:27', '', '3', '1', '2018-04-17 16:31:19', '2018-04-17 16:31:27');
INSERT INTO `ibid_user_recharges` VALUES ('6', '2', 'R2018041716323099525', 'money', '1', '10.00', '0', '', '', '', '1', '1', '2018-04-17 16:32:30', '2018-04-17 16:32:30');
INSERT INTO `ibid_user_recharges` VALUES ('7', '4', 'R2018041813410305917', 'money', '1', '10000.00', '1', '2', '2018-04-18 13:41:15', '', '3', '1', '2018-04-18 13:41:03', '2018-04-18 13:41:15');
INSERT INTO `ibid_user_recharges` VALUES ('8', '1', 'R2018041817194531233', 'money', '1', '2.00', '0', '', '', '', '1', '1', '2018-04-18 17:19:45', '2018-04-18 17:19:45');
INSERT INTO `ibid_user_recharges` VALUES ('9', '1', 'R2018041817195109633', 'money', '1', '14.00', '0', '', '', '', '1', '1', '2018-04-18 17:19:51', '2018-04-18 17:19:51');
INSERT INTO `ibid_user_recharges` VALUES ('10', '1', 'R2018041817221953310', 'money', '1', '12.00', '0', '', '', '', '1', '1', '2018-04-18 17:22:19', '2018-04-18 17:22:19');
INSERT INTO `ibid_user_recharges` VALUES ('11', '1', 'R2018041817224426941', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-18 17:22:44', '2018-04-18 17:22:44');
INSERT INTO `ibid_user_recharges` VALUES ('12', '1', 'R2018041817251184968', 'money', '1', '120.00', '0', '', '', '', '1', '1', '2018-04-18 17:25:11', '2018-04-18 17:25:11');
INSERT INTO `ibid_user_recharges` VALUES ('13', '1', 'R2018041817254089066', 'money', '1', '128.00', '0', '', '', '', '1', '1', '2018-04-18 17:25:40', '2018-04-18 17:25:40');
INSERT INTO `ibid_user_recharges` VALUES ('14', '1', 'R2018041817305448584', 'money', '1', '128.00', '0', '', '', '', '1', '1', '2018-04-18 17:30:54', '2018-04-18 17:30:54');
INSERT INTO `ibid_user_recharges` VALUES ('15', '1', 'R2018041817310565130', 'money', '1', '128.00', '0', '', '', '', '1', '1', '2018-04-18 17:31:05', '2018-04-18 17:31:05');
INSERT INTO `ibid_user_recharges` VALUES ('16', '1', 'R2018041817323038759', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-18 17:32:30', '2018-04-18 17:32:30');
INSERT INTO `ibid_user_recharges` VALUES ('17', '1', 'R2018041817324599294', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-18 17:32:45', '2018-04-18 17:32:45');
INSERT INTO `ibid_user_recharges` VALUES ('18', '1', 'R2018041817332868063', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-18 17:33:28', '2018-04-18 17:33:28');
INSERT INTO `ibid_user_recharges` VALUES ('19', '1', 'R2018041817372173350', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-18 17:37:21', '2018-04-18 17:37:21');
INSERT INTO `ibid_user_recharges` VALUES ('20', '1', 'R2018041817382750863', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-18 17:38:27', '2018-04-18 17:38:27');
INSERT INTO `ibid_user_recharges` VALUES ('21', '1', 'R2018041817393380116', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-18 17:39:33', '2018-04-18 17:39:33');
INSERT INTO `ibid_user_recharges` VALUES ('22', '1', 'R2018041817395812826', 'money', '1', '0.01', '1', '1', '2018-04-18 17:40:05', '', '3', '1', '2018-04-18 17:39:58', '2018-04-18 17:40:05');
INSERT INTO `ibid_user_recharges` VALUES ('23', '1', 'R2018041817463514661', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 17:46:35', '2018-04-18 17:46:35');
INSERT INTO `ibid_user_recharges` VALUES ('24', '1', 'R2018041817463895323', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 17:46:38', '2018-04-18 17:46:38');
INSERT INTO `ibid_user_recharges` VALUES ('25', '1', 'R2018041817465192375', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 17:46:51', '2018-04-18 17:46:51');
INSERT INTO `ibid_user_recharges` VALUES ('26', '1', 'R2018041817472908894', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 17:47:29', '2018-04-18 17:47:29');
INSERT INTO `ibid_user_recharges` VALUES ('27', '1', 'R2018041817475297712', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 17:47:52', '2018-04-18 17:47:52');
INSERT INTO `ibid_user_recharges` VALUES ('28', '1', 'R2018041817485655944', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 17:48:56', '2018-04-18 17:48:56');
INSERT INTO `ibid_user_recharges` VALUES ('29', '1', 'R2018041817564640721', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 17:56:46', '2018-04-18 17:56:46');
INSERT INTO `ibid_user_recharges` VALUES ('30', '1', 'R2018041818030482264', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 18:03:04', '2018-04-18 18:03:04');
INSERT INTO `ibid_user_recharges` VALUES ('31', '1', 'R2018041818041181282', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 18:04:11', '2018-04-18 18:04:11');
INSERT INTO `ibid_user_recharges` VALUES ('32', '1', 'R2018041820272271440', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 20:27:22', '2018-04-18 20:27:22');
INSERT INTO `ibid_user_recharges` VALUES ('33', '1', 'R2018041820293820635', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 20:29:38', '2018-04-18 20:29:38');
INSERT INTO `ibid_user_recharges` VALUES ('34', '1', 'R2018041821211559587', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 21:21:15', '2018-04-18 21:21:15');
INSERT INTO `ibid_user_recharges` VALUES ('35', '1', 'R2018041821221263244', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 21:22:12', '2018-04-18 21:22:12');
INSERT INTO `ibid_user_recharges` VALUES ('36', '1', 'R2018041821224654467', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 21:22:46', '2018-04-18 21:22:46');
INSERT INTO `ibid_user_recharges` VALUES ('37', '1', 'R2018041821235151550', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 21:23:51', '2018-04-18 21:23:51');
INSERT INTO `ibid_user_recharges` VALUES ('38', '1', 'R2018041821260487833', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 21:26:04', '2018-04-18 21:26:04');
INSERT INTO `ibid_user_recharges` VALUES ('39', '1', 'R2018041821454301143', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 21:45:43', '2018-04-18 21:45:43');
INSERT INTO `ibid_user_recharges` VALUES ('40', '1', 'R2018041821464036116', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 21:46:40', '2018-04-18 21:46:40');
INSERT INTO `ibid_user_recharges` VALUES ('41', '1', 'R2018041821470475040', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-18 21:47:04', '2018-04-18 21:47:04');
INSERT INTO `ibid_user_recharges` VALUES ('42', '1', 'R2018041821493560498', 'money', '1', '0.01', '1', '2', '2018-04-18 21:50:04', '', '3', '1', '2018-04-18 21:49:35', '2018-04-18 21:50:04');
INSERT INTO `ibid_user_recharges` VALUES ('43', '1', 'R2018041821550702894', 'money', '1', '0.01', '1', '2', '2018-04-18 21:55:16', '', '3', '1', '2018-04-18 21:55:07', '2018-04-18 21:55:16');
INSERT INTO `ibid_user_recharges` VALUES ('44', '2', 'R2018041910313640222', 'money', '1', '10000.00', '1', '2', '2018-04-19 10:31:43', '', '3', '1', '2018-04-19 10:31:36', '2018-04-19 10:31:43');
INSERT INTO `ibid_user_recharges` VALUES ('45', '2', 'R2018042009541096813', 'money', '1', '10000.00', '1', '2', '2018-04-20 09:54:17', '', '3', '1', '2018-04-20 09:54:10', '2018-04-20 09:54:17');
INSERT INTO `ibid_user_recharges` VALUES ('46', '1', 'R2018042011435090240', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-20 11:43:50', '2018-04-20 11:43:50');
INSERT INTO `ibid_user_recharges` VALUES ('47', '1', 'R2018042011435667691', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-20 11:43:56', '2018-04-20 11:43:56');
INSERT INTO `ibid_user_recharges` VALUES ('48', '1', 'R2018042011435840739', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-20 11:43:58', '2018-04-20 11:43:58');
INSERT INTO `ibid_user_recharges` VALUES ('49', '1', 'R2018042011440038152', 'money', '1', '0.01', '1', '1', '2018-04-20 11:44:11', '', '3', '1', '2018-04-20 11:44:00', '2018-04-20 11:44:11');
INSERT INTO `ibid_user_recharges` VALUES ('50', '1', 'R2018042011442447186', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-20 11:44:24', '2018-04-20 11:44:24');
INSERT INTO `ibid_user_recharges` VALUES ('51', '1', 'R2018042011452404191', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-20 11:45:24', '2018-04-20 11:45:24');
INSERT INTO `ibid_user_recharges` VALUES ('52', '1', 'R2018042011461933022', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-20 11:46:19', '2018-04-20 11:46:19');
INSERT INTO `ibid_user_recharges` VALUES ('53', '1', 'R2018042011474370991', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-20 11:47:43', '2018-04-20 11:47:43');
INSERT INTO `ibid_user_recharges` VALUES ('54', '13', 'R2018042011565592417', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-20 11:56:55', '2018-04-20 11:56:55');
INSERT INTO `ibid_user_recharges` VALUES ('55', '13', 'R2018042011570603469', 'money', '1', '0.01', '0', '', '', '', '1', '1', '2018-04-20 11:57:06', '2018-04-20 11:57:06');
INSERT INTO `ibid_user_recharges` VALUES ('56', '13', 'R2018042011593986010', 'money', '1', '0.01', '1', '2', '2018-04-20 11:59:56', '', '3', '1', '2018-04-20 11:59:39', '2018-04-20 11:59:56');
INSERT INTO `ibid_user_recharges` VALUES ('57', '2', 'R2018042014090280151', 'money', '1', '10000.00', '0', '', '', '', '1', '1', '2018-04-20 14:09:02', '2018-04-20 14:09:02');
INSERT INTO `ibid_user_recharges` VALUES ('58', '10', 'R2018042015521592651', 'money', '1', '0.10', '0', '', '', '', '1', '1', '2018-04-20 15:52:15', '2018-04-20 15:52:15');
INSERT INTO `ibid_user_recharges` VALUES ('59', '2', 'R2018042017154091748', 'money', '1', '10.00', '0', '', '', '', '1', '1', '2018-04-20 17:15:40', '2018-04-20 17:15:40');
INSERT INTO `ibid_user_recharges` VALUES ('60', '10', 'R2018042018065992924', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-20 18:06:59', '2018-04-20 18:06:59');
INSERT INTO `ibid_user_recharges` VALUES ('61', '10', 'R2018042109170857597', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-21 09:17:08', '2018-04-21 09:17:08');
INSERT INTO `ibid_user_recharges` VALUES ('62', '10', 'R2018042109172117742', 'money', '1', '1.00', '0', '', '', '', '1', '1', '2018-04-21 09:17:21', '2018-04-21 09:17:21');
INSERT INTO `ibid_user_recharges` VALUES ('63', '9', 'R2018042116240834820', 'money', '1', '20.00', '0', '', '', '0', '1', '1', '2018-04-21 16:24:08', '2018-04-21 16:24:08');
INSERT INTO `ibid_user_recharges` VALUES ('64', '9', 'R2018042116240999288', 'money', '1', '20.00', '0', '', '', '0', '1', '1', '2018-04-21 16:24:09', '2018-04-21 16:24:09');
INSERT INTO `ibid_user_recharges` VALUES ('65', '9', 'R2018042116250491812', 'money', '1', '20.00', '0', '', '', '0', '1', '1', '2018-04-21 16:25:04', '2018-04-21 16:25:04');
INSERT INTO `ibid_user_recharges` VALUES ('66', '10', 'R2018042116454648100', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:45:46', '2018-04-21 16:45:46');
INSERT INTO `ibid_user_recharges` VALUES ('67', '10', 'R2018042116484059131', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:48:40', '2018-04-21 16:48:40');
INSERT INTO `ibid_user_recharges` VALUES ('68', '10', 'R2018042116554244259', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:55:42', '2018-04-21 16:55:42');
INSERT INTO `ibid_user_recharges` VALUES ('69', '10', 'R2018042116554949143', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:55:49', '2018-04-21 16:55:49');
INSERT INTO `ibid_user_recharges` VALUES ('70', '10', 'R2018042116563736877', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:56:37', '2018-04-21 16:56:37');
INSERT INTO `ibid_user_recharges` VALUES ('71', '10', 'R2018042116565491158', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:56:54', '2018-04-21 16:56:54');
INSERT INTO `ibid_user_recharges` VALUES ('72', '10', 'R2018042116572241524', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:57:22', '2018-04-21 16:57:22');
INSERT INTO `ibid_user_recharges` VALUES ('73', '10', 'R2018042116574114666', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:57:41', '2018-04-21 16:57:41');
INSERT INTO `ibid_user_recharges` VALUES ('74', '10', 'R2018042116580224320', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:58:02', '2018-04-21 16:58:02');
INSERT INTO `ibid_user_recharges` VALUES ('75', '10', 'R2018042116582135158', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:58:21', '2018-04-21 16:58:21');
INSERT INTO `ibid_user_recharges` VALUES ('76', '10', 'R2018042116584160305', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:58:41', '2018-04-21 16:58:41');
INSERT INTO `ibid_user_recharges` VALUES ('77', '10', 'R2018042116590579476', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:59:05', '2018-04-21 16:59:05');
INSERT INTO `ibid_user_recharges` VALUES ('78', '10', 'R2018042116594264836', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 16:59:42', '2018-04-21 16:59:42');
INSERT INTO `ibid_user_recharges` VALUES ('79', '10', 'R2018042117001793196', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:00:17', '2018-04-21 17:00:17');
INSERT INTO `ibid_user_recharges` VALUES ('80', '10', 'R2018042117020370140', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:02:03', '2018-04-21 17:02:03');
INSERT INTO `ibid_user_recharges` VALUES ('81', '10', 'R2018042117023003839', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:02:30', '2018-04-21 17:02:30');
INSERT INTO `ibid_user_recharges` VALUES ('82', '10', 'R2018042117265187790', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:26:51', '2018-04-21 17:26:51');
INSERT INTO `ibid_user_recharges` VALUES ('83', '10', 'R2018042117290826877', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:29:08', '2018-04-21 17:29:08');
INSERT INTO `ibid_user_recharges` VALUES ('84', '10', 'R2018042117301651562', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:30:16', '2018-04-21 17:30:16');
INSERT INTO `ibid_user_recharges` VALUES ('85', '10', 'R2018042117303158377', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:30:31', '2018-04-21 17:30:31');
INSERT INTO `ibid_user_recharges` VALUES ('86', '10', 'R2018042117305396321', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:30:53', '2018-04-21 17:30:53');
INSERT INTO `ibid_user_recharges` VALUES ('87', '10', 'R2018042117312793855', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:31:27', '2018-04-21 17:31:27');
INSERT INTO `ibid_user_recharges` VALUES ('88', '10', 'R2018042117315073351', 'money', '1', '1231231.00', '0', '', '', '0', '1', '1', '2018-04-21 17:31:50', '2018-04-21 17:31:50');
INSERT INTO `ibid_user_recharges` VALUES ('89', '10', 'R2018042117374144945', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:37:41', '2018-04-21 17:37:41');
INSERT INTO `ibid_user_recharges` VALUES ('90', '10', 'R2018042117374861593', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:37:48', '2018-04-21 17:37:48');
INSERT INTO `ibid_user_recharges` VALUES ('91', '10', 'R2018042117403703029', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:40:37', '2018-04-21 17:40:37');
INSERT INTO `ibid_user_recharges` VALUES ('92', '10', 'R2018042117412213885', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:41:22', '2018-04-21 17:41:22');
INSERT INTO `ibid_user_recharges` VALUES ('93', '10', 'R2018042117431775441', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:43:17', '2018-04-21 17:43:17');
INSERT INTO `ibid_user_recharges` VALUES ('94', '10', 'R2018042117453946564', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:45:39', '2018-04-21 17:45:39');
INSERT INTO `ibid_user_recharges` VALUES ('95', '10', 'R2018042117461425044', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:46:14', '2018-04-21 17:46:14');
INSERT INTO `ibid_user_recharges` VALUES ('96', '10', 'R2018042117465241241', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:46:52', '2018-04-21 17:46:52');
INSERT INTO `ibid_user_recharges` VALUES ('97', '10', 'R2018042117534349627', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:53:43', '2018-04-21 17:53:43');
INSERT INTO `ibid_user_recharges` VALUES ('98', '10', 'R2018042117540022915', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:54:00', '2018-04-21 17:54:00');
INSERT INTO `ibid_user_recharges` VALUES ('99', '10', 'R2018042117552279861', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:55:22', '2018-04-21 17:55:22');
INSERT INTO `ibid_user_recharges` VALUES ('100', '10', 'R2018042117554459194', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:55:44', '2018-04-21 17:55:44');
INSERT INTO `ibid_user_recharges` VALUES ('101', '10', 'R2018042117560100327', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:56:01', '2018-04-21 17:56:01');
INSERT INTO `ibid_user_recharges` VALUES ('102', '10', 'R2018042117561886031', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 17:56:18', '2018-04-21 17:56:18');
INSERT INTO `ibid_user_recharges` VALUES ('103', '10', 'R2018042118043507649', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 18:04:35', '2018-04-21 18:04:35');
INSERT INTO `ibid_user_recharges` VALUES ('104', '10', 'R2018042118044437611', 'money', '1', '1.00', '1', '2', '2018-04-21 18:06:44', '0', '3', '1', '2018-04-21 18:04:44', '2018-04-21 18:06:44');
INSERT INTO `ibid_user_recharges` VALUES ('105', '10', 'R2018042118092620423', 'money', '1', '1.00', '1', '2', '2018-04-21 18:09:36', '0', '3', '1', '2018-04-21 18:09:26', '2018-04-21 18:09:36');
INSERT INTO `ibid_user_recharges` VALUES ('106', '10', 'R2018042118095376991', 'money', '1', '1.00', '1', '2', '2018-04-21 18:10:02', '0', '3', '1', '2018-04-21 18:09:53', '2018-04-21 18:10:02');
INSERT INTO `ibid_user_recharges` VALUES ('107', '10', 'R2018042118132400682', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 18:13:24', '2018-04-21 18:13:24');
INSERT INTO `ibid_user_recharges` VALUES ('108', '10', 'R2018042118543857299', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-21 18:54:38', '2018-04-21 18:54:38');
INSERT INTO `ibid_user_recharges` VALUES ('109', '9', 'R2018042310064416555', 'money', '1', '20.00', '0', '', '', '0', '1', '1', '2018-04-23 10:06:44', '2018-04-23 10:06:44');
INSERT INTO `ibid_user_recharges` VALUES ('110', '9', 'R2018042310064542314', 'money', '1', '20.00', '0', '', '', '0', '1', '1', '2018-04-23 10:06:45', '2018-04-23 10:06:45');
INSERT INTO `ibid_user_recharges` VALUES ('111', '9', 'R2018042310065384291', 'money', '1', '10.00', '0', '', '', '0', '1', '1', '2018-04-23 10:06:53', '2018-04-23 10:06:53');
INSERT INTO `ibid_user_recharges` VALUES ('112', '9', 'R2018042310113203438', 'money', '1', '20.00', '0', '', '', '0', '1', '1', '2018-04-23 10:11:32', '2018-04-23 10:11:32');
INSERT INTO `ibid_user_recharges` VALUES ('113', '9', 'R2018042310115607725', 'money', '1', '1.00', '1', '2', '2018-04-23 10:12:06', '0', '3', '1', '2018-04-23 10:11:56', '2018-04-23 10:12:06');
INSERT INTO `ibid_user_recharges` VALUES ('114', '9', 'R2018042310132369977', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-23 10:13:23', '2018-04-23 10:13:23');
INSERT INTO `ibid_user_recharges` VALUES ('115', '9', 'R2018042310132788757', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-23 10:13:27', '2018-04-23 10:13:27');
INSERT INTO `ibid_user_recharges` VALUES ('116', '9', 'R2018042310132992286', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-23 10:13:29', '2018-04-23 10:13:29');
INSERT INTO `ibid_user_recharges` VALUES ('117', '9', 'R2018042310161145864', 'money', '1', '20.00', '0', '', '', '0', '1', '1', '2018-04-23 10:16:11', '2018-04-23 10:16:11');
INSERT INTO `ibid_user_recharges` VALUES ('118', '9', 'R2018042310161211136', 'money', '1', '20.00', '0', '', '', '0', '1', '1', '2018-04-23 10:16:12', '2018-04-23 10:16:12');
INSERT INTO `ibid_user_recharges` VALUES ('119', '9', 'R2018042310164877915', 'money', '1', '210.00', '0', '', '', '0', '1', '1', '2018-04-23 10:16:48', '2018-04-23 10:16:48');
INSERT INTO `ibid_user_recharges` VALUES ('120', '9', 'R2018042310172546259', 'money', '1', '20.00', '0', '', '', '0', '1', '1', '2018-04-23 10:17:25', '2018-04-23 10:17:25');
INSERT INTO `ibid_user_recharges` VALUES ('121', '2', 'R2018042315314001609', 'money', '1', '0.10', '1', '2', '2018-04-23 15:31:46', '1', '3', '1', '2018-04-23 15:31:40', '2018-04-23 15:31:46');
INSERT INTO `ibid_user_recharges` VALUES ('122', '9', 'R2018042316165110775', 'money', '1', '1.00', '0', '', '', '0', '1', '1', '2018-04-23 16:16:51', '2018-04-23 16:16:51');
INSERT INTO `ibid_user_recharges` VALUES ('123', '9', 'R2018042316415220406', 'money', '1', '12.00', '0', '', '', '0', '1', '1', '2018-04-23 16:41:52', '2018-04-23 16:41:52');

-- -----------------------------
-- Table structure for `ibid_user_tokens`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_tokens`;
CREATE TABLE `ibid_user_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_account_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户账号ID',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `client_type` varchar(50) NOT NULL COMMENT '客户端类型：pc|wap|app|wechat|applet',
  `token` varchar(255) NOT NULL COMMENT '授权token',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '刷新token',
  `expire_time` int(11) DEFAULT NULL COMMENT 'token有效时长，为空表示永久有效',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_tokens`
-- -----------------------------
INSERT INTO `ibid_user_tokens` VALUES ('1', '1', '1', 'wap', 'user&wap@6d79596313a46db04d3231236acaaeba', 'user&wap@47f926a0728b908f3562a0a78cf0222b', '7200', '1', '2018-04-17 15:58:46', '2018-04-17 15:58:46');
INSERT INTO `ibid_user_tokens` VALUES ('2', '2', '2', 'wechat', 'user&wechat@9ba08f881b3c35016a6fac019af6da12', 'user&wechat@510125b41d07facc35b213e8ba1b169e', '7200', '1', '2018-04-17 16:14:28', '2018-04-17 16:14:28');
INSERT INTO `ibid_user_tokens` VALUES ('3', '2', '2', 'wap', 'user&wap@340f8282d5cf081f1aa27ee24d8e0bee', 'user&wap@8df2bb6676cf0af59967d849b9faf030', '7200', '1', '2018-04-17 16:22:55', '2018-04-17 16:22:55');
INSERT INTO `ibid_user_tokens` VALUES ('4', '2', '2', 'wap', 'user&wap@cd12b902b8a0ede8bb4cd25135e68d92', 'user&wap@566f7b76f067c515dbb54c7556c69cae', '7200', '1', '2018-04-17 16:48:34', '2018-04-17 16:48:34');
INSERT INTO `ibid_user_tokens` VALUES ('5', '2', '2', 'wap', 'user&wap@df68a9c861c06470722071365cbf1c01', 'user&wap@e77fb2e7cbc86a59afb340335cbdc245', '7200', '1', '2018-04-17 16:48:51', '2018-04-17 16:48:51');
INSERT INTO `ibid_user_tokens` VALUES ('6', '2', '2', 'wap', 'user&wap@48e06007a927eaab15faf0ef623eca33', 'user&wap@d2e4fb329d8017265d128c36380bd825', '7200', '1', '2018-04-17 16:54:26', '2018-04-17 16:54:26');
INSERT INTO `ibid_user_tokens` VALUES ('7', '2', '2', 'wap', 'user&wap@09f7bc3a7d23cd7dac78e099d8382989', 'user&wap@e30a7d3c3b74da9924e87a3aff150d5c', '7200', '1', '2018-04-17 17:41:32', '2018-04-17 17:41:32');
INSERT INTO `ibid_user_tokens` VALUES ('8', '2', '2', 'wap', 'user&wap@3bf324f42f8a53a69fb021b8b6bf7883', 'user&wap@546dd26ac67127d5939dede83a4372d3', '7200', '1', '2018-04-17 17:43:22', '2018-04-17 17:43:22');
INSERT INTO `ibid_user_tokens` VALUES ('9', '2', '2', 'wap', 'user&wap@857bb7f479caedf5901015352d8dcdf7', 'user&wap@e0d473e5e1f99b2982e175f63e45882f', '7200', '1', '2018-04-17 17:57:50', '2018-04-17 17:57:50');
INSERT INTO `ibid_user_tokens` VALUES ('10', '2', '2', 'wap', 'user&wap@7867add746cbe9946fc295493bd818c4', 'user&wap@1f0e8f1e894c081f9883add9024d532a', '7200', '1', '2018-04-17 17:57:59', '2018-04-17 17:57:59');
INSERT INTO `ibid_user_tokens` VALUES ('11', '2', '2', 'wap', 'user&wap@c6cce581f3f4c7645afcbbe4fca2b21e', 'user&wap@97b3b2ec82d4463b7808a146a8697222', '7200', '1', '2018-04-17 17:58:10', '2018-04-17 17:58:10');
INSERT INTO `ibid_user_tokens` VALUES ('12', '2', '2', 'wap', 'user&wap@4b4dc118a84cfa51065b82c2dfc024b7', 'user&wap@673236eeb15903b1bfb87c00b130604d', '7200', '1', '2018-04-17 17:58:21', '2018-04-17 17:58:21');
INSERT INTO `ibid_user_tokens` VALUES ('65', '11', '11', 'wechat', 'user&wechat@fa96688732f0500acbfa0dccd38e9c8a', 'user&wechat@34650f619b65d31297fd3f311a07b2c4', '7200', '1', '2018-04-19 11:02:27', '2018-04-19 11:02:27');
INSERT INTO `ibid_user_tokens` VALUES ('14', '4', '4', 'wap', 'user&wap@e346fda9fb268a5e3ba1661d15385012', 'user&wap@2a470a3a2305c5c9bb09c5d993d836c6', '7200', '1', '2018-04-18 09:10:30', '2018-04-18 09:10:30');
INSERT INTO `ibid_user_tokens` VALUES ('15', '5', '5', 'wap', 'user&wap@8129641c5d5ac9f3f5b1967dbc8cb90b', 'user&wap@a94b83cd57d7e754bc3cd076db425953', '7200', '1', '2018-04-18 09:14:16', '2018-04-18 09:14:16');
INSERT INTO `ibid_user_tokens` VALUES ('16', '2', '2', 'wap', 'user&wap@c6123ad182a1398d4732fb422bb6692c', 'user&wap@a1f79d085a8bfcf18f15809e0dd045e0', '7200', '1', '2018-04-18 09:16:31', '2018-04-18 09:16:31');
INSERT INTO `ibid_user_tokens` VALUES ('17', '4', '4', 'wap', 'user&wap@2f116cb17f8a32efdf87b59e637a9645', 'user&wap@80a635a01b8aee1d6b95f808264fb002', '7200', '1', '2018-04-18 09:17:42', '2018-04-18 09:17:42');
INSERT INTO `ibid_user_tokens` VALUES ('18', '6', '6', 'wap', 'user&wap@ef566d061367c97432976a52465baf0b', 'user&wap@cb3cbd25dfcb240175139c50937df176', '7200', '1', '2018-04-18 09:34:43', '2018-04-18 09:34:43');
INSERT INTO `ibid_user_tokens` VALUES ('59', '3', '3', 'pc', 'user&pc@e61ea4dcdac70b015516b85309b88363', 'user&pc@60659be8e4aa2dd098a7f67bd9bc2a2b', '7200', '1', '2018-04-19 09:38:39', '2018-04-19 09:38:39');
INSERT INTO `ibid_user_tokens` VALUES ('20', '5', '5', 'wechat', 'user&wechat@5e6da1afd373024fb82ed694ed6782f5', 'user&wechat@bbc0d113ca4e2c1c5a7290bf4787732f', '7200', '1', '2018-04-18 09:37:38', '2018-04-18 09:37:38');
INSERT INTO `ibid_user_tokens` VALUES ('21', '7', '7', 'wap', 'user&wap@478f0625edc9bf17a6dec93f2d91586a', 'user&wap@b84c29a55b85c797d0193f5974d036dd', '7200', '1', '2018-04-18 09:38:47', '2018-04-18 09:38:47');
INSERT INTO `ibid_user_tokens` VALUES ('22', '6', '6', 'wap', 'user&wap@0b07d6c0e4903045428a967e74728128', 'user&wap@6a74708ce60abe248f48be8fe9b2fa41', '7200', '1', '2018-04-18 09:47:52', '2018-04-18 09:47:52');
INSERT INTO `ibid_user_tokens` VALUES ('23', '2', '2', 'wap', 'user&wap@c26d9ca05d69764d646d86df18e9aced', 'user&wap@e4c60a03efbe35806e290b21ffddd6b8', '7200', '1', '2018-04-18 09:49:21', '2018-04-18 09:49:21');
INSERT INTO `ibid_user_tokens` VALUES ('24', '2', '2', 'wap', 'user&wap@74bb71d96e55fee74a225a04bb56ee57', 'user&wap@46440f96db44dd4a9c548d70c8c21a65', '7200', '1', '2018-04-18 10:05:01', '2018-04-18 10:05:01');
INSERT INTO `ibid_user_tokens` VALUES ('25', '8', '8', 'wechat', 'user&wechat@e71ea07144befbe7c764c25c766e6166', 'user&wechat@f0cd6489b26d58d73c0bd4708458a04c', '7200', '1', '2018-04-18 10:08:34', '2018-04-18 10:08:34');
INSERT INTO `ibid_user_tokens` VALUES ('26', '8', '8', 'wechat', 'user&wechat@40eaa62eb66615067d54a0e83bdcb4b6', 'user&wechat@3c760fc3d3799b6f9c85a07c751b656a', '7200', '1', '2018-04-18 10:14:59', '2018-04-18 10:14:59');
INSERT INTO `ibid_user_tokens` VALUES ('27', '9', '9', 'wap', 'user&wap@3daaa96d5446e2f033cbe4137fc51aea', 'user&wap@7e2260b604396f091266201e57d4aafb', '7200', '1', '2018-04-18 10:16:12', '2018-04-18 10:16:12');
INSERT INTO `ibid_user_tokens` VALUES ('28', '2', '2', 'wap', 'user&wap@737856f3679e988d8756b74b60e33205', 'user&wap@bc81dbb33e9a0c9d4a87420135f71451', '7200', '1', '2018-04-18 10:22:04', '2018-04-18 10:22:04');
INSERT INTO `ibid_user_tokens` VALUES ('29', '3', '3', 'pc', 'user&pc@15acc8d23f9d19145b11ac7242c8520a', 'user&pc@f52bfbf8a1ae25efc9266c25b8dd16e4', '7200', '1', '2018-04-18 10:29:02', '2018-04-18 10:29:02');
INSERT INTO `ibid_user_tokens` VALUES ('30', '1', '1', 'wap', 'user&wap@b16115bd8a982c70971471d96a5c008e', 'user&wap@d8bf24e714e1e7d15a279465b014b60a', '7200', '1', '2018-04-18 10:35:18', '2018-04-18 10:35:18');
INSERT INTO `ibid_user_tokens` VALUES ('137', '10', '10', 'pc', 'user&pc@37d3d0de048155ea6323d6179be125fe', 'user&pc@411f5b5c69910e0efee989f090d55f3a', '7200', '1', '2018-04-21 18:48:42', '2018-04-21 18:48:42');
INSERT INTO `ibid_user_tokens` VALUES ('32', '2', '2', 'wap', 'user&wap@32eb7938a5151b8bdd43c6c37d88d96c', 'user&wap@818122be220be6e0b405335a198aebd6', '7200', '1', '2018-04-18 10:47:45', '2018-04-18 10:47:45');
INSERT INTO `ibid_user_tokens` VALUES ('33', '2', '2', 'wap', 'user&wap@98197072fa587f06f674f15c4895b5a3', 'user&wap@f232ffa76d79a64bd3c4646619ad5d18', '7200', '1', '2018-04-18 11:58:20', '2018-04-18 11:58:20');
INSERT INTO `ibid_user_tokens` VALUES ('34', '2', '2', 'wap', 'user&wap@043bf757ea5b71e8b3d40efac72340c2', 'user&wap@61c1e87b2da294efc8d5b33b90df0459', '7200', '1', '2018-04-18 11:58:24', '2018-04-18 11:58:24');
INSERT INTO `ibid_user_tokens` VALUES ('35', '2', '2', 'wap', 'user&wap@b5bfce8f08afb1b5cd86abc9cd316280', 'user&wap@feb1a3f794496b0c28bc1f126dcdf074', '7200', '1', '2018-04-18 13:38:30', '2018-04-18 13:38:30');
INSERT INTO `ibid_user_tokens` VALUES ('36', '4', '4', 'wap', 'user&wap@59cb2fafa42407c2c61e3772379f7422', 'user&wap@b1325ea83e5e0da4e5bc721b1dfdbcfc', '7200', '1', '2018-04-18 13:39:08', '2018-04-18 13:39:08');
INSERT INTO `ibid_user_tokens` VALUES ('121', '10', '10', 'wap', 'user&wap@b8727779cc44dfcf9792f2bf855d6e80', 'user&wap@6e4e60baafdd817ac3446d291abb7b62', '7200', '1', '2018-04-21 10:36:04', '2018-04-21 10:36:04');
INSERT INTO `ibid_user_tokens` VALUES ('38', '11', '11', 'wechat', 'user&wechat@20855a6930ae8c29b4fc7c8bb2d2a9ef', 'user&wechat@3a6ecae3daf9c1e147400163d20329c2', '7200', '1', '2018-04-18 13:59:33', '2018-04-18 13:59:33');
INSERT INTO `ibid_user_tokens` VALUES ('39', '11', '11', 'wechat', 'user&wechat@c41c4f081e498d8799361aa265de3f2f', 'user&wechat@47fd4dff024ed120a4c42c8449e91804', '7200', '1', '2018-04-18 14:00:32', '2018-04-18 14:00:32');
INSERT INTO `ibid_user_tokens` VALUES ('40', '1', '1', 'app', 'user&app@685e61ac7fa7728a2a7ae46bed10150d', 'user&app@bd99ade87e4d71de7302b4702a1e0f81', '0', '1', '2018-04-18 14:47:30', '2018-04-18 14:47:30');
INSERT INTO `ibid_user_tokens` VALUES ('41', '1', '1', 'app', 'user&app@9363cfe89656f3bef15aea832eb8ec37', 'user&app@2ac8d4f5eefe567637d8375e2373ae3a', '0', '1', '2018-04-18 14:51:10', '2018-04-18 14:51:10');
INSERT INTO `ibid_user_tokens` VALUES ('42', '1', '1', 'app', 'user&app@13913816036b2e5240f58481c1745918', 'user&app@cc6646687de4a01900f26afd5f16c8f6', '0', '1', '2018-04-18 14:54:35', '2018-04-18 14:54:35');
INSERT INTO `ibid_user_tokens` VALUES ('43', '12', '12', 'app', 'user&app@afe2f68e0722babd7400578daf693e8d', 'user&app@a9071a281ab059410eb291b2ea292c65', '0', '1', '2018-04-18 15:15:01', '2018-04-18 15:15:01');
INSERT INTO `ibid_user_tokens` VALUES ('44', '12', '12', 'app', 'user&app@a81475e5abaca3334bc2ccf4b2c7495e', 'user&app@f6ed29e6b2313809e651c2e2cb0544e1', '0', '1', '2018-04-18 15:15:29', '2018-04-18 15:15:29');
INSERT INTO `ibid_user_tokens` VALUES ('45', '12', '12', 'app', 'user&app@07be778cf7d1e96d42ebe39844b8d88a', 'user&app@7f5a98cfa35abbab5c4f96ee71964672', '0', '1', '2018-04-18 15:16:34', '2018-04-18 15:16:34');
INSERT INTO `ibid_user_tokens` VALUES ('46', '1', '1', 'app', 'user&app@79e058becbbbeaa63283ed43089091aa', 'user&app@7ca011cd16feceadb70e24db55b912d5', '0', '1', '2018-04-18 15:19:49', '2018-04-18 15:19:49');
INSERT INTO `ibid_user_tokens` VALUES ('47', '12', '12', 'pc', 'user&pc@6984dd0c042ec38e3e24bb2643c79759', 'user&pc@b9c28685408af59c4e7f97f7ab3bc737', '7200', '1', '2018-04-18 15:22:19', '2018-04-18 15:22:19');
INSERT INTO `ibid_user_tokens` VALUES ('48', '12', '12', 'pc', 'user&pc@0b3515e3cb93445977c93faa882ba63e', 'user&pc@70aac969a2015dcc9d8dede30c4f38cf', '7200', '1', '2018-04-18 15:23:41', '2018-04-18 15:23:41');
INSERT INTO `ibid_user_tokens` VALUES ('49', '12', '12', 'pc', 'user&pc@c7188f85a09581e804b699c3ba39a435', 'user&pc@9403bb74f81a4aa84688010f0b40db7c', '7200', '1', '2018-04-18 15:23:44', '2018-04-18 15:23:44');
INSERT INTO `ibid_user_tokens` VALUES ('50', '1', '1', 'app', 'user&app@2c600da30976df2106c8d0fb6fbe3ba9', 'user&app@23a6ee2a5d5f488a023dff3c6ad49841', '0', '1', '2018-04-18 15:43:37', '2018-04-18 15:43:37');
INSERT INTO `ibid_user_tokens` VALUES ('51', '1', '1', 'app', 'user&app@5a4923a08ae6525656d3b6693d19157f', 'user&app@bb2fef4c34b39b17873185b6a97a5792', '0', '1', '2018-04-18 15:45:16', '2018-04-18 15:45:16');
INSERT INTO `ibid_user_tokens` VALUES ('52', '1', '1', 'app', 'user&app@2024d58d9b7a1f902075ca348ec342f6', 'user&app@0fd9dde51acc295db140d04716f774c0', '0', '1', '2018-04-18 15:48:58', '2018-04-18 15:48:58');
INSERT INTO `ibid_user_tokens` VALUES ('53', '13', '13', 'app', 'user&app@133c45b64231be58348a2474d0a988e2', 'user&app@24b67e0e95a1e5241fed3319c5b48d85', '0', '1', '2018-04-18 15:50:30', '2018-04-18 15:50:30');
INSERT INTO `ibid_user_tokens` VALUES ('54', '13', '13', 'app', 'user&app@164be89971f4ea9119ac832e8abeb09d', 'user&app@cbc1617e033501aa1b26606d4286bc4e', '0', '1', '2018-04-18 15:56:21', '2018-04-18 15:56:21');
INSERT INTO `ibid_user_tokens` VALUES ('55', '1', '1', 'app', 'user&app@33cbf99126e9b8da7125853e2313390c', 'user&app@81e5e0c568b9b5aa1a1d0121f66331b9', '0', '1', '2018-04-18 15:58:10', '2018-04-18 15:58:10');
INSERT INTO `ibid_user_tokens` VALUES ('56', '1', '1', 'wap', 'user&wap@4c08433ab6709169ec507703c1ece1a1', 'user&wap@80917f12c6f9c500b2ad5bf804f9f69b', '7200', '1', '2018-04-18 16:24:30', '2018-04-18 16:24:30');
INSERT INTO `ibid_user_tokens` VALUES ('136', '10', '10', 'wap', 'user&wap@f2016f1c855f70c767bd6d63e5d28aaf', 'user&wap@cb4543de846c9ae699db1a26b4ad3eba', '7200', '1', '2018-04-21 17:59:13', '2018-04-21 17:59:13');
INSERT INTO `ibid_user_tokens` VALUES ('58', '3', '3', 'pc', 'user&pc@881ab72c43e6d09533b693e51c46057e', 'user&pc@de0d760d34a0688c0c9b779ddb8761c7', '7200', '1', '2018-04-19 09:29:05', '2018-04-19 09:29:05');
INSERT INTO `ibid_user_tokens` VALUES ('60', '14', '14', 'pc', 'user&pc@d03bd756ed67b5c3657fc709e6eca266', 'user&pc@d647e87b43808d3d87e97d73724c06a2', '7200', '1', '2018-04-19 09:39:25', '2018-04-19 09:39:25');
INSERT INTO `ibid_user_tokens` VALUES ('61', '2', '2', 'wap', 'user&wap@9c1a7bff5eb8306c295462acccbb48b6', 'user&wap@3d7f306915b1d0c5aac1ffb1792ebaab', '7200', '1', '2018-04-19 10:30:17', '2018-04-19 10:30:17');
INSERT INTO `ibid_user_tokens` VALUES ('62', '2', '2', 'wap', 'user&wap@828a2ab02b176e632a02de44d2bf5257', 'user&wap@801886832eb34caad016724b498c8e74', '7200', '1', '2018-04-19 10:31:14', '2018-04-19 10:31:14');
INSERT INTO `ibid_user_tokens` VALUES ('63', '2', '2', 'wap', 'user&wap@7ceca1a0c4b78b43a0cf199efbb07ca1', 'user&wap@e21e378d4284e1068d4e1d3dc7794e39', '7200', '1', '2018-04-19 10:37:47', '2018-04-19 10:37:47');
INSERT INTO `ibid_user_tokens` VALUES ('64', '11', '11', 'wechat', 'user&wechat@ef5b80a73cdee99f51f9b7d76847e054', 'user&wechat@e4ca07687679d850139260cb2271c782', '7200', '1', '2018-04-19 10:57:06', '2018-04-19 10:57:06');
INSERT INTO `ibid_user_tokens` VALUES ('99', '1', '1', 'wap', 'user&wap@78c62f6c1df0b68c91afba00cad41892', 'user&wap@3d2cef949644ac3b0ae286d54226877d', '7200', '1', '2018-04-20 14:02:44', '2018-04-20 14:02:44');
INSERT INTO `ibid_user_tokens` VALUES ('67', '2', '2', 'wap', 'user&wap@6ea34d53dc538a23d344c5cfba3b3fc5', 'user&wap@ea2cf2571cf271c13723ac0c4e025b6b', '7200', '1', '2018-04-19 11:51:55', '2018-04-19 11:51:55');
INSERT INTO `ibid_user_tokens` VALUES ('68', '15', '15', 'pc', 'user&pc@ec4abdde52d7289f2eb9ee1bbac3581e', 'user&pc@5494c897f2abf3e1c6f1ca7a3a779f70', '7200', '1', '2018-04-19 11:58:27', '2018-04-19 11:58:27');
INSERT INTO `ibid_user_tokens` VALUES ('69', '3', '3', 'pc', 'user&pc@29b92222a770f1df1be47b63300c7249', 'user&pc@06849ecdd4634dae46d0ab5f8a7eedcc', '7200', '1', '2018-04-19 14:17:24', '2018-04-19 14:17:24');
INSERT INTO `ibid_user_tokens` VALUES ('70', '3', '3', 'pc', 'user&pc@e59d17bf5be43cf4cacb4481293b9f24', 'user&pc@efc9b0b5b8a6452363f3521fe0b0f6c8', '7200', '1', '2018-04-19 14:17:25', '2018-04-19 14:17:25');
INSERT INTO `ibid_user_tokens` VALUES ('71', '3', '3', 'pc', 'user&pc@c455deaab4b31fca50812cd87f033838', 'user&pc@ede9952ee3925ee6444c1b9a23803fbd', '7200', '1', '2018-04-19 14:19:32', '2018-04-19 14:19:32');
INSERT INTO `ibid_user_tokens` VALUES ('72', '1', '1', 'app', 'user&app@6d1ca8d4e675b3f2b4bd3e4e2b0f7081', 'user&app@0002aacbcb9c5c8f3aaa610cd677f1aa', '0', '1', '2018-04-19 14:48:17', '2018-04-19 14:48:17');
INSERT INTO `ibid_user_tokens` VALUES ('231', '10', '10', 'pc', 'user&pc@694ae26087135749f5bd0f77dd45a456', 'user&pc@4ca95e961ccfb40e62b0ed9a6ae3546b', '7200', '1', '2018-04-24 21:04:57', '2018-04-24 21:04:57');
INSERT INTO `ibid_user_tokens` VALUES ('74', '2', '2', 'wap', 'user&wap@aa02b76bdb4d7c058cf32894428d5834', 'user&wap@533d94b4dc07d1c539ef235469dc5d2d', '7200', '1', '2018-04-19 15:57:26', '2018-04-19 15:57:26');
INSERT INTO `ibid_user_tokens` VALUES ('76', '10', '10', 'pc', 'user&pc@adc834391704a15e01feda9aca473808', 'user&pc@727730ef23361f0c72a653a8011a9905', '7200', '1', '2018-04-19 19:41:54', '2018-04-19 19:41:54');
INSERT INTO `ibid_user_tokens` VALUES ('77', '16', '16', 'pc', 'user&pc@1f2c46b278b8e3717ef1429bfd2e20ac', 'user&pc@f9aa69ce63f6d7f69d84d0efdae3ac39', '7200', '1', '2018-04-19 22:30:46', '2018-04-19 22:30:46');
INSERT INTO `ibid_user_tokens` VALUES ('78', '17', '17', 'pc', 'user&pc@2e990e07cb29b7860363a8fd34da170f', 'user&pc@e9c3c6ac9f987e9f06711d3bddfda498', '7200', '1', '2018-04-19 22:31:34', '2018-04-19 22:31:34');
INSERT INTO `ibid_user_tokens` VALUES ('79', '18', '18', 'pc', 'user&pc@b3d2272977767acd257b272b75342db0', 'user&pc@ea2c1500fc8c8d6eb9f20342603a4553', '7200', '1', '2018-04-19 22:32:08', '2018-04-19 22:32:08');
INSERT INTO `ibid_user_tokens` VALUES ('80', '19', '19', 'pc', 'user&pc@4d90b05529a6820122da978f062be099', 'user&pc@f6c503ef1a679f593de6f601b72349c3', '7200', '1', '2018-04-19 22:32:31', '2018-04-19 22:32:31');
INSERT INTO `ibid_user_tokens` VALUES ('81', '15', '15', 'pc', 'user&pc@68810d631f919589479af163127c39f3', 'user&pc@fac19c56468ec6f7d68debb30da68636', '7200', '1', '2018-04-19 22:51:06', '2018-04-19 22:51:06');
INSERT INTO `ibid_user_tokens` VALUES ('82', '15', '15', 'pc', 'user&pc@ac422c70bcd134540af4a30c81cfdf59', 'user&pc@9e6c6aa2596f31ede84fb061118b9f19', '7200', '1', '2018-04-19 22:51:28', '2018-04-19 22:51:28');
INSERT INTO `ibid_user_tokens` VALUES ('83', '15', '15', 'pc', 'user&pc@b4858f33b460b5e9189f57f79be975af', 'user&pc@fab0fe974f3e212d5e05d46dbf8e640a', '7200', '1', '2018-04-19 22:51:29', '2018-04-19 22:51:29');
INSERT INTO `ibid_user_tokens` VALUES ('84', '15', '15', 'pc', 'user&pc@22929b74791f457be91c632b90869f52', 'user&pc@f2ccee52d29d7cdbcfc76435cc04ec86', '7200', '1', '2018-04-19 22:51:29', '2018-04-19 22:51:29');
INSERT INTO `ibid_user_tokens` VALUES ('85', '2', '2', 'wap', 'user&wap@4e2f3ca51fe419405637197f8b23df92', 'user&wap@65ea0865554f6237b58a5ab9c32933d4', '7200', '1', '2018-04-20 09:04:50', '2018-04-20 09:04:50');
INSERT INTO `ibid_user_tokens` VALUES ('86', '4', '4', 'wechat', 'user&wechat@662ad8857ce3cf075fc44ec69582708f', 'user&wechat@d50eba5f2f4c1a10712cbd22eab0931f', '7200', '1', '2018-04-20 09:17:37', '2018-04-20 09:17:37');
INSERT INTO `ibid_user_tokens` VALUES ('87', '10', '10', 'wap', 'user&wap@ca5d7746729235f7e08facd4f803aeb9', 'user&wap@887a03302b40ead2e31f01b95c92d305', '7200', '1', '2018-04-20 09:31:32', '2018-04-20 09:31:32');
INSERT INTO `ibid_user_tokens` VALUES ('88', '3', '3', 'wap', 'user&wap@b5b771b973a2b219c8cd29732c38a00d', 'user&wap@a2c83f386e25148be58f18ffe2db6f74', '7200', '1', '2018-04-20 09:40:40', '2018-04-20 09:40:40');
INSERT INTO `ibid_user_tokens` VALUES ('89', '4', '4', 'wap', 'user&wap@48ad7f836cd2cdd1f0e0ae7bce3e5450', 'user&wap@e114995815bb143d5a257c540ded1308', '7200', '1', '2018-04-20 09:40:01', '2018-04-20 09:40:01');
INSERT INTO `ibid_user_tokens` VALUES ('90', '20', '20', 'pc', 'user&pc@83fa58b0a06fa694bcfae338c3c763e9', 'user&pc@45fd39e9f24fcd6870de0d53c6cbc035', '7200', '1', '2018-04-20 09:43:18', '2018-04-20 09:43:18');
INSERT INTO `ibid_user_tokens` VALUES ('91', '16', '16', 'pc', 'user&pc@50424277c20e61ad834c58b64cecbfe1', 'user&pc@858ccecec0129b961431d84e99a6b4d5', '7200', '1', '2018-04-20 09:44:10', '2018-04-20 09:44:10');
INSERT INTO `ibid_user_tokens` VALUES ('92', '2', '2', 'wap', 'user&wap@e36052c0bf9d2edf1064ff7dbf0a2b2c', 'user&wap@c35986a6daed01c78aed2b7d8235a7e0', '7200', '1', '2018-04-20 10:19:04', '2018-04-20 10:19:04');
INSERT INTO `ibid_user_tokens` VALUES ('93', '2', '2', 'wap', 'user&wap@508874ed5cd2983413bf0c7cf3967db6', 'user&wap@137e475ec538e27ee549f4e1478ee05f', '7200', '1', '2018-04-20 10:30:38', '2018-04-20 10:30:38');
INSERT INTO `ibid_user_tokens` VALUES ('94', '9', '9', 'pc', 'user&pc@985a30de4c945bcc87ff62297c72b60b', 'user&pc@be706bfa39bbe656b086beb8aab1d9f9', '7200', '1', '2018-04-20 10:33:13', '2018-04-20 10:33:13');
INSERT INTO `ibid_user_tokens` VALUES ('95', '1', '1', 'app', 'user&app@9cdf95a06e15d3e381a794b9266e2aac', 'user&app@95dfb789eed7808eae753195e1ba369b', '0', '1', '2018-04-20 11:51:55', '2018-04-20 11:51:55');
INSERT INTO `ibid_user_tokens` VALUES ('96', '13', '13', 'app', 'user&app@35b31c607a54fe607b4c80b9642df136', 'user&app@a1c79bd9c3c877fa419600363e1b54f3', '0', '1', '2018-04-20 11:52:03', '2018-04-20 11:52:03');
INSERT INTO `ibid_user_tokens` VALUES ('97', '2', '2', 'wap', 'user&wap@7eb227455654049e367f0818a1db00c7', 'user&wap@adcf6ae47dd0ec015e65c5b2a7aa549f', '7200', '1', '2018-04-20 13:40:46', '2018-04-20 13:40:46');
INSERT INTO `ibid_user_tokens` VALUES ('177', '9', '9', 'wechat', 'user&wechat@b03a011f30a4c88b836691df52f63345', 'user&wechat@ae709063edbb024a68a29a2816900e41', '7200', '1', '2018-04-23 11:03:54', '2018-04-23 11:03:54');
INSERT INTO `ibid_user_tokens` VALUES ('100', '1', '1', 'pc', 'user&pc@08c4ca57dd634284c12d28df7dab15b2', 'user&pc@2d1a255d06a88ab3941d35e0c1babfde', '7200', '1', '2018-04-20 14:10:29', '2018-04-20 14:10:29');
INSERT INTO `ibid_user_tokens` VALUES ('101', '1', '1', 'pc', 'user&pc@413e7a726ded9b6271f291e7a6bb09a2', 'user&pc@de27e0efb37929f4cb03509ead404a19', '7200', '1', '2018-04-20 14:10:30', '2018-04-20 14:10:30');
INSERT INTO `ibid_user_tokens` VALUES ('138', '9', '9', 'wap', 'user&wap@474053e225238858e9c193c1adab5b7a', 'user&wap@86ca943e762dac46a32ee24c0661c40c', '7200', '1', '2018-04-21 19:56:26', '2018-04-21 19:56:26');
INSERT INTO `ibid_user_tokens` VALUES ('103', '2', '2', 'wap', 'user&wap@da165f5832a7491d31a716d77eb23772', 'user&wap@0f41be71ce6a75590f2b10eee685d83b', '7200', '1', '2018-04-20 15:50:48', '2018-04-20 15:50:48');
INSERT INTO `ibid_user_tokens` VALUES ('130', '10', '10', 'wap', 'user&wap@6982cc99c8edd2433cc6465c2c8612b4', 'user&wap@d1c7a12e71b69a12712c8f06da82e6a4', '7200', '1', '2018-04-21 15:59:42', '2018-04-21 15:59:42');
INSERT INTO `ibid_user_tokens` VALUES ('133', '1', '1', 'app', 'user&app@5a6433036786e1eb130d5276dc47ee8a', 'user&app@23773e8ed3e500ee28c2cafccdde9d1e', '0', '1', '2018-04-21 16:59:34', '2018-04-21 16:59:34');
INSERT INTO `ibid_user_tokens` VALUES ('106', '2', '2', 'app', 'user&app@e183a06765d7c1fd46234c48f5ba2ef3', 'user&app@4b4748b42590dc514303de18f27a1ed4', '0', '1', '2018-04-20 16:49:53', '2018-04-20 16:49:53');
INSERT INTO `ibid_user_tokens` VALUES ('107', '2', '2', 'app', 'user&app@974a6a369a9802e8f2617e9abc66413e', 'user&app@badd7173a9987357b6cf0aa275d50a28', '0', '1', '2018-04-20 17:30:55', '2018-04-20 17:30:55');
INSERT INTO `ibid_user_tokens` VALUES ('108', '1', '1', 'app', 'user&app@c2bc1b5c41f09d5e423882e0db46aaca', 'user&app@b26215e2644f2ca626c294a492a25236', '0', '1', '2018-04-20 18:01:31', '2018-04-20 18:01:31');
INSERT INTO `ibid_user_tokens` VALUES ('109', '1', '1', 'app', 'user&app@437b9bf555b23d3e7f297f79d1ee04d2', 'user&app@27b7f23c724e522ad4dc4f4d067e606d', '0', '1', '2018-04-20 18:01:50', '2018-04-20 18:01:50');
INSERT INTO `ibid_user_tokens` VALUES ('110', '9', '9', 'pc', 'user&pc@13054b0e934bd7c23b110d51ed6518b4', 'user&pc@5a0a449d928622281272ed0138e5d6c3', '7200', '1', '2018-04-20 18:12:37', '2018-04-20 18:12:37');
INSERT INTO `ibid_user_tokens` VALUES ('111', '9', '9', 'pc', 'user&pc@181d98590e1414fd59debad57a94fc29', 'user&pc@e47cd21a37f3528648d7c910e19a6b60', '7200', '1', '2018-04-20 18:12:38', '2018-04-20 18:12:38');
INSERT INTO `ibid_user_tokens` VALUES ('179', '10', '10', 'wap', 'user&wap@ce0f4a20be8591b0aec47767ea8d90fd', 'user&wap@a51e924837f7788f6ce436abc06711a3', '7200', '1', '2018-04-23 11:58:52', '2018-04-23 11:58:52');
INSERT INTO `ibid_user_tokens` VALUES ('113', '10', '10', 'pc', 'user&pc@c818536937fa9f0cb0921f8187aa4b7e', 'user&pc@f02fcd29f2dfa8623839d33ea0e91c2e', '7200', '1', '2018-04-21 08:57:41', '2018-04-21 08:57:41');
INSERT INTO `ibid_user_tokens` VALUES ('114', '1', '1', 'app', 'user&app@30dd2b047824e97769aeb1ce0ef82fef', 'user&app@9ce1a8147f04e385fbf79d5c3af581fb', '0', '1', '2018-04-21 09:05:12', '2018-04-21 09:05:12');
INSERT INTO `ibid_user_tokens` VALUES ('115', '10', '10', 'pc', 'user&pc@acf98624298c55351a6023bb3b90cc1c', 'user&pc@d0759feb0e06bc3ee362e06432219db8', '7200', '1', '2018-04-21 09:15:40', '2018-04-21 09:15:40');
INSERT INTO `ibid_user_tokens` VALUES ('116', '2', '2', 'wap', 'user&wap@2c51e11fb6e64919a47501247db43888', 'user&wap@e55e0f2efc352e62dcfa31d1dc22c956', '7200', '1', '2018-04-21 09:11:45', '2018-04-21 09:11:45');
INSERT INTO `ibid_user_tokens` VALUES ('117', '2', '2', 'wap', 'user&wap@3da681215a3b112606927d2f0e4009a6', 'user&wap@2b228deebb74120377dafa772325a46b', '7200', '1', '2018-04-21 09:30:20', '2018-04-21 09:30:20');
INSERT INTO `ibid_user_tokens` VALUES ('118', '2', '2', 'wap', 'user&wap@2b8d464aa2a962bca29b817fe4645892', 'user&wap@2103a1968f567c9789d2b0ccf4b96def', '7200', '1', '2018-04-21 09:33:24', '2018-04-21 09:33:24');
INSERT INTO `ibid_user_tokens` VALUES ('119', '10', '10', 'pc', 'user&pc@f2e0f6d49b1ba85ceee5b035366b5d5b', 'user&pc@ea9706699ef7e209a2819f26b7c05e13', '7200', '1', '2018-04-21 09:48:51', '2018-04-21 09:48:51');
INSERT INTO `ibid_user_tokens` VALUES ('120', '1', '1', 'app', 'user&app@74fd315e310b22e25b535098f08db46a', 'user&app@dbce410b1e49036691589bd369270b3d', '0', '1', '2018-04-21 09:50:06', '2018-04-21 09:50:06');
INSERT INTO `ibid_user_tokens` VALUES ('122', '2', '2', 'app', 'user&app@5b673f96b53a81b7a6d3d145aeca30f5', 'user&app@eb2d92dce6e527a07c59a41b55eec0c8', '0', '1', '2018-04-21 10:47:56', '2018-04-21 10:47:56');
INSERT INTO `ibid_user_tokens` VALUES ('123', '10', '10', 'wap', 'user&wap@d7bf585b3697948fb3066cbb709b8b2d', 'user&wap@848874a67359a0ad7f1e758e7cfabcb5', '7200', '1', '2018-04-21 11:42:51', '2018-04-21 11:42:51');
INSERT INTO `ibid_user_tokens` VALUES ('124', '2', '2', 'wap', 'user&wap@499ad2b659108824a23852589f1f79d4', 'user&wap@363cab1435a0d348f1bc1e1542bd073a', '7200', '1', '2018-04-21 11:52:33', '2018-04-21 11:52:33');
INSERT INTO `ibid_user_tokens` VALUES ('125', '3', '3', 'wap', 'user&wap@e921ee34d791d519b58b95add147ecee', 'user&wap@d148cd50f19be7a0f2b87fe5768a30a6', '7200', '1', '2018-04-21 11:54:55', '2018-04-21 11:54:55');
INSERT INTO `ibid_user_tokens` VALUES ('126', '10', '10', 'pc', 'user&pc@c53e26f15777313ee2f36035739b323d', 'user&pc@4356fccecc48b4fdf1911ba4f440b7b0', '7200', '1', '2018-04-21 14:23:16', '2018-04-21 14:23:16');
INSERT INTO `ibid_user_tokens` VALUES ('128', '10', '10', 'pc', 'user&pc@ad3e0c7f16e60736d6a80732604445c2', 'user&pc@f43fa019e65a17e7bae8e36fdbb5bd20', '7200', '1', '2018-04-21 15:10:05', '2018-04-21 15:10:05');
INSERT INTO `ibid_user_tokens` VALUES ('129', '9', '9', 'pc', 'user&pc@9b4425994054e7a45edf4c8c9a21da95', 'user&pc@e210100fb66e0ff5575d4572b15726ff', '7200', '1', '2018-04-21 15:54:05', '2018-04-21 15:54:05');
INSERT INTO `ibid_user_tokens` VALUES ('131', '13', '13', 'app', 'user&app@06f85721881413053ef0375d3525e47b', 'user&app@62697fd492e123e8a6721d22bbed3e95', '0', '1', '2018-04-21 16:45:37', '2018-04-21 16:45:37');
INSERT INTO `ibid_user_tokens` VALUES ('132', '13', '13', 'app', 'user&app@0e6d703ea61d9c1f2d3c67973ae07467', 'user&app@f57e2ae94cc7b8650c10f6fcd7ea0c5b', '0', '1', '2018-04-21 16:45:47', '2018-04-21 16:45:47');
INSERT INTO `ibid_user_tokens` VALUES ('134', '1', '1', 'app', 'user&app@c72e1ef4f810296efd9558f5b9054a02', 'user&app@a3813ff754349692f56a9a104e227e0b', '0', '1', '2018-04-21 17:00:49', '2018-04-21 17:00:49');
INSERT INTO `ibid_user_tokens` VALUES ('135', '1', '1', 'app', 'user&app@a7f1a359c69e94f52a6ba3982faf2e31', 'user&app@0474a2ebf870b340ef0f9482bba3cb62', '0', '1', '2018-04-21 17:01:14', '2018-04-21 17:01:14');
INSERT INTO `ibid_user_tokens` VALUES ('139', '9', '9', 'wap', 'user&wap@729dd5a83a6699f76bfe147d839075be', 'user&wap@d50a780b60152cad94edb52dfd3684b4', '7200', '1', '2018-04-21 19:57:37', '2018-04-21 19:57:37');
INSERT INTO `ibid_user_tokens` VALUES ('140', '13', '13', 'wap', 'user&wap@b5f310c4319efa49b39ef5fae1530438', 'user&wap@e8cfe3d6bb7640499320784c4034bc91', '7200', '1', '2018-04-21 20:00:58', '2018-04-21 20:00:58');
INSERT INTO `ibid_user_tokens` VALUES ('141', '3', '3', 'pc', 'user&pc@5a92d08b8fa37c426262cc52350b01fe', 'user&pc@4e6791d51ba829be485b3bafde1d9021', '7200', '1', '2018-04-21 20:04:35', '2018-04-21 20:04:35');
INSERT INTO `ibid_user_tokens` VALUES ('142', '13', '13', 'wechat', 'user&wechat@1ac8f6b8a024874f6be0c4cdeeb3a576', 'user&wechat@bc11a22b366e09971cc89528391cce79', '7200', '1', '2018-04-21 20:04:02', '2018-04-21 20:04:02');
INSERT INTO `ibid_user_tokens` VALUES ('143', '9', '9', 'wechat', 'user&wechat@6f2d59e41f842fe05eb29fbbd3ada0df', 'user&wechat@f95524e1871aa9020f3c86a23d1679d0', '7200', '1', '2018-04-21 20:06:16', '2018-04-21 20:06:16');
INSERT INTO `ibid_user_tokens` VALUES ('144', '15', '15', 'pc', 'user&pc@113c970c0474f9b313fe223de2f5aeeb', 'user&pc@9d6ffdc614a0538806f159afa88f44b7', '7200', '1', '2018-04-21 20:28:39', '2018-04-21 20:28:39');
INSERT INTO `ibid_user_tokens` VALUES ('145', '1', '1', 'wechat', 'user&wechat@8c59894321f16d815eefb1dfa7e36d03', 'user&wechat@1081dd8929218c226053d40302fe0b88', '7200', '1', '2018-04-21 20:32:00', '2018-04-21 20:32:00');
INSERT INTO `ibid_user_tokens` VALUES ('207', '9', '9', 'pc', 'user&pc@b6abe432e176898462d9743ba991bd41', 'user&pc@357188b34191eb4fc73349b0b5dff7cd', '7200', '1', '2018-04-24 09:34:54', '2018-04-24 09:34:54');
INSERT INTO `ibid_user_tokens` VALUES ('147', '3', '3', 'wap', 'user&wap@4c7c7887c67e674a1f7803558d6d61b9', 'user&wap@2e0ab888f3b16a88c3d63d8e45053a0e', '7200', '1', '2018-04-21 22:58:36', '2018-04-21 22:58:36');
INSERT INTO `ibid_user_tokens` VALUES ('148', '3', '3', 'pc', 'user&pc@0dda15adec446af69252c92ba126e70d', 'user&pc@c2c4c93079ddae3b64a2687de61da113', '7200', '1', '2018-04-21 23:17:23', '2018-04-21 23:17:23');
INSERT INTO `ibid_user_tokens` VALUES ('149', '3', '3', 'pc', 'user&pc@30af4325e71ac3db5c651a90ab957d28', 'user&pc@e05a104281aed355fa0a85fbf2085bfd', '7200', '1', '2018-04-21 23:17:32', '2018-04-21 23:17:32');
INSERT INTO `ibid_user_tokens` VALUES ('150', '3', '3', 'pc', 'user&pc@d42f1f96cb13c9f37f4f1bf926e9c6fe', 'user&pc@f80159a474e786af5506a0822105c823', '7200', '1', '2018-04-21 23:19:03', '2018-04-21 23:19:03');
INSERT INTO `ibid_user_tokens` VALUES ('151', '3', '3', 'pc', 'user&pc@dd532ec9ea349abd20978ced2478f988', 'user&pc@7d1b6efdede28e651d2bdece21a71c41', '7200', '1', '2018-04-21 23:21:36', '2018-04-21 23:21:36');
INSERT INTO `ibid_user_tokens` VALUES ('152', '3', '3', 'wap', 'user&wap@1eadd8aad2c58066498a8694efb1fd07', 'user&wap@8daef3d54deb60a6173e1ad82a149f9d', '7200', '1', '2018-04-21 23:31:44', '2018-04-21 23:31:44');
INSERT INTO `ibid_user_tokens` VALUES ('153', '3', '3', 'pc', 'user&pc@582f649a114616131111e56a614b2004', 'user&pc@9e58b1e094c16088341cea03c4b3d91a', '7200', '1', '2018-04-21 23:33:30', '2018-04-21 23:33:30');
INSERT INTO `ibid_user_tokens` VALUES ('154', '3', '3', 'pc', 'user&pc@a92126a71d46ed8ed063b6876259bd9e', 'user&pc@b27ebf93a46d551ac4aedb4af27f8bd8', '7200', '1', '2018-04-21 23:33:46', '2018-04-21 23:33:46');
INSERT INTO `ibid_user_tokens` VALUES ('155', '3', '3', 'pc', 'user&pc@cba1102003bfc997ab02c79de31ae64d', 'user&pc@489d9bfa2e1c86af953e26a8fde609bf', '7200', '1', '2018-04-21 23:34:41', '2018-04-21 23:34:41');
INSERT INTO `ibid_user_tokens` VALUES ('156', '3', '3', 'pc', 'user&pc@b66dd1106f62dea829d4758f2cc5611e', 'user&pc@381f9d7111d9459479d2b9df4c30cdb0', '7200', '1', '2018-04-21 23:35:42', '2018-04-21 23:35:42');
INSERT INTO `ibid_user_tokens` VALUES ('157', '1', '1', 'wap', 'user&wap@cb9464137164c1c5c255da2d382da361', 'user&wap@c1ffbe5d486eda9f334a74b6aa0f210f', '7200', '1', '2018-04-22 10:35:04', '2018-04-22 10:35:04');
INSERT INTO `ibid_user_tokens` VALUES ('158', '1', '1', 'app', 'user&app@e73a97f1fa3bab0b0fb9a2384ed63aeb', 'user&app@73b56302e57ec8313ccac9ee68241025', '0', '1', '2018-04-22 11:44:03', '2018-04-22 11:44:03');
INSERT INTO `ibid_user_tokens` VALUES ('159', '1', '1', 'app', 'user&app@497659714cdb5cbcf009ede61fdf6e47', 'user&app@971bb576dacacd746dfb2ceb6dd699f8', '0', '1', '2018-04-22 11:55:12', '2018-04-22 11:55:12');
INSERT INTO `ibid_user_tokens` VALUES ('160', '15', '15', 'pc', 'user&pc@ffc8ee111476ed733424221488c9d064', 'user&pc@d2c89fd7b1720eaff956fcec17e61783', '7200', '1', '2018-04-22 20:25:30', '2018-04-22 20:25:30');
INSERT INTO `ibid_user_tokens` VALUES ('161', '15', '15', 'pc', 'user&pc@18131f65850be3f8d9c4fb8ce90b8854', 'user&pc@c3f0a105c9c4ece4507ac5fbf613d426', '7200', '1', '2018-04-22 20:25:32', '2018-04-22 20:25:32');
INSERT INTO `ibid_user_tokens` VALUES ('162', '15', '15', 'wap', 'user&wap@b6fbb966acbdf2242c85405436f1ac60', 'user&wap@ba7357c20573b7681481e9d163bcda65', '7200', '1', '2018-04-22 20:40:36', '2018-04-22 20:40:36');
INSERT INTO `ibid_user_tokens` VALUES ('163', '3', '3', 'pc', 'user&pc@7ca198b6764f58adc23d6118df4d0ad1', 'user&pc@599a672f13664e97a6de507996cfc3ab', '7200', '1', '2018-04-22 21:45:32', '2018-04-22 21:45:32');
INSERT INTO `ibid_user_tokens` VALUES ('164', '3', '3', 'pc', 'user&pc@8c8ad2458173e5c7608f88201409151e', 'user&pc@42683dc20c536483c5d8b16a8905924e', '7200', '1', '2018-04-22 21:54:21', '2018-04-22 21:54:21');
INSERT INTO `ibid_user_tokens` VALUES ('165', '3', '3', 'pc', 'user&pc@e472fbb7d4324e26feab55a1b40e92ca', 'user&pc@097b3e1fd8806a206739be4fcdcc45e7', '7200', '1', '2018-04-22 21:54:27', '2018-04-22 21:54:27');
INSERT INTO `ibid_user_tokens` VALUES ('166', '3', '3', 'pc', 'user&pc@f50126ed7be22f789183e19552ed1c29', 'user&pc@647916acd0f0a5b914c61a05a024bf79', '7200', '1', '2018-04-22 21:54:32', '2018-04-22 21:54:32');
INSERT INTO `ibid_user_tokens` VALUES ('168', '3', '3', 'pc', 'user&pc@d621e6cf1906bc141d50c6a9262d3542', 'user&pc@eea117905a6f5ada39a69b40c70eeb43', '7200', '1', '2018-04-23 09:38:10', '2018-04-23 09:38:10');
INSERT INTO `ibid_user_tokens` VALUES ('169', '1', '1', 'app', 'user&app@9ad2b7b4d17ab01de3429bd0364e367b', 'user&app@cbe920786b416fef267962b00625af73', '0', '1', '2018-04-23 09:38:57', '2018-04-23 09:38:57');
INSERT INTO `ibid_user_tokens` VALUES ('170', '2', '2', 'app', 'user&app@b449e397c4f2c4ac950238f3008e575a', 'user&app@4233493a9f3d0e1b8d8f45f3c8919e11', '0', '1', '2018-04-23 09:41:15', '2018-04-23 09:41:15');
INSERT INTO `ibid_user_tokens` VALUES ('171', '10', '10', 'pc', 'user&pc@4732459d108555cb7bc2fd3908648a35', 'user&pc@9222ad145dd0b70dff78b8d9a36c758c', '7200', '1', '2018-04-23 09:43:25', '2018-04-23 09:43:25');
INSERT INTO `ibid_user_tokens` VALUES ('172', '10', '10', 'pc', 'user&pc@31bbc45f269d6bef11bcfdf76c4bc7fd', 'user&pc@1ab30e473e3a6cb30904e1d6118c4329', '7200', '1', '2018-04-23 09:47:56', '2018-04-23 09:47:56');
INSERT INTO `ibid_user_tokens` VALUES ('173', '10', '10', 'wap', 'user&wap@84d11df52626fdaa7a42d723a89ee3c9', 'user&wap@c7ff2d9d84fe7daed8da6d5cc762b55d', '7200', '1', '2018-04-23 10:13:45', '2018-04-23 10:13:45');
INSERT INTO `ibid_user_tokens` VALUES ('174', '10', '10', 'pc', 'user&pc@915d25bbb3fd2ea97f5c58e624c08366', 'user&pc@e35bf2d766d15f1bb8418beac253f605', '7200', '1', '2018-04-23 10:28:08', '2018-04-23 10:28:08');
INSERT INTO `ibid_user_tokens` VALUES ('175', '14', '14', 'wap', 'user&wap@ba55efd8791f0120701435ee47538a5c', 'user&wap@06312663da6a6b9c2936f699d7cc6d66', '7200', '1', '2018-04-23 10:56:12', '2018-04-23 10:56:12');
INSERT INTO `ibid_user_tokens` VALUES ('176', '3', '3', 'wap', 'user&wap@c0a52ef613db85ece307553afa177ef5', 'user&wap@ce3b16ee11175304bdacd6c7c4ec9a59', '7200', '1', '2018-04-23 10:57:05', '2018-04-23 10:57:05');
INSERT INTO `ibid_user_tokens` VALUES ('178', '10', '10', 'pc', 'user&pc@d4ce069b4e18fcbcb9eedeac0f71098a', 'user&pc@49e17495e7678ab0f0cda969c77dd934', '7200', '1', '2018-04-23 11:57:15', '2018-04-23 11:57:15');
INSERT INTO `ibid_user_tokens` VALUES ('180', '10', '10', 'pc', 'user&pc@13801a42df2bb1a61bcbc41f4d7b4dae', 'user&pc@393d06219237b11e0175bcee8fdc0359', '7200', '1', '2018-04-23 13:45:58', '2018-04-23 13:45:58');
INSERT INTO `ibid_user_tokens` VALUES ('181', '1', '1', 'wap', 'user&wap@bb536090039b7b183e4b0acc72b73946', 'user&wap@0f8138ce4fade9bbafd9b24397121dcd', '7200', '1', '2018-04-23 13:51:50', '2018-04-23 13:51:50');
INSERT INTO `ibid_user_tokens` VALUES ('223', '1', '1', 'wap', 'user&wap@2ca32b20be2df45952040490e7495829', 'user&wap@08e09a0bfdd766db0f8759b9017830e4', '7200', '1', '2018-04-24 15:43:34', '2018-04-24 15:43:34');
INSERT INTO `ibid_user_tokens` VALUES ('222', '10', '10', 'wap', 'user&wap@1ee3be3bc34a954306a7d429f410cee0', 'user&wap@dc1055066827317a5baf55c21c69a97a', '7200', '1', '2018-04-24 15:39:14', '2018-04-24 15:39:14');
INSERT INTO `ibid_user_tokens` VALUES ('184', '1', '1', 'app', 'user&app@b7554531f249f735d9223aab3bff23d4', 'user&app@315c5d45483a714ee60fe76743b73e7f', '0', '1', '2018-04-23 14:55:19', '2018-04-23 14:55:19');
INSERT INTO `ibid_user_tokens` VALUES ('185', '2', '2', 'app', 'user&app@015cadb0ddaf98e067024c9df99823d5', 'user&app@ea9d32522b989808bbf8c690441ee4ee', '0', '1', '2018-04-23 15:06:03', '2018-04-23 15:06:03');
INSERT INTO `ibid_user_tokens` VALUES ('186', '1', '1', 'app', 'user&app@a2e0667cdadfeb7b4b2af61ce3ce6764', 'user&app@15c955f96e33fa8d185955848bdf5fac', '0', '1', '2018-04-23 15:11:47', '2018-04-23 15:11:47');
INSERT INTO `ibid_user_tokens` VALUES ('187', '1', '1', 'app', 'user&app@d81740f12cd35c8c4596e1bf5cae444b', 'user&app@6ec50bf4a58175d3f3a2a403fd03b2a2', '0', '1', '2018-04-23 15:29:28', '2018-04-23 15:29:28');
INSERT INTO `ibid_user_tokens` VALUES ('188', '1', '1', 'app', 'user&app@59ddb14cc749050e5457192d0e3e6549', 'user&app@d1dbc7a7e189eccf7cf5690e8e58a1c0', '0', '1', '2018-04-23 15:29:38', '2018-04-23 15:29:38');
INSERT INTO `ibid_user_tokens` VALUES ('189', '2', '2', 'app', 'user&app@a3589b4c02995ef1434dcb1ea5f31a1e', 'user&app@0d625d59df45da81abdf4150c3275c72', '0', '1', '2018-04-23 15:30:18', '2018-04-23 15:30:18');
INSERT INTO `ibid_user_tokens` VALUES ('191', '1', '1', 'app', 'user&app@ba2b2a6c8566a4c76db998964511e3cc', 'user&app@d1c94cb6a213c313ee92a7ec98630849', '0', '1', '2018-04-23 15:39:37', '2018-04-23 15:39:37');
INSERT INTO `ibid_user_tokens` VALUES ('192', '2', '2', 'app', 'user&app@4029ac9ee8e73591aa3269d187cf790f', 'user&app@aa25b31951915d098b58d3680fdcd2c1', '0', '1', '2018-04-23 15:42:28', '2018-04-23 15:42:28');
INSERT INTO `ibid_user_tokens` VALUES ('193', '1', '1', 'app', 'user&app@a7984c48a87cf055b413c6cda3d111fe', 'user&app@bdceb9c33d2baa6e4e9acd671f9d6598', '0', '1', '2018-04-23 15:55:28', '2018-04-23 15:55:28');
INSERT INTO `ibid_user_tokens` VALUES ('194', '2', '2', 'app', 'user&app@dd924bf2310e2cbde9d5af8ae7866ca1', 'user&app@5163f32015b7a6cdc57a148c0565a955', '0', '1', '2018-04-23 15:56:38', '2018-04-23 15:56:38');
INSERT INTO `ibid_user_tokens` VALUES ('195', '1', '1', 'app', 'user&app@4bbb15028ee9262ea97f603afa453570', 'user&app@97b6bab055f45c7ad82746114c90c2a4', '0', '1', '2018-04-23 16:42:19', '2018-04-23 16:42:19');
INSERT INTO `ibid_user_tokens` VALUES ('196', '15', '15', 'pc', 'user&pc@2b14f94b090f6e4477cfe67b09015424', 'user&pc@06d1504f44aaeb82ebef34fd00774766', '7200', '1', '2018-04-23 16:59:40', '2018-04-23 16:59:40');
INSERT INTO `ibid_user_tokens` VALUES ('197', '21', '21', 'app', 'user&app@35fe460ac23224ae4cbd214eec4bcfc3', 'user&app@78cb55912168dca810431bf5996cf89f', '0', '1', '2018-04-23 17:00:39', '2018-04-23 17:00:39');
INSERT INTO `ibid_user_tokens` VALUES ('198', '2', '2', 'app', 'user&app@c8336a897b2a74c974a350563b16bafe', 'user&app@3b132ce96814a6deaa7dd641466dd6ee', '0', '1', '2018-04-23 17:01:28', '2018-04-23 17:01:28');
INSERT INTO `ibid_user_tokens` VALUES ('199', '21', '21', 'app', 'user&app@b9cab95b18aaa0a49d1d692f9b0a2f12', 'user&app@07d7b577c72c306647b654e4116e7dbc', '0', '1', '2018-04-23 17:02:38', '2018-04-23 17:02:38');
INSERT INTO `ibid_user_tokens` VALUES ('200', '2', '2', 'wap', 'user&wap@b3fad3ce48c829963d3ea45b33029c40', 'user&wap@d909f7b49170d4697c3f9a832e23b82e', '7200', '1', '2018-04-23 17:13:36', '2018-04-23 17:13:36');
INSERT INTO `ibid_user_tokens` VALUES ('201', '2', '2', 'app', 'user&app@866504377df92c53c65b0a045d200fbd', 'user&app@8d5508c35348276c9025ef683d7b9805', '0', '1', '2018-04-23 17:21:36', '2018-04-23 17:21:36');
INSERT INTO `ibid_user_tokens` VALUES ('202', '1', '1', 'app', 'user&app@acb7a3a678c1383ea6262ca13cedd57a', 'user&app@354321f14d7021162cc2f95d99dc55e5', '0', '1', '2018-04-23 17:54:21', '2018-04-23 17:54:21');
INSERT INTO `ibid_user_tokens` VALUES ('203', '1', '1', 'app', 'user&app@c0002bdb0ba470803798ceeaa5e506cd', 'user&app@ae5f3df912c1df887afc61ce813fa388', '0', '1', '2018-04-23 17:54:39', '2018-04-23 17:54:39');
INSERT INTO `ibid_user_tokens` VALUES ('204', '2', '2', 'app', 'user&app@8a7699b80a57b49f240f6babe03b021e', 'user&app@5d33d2c26349817568f8b36ff79db583', '0', '1', '2018-04-23 18:02:36', '2018-04-23 18:02:36');
INSERT INTO `ibid_user_tokens` VALUES ('205', '9', '9', 'pc', 'user&pc@32789ded3dff372f63c660b758f7ac58', 'user&pc@92eebacd9036e036fc9fa43b9c6d1920', '7200', '1', '2018-04-24 00:00:48', '2018-04-24 00:00:48');
INSERT INTO `ibid_user_tokens` VALUES ('206', '10', '10', 'pc', 'user&pc@c076ff0091286b9ab949b04c8b4b3a67', 'user&pc@cf7aa06a79ba2090029937eda3105372', '7200', '1', '2018-04-24 09:33:07', '2018-04-24 09:33:07');
INSERT INTO `ibid_user_tokens` VALUES ('208', '10', '10', 'pc', 'user&pc@6c52c8e32ff65a4fbce23f31abec97f2', 'user&pc@b0df527e9659029c09c51c394541ccd3', '7200', '1', '2018-04-24 09:44:47', '2018-04-24 09:44:47');
INSERT INTO `ibid_user_tokens` VALUES ('209', '2', '2', 'wap', 'user&wap@9c082380e1ccfaac28b59bb5549614c1', 'user&wap@465a25f19cb11d39030ecb48668e8bfb', '7200', '1', '2018-04-24 10:04:26', '2018-04-24 10:04:26');
INSERT INTO `ibid_user_tokens` VALUES ('210', '1', '1', 'app', 'user&app@0820c21467da6b984e53ea1178bc1cf1', 'user&app@3fcc3e9a384085d4ca8575a08d1131d3', '0', '1', '2018-04-24 10:20:27', '2018-04-24 10:20:27');
INSERT INTO `ibid_user_tokens` VALUES ('211', '1', '1', 'app', 'user&app@c5bcefae3fc0e90b5c9fa711d2ae15c3', 'user&app@744e7860d9187e7f0d988c462d2acea0', '0', '1', '2018-04-24 10:31:37', '2018-04-24 10:31:37');
INSERT INTO `ibid_user_tokens` VALUES ('212', '3', '3', 'app', 'user&app@63a6bb25b795ad993170dc782ebadef7', 'user&app@f175f401398498c31aacf715938ac07b', '0', '1', '2018-04-24 10:36:43', '2018-04-24 10:36:43');
INSERT INTO `ibid_user_tokens` VALUES ('213', '1', '1', 'app', 'user&app@7cc964b5fe4dcadced455f19c9fc39a9', 'user&app@e27d8f08182b0d47b423805774cd5e4b', '0', '1', '2018-04-24 11:46:44', '2018-04-24 11:46:44');
INSERT INTO `ibid_user_tokens` VALUES ('214', '1', '1', 'app', 'user&app@6abd0a2586e871ede720d2b190015cda', 'user&app@5770e36dd13db35a629960bf0ff660a9', '0', '1', '2018-04-24 11:55:40', '2018-04-24 11:55:40');
INSERT INTO `ibid_user_tokens` VALUES ('215', '15', '15', 'pc', 'user&pc@cf34f8b5b472a34793da5b2b4a322683', 'user&pc@aac28bc92cd2a36d12c7b3ed1771e312', '7200', '1', '2018-04-24 12:01:47', '2018-04-24 12:01:47');
INSERT INTO `ibid_user_tokens` VALUES ('216', '9', '9', 'pc', 'user&pc@2f004e3a1b36fb328824c572d07a51de', 'user&pc@63f55da2d0b07395849ddf68a9ed7887', '7200', '1', '2018-04-24 13:38:14', '2018-04-24 13:38:14');
INSERT INTO `ibid_user_tokens` VALUES ('217', '2', '2', 'app', 'user&app@64a5099dcaaff1120a4d627c38fa7360', 'user&app@50fdead3485a91d48201f90be11fbb77', '0', '1', '2018-04-24 13:57:47', '2018-04-24 13:57:47');
INSERT INTO `ibid_user_tokens` VALUES ('218', '1', '1', 'app', 'user&app@db927d1cbd18ebcb6fa7fc11921fe497', 'user&app@4f74b18879f82aab3155e42fca1bfab3', '0', '1', '2018-04-24 14:00:36', '2018-04-24 14:00:36');
INSERT INTO `ibid_user_tokens` VALUES ('219', '3', '3', 'pc', 'user&pc@ffc89bebb6b37950348004affe982d65', 'user&pc@6235fa8bbfaffd98bd2e15b65e18c9dd', '7200', '1', '2018-04-24 14:09:56', '2018-04-24 14:09:56');
INSERT INTO `ibid_user_tokens` VALUES ('220', '2', '2', 'app', 'user&app@88b7534208c5db61f046bde02db5b3c0', 'user&app@eab894bd4a63eac5226edd5b2e38629d', '0', '1', '2018-04-24 14:28:56', '2018-04-24 14:28:56');
INSERT INTO `ibid_user_tokens` VALUES ('221', '10', '10', 'pc', 'user&pc@34c24827b69b5534c2a05523ca08cd8e', 'user&pc@6f40277c09632701da044a62dc368b76', '7200', '1', '2018-04-24 14:45:21', '2018-04-24 14:45:21');
INSERT INTO `ibid_user_tokens` VALUES ('224', '9', '9', 'pc', 'user&pc@b5332c62ab771fdfc2ac2c1e01322ce7', 'user&pc@7c5e5e20dfc4f57213912c5fb5b55cdb', '7200', '1', '2018-04-24 16:14:13', '2018-04-24 16:14:13');
INSERT INTO `ibid_user_tokens` VALUES ('225', '9', '9', 'pc', 'user&pc@bfcf0f890e412f6ea3fa425586fa10ae', 'user&pc@abf1422b3f19c12c9a173569f47459ab', '7200', '1', '2018-04-24 16:14:13', '2018-04-24 16:14:13');
INSERT INTO `ibid_user_tokens` VALUES ('226', '10', '10', 'pc', 'user&pc@108cf364f34d0c2c613d2eaab069491a', 'user&pc@33441fb552bf5921ede930485d55e5fb', '7200', '1', '2018-04-24 16:17:36', '2018-04-24 16:17:36');
INSERT INTO `ibid_user_tokens` VALUES ('227', '10', '10', 'wap', 'user&wap@9d1aca3d2707fce11dd1191ad917b47a', 'user&wap@74b5e4f4cc5c20adade5d5298c558826', '7200', '1', '2018-04-24 16:17:51', '2018-04-24 16:17:51');
INSERT INTO `ibid_user_tokens` VALUES ('228', '10', '10', 'pc', 'user&pc@8e925a65e44e88bdd5ce8c42ae7ede80', 'user&pc@439faf093e415605b75cf2c8d59bae5b', '7200', '1', '2018-04-24 16:33:34', '2018-04-24 16:33:34');
INSERT INTO `ibid_user_tokens` VALUES ('229', '2', '2', 'app', 'user&app@c6450627d5c3acdd267410bef0038975', 'user&app@9350e4022fb98b46c159036a1734f119', '0', '1', '2018-04-24 16:45:52', '2018-04-24 16:45:52');
INSERT INTO `ibid_user_tokens` VALUES ('230', '2', '2', 'app', 'user&app@d5c17a9c68815237cdb1346b3957cee2', 'user&app@2ed7a2a7161b3a628db13f9ff2050f9e', '0', '1', '2018-04-24 16:47:19', '2018-04-24 16:47:19');
INSERT INTO `ibid_user_tokens` VALUES ('232', '9', '9', 'pc', 'user&pc@72539022e891fea43f98606a0a73e05e', 'user&pc@ef07fe655e3d71714e3c9ca28378f5d0', '7200', '1', '2018-04-24 23:29:30', '2018-04-24 23:29:30');
INSERT INTO `ibid_user_tokens` VALUES ('233', '9', '9', 'pc', 'user&pc@93aff29c8d914f3f884d3d128f00c382', 'user&pc@4e6b8624c68acd5a27901c3ae47d6a74', '7200', '1', '2018-04-24 23:38:35', '2018-04-24 23:38:35');
INSERT INTO `ibid_user_tokens` VALUES ('234', '1', '1', 'wap', 'user&wap@809ba6e0d7b044908c9fd5aa34e6d5d6', 'user&wap@485c9fd959b1034d977f9ba68d668760', '7200', '1', '2018-04-25 00:04:36', '2018-04-25 00:04:36');
INSERT INTO `ibid_user_tokens` VALUES ('235', '22', '22', 'app', 'user&app@c37bcb41453742886e933f7b88f229dc', 'user&app@18dc80d7efea9f6c972578c32555547a', '0', '1', '2018-04-25 08:21:14', '2018-04-25 08:21:14');
INSERT INTO `ibid_user_tokens` VALUES ('236', '22', '22', 'wap', 'user&wap@23b0e25e5388fbb6c41b6b6c6ae3a480', 'user&wap@6067f6f5e725be38cbec1f925daaff59', '7200', '1', '2018-04-25 08:24:11', '2018-04-25 08:24:11');
INSERT INTO `ibid_user_tokens` VALUES ('237', '1', '1', 'app', 'user&app@e4d9853bee3ea3aa44505f8ef17fde8a', 'user&app@e6881caf9fbff6295f45f931ca09c561', '0', '1', '2018-04-25 09:01:57', '2018-04-25 09:01:57');
INSERT INTO `ibid_user_tokens` VALUES ('238', '9', '9', 'pc', 'user&pc@91ad49f722343702e5d36ffff2039270', 'user&pc@a585f2b539f716b42b2ac939917916a9', '7200', '1', '2018-04-25 09:11:22', '2018-04-25 09:11:22');

-- -----------------------------
-- Table structure for `ibid_user_visit_logs`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_user_visit_logs`;
CREATE TABLE `ibid_user_visit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_account_id` bigint(20) NOT NULL COMMENT '会员账号ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `client_type` varchar(255) NOT NULL COMMENT '客户端类型：pc|wap|app|wechat|applet',
  `ip` varchar(255) NOT NULL COMMENT '访问IP',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：1正常0删除',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_user_visit_logs`
-- -----------------------------
INSERT INTO `ibid_user_visit_logs` VALUES ('1', '1', '1', 'wap', '113.247.49.232', '2018-04-17 15:58:46', '1', '2018-04-17 15:58:46', '2018-04-17 15:58:46');
INSERT INTO `ibid_user_visit_logs` VALUES ('2', '2', '2', 'wechat', '113.247.49.232', '2018-04-17 16:14:28', '1', '2018-04-17 16:14:28', '2018-04-17 16:14:28');
INSERT INTO `ibid_user_visit_logs` VALUES ('3', '2', '2', 'wap', '113.247.49.232', '2018-04-17 16:22:55', '1', '2018-04-17 16:22:55', '2018-04-17 16:22:55');
INSERT INTO `ibid_user_visit_logs` VALUES ('4', '2', '2', 'wap', '113.247.49.232', '2018-04-17 16:48:34', '1', '2018-04-17 16:48:34', '2018-04-17 16:48:34');
INSERT INTO `ibid_user_visit_logs` VALUES ('5', '2', '2', 'wap', '113.247.49.232', '2018-04-17 16:48:51', '1', '2018-04-17 16:48:51', '2018-04-17 16:48:51');
INSERT INTO `ibid_user_visit_logs` VALUES ('6', '2', '2', 'wap', '113.247.49.232', '2018-04-17 16:54:26', '1', '2018-04-17 16:54:26', '2018-04-17 16:54:26');
INSERT INTO `ibid_user_visit_logs` VALUES ('7', '2', '2', 'wap', '113.247.49.232', '2018-04-17 17:41:32', '1', '2018-04-17 17:41:32', '2018-04-17 17:41:32');
INSERT INTO `ibid_user_visit_logs` VALUES ('8', '2', '2', 'wap', '113.247.49.232', '2018-04-17 17:43:22', '1', '2018-04-17 17:43:22', '2018-04-17 17:43:22');
INSERT INTO `ibid_user_visit_logs` VALUES ('9', '2', '2', 'wap', '113.247.49.232', '2018-04-17 17:57:50', '1', '2018-04-17 17:57:50', '2018-04-17 17:57:50');
INSERT INTO `ibid_user_visit_logs` VALUES ('10', '2', '2', 'wap', '113.247.49.232', '2018-04-17 17:57:59', '1', '2018-04-17 17:57:59', '2018-04-17 17:57:59');
INSERT INTO `ibid_user_visit_logs` VALUES ('11', '2', '2', 'wap', '113.247.49.232', '2018-04-17 17:58:10', '1', '2018-04-17 17:58:10', '2018-04-17 17:58:10');
INSERT INTO `ibid_user_visit_logs` VALUES ('12', '2', '2', 'wap', '113.247.49.232', '2018-04-17 17:58:21', '1', '2018-04-17 17:58:21', '2018-04-17 17:58:21');
INSERT INTO `ibid_user_visit_logs` VALUES ('13', '3', '3', 'wap', '36.157.217.146', '2018-04-17 18:08:00', '1', '2018-04-17 18:08:01', '2018-04-17 18:08:01');
INSERT INTO `ibid_user_visit_logs` VALUES ('14', '4', '4', 'wap', '106.17.185.65', '2018-04-18 09:10:30', '1', '2018-04-18 09:10:30', '2018-04-18 09:10:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('15', '5', '5', 'wap', '113.247.49.232', '2018-04-18 09:14:16', '1', '2018-04-18 09:14:16', '2018-04-18 09:14:16');
INSERT INTO `ibid_user_visit_logs` VALUES ('16', '2', '2', 'wap', '106.17.185.65', '2018-04-18 09:16:31', '1', '2018-04-18 09:16:31', '2018-04-18 09:16:31');
INSERT INTO `ibid_user_visit_logs` VALUES ('17', '4', '4', 'wap', '106.17.185.65', '2018-04-18 09:17:42', '1', '2018-04-18 09:17:42', '2018-04-18 09:17:42');
INSERT INTO `ibid_user_visit_logs` VALUES ('18', '6', '6', 'wap', '113.247.49.232', '2018-04-18 09:34:43', '1', '2018-04-18 09:34:43', '2018-04-18 09:34:43');
INSERT INTO `ibid_user_visit_logs` VALUES ('19', '5', '5', 'wap', '113.247.49.232', '2018-04-18 09:36:34', '1', '2018-04-18 09:36:34', '2018-04-18 09:36:34');
INSERT INTO `ibid_user_visit_logs` VALUES ('20', '5', '5', 'wechat', '113.247.49.232', '2018-04-18 09:37:38', '1', '2018-04-18 09:37:38', '2018-04-18 09:37:38');
INSERT INTO `ibid_user_visit_logs` VALUES ('21', '7', '7', 'wap', '106.17.185.65', '2018-04-18 09:38:47', '1', '2018-04-18 09:38:47', '2018-04-18 09:38:47');
INSERT INTO `ibid_user_visit_logs` VALUES ('22', '6', '6', 'wap', '113.247.49.232', '2018-04-18 09:47:52', '1', '2018-04-18 09:47:52', '2018-04-18 09:47:52');
INSERT INTO `ibid_user_visit_logs` VALUES ('23', '2', '2', 'wap', '106.17.185.65', '2018-04-18 09:49:21', '1', '2018-04-18 09:49:21', '2018-04-18 09:49:21');
INSERT INTO `ibid_user_visit_logs` VALUES ('24', '2', '2', 'wap', '106.17.185.65', '2018-04-18 10:05:01', '1', '2018-04-18 10:05:01', '2018-04-18 10:05:01');
INSERT INTO `ibid_user_visit_logs` VALUES ('25', '8', '8', 'wechat', '113.247.49.232', '2018-04-18 10:08:34', '1', '2018-04-18 10:08:34', '2018-04-18 10:08:34');
INSERT INTO `ibid_user_visit_logs` VALUES ('26', '8', '8', 'wechat', '113.247.49.232', '2018-04-18 10:14:59', '1', '2018-04-18 10:14:59', '2018-04-18 10:14:59');
INSERT INTO `ibid_user_visit_logs` VALUES ('27', '9', '9', 'wap', '0.0.0.0', '2018-04-18 10:16:12', '1', '2018-04-18 10:16:12', '2018-04-18 10:16:12');
INSERT INTO `ibid_user_visit_logs` VALUES ('28', '2', '2', 'wap', '113.247.49.232', '2018-04-18 10:22:04', '1', '2018-04-18 10:22:04', '2018-04-18 10:22:04');
INSERT INTO `ibid_user_visit_logs` VALUES ('29', '3', '3', 'pc', '127.0.0.1', '2018-04-18 10:29:02', '1', '2018-04-18 10:29:02', '2018-04-18 10:29:02');
INSERT INTO `ibid_user_visit_logs` VALUES ('30', '1', '1', 'wap', '113.247.49.232', '2018-04-18 10:35:18', '1', '2018-04-18 10:35:18', '2018-04-18 10:35:18');
INSERT INTO `ibid_user_visit_logs` VALUES ('31', '2', '2', 'wap', '113.247.49.232', '2018-04-18 10:35:49', '1', '2018-04-18 10:35:49', '2018-04-18 10:35:49');
INSERT INTO `ibid_user_visit_logs` VALUES ('32', '2', '2', 'wap', '106.17.185.65', '2018-04-18 10:47:45', '1', '2018-04-18 10:47:45', '2018-04-18 10:47:45');
INSERT INTO `ibid_user_visit_logs` VALUES ('33', '2', '2', 'wap', '106.17.185.65', '2018-04-18 11:58:20', '1', '2018-04-18 11:58:20', '2018-04-18 11:58:20');
INSERT INTO `ibid_user_visit_logs` VALUES ('34', '2', '2', 'wap', '106.17.185.65', '2018-04-18 11:58:24', '1', '2018-04-18 11:58:24', '2018-04-18 11:58:24');
INSERT INTO `ibid_user_visit_logs` VALUES ('35', '2', '2', 'wap', '106.17.185.65', '2018-04-18 13:38:30', '1', '2018-04-18 13:38:30', '2018-04-18 13:38:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('36', '4', '4', 'wap', '106.17.185.65', '2018-04-18 13:39:08', '1', '2018-04-18 13:39:08', '2018-04-18 13:39:08');
INSERT INTO `ibid_user_visit_logs` VALUES ('37', '10', '10', 'wap', '43.250.201.125', '2018-04-18 13:52:55', '1', '2018-04-18 13:52:55', '2018-04-18 13:52:55');
INSERT INTO `ibid_user_visit_logs` VALUES ('38', '11', '11', 'wechat', '113.247.49.232', '2018-04-18 13:59:33', '1', '2018-04-18 13:59:33', '2018-04-18 13:59:33');
INSERT INTO `ibid_user_visit_logs` VALUES ('39', '11', '11', 'wechat', '113.247.49.232', '2018-04-18 14:00:32', '1', '2018-04-18 14:00:32', '2018-04-18 14:00:32');
INSERT INTO `ibid_user_visit_logs` VALUES ('40', '1', '1', 'app', '113.247.49.232', '2018-04-18 14:47:30', '1', '2018-04-18 14:47:30', '2018-04-18 14:47:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('41', '1', '1', 'app', '113.247.49.232', '2018-04-18 14:51:10', '1', '2018-04-18 14:51:10', '2018-04-18 14:51:10');
INSERT INTO `ibid_user_visit_logs` VALUES ('42', '1', '1', 'app', '113.247.49.232', '2018-04-18 14:54:35', '1', '2018-04-18 14:54:35', '2018-04-18 14:54:35');
INSERT INTO `ibid_user_visit_logs` VALUES ('43', '12', '12', 'app', '113.247.49.232', '2018-04-18 15:15:01', '1', '2018-04-18 15:15:02', '2018-04-18 15:15:02');
INSERT INTO `ibid_user_visit_logs` VALUES ('44', '12', '12', 'app', '113.247.49.232', '2018-04-18 15:15:29', '1', '2018-04-18 15:15:29', '2018-04-18 15:15:29');
INSERT INTO `ibid_user_visit_logs` VALUES ('45', '12', '12', 'app', '113.247.49.232', '2018-04-18 15:16:34', '1', '2018-04-18 15:16:34', '2018-04-18 15:16:34');
INSERT INTO `ibid_user_visit_logs` VALUES ('46', '1', '1', 'app', '113.247.49.232', '2018-04-18 15:19:49', '1', '2018-04-18 15:19:49', '2018-04-18 15:19:49');
INSERT INTO `ibid_user_visit_logs` VALUES ('47', '12', '12', 'pc', '113.247.49.232', '2018-04-18 15:22:19', '1', '2018-04-18 15:22:19', '2018-04-18 15:22:19');
INSERT INTO `ibid_user_visit_logs` VALUES ('48', '12', '12', 'pc', '113.247.49.232', '2018-04-18 15:23:41', '1', '2018-04-18 15:23:41', '2018-04-18 15:23:41');
INSERT INTO `ibid_user_visit_logs` VALUES ('49', '12', '12', 'pc', '113.247.49.232', '2018-04-18 15:23:44', '1', '2018-04-18 15:23:44', '2018-04-18 15:23:44');
INSERT INTO `ibid_user_visit_logs` VALUES ('50', '1', '1', 'app', '113.247.49.232', '2018-04-18 15:43:37', '1', '2018-04-18 15:43:37', '2018-04-18 15:43:37');
INSERT INTO `ibid_user_visit_logs` VALUES ('51', '1', '1', 'app', '113.247.49.232', '2018-04-18 15:45:16', '1', '2018-04-18 15:45:16', '2018-04-18 15:45:16');
INSERT INTO `ibid_user_visit_logs` VALUES ('52', '1', '1', 'app', '113.247.49.232', '2018-04-18 15:48:58', '1', '2018-04-18 15:48:58', '2018-04-18 15:48:58');
INSERT INTO `ibid_user_visit_logs` VALUES ('53', '13', '13', 'app', '113.247.49.232', '2018-04-18 15:50:30', '1', '2018-04-18 15:50:30', '2018-04-18 15:50:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('54', '13', '13', 'app', '113.247.49.232', '2018-04-18 15:56:21', '1', '2018-04-18 15:56:21', '2018-04-18 15:56:21');
INSERT INTO `ibid_user_visit_logs` VALUES ('55', '1', '1', 'app', '113.247.49.232', '2018-04-18 15:58:10', '1', '2018-04-18 15:58:10', '2018-04-18 15:58:10');
INSERT INTO `ibid_user_visit_logs` VALUES ('56', '1', '1', 'wap', '113.247.49.232', '2018-04-18 16:24:30', '1', '2018-04-18 16:24:30', '2018-04-18 16:24:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('57', '1', '1', 'wap', '113.247.49.232', '2018-04-18 21:05:36', '1', '2018-04-18 21:05:36', '2018-04-18 21:05:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('58', '3', '3', 'pc', '127.0.0.1', '2018-04-19 09:29:05', '1', '2018-04-19 09:29:05', '2018-04-19 09:29:05');
INSERT INTO `ibid_user_visit_logs` VALUES ('59', '3', '3', 'pc', '127.0.0.1', '2018-04-19 09:38:39', '1', '2018-04-19 09:38:39', '2018-04-19 09:38:39');
INSERT INTO `ibid_user_visit_logs` VALUES ('60', '14', '14', 'pc', '127.0.0.1', '2018-04-19 09:39:25', '1', '2018-04-19 09:39:25', '2018-04-19 09:39:25');
INSERT INTO `ibid_user_visit_logs` VALUES ('61', '2', '2', 'wap', '113.247.49.232', '2018-04-19 10:30:17', '1', '2018-04-19 10:30:17', '2018-04-19 10:30:17');
INSERT INTO `ibid_user_visit_logs` VALUES ('62', '2', '2', 'wap', '113.247.49.232', '2018-04-19 10:31:14', '1', '2018-04-19 10:31:14', '2018-04-19 10:31:14');
INSERT INTO `ibid_user_visit_logs` VALUES ('63', '2', '2', 'wap', '113.247.49.232', '2018-04-19 10:37:47', '1', '2018-04-19 10:37:47', '2018-04-19 10:37:47');
INSERT INTO `ibid_user_visit_logs` VALUES ('64', '11', '11', 'wechat', '113.247.49.232', '2018-04-19 10:57:06', '1', '2018-04-19 10:57:06', '2018-04-19 10:57:06');
INSERT INTO `ibid_user_visit_logs` VALUES ('65', '11', '11', 'wechat', '113.247.49.232', '2018-04-19 11:02:27', '1', '2018-04-19 11:02:27', '2018-04-19 11:02:27');
INSERT INTO `ibid_user_visit_logs` VALUES ('66', '1', '1', 'wap', '113.247.49.232', '2018-04-19 11:47:48', '1', '2018-04-19 11:47:48', '2018-04-19 11:47:48');
INSERT INTO `ibid_user_visit_logs` VALUES ('67', '2', '2', 'wap', '106.19.112.234', '2018-04-19 11:51:55', '1', '2018-04-19 11:51:55', '2018-04-19 11:51:55');
INSERT INTO `ibid_user_visit_logs` VALUES ('68', '15', '15', 'pc', '127.0.0.1', '2018-04-19 11:58:27', '1', '2018-04-19 11:58:27', '2018-04-19 11:58:27');
INSERT INTO `ibid_user_visit_logs` VALUES ('69', '3', '3', 'pc', '127.0.0.1', '2018-04-19 14:17:24', '1', '2018-04-19 14:17:24', '2018-04-19 14:17:24');
INSERT INTO `ibid_user_visit_logs` VALUES ('70', '3', '3', 'pc', '127.0.0.1', '2018-04-19 14:17:25', '1', '2018-04-19 14:17:25', '2018-04-19 14:17:25');
INSERT INTO `ibid_user_visit_logs` VALUES ('71', '3', '3', 'pc', '127.0.0.1', '2018-04-19 14:19:32', '1', '2018-04-19 14:19:33', '2018-04-19 14:19:33');
INSERT INTO `ibid_user_visit_logs` VALUES ('72', '1', '1', 'app', '175.8.204.108', '2018-04-19 14:48:17', '1', '2018-04-19 14:48:17', '2018-04-19 14:48:17');
INSERT INTO `ibid_user_visit_logs` VALUES ('73', '3', '3', 'wap', '175.8.204.108', '2018-04-19 15:47:51', '1', '2018-04-19 15:47:51', '2018-04-19 15:47:51');
INSERT INTO `ibid_user_visit_logs` VALUES ('74', '2', '2', 'wap', '106.17.180.192', '2018-04-19 15:57:26', '1', '2018-04-19 15:57:26', '2018-04-19 15:57:26');
INSERT INTO `ibid_user_visit_logs` VALUES ('75', '10', '10', 'wap', '220.202.152.4', '2018-04-19 15:59:30', '1', '2018-04-19 15:59:30', '2018-04-19 15:59:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('76', '10', '10', 'pc', '127.0.0.1', '2018-04-19 19:41:54', '1', '2018-04-19 19:41:54', '2018-04-19 19:41:54');
INSERT INTO `ibid_user_visit_logs` VALUES ('77', '16', '16', 'pc', '127.0.0.1', '2018-04-19 22:30:46', '1', '2018-04-19 22:30:46', '2018-04-19 22:30:46');
INSERT INTO `ibid_user_visit_logs` VALUES ('78', '17', '17', 'pc', '127.0.0.1', '2018-04-19 22:31:34', '1', '2018-04-19 22:31:34', '2018-04-19 22:31:34');
INSERT INTO `ibid_user_visit_logs` VALUES ('79', '18', '18', 'pc', '127.0.0.1', '2018-04-19 22:32:08', '1', '2018-04-19 22:32:08', '2018-04-19 22:32:08');
INSERT INTO `ibid_user_visit_logs` VALUES ('80', '19', '19', 'pc', '127.0.0.1', '2018-04-19 22:32:31', '1', '2018-04-19 22:32:31', '2018-04-19 22:32:31');
INSERT INTO `ibid_user_visit_logs` VALUES ('81', '15', '15', 'pc', '127.0.0.1', '2018-04-19 22:51:06', '1', '2018-04-19 22:51:06', '2018-04-19 22:51:06');
INSERT INTO `ibid_user_visit_logs` VALUES ('82', '15', '15', 'pc', '127.0.0.1', '2018-04-19 22:51:28', '1', '2018-04-19 22:51:28', '2018-04-19 22:51:28');
INSERT INTO `ibid_user_visit_logs` VALUES ('83', '15', '15', 'pc', '127.0.0.1', '2018-04-19 22:51:29', '1', '2018-04-19 22:51:29', '2018-04-19 22:51:29');
INSERT INTO `ibid_user_visit_logs` VALUES ('84', '15', '15', 'pc', '127.0.0.1', '2018-04-19 22:51:30', '1', '2018-04-19 22:51:30', '2018-04-19 22:51:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('85', '2', '2', 'wap', '106.19.71.220', '2018-04-20 09:04:50', '1', '2018-04-20 09:04:50', '2018-04-20 09:04:50');
INSERT INTO `ibid_user_visit_logs` VALUES ('86', '4', '4', 'wechat', '175.8.204.108', '2018-04-20 09:17:37', '1', '2018-04-20 09:17:37', '2018-04-20 09:17:37');
INSERT INTO `ibid_user_visit_logs` VALUES ('87', '10', '10', 'wap', '175.8.204.108', '2018-04-20 09:31:32', '1', '2018-04-20 09:31:32', '2018-04-20 09:31:32');
INSERT INTO `ibid_user_visit_logs` VALUES ('88', '3', '3', 'wap', '127.0.0.1', '2018-04-20 09:40:40', '1', '2018-04-20 09:40:40', '2018-04-20 09:40:40');
INSERT INTO `ibid_user_visit_logs` VALUES ('89', '4', '4', 'wap', '175.8.204.108', '2018-04-20 09:40:01', '1', '2018-04-20 09:40:01', '2018-04-20 09:40:01');
INSERT INTO `ibid_user_visit_logs` VALUES ('90', '20', '20', 'pc', '127.0.0.1', '2018-04-20 09:43:18', '1', '2018-04-20 09:43:19', '2018-04-20 09:43:19');
INSERT INTO `ibid_user_visit_logs` VALUES ('91', '16', '16', 'pc', '127.0.0.1', '2018-04-20 09:44:10', '1', '2018-04-20 09:44:10', '2018-04-20 09:44:10');
INSERT INTO `ibid_user_visit_logs` VALUES ('92', '2', '2', 'wap', '106.19.71.220', '2018-04-20 10:19:04', '1', '2018-04-20 10:19:04', '2018-04-20 10:19:04');
INSERT INTO `ibid_user_visit_logs` VALUES ('93', '2', '2', 'wap', '106.19.71.220', '2018-04-20 10:30:38', '1', '2018-04-20 10:30:38', '2018-04-20 10:30:38');
INSERT INTO `ibid_user_visit_logs` VALUES ('94', '9', '9', 'pc', '0.0.0.0', '2018-04-20 10:33:13', '1', '2018-04-20 10:33:13', '2018-04-20 10:33:13');
INSERT INTO `ibid_user_visit_logs` VALUES ('95', '1', '1', 'app', '175.8.204.108', '2018-04-20 11:51:55', '1', '2018-04-20 11:51:55', '2018-04-20 11:51:55');
INSERT INTO `ibid_user_visit_logs` VALUES ('96', '13', '13', 'app', '175.8.204.108', '2018-04-20 11:52:03', '1', '2018-04-20 11:52:03', '2018-04-20 11:52:03');
INSERT INTO `ibid_user_visit_logs` VALUES ('97', '2', '2', 'wap', '106.19.71.220', '2018-04-20 13:40:46', '1', '2018-04-20 13:40:46', '2018-04-20 13:40:46');
INSERT INTO `ibid_user_visit_logs` VALUES ('98', '9', '9', 'wechat', '223.104.21.10', '2018-04-20 13:57:19', '1', '2018-04-20 13:57:19', '2018-04-20 13:57:19');
INSERT INTO `ibid_user_visit_logs` VALUES ('99', '1', '1', 'wap', '175.8.204.108', '2018-04-20 14:02:44', '1', '2018-04-20 14:02:44', '2018-04-20 14:02:44');
INSERT INTO `ibid_user_visit_logs` VALUES ('100', '1', '1', 'pc', '175.8.204.108', '2018-04-20 14:10:29', '1', '2018-04-20 14:10:29', '2018-04-20 14:10:29');
INSERT INTO `ibid_user_visit_logs` VALUES ('101', '1', '1', 'pc', '175.8.204.108', '2018-04-20 14:10:30', '1', '2018-04-20 14:10:30', '2018-04-20 14:10:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('102', '9', '9', 'wap', '175.8.204.108', '2018-04-20 14:34:19', '1', '2018-04-20 14:34:19', '2018-04-20 14:34:19');
INSERT INTO `ibid_user_visit_logs` VALUES ('103', '2', '2', 'wap', '175.8.204.108', '2018-04-20 15:50:48', '1', '2018-04-20 15:50:48', '2018-04-20 15:50:48');
INSERT INTO `ibid_user_visit_logs` VALUES ('104', '10', '10', 'wap', '175.8.204.108', '2018-04-20 15:51:33', '1', '2018-04-20 15:51:33', '2018-04-20 15:51:33');
INSERT INTO `ibid_user_visit_logs` VALUES ('105', '3', '3', 'pc', '127.0.0.1', '2018-04-20 16:11:53', '1', '2018-04-20 16:11:53', '2018-04-20 16:11:53');
INSERT INTO `ibid_user_visit_logs` VALUES ('106', '2', '2', 'app', '175.8.204.108', '2018-04-20 16:49:53', '1', '2018-04-20 16:49:53', '2018-04-20 16:49:53');
INSERT INTO `ibid_user_visit_logs` VALUES ('107', '2', '2', 'app', '175.8.204.108', '2018-04-20 17:30:55', '1', '2018-04-20 17:30:55', '2018-04-20 17:30:55');
INSERT INTO `ibid_user_visit_logs` VALUES ('108', '1', '1', 'app', '175.8.204.108', '2018-04-20 18:01:31', '1', '2018-04-20 18:01:31', '2018-04-20 18:01:31');
INSERT INTO `ibid_user_visit_logs` VALUES ('109', '1', '1', 'app', '175.8.204.108', '2018-04-20 18:01:50', '1', '2018-04-20 18:01:50', '2018-04-20 18:01:50');
INSERT INTO `ibid_user_visit_logs` VALUES ('110', '9', '9', 'pc', '192.168.1.129', '2018-04-20 18:12:37', '1', '2018-04-20 18:12:37', '2018-04-20 18:12:37');
INSERT INTO `ibid_user_visit_logs` VALUES ('111', '9', '9', 'pc', '192.168.1.129', '2018-04-20 18:12:39', '1', '2018-04-20 18:12:39', '2018-04-20 18:12:39');
INSERT INTO `ibid_user_visit_logs` VALUES ('112', '10', '10', 'wap', '36.157.214.127', '2018-04-20 19:59:30', '1', '2018-04-20 19:59:30', '2018-04-20 19:59:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('113', '10', '10', 'pc', '175.8.204.108', '2018-04-21 08:57:41', '1', '2018-04-21 08:57:41', '2018-04-21 08:57:41');
INSERT INTO `ibid_user_visit_logs` VALUES ('114', '1', '1', 'app', '175.8.204.108', '2018-04-21 09:05:12', '1', '2018-04-21 09:05:12', '2018-04-21 09:05:12');
INSERT INTO `ibid_user_visit_logs` VALUES ('115', '10', '10', 'pc', '127.0.0.1', '2018-04-21 09:15:40', '1', '2018-04-21 09:15:41', '2018-04-21 09:15:41');
INSERT INTO `ibid_user_visit_logs` VALUES ('116', '2', '2', 'wap', '175.8.204.108', '2018-04-21 09:11:45', '1', '2018-04-21 09:11:45', '2018-04-21 09:11:45');
INSERT INTO `ibid_user_visit_logs` VALUES ('117', '2', '2', 'wap', '175.8.204.108', '2018-04-21 09:30:20', '1', '2018-04-21 09:30:20', '2018-04-21 09:30:20');
INSERT INTO `ibid_user_visit_logs` VALUES ('118', '2', '2', 'wap', '175.8.204.108', '2018-04-21 09:33:24', '1', '2018-04-21 09:33:24', '2018-04-21 09:33:24');
INSERT INTO `ibid_user_visit_logs` VALUES ('119', '10', '10', 'pc', '127.0.0.1', '2018-04-21 09:48:51', '1', '2018-04-21 09:48:51', '2018-04-21 09:48:51');
INSERT INTO `ibid_user_visit_logs` VALUES ('120', '1', '1', 'app', '175.8.204.108', '2018-04-21 09:50:06', '1', '2018-04-21 09:50:06', '2018-04-21 09:50:06');
INSERT INTO `ibid_user_visit_logs` VALUES ('121', '10', '10', 'wap', '175.8.204.108', '2018-04-21 10:36:04', '1', '2018-04-21 10:36:04', '2018-04-21 10:36:04');
INSERT INTO `ibid_user_visit_logs` VALUES ('122', '2', '2', 'app', '175.8.204.108', '2018-04-21 10:47:56', '1', '2018-04-21 10:47:56', '2018-04-21 10:47:56');
INSERT INTO `ibid_user_visit_logs` VALUES ('123', '10', '10', 'wap', '175.8.204.108', '2018-04-21 11:42:51', '1', '2018-04-21 11:42:51', '2018-04-21 11:42:51');
INSERT INTO `ibid_user_visit_logs` VALUES ('124', '2', '2', 'wap', '175.8.204.108', '2018-04-21 11:52:33', '1', '2018-04-21 11:52:33', '2018-04-21 11:52:33');
INSERT INTO `ibid_user_visit_logs` VALUES ('125', '3', '3', 'wap', '127.0.0.1', '2018-04-21 11:54:55', '1', '2018-04-21 11:54:55', '2018-04-21 11:54:55');
INSERT INTO `ibid_user_visit_logs` VALUES ('126', '10', '10', 'pc', '127.0.0.1', '2018-04-21 14:23:16', '1', '2018-04-21 14:23:16', '2018-04-21 14:23:16');
INSERT INTO `ibid_user_visit_logs` VALUES ('127', '9', '9', 'wechat', '223.104.21.27', '2018-04-21 14:45:21', '1', '2018-04-21 14:45:21', '2018-04-21 14:45:21');
INSERT INTO `ibid_user_visit_logs` VALUES ('128', '10', '10', 'pc', '127.0.0.1', '2018-04-21 15:10:05', '1', '2018-04-21 15:10:05', '2018-04-21 15:10:05');
INSERT INTO `ibid_user_visit_logs` VALUES ('129', '9', '9', 'pc', '175.8.207.160', '2018-04-21 15:54:05', '1', '2018-04-21 15:54:05', '2018-04-21 15:54:05');
INSERT INTO `ibid_user_visit_logs` VALUES ('130', '10', '10', 'wap', '175.8.207.160', '2018-04-21 15:59:42', '1', '2018-04-21 15:59:42', '2018-04-21 15:59:42');
INSERT INTO `ibid_user_visit_logs` VALUES ('131', '13', '13', 'app', '175.8.207.160', '2018-04-21 16:45:37', '1', '2018-04-21 16:45:37', '2018-04-21 16:45:37');
INSERT INTO `ibid_user_visit_logs` VALUES ('132', '13', '13', 'app', '175.8.207.160', '2018-04-21 16:45:47', '1', '2018-04-21 16:45:47', '2018-04-21 16:45:47');
INSERT INTO `ibid_user_visit_logs` VALUES ('133', '1', '1', 'app', '175.8.207.160', '2018-04-21 16:59:34', '1', '2018-04-21 16:59:34', '2018-04-21 16:59:34');
INSERT INTO `ibid_user_visit_logs` VALUES ('134', '1', '1', 'app', '175.8.207.160', '2018-04-21 17:00:49', '1', '2018-04-21 17:00:49', '2018-04-21 17:00:49');
INSERT INTO `ibid_user_visit_logs` VALUES ('135', '1', '1', 'app', '106.17.11.69', '2018-04-21 17:01:14', '1', '2018-04-21 17:01:14', '2018-04-21 17:01:14');
INSERT INTO `ibid_user_visit_logs` VALUES ('136', '10', '10', 'wap', '175.8.207.160', '2018-04-21 17:59:13', '1', '2018-04-21 17:59:13', '2018-04-21 17:59:13');
INSERT INTO `ibid_user_visit_logs` VALUES ('137', '10', '10', 'pc', '175.8.207.160', '2018-04-21 18:48:42', '1', '2018-04-21 18:48:42', '2018-04-21 18:48:42');
INSERT INTO `ibid_user_visit_logs` VALUES ('138', '9', '9', 'wap', '175.8.207.160', '2018-04-21 19:56:26', '1', '2018-04-21 19:56:26', '2018-04-21 19:56:26');
INSERT INTO `ibid_user_visit_logs` VALUES ('139', '9', '9', 'wap', '223.104.21.27', '2018-04-21 19:57:37', '1', '2018-04-21 19:57:37', '2018-04-21 19:57:37');
INSERT INTO `ibid_user_visit_logs` VALUES ('140', '13', '13', 'wap', '175.8.207.160', '2018-04-21 20:00:58', '1', '2018-04-21 20:00:58', '2018-04-21 20:00:58');
INSERT INTO `ibid_user_visit_logs` VALUES ('141', '3', '3', 'pc', '127.0.0.1', '2018-04-21 20:04:35', '1', '2018-04-21 20:04:35', '2018-04-21 20:04:35');
INSERT INTO `ibid_user_visit_logs` VALUES ('142', '13', '13', 'wechat', '117.136.89.90', '2018-04-21 20:04:02', '1', '2018-04-21 20:04:02', '2018-04-21 20:04:02');
INSERT INTO `ibid_user_visit_logs` VALUES ('143', '9', '9', 'wechat', '175.8.207.160', '2018-04-21 20:06:16', '1', '2018-04-21 20:06:16', '2018-04-21 20:06:16');
INSERT INTO `ibid_user_visit_logs` VALUES ('144', '15', '15', 'pc', '127.0.0.1', '2018-04-21 20:28:39', '1', '2018-04-21 20:28:39', '2018-04-21 20:28:39');
INSERT INTO `ibid_user_visit_logs` VALUES ('145', '1', '1', 'wechat', '117.136.89.90', '2018-04-21 20:32:00', '1', '2018-04-21 20:32:00', '2018-04-21 20:32:00');
INSERT INTO `ibid_user_visit_logs` VALUES ('146', '9', '9', 'pc', '175.8.207.160', '2018-04-21 20:45:54', '1', '2018-04-21 20:45:54', '2018-04-21 20:45:54');
INSERT INTO `ibid_user_visit_logs` VALUES ('147', '3', '3', 'wap', '222.240.234.78', '2018-04-21 22:58:36', '1', '2018-04-21 22:58:36', '2018-04-21 22:58:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('148', '3', '3', 'pc', '127.0.0.1', '2018-04-21 23:17:23', '1', '2018-04-21 23:17:23', '2018-04-21 23:17:23');
INSERT INTO `ibid_user_visit_logs` VALUES ('149', '3', '3', 'pc', '127.0.0.1', '2018-04-21 23:17:32', '1', '2018-04-21 23:17:32', '2018-04-21 23:17:32');
INSERT INTO `ibid_user_visit_logs` VALUES ('150', '3', '3', 'pc', '127.0.0.1', '2018-04-21 23:19:04', '1', '2018-04-21 23:19:04', '2018-04-21 23:19:04');
INSERT INTO `ibid_user_visit_logs` VALUES ('151', '3', '3', 'pc', '127.0.0.1', '2018-04-21 23:21:36', '1', '2018-04-21 23:21:36', '2018-04-21 23:21:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('152', '3', '3', 'wap', '222.240.234.78', '2018-04-21 23:31:44', '1', '2018-04-21 23:31:44', '2018-04-21 23:31:44');
INSERT INTO `ibid_user_visit_logs` VALUES ('153', '3', '3', 'pc', '222.240.234.78', '2018-04-21 23:33:30', '1', '2018-04-21 23:33:30', '2018-04-21 23:33:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('154', '3', '3', 'pc', '222.240.234.78', '2018-04-21 23:33:46', '1', '2018-04-21 23:33:46', '2018-04-21 23:33:46');
INSERT INTO `ibid_user_visit_logs` VALUES ('155', '3', '3', 'pc', '222.240.234.78', '2018-04-21 23:34:41', '1', '2018-04-21 23:34:41', '2018-04-21 23:34:41');
INSERT INTO `ibid_user_visit_logs` VALUES ('156', '3', '3', 'pc', '222.240.234.78', '2018-04-21 23:35:42', '1', '2018-04-21 23:35:42', '2018-04-21 23:35:42');
INSERT INTO `ibid_user_visit_logs` VALUES ('157', '1', '1', 'wap', '175.8.207.160', '2018-04-22 10:35:04', '1', '2018-04-22 10:35:04', '2018-04-22 10:35:04');
INSERT INTO `ibid_user_visit_logs` VALUES ('158', '1', '1', 'app', '175.8.207.160', '2018-04-22 11:44:03', '1', '2018-04-22 11:44:03', '2018-04-22 11:44:03');
INSERT INTO `ibid_user_visit_logs` VALUES ('159', '1', '1', 'app', '175.8.207.160', '2018-04-22 11:55:12', '1', '2018-04-22 11:55:12', '2018-04-22 11:55:12');
INSERT INTO `ibid_user_visit_logs` VALUES ('160', '15', '15', 'pc', '127.0.0.1', '2018-04-22 20:25:30', '1', '2018-04-22 20:25:30', '2018-04-22 20:25:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('161', '15', '15', 'pc', '127.0.0.1', '2018-04-22 20:25:32', '1', '2018-04-22 20:25:32', '2018-04-22 20:25:32');
INSERT INTO `ibid_user_visit_logs` VALUES ('162', '15', '15', 'wap', '127.0.0.1', '2018-04-22 20:40:36', '1', '2018-04-22 20:40:36', '2018-04-22 20:40:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('163', '3', '3', 'pc', '222.240.234.78', '2018-04-22 21:45:32', '1', '2018-04-22 21:45:32', '2018-04-22 21:45:32');
INSERT INTO `ibid_user_visit_logs` VALUES ('164', '3', '3', 'pc', '222.240.234.78', '2018-04-22 21:54:21', '1', '2018-04-22 21:54:21', '2018-04-22 21:54:21');
INSERT INTO `ibid_user_visit_logs` VALUES ('165', '3', '3', 'pc', '222.240.234.78', '2018-04-22 21:54:27', '1', '2018-04-22 21:54:27', '2018-04-22 21:54:27');
INSERT INTO `ibid_user_visit_logs` VALUES ('166', '3', '3', 'pc', '222.240.234.78', '2018-04-22 21:54:32', '1', '2018-04-22 21:54:32', '2018-04-22 21:54:32');
INSERT INTO `ibid_user_visit_logs` VALUES ('167', '9', '9', 'pc', '175.8.207.160', '2018-04-23 09:04:41', '1', '2018-04-23 09:04:41', '2018-04-23 09:04:41');
INSERT INTO `ibid_user_visit_logs` VALUES ('168', '3', '3', 'pc', '127.0.0.1', '2018-04-23 09:38:11', '1', '2018-04-23 09:38:11', '2018-04-23 09:38:11');
INSERT INTO `ibid_user_visit_logs` VALUES ('169', '1', '1', 'app', '106.19.38.238', '2018-04-23 09:38:57', '1', '2018-04-23 09:38:57', '2018-04-23 09:38:57');
INSERT INTO `ibid_user_visit_logs` VALUES ('170', '2', '2', 'app', '175.8.207.160', '2018-04-23 09:41:15', '1', '2018-04-23 09:41:15', '2018-04-23 09:41:15');
INSERT INTO `ibid_user_visit_logs` VALUES ('171', '10', '10', 'pc', '127.0.0.1', '2018-04-23 09:43:25', '1', '2018-04-23 09:43:25', '2018-04-23 09:43:25');
INSERT INTO `ibid_user_visit_logs` VALUES ('172', '10', '10', 'pc', '127.0.0.1', '2018-04-23 09:47:56', '1', '2018-04-23 09:47:56', '2018-04-23 09:47:56');
INSERT INTO `ibid_user_visit_logs` VALUES ('173', '10', '10', 'wap', '127.0.0.1', '2018-04-23 10:13:45', '1', '2018-04-23 10:13:45', '2018-04-23 10:13:45');
INSERT INTO `ibid_user_visit_logs` VALUES ('174', '10', '10', 'pc', '127.0.0.1', '2018-04-23 10:28:08', '1', '2018-04-23 10:28:08', '2018-04-23 10:28:08');
INSERT INTO `ibid_user_visit_logs` VALUES ('175', '14', '14', 'wap', '175.8.207.160', '2018-04-23 10:56:12', '1', '2018-04-23 10:56:12', '2018-04-23 10:56:12');
INSERT INTO `ibid_user_visit_logs` VALUES ('176', '3', '3', 'wap', '175.8.207.160', '2018-04-23 10:57:05', '1', '2018-04-23 10:57:05', '2018-04-23 10:57:05');
INSERT INTO `ibid_user_visit_logs` VALUES ('177', '9', '9', 'wechat', '175.8.207.160', '2018-04-23 11:03:54', '1', '2018-04-23 11:03:54', '2018-04-23 11:03:54');
INSERT INTO `ibid_user_visit_logs` VALUES ('178', '10', '10', 'pc', '175.8.207.160', '2018-04-23 11:57:15', '1', '2018-04-23 11:57:15', '2018-04-23 11:57:15');
INSERT INTO `ibid_user_visit_logs` VALUES ('179', '10', '10', 'wap', '175.8.207.160', '2018-04-23 11:58:52', '1', '2018-04-23 11:58:52', '2018-04-23 11:58:52');
INSERT INTO `ibid_user_visit_logs` VALUES ('180', '10', '10', 'pc', '113.247.12.81', '2018-04-23 13:45:58', '1', '2018-04-23 13:45:58', '2018-04-23 13:45:58');
INSERT INTO `ibid_user_visit_logs` VALUES ('181', '1', '1', 'wap', '113.247.12.81', '2018-04-23 13:51:50', '1', '2018-04-23 13:51:50', '2018-04-23 13:51:50');
INSERT INTO `ibid_user_visit_logs` VALUES ('182', '1', '1', 'wap', '113.247.12.81', '2018-04-23 13:57:32', '1', '2018-04-23 13:57:32', '2018-04-23 13:57:32');
INSERT INTO `ibid_user_visit_logs` VALUES ('183', '10', '10', 'wap', '113.247.12.81', '2018-04-23 14:19:15', '1', '2018-04-23 14:19:15', '2018-04-23 14:19:15');
INSERT INTO `ibid_user_visit_logs` VALUES ('184', '1', '1', 'app', '106.19.102.173', '2018-04-23 14:55:19', '1', '2018-04-23 14:55:19', '2018-04-23 14:55:19');
INSERT INTO `ibid_user_visit_logs` VALUES ('185', '2', '2', 'app', '113.247.12.81', '2018-04-23 15:06:03', '1', '2018-04-23 15:06:03', '2018-04-23 15:06:03');
INSERT INTO `ibid_user_visit_logs` VALUES ('186', '1', '1', 'app', '113.247.12.81', '2018-04-23 15:11:47', '1', '2018-04-23 15:11:47', '2018-04-23 15:11:47');
INSERT INTO `ibid_user_visit_logs` VALUES ('187', '1', '1', 'app', '113.247.12.81', '2018-04-23 15:29:28', '1', '2018-04-23 15:29:28', '2018-04-23 15:29:28');
INSERT INTO `ibid_user_visit_logs` VALUES ('188', '1', '1', 'app', '113.247.12.81', '2018-04-23 15:29:38', '1', '2018-04-23 15:29:38', '2018-04-23 15:29:38');
INSERT INTO `ibid_user_visit_logs` VALUES ('189', '2', '2', 'app', '113.247.12.81', '2018-04-23 15:30:18', '1', '2018-04-23 15:30:18', '2018-04-23 15:30:18');
INSERT INTO `ibid_user_visit_logs` VALUES ('190', '3', '3', 'wap', '113.247.12.81', '2018-04-23 15:38:29', '1', '2018-04-23 15:38:29', '2018-04-23 15:38:29');
INSERT INTO `ibid_user_visit_logs` VALUES ('191', '1', '1', 'app', '113.247.12.81', '2018-04-23 15:39:37', '1', '2018-04-23 15:39:37', '2018-04-23 15:39:37');
INSERT INTO `ibid_user_visit_logs` VALUES ('192', '2', '2', 'app', '113.247.12.81', '2018-04-23 15:42:28', '1', '2018-04-23 15:42:28', '2018-04-23 15:42:28');
INSERT INTO `ibid_user_visit_logs` VALUES ('193', '1', '1', 'app', '113.247.12.81', '2018-04-23 15:55:28', '1', '2018-04-23 15:55:28', '2018-04-23 15:55:28');
INSERT INTO `ibid_user_visit_logs` VALUES ('194', '2', '2', 'app', '113.247.12.81', '2018-04-23 15:56:38', '1', '2018-04-23 15:56:38', '2018-04-23 15:56:38');
INSERT INTO `ibid_user_visit_logs` VALUES ('195', '1', '1', 'app', '113.247.12.81', '2018-04-23 16:42:19', '1', '2018-04-23 16:42:19', '2018-04-23 16:42:19');
INSERT INTO `ibid_user_visit_logs` VALUES ('196', '15', '15', 'pc', '127.0.0.1', '2018-04-23 16:59:40', '1', '2018-04-23 16:59:40', '2018-04-23 16:59:40');
INSERT INTO `ibid_user_visit_logs` VALUES ('197', '21', '21', 'app', '113.247.12.81', '2018-04-23 17:00:39', '1', '2018-04-23 17:00:39', '2018-04-23 17:00:39');
INSERT INTO `ibid_user_visit_logs` VALUES ('198', '2', '2', 'app', '113.247.12.81', '2018-04-23 17:01:28', '1', '2018-04-23 17:01:28', '2018-04-23 17:01:28');
INSERT INTO `ibid_user_visit_logs` VALUES ('199', '21', '21', 'app', '113.247.12.81', '2018-04-23 17:02:38', '1', '2018-04-23 17:02:38', '2018-04-23 17:02:38');
INSERT INTO `ibid_user_visit_logs` VALUES ('200', '2', '2', 'wap', '113.247.12.81', '2018-04-23 17:13:36', '1', '2018-04-23 17:13:36', '2018-04-23 17:13:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('201', '2', '2', 'app', '113.247.12.81', '2018-04-23 17:21:36', '1', '2018-04-23 17:21:36', '2018-04-23 17:21:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('202', '1', '1', 'app', '113.247.12.81', '2018-04-23 17:54:21', '1', '2018-04-23 17:54:21', '2018-04-23 17:54:21');
INSERT INTO `ibid_user_visit_logs` VALUES ('203', '1', '1', 'app', '113.247.12.81', '2018-04-23 17:54:39', '1', '2018-04-23 17:54:39', '2018-04-23 17:54:39');
INSERT INTO `ibid_user_visit_logs` VALUES ('204', '2', '2', 'app', '113.247.12.81', '2018-04-23 18:02:36', '1', '2018-04-23 18:02:36', '2018-04-23 18:02:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('205', '9', '9', 'pc', '119.39.248.57', '2018-04-24 00:00:48', '1', '2018-04-24 00:00:48', '2018-04-24 00:00:48');
INSERT INTO `ibid_user_visit_logs` VALUES ('206', '10', '10', 'pc', '127.0.0.1', '2018-04-24 09:33:07', '1', '2018-04-24 09:33:07', '2018-04-24 09:33:07');
INSERT INTO `ibid_user_visit_logs` VALUES ('207', '9', '9', 'pc', '113.247.12.81', '2018-04-24 09:34:54', '1', '2018-04-24 09:34:54', '2018-04-24 09:34:54');
INSERT INTO `ibid_user_visit_logs` VALUES ('208', '10', '10', 'pc', '127.0.0.1', '2018-04-24 09:44:48', '1', '2018-04-24 09:44:48', '2018-04-24 09:44:48');
INSERT INTO `ibid_user_visit_logs` VALUES ('209', '2', '2', 'wap', '113.247.12.81', '2018-04-24 10:04:26', '1', '2018-04-24 10:04:26', '2018-04-24 10:04:26');
INSERT INTO `ibid_user_visit_logs` VALUES ('210', '1', '1', 'app', '113.247.12.81', '2018-04-24 10:20:27', '1', '2018-04-24 10:20:27', '2018-04-24 10:20:27');
INSERT INTO `ibid_user_visit_logs` VALUES ('211', '1', '1', 'app', '113.247.12.81', '2018-04-24 10:31:37', '1', '2018-04-24 10:31:37', '2018-04-24 10:31:37');
INSERT INTO `ibid_user_visit_logs` VALUES ('212', '3', '3', 'app', '113.247.12.81', '2018-04-24 10:36:43', '1', '2018-04-24 10:36:43', '2018-04-24 10:36:43');
INSERT INTO `ibid_user_visit_logs` VALUES ('213', '1', '1', 'app', '113.246.200.32', '2018-04-24 11:46:44', '1', '2018-04-24 11:46:44', '2018-04-24 11:46:44');
INSERT INTO `ibid_user_visit_logs` VALUES ('214', '1', '1', 'app', '113.246.200.32', '2018-04-24 11:55:40', '1', '2018-04-24 11:55:40', '2018-04-24 11:55:40');
INSERT INTO `ibid_user_visit_logs` VALUES ('215', '15', '15', 'pc', '127.0.0.1', '2018-04-24 12:01:47', '1', '2018-04-24 12:01:48', '2018-04-24 12:01:48');
INSERT INTO `ibid_user_visit_logs` VALUES ('216', '9', '9', 'pc', '113.246.200.32', '2018-04-24 13:38:15', '1', '2018-04-24 13:38:15', '2018-04-24 13:38:15');
INSERT INTO `ibid_user_visit_logs` VALUES ('217', '2', '2', 'app', '113.246.200.32', '2018-04-24 13:57:47', '1', '2018-04-24 13:57:47', '2018-04-24 13:57:47');
INSERT INTO `ibid_user_visit_logs` VALUES ('218', '1', '1', 'app', '113.246.200.32', '2018-04-24 14:00:36', '1', '2018-04-24 14:00:36', '2018-04-24 14:00:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('219', '3', '3', 'pc', '127.0.0.1', '2018-04-24 14:09:56', '1', '2018-04-24 14:09:56', '2018-04-24 14:09:56');
INSERT INTO `ibid_user_visit_logs` VALUES ('220', '2', '2', 'app', '113.246.200.32', '2018-04-24 14:28:56', '1', '2018-04-24 14:28:56', '2018-04-24 14:28:56');
INSERT INTO `ibid_user_visit_logs` VALUES ('221', '10', '10', 'pc', '113.246.200.32', '2018-04-24 14:45:21', '1', '2018-04-24 14:45:21', '2018-04-24 14:45:21');
INSERT INTO `ibid_user_visit_logs` VALUES ('222', '10', '10', 'wap', '113.246.200.32', '2018-04-24 15:39:14', '1', '2018-04-24 15:39:14', '2018-04-24 15:39:14');
INSERT INTO `ibid_user_visit_logs` VALUES ('223', '1', '1', 'wap', '113.246.200.32', '2018-04-24 15:43:34', '1', '2018-04-24 15:43:34', '2018-04-24 15:43:34');
INSERT INTO `ibid_user_visit_logs` VALUES ('224', '9', '9', 'pc', '113.246.200.32', '2018-04-24 16:14:13', '1', '2018-04-24 16:14:13', '2018-04-24 16:14:13');
INSERT INTO `ibid_user_visit_logs` VALUES ('225', '9', '9', 'pc', '113.246.200.32', '2018-04-24 16:14:13', '1', '2018-04-24 16:14:13', '2018-04-24 16:14:13');
INSERT INTO `ibid_user_visit_logs` VALUES ('226', '10', '10', 'pc', '113.246.200.32', '2018-04-24 16:17:36', '1', '2018-04-24 16:17:36', '2018-04-24 16:17:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('227', '10', '10', 'wap', '113.246.200.32', '2018-04-24 16:17:51', '1', '2018-04-24 16:17:51', '2018-04-24 16:17:51');
INSERT INTO `ibid_user_visit_logs` VALUES ('228', '10', '10', 'pc', '113.246.200.32', '2018-04-24 16:33:34', '1', '2018-04-24 16:33:34', '2018-04-24 16:33:34');
INSERT INTO `ibid_user_visit_logs` VALUES ('229', '2', '2', 'app', '106.17.230.70', '2018-04-24 16:45:52', '1', '2018-04-24 16:45:52', '2018-04-24 16:45:52');
INSERT INTO `ibid_user_visit_logs` VALUES ('230', '2', '2', 'app', '106.17.230.70', '2018-04-24 16:47:19', '1', '2018-04-24 16:47:19', '2018-04-24 16:47:19');
INSERT INTO `ibid_user_visit_logs` VALUES ('231', '10', '10', 'pc', '36.157.214.127', '2018-04-24 21:04:57', '1', '2018-04-24 21:04:57', '2018-04-24 21:04:57');
INSERT INTO `ibid_user_visit_logs` VALUES ('232', '9', '9', 'pc', '113.246.200.32', '2018-04-24 23:29:30', '1', '2018-04-24 23:29:30', '2018-04-24 23:29:30');
INSERT INTO `ibid_user_visit_logs` VALUES ('233', '9', '9', 'pc', '113.246.200.32', '2018-04-24 23:38:35', '1', '2018-04-24 23:38:35', '2018-04-24 23:38:35');
INSERT INTO `ibid_user_visit_logs` VALUES ('234', '1', '1', 'wap', '113.246.200.32', '2018-04-25 00:04:36', '1', '2018-04-25 00:04:36', '2018-04-25 00:04:36');
INSERT INTO `ibid_user_visit_logs` VALUES ('235', '22', '22', 'app', '113.246.200.32', '2018-04-25 08:21:14', '1', '2018-04-25 08:21:14', '2018-04-25 08:21:14');
INSERT INTO `ibid_user_visit_logs` VALUES ('236', '22', '22', 'wap', '113.246.200.32', '2018-04-25 08:24:11', '1', '2018-04-25 08:24:11', '2018-04-25 08:24:11');
INSERT INTO `ibid_user_visit_logs` VALUES ('237', '1', '1', 'app', '113.246.200.32', '2018-04-25 09:01:57', '1', '2018-04-25 09:01:57', '2018-04-25 09:01:57');
INSERT INTO `ibid_user_visit_logs` VALUES ('238', '9', '9', 'pc', '113.246.200.32', '2018-04-25 09:11:22', '1', '2018-04-25 09:11:22', '2018-04-25 09:11:22');

-- -----------------------------
-- Table structure for `ibid_users`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_users`;
CREATE TABLE `ibid_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL COMMENT '用户手机号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `gender` tinyint(1) DEFAULT '0' COMMENT '性别：0保密1男2女',
  `telephone` varchar(20) DEFAULT NULL COMMENT '用户联系电话',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq号',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信号',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `memo` text COMMENT '备注',
  `role_ids` text COMMENT '角色IDs',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态：1正常9黑名单',
  `data_state` tinyint(1) DEFAULT '1' COMMENT '数据状态：0假删除1正常',
  `create_time` datetime NOT NULL COMMENT '数据创建时间',
  `update_time` datetime NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_users`
-- -----------------------------
INSERT INTO `ibid_users` VALUES ('1', '18888888888', '', '咯 out', '', '1', '', '', '', '', '', '\"\"', '1', '1', '2018-04-17 15:58:46', '2018-04-23 17:54:36');
INSERT INTO `ibid_users` VALUES ('2', '15802577957', '', '嘿你的', '/public/upload/images/1524539353326.jpg', '1', '', '', '', '', '', '\"\"', '1', '1', '2018-04-17 16:14:28', '2018-04-24 16:47:13');
INSERT INTO `ibid_users` VALUES ('3', '15580841403', '', '易云', '/public/upload/images/1523959708413.jpg', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-17 18:08:00', '2018-04-18 09:34:27');
INSERT INTO `ibid_users` VALUES ('4', '15802577957', '', '记日记', '/public/upload/images/1524014029235.jpg', '2', '', '', '', '', '', '\"\"', '1', '0', '2018-04-18 09:10:30', '2018-04-24 16:45:31');
INSERT INTO `ibid_users` VALUES ('5', '13170308670', '', '', '/public/upload/images/1524014227333.jpg', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-18 09:14:16', '2018-04-18 09:34:27');
INSERT INTO `ibid_users` VALUES ('6', '15111463656', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-18 09:34:43', '2018-04-18 09:37:26');
INSERT INTO `ibid_users` VALUES ('7', '18112344321', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '0', '2018-04-18 09:38:47', '2018-04-18 09:53:05');
INSERT INTO `ibid_users` VALUES ('8', '18390916324', '', '韩梅梅', '/public/upload/images/1524017342599.jpg', '0', '', '', '', '', '', '\"\"', '1', '0', '2018-04-18 10:08:34', '2018-04-18 13:58:41');
INSERT INTO `ibid_users` VALUES ('9', '13574849891', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-18 10:16:12', '2018-04-18 10:16:12');
INSERT INTO `ibid_users` VALUES ('10', '17670745968', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-18 13:52:55', '2018-04-18 13:52:55');
INSERT INTO `ibid_users` VALUES ('11', '18390916324', '', '韩梅梅', '/public/upload/images/1524031338510.jpg', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-18 13:59:33', '2018-04-18 14:02:27');
INSERT INTO `ibid_users` VALUES ('12', '18399999999', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-18 15:15:01', '2018-04-18 15:15:01');
INSERT INTO `ibid_users` VALUES ('13', '18788888888', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-18 15:50:30', '2018-04-21 20:30:57');
INSERT INTO `ibid_users` VALUES ('14', '15580841409', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-19 09:39:25', '2018-04-19 09:39:25');
INSERT INTO `ibid_users` VALUES ('15', '17621502221', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-19 11:58:27', '2018-04-19 11:58:27');
INSERT INTO `ibid_users` VALUES ('16', '17621502222', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-19 22:30:46', '2018-04-19 22:30:46');
INSERT INTO `ibid_users` VALUES ('17', '17621502223', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-19 22:31:34', '2018-04-19 22:31:34');
INSERT INTO `ibid_users` VALUES ('18', '17621503333', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-19 22:32:08', '2018-04-19 22:32:08');
INSERT INTO `ibid_users` VALUES ('19', '17621506666', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-19 22:32:31', '2018-04-19 22:32:31');
INSERT INTO `ibid_users` VALUES ('20', '17621502224', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-20 09:43:18', '2018-04-20 09:43:18');
INSERT INTO `ibid_users` VALUES ('21', '15274901730', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-23 17:00:39', '2018-04-23 17:00:39');
INSERT INTO `ibid_users` VALUES ('22', '15500000000', '', '', '', '0', '', '', '', '', '', '\"\"', '1', '1', '2018-04-25 08:21:14', '2018-04-25 08:21:14');

-- -----------------------------
-- Table structure for `ibid_wechat`
-- -----------------------------
DROP TABLE IF EXISTS `ibid_wechat`;
CREATE TABLE `ibid_wechat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jsapi_ticket` text,
  `last_ticket_time` int(11) DEFAULT NULL,
  `access_token` text,
  `last_token_time` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ibid_wechat`
-- -----------------------------
INSERT INTO `ibid_wechat` VALUES ('1', 'sM4AOVdWfPE4DxkXGEs8VATrVRgaBnIuWF9DKdkYdvG5RtAQ_W7lM_stcGbuEYWMjQFTCIPO-DT0kQLEQmWDpw', '1520349729', '7_D6xharWLxLie9YHAhvhquD5_kV4a1oZ2iFlmYLiqagCm-nDP6BUJKdBZzEuAub-3gHaDRgWaDi5eRwqnJNlSqt1OSRx3OmMODi2aiBIT8dedKoV448ZXJW-rjW8AYMeAEAOMA', '1520349698', '2018-03-05 16:13:53');
