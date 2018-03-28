/*
Navicat MySQL Data Transfer

Source Server         : wqimc-web
Source Server Version : 50717
Source Host           : localhost:3380
Source Database       : niangzi

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-28 16:14:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL COMMENT '收支类型：1 支出 2 收入 ',
  `money` double DEFAULT NULL COMMENT '金额',
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account
-- ----------------------------

-- ----------------------------
-- Table structure for `t_desk`
-- ----------------------------
DROP TABLE IF EXISTS `t_desk`;
CREATE TABLE `t_desk` (
  `id` bigint(20) NOT NULL,
  `number` varchar(10) DEFAULT NULL,
  `code` varchar(1000) DEFAULT NULL,
  `merchant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`merchant_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`merchant_id`) REFERENCES `t_merchant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='桌子表';

-- ----------------------------
-- Records of t_desk
-- ----------------------------

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `full_price` double DEFAULT NULL,
  `discount_price` double DEFAULT NULL,
  `discount_status` tinyint(1) DEFAULT NULL,
  `sell_status` tinyint(1) DEFAULT NULL,
  `sales_vollume` bigint(20) DEFAULT NULL COMMENT '销量',
  `score` double DEFAULT NULL COMMENT '评分',
  `image_url` varchar(1000) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `merchant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `t_menu_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `t_merchant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `t_merchant`
-- ----------------------------
DROP TABLE IF EXISTS `t_merchant`;
CREATE TABLE `t_merchant` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `avatar_url` varchar(1000) DEFAULT NULL COMMENT '头像图片rul',
  `bg_url` varchar(1000) DEFAULT NULL COMMENT '背景图片url',
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`user_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家信息表';

-- ----------------------------
-- Records of t_merchant
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `canser_time` datetime DEFAULT NULL,
  `compelete_time` datetime DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `discount_price` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1 Not-paid,\r\n            2  pending,\r\n            3 reading,\r\n            4 complete,\r\n            5 user-canser',
  `pay_type` tinyint(1) DEFAULT NULL COMMENT '支付类型：\r\n            1 微信\r\n            2 现金\r\n            3 待定',
  `take_type` tinyint(1) DEFAULT NULL COMMENT '取餐类型：\r\n            1 自取\r\n            2 等待',
  `discount_status` tinyint(1) DEFAULT NULL COMMENT '打折状态：\r\n            1 打折\r\n            2 不打折',
  `discount` double DEFAULT NULL COMMENT '打折额度',
  `desk_id` bigint(20) DEFAULT NULL,
  KEY `FK_Reference_7` (`id`),
  KEY `FK_Reference` (`desk_id`),
  CONSTRAINT `FK_Reference` FOREIGN KEY (`desk_id`) REFERENCES `t_desk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_menu`;
CREATE TABLE `t_order_menu` (
  `id` bigint(20) NOT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`menu_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_order_menu_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单菜单中间表';

-- ----------------------------
-- Records of t_order_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_order`;
CREATE TABLE `t_user_order` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `t_user_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_user_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户订单中间表';

-- ----------------------------
-- Records of t_user_order
-- ----------------------------
