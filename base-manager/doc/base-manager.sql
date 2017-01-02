/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50618
Source Host           : localhost:3306
Source Database       : base-manager

Target Server Type    : MYSQL
Target Server Version : 50618
File Encoding         : 65001

Date: 2017-01-02 22:49:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) DEFAULT NULL COMMENT '登录名',
  `password` varchar(256) DEFAULT NULL COMMENT '登录密码，保存md5值',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '公司的个人邮箱，邮件提醒功能',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `state` int(2) DEFAULT NULL COMMENT '数据状态',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='后勤用户身份';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'dev', 'EF260E9AA3C673AF240D17A2660480361A8E081D1FFECA2A5ED0E3219FC18567', '开发者', '', '18028763997', '', '0', '2013-01-23 17:33:24');
INSERT INTO `admin` VALUES ('2', 'admin', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '系统管理员', null, '12345678909', null, '0', '2013-01-23 17:33:46');
INSERT INTO `admin` VALUES ('3', 'qnyk123', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '清能云控', null, '18028763997', null, '0', '2015-10-10 22:59:59');
INSERT INTO `admin` VALUES ('5', 'qnyk1234', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '李', null, '13430909666', null, '0', '2015-11-25 01:08:33');
INSERT INTO `admin` VALUES ('6', 'ewang', null, 'Eric', null, '13810734019', null, '1', '2015-12-03 02:30:24');
INSERT INTO `admin` VALUES ('7', 'ewang2', null, 'Eric', null, '13810734019', null, '1', '2015-12-03 03:18:16');
INSERT INTO `admin` VALUES ('9', 'qnyk2', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '电站管理员2', null, '12345678909', null, '-1', '2015-12-06 21:58:55');
INSERT INTO `admin` VALUES ('10', 'qnyk66', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', '账号管理员', null, '12345678909', null, '0', '2015-12-07 21:27:52');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `roleId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '1', '1');
INSERT INTO `admin_role` VALUES ('6', '9', '3');
INSERT INTO `admin_role` VALUES ('7', '6', '2');
INSERT INTO `admin_role` VALUES ('8', '6', '5');
INSERT INTO `admin_role` VALUES ('11', '2', '2');
INSERT INTO `admin_role` VALUES ('12', '10', '5');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `type` int(4) DEFAULT NULL COMMENT '菜单所属分类，1为内勤人员功能菜单，2为外勤人员功能菜单',
  `parentId` bigint(11) NOT NULL COMMENT '父级菜单ID',
  `parentIdPath` varchar(500) NOT NULL COMMENT '父级菜单ID串联，便于查询，格式：$1$2$',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单链接',
  `orderNo` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `state` int(2) DEFAULT '1' COMMENT '数据状态',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `onMenu` tinyint(4) DEFAULT '1' COMMENT '是否显示在菜单',
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='后勤管理权限菜单信息';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '清能管理平台', '1', '-1', '$', '', '0', '清能管理平台', '1', '2013-01-21 14:19:22', '1', null);
INSERT INTO `menu` VALUES ('2', '系统管理', '1', '1', '$1$', '', '1', '用户和菜单的设置', '1', '2013-01-23 10:12:31', '1', 'icon-cogs');
INSERT INTO `menu` VALUES ('3', '用户管理', '1', '2', '$1$2$', '/manager/admin/list', '1', '系统用户管理', '1', '2013-01-23 10:15:27', '1', null);
INSERT INTO `menu` VALUES ('4', '菜单管理', '1', '2', '$1$2$', '/manager/menu/list', '3', '功能菜单管理', '1', '2013-01-23 10:17:34', '1', null);
INSERT INTO `menu` VALUES ('5', '角色管理', '1', '2', '$1$2$', '/manager/role/list', '4', '用户角色管理', '1', '2013-01-24 14:28:03', '1', null);
INSERT INTO `menu` VALUES ('9', '分配权限查看', '1', '5', '', '/manager/role_menu/privileges', '1', '', '1', '2015-10-16 00:14:17', '0', null);
INSERT INTO `menu` VALUES ('10', '分配权限提交', '1', '5', '$1$2$5$', '/manager/role_menu/saveMenu', '2', null, '1', '2015-10-16 00:21:56', '0', null);
INSERT INTO `menu` VALUES ('11', '菜单详情', '1', '4', '$1$2$4$', '/manager/menu/detail', '1', null, '1', '2015-10-16 00:28:52', '0', null);
INSERT INTO `menu` VALUES ('12', '新增菜单提交', '1', '4', '', '/manager/menu/add', '4', '', '1', '2015-10-16 00:29:56', '0', null);
INSERT INTO `menu` VALUES ('13', '修改菜单', '1', '4', '$1$2$4$', '/manager/menu/update', '3', null, '1', '2015-10-16 00:31:31', '0', null);
INSERT INTO `menu` VALUES ('16', '删除菜单', '1', '4', '$1$2$4$', '/manager/menu/del', '6', null, '1', '2015-10-16 00:36:38', '0', null);
INSERT INTO `menu` VALUES ('19', '新增用户提交', '1', '3', '$1$2$3$', '/manager/admin/add', '2', null, '1', '2015-10-16 01:13:24', '0', null);
INSERT INTO `menu` VALUES ('20', '修改用户', '1', '3', '$1$2$3$', '/manager/admin/detail', '3', null, '1', '2015-10-16 01:14:20', '0', null);
INSERT INTO `menu` VALUES ('21', '修改用户提交', '1', '3', '', '/manager/admin/update', '4', null, '1', '2015-10-16 01:14:36', '0', null);
INSERT INTO `menu` VALUES ('22', '删除用户', '1', '3', '$1$2$3$', '/manager/admin/del', '5', null, '1', '2015-10-16 01:17:26', '0', null);
INSERT INTO `menu` VALUES ('24', '角色树形', '1', '5', '$1$2$5$', '/manager/role/api/tree', '3', null, '1', '2015-10-16 01:19:59', '0', null);
INSERT INTO `menu` VALUES ('25', '新增角色提交', '1', '5', '$1$2$5$', '/manager/role/add', '4', null, '1', '2015-10-16 01:20:46', '0', null);
INSERT INTO `menu` VALUES ('26', '修改角色', '1', '5', '$1$2$5$', '/manager/role/detail', '5', null, '1', '2015-10-16 01:21:27', '0', null);
INSERT INTO `menu` VALUES ('27', '修改角色提交', '1', '5', '', '/manager/role/update', '6', null, '1', '2015-10-16 01:22:02', '0', null);
INSERT INTO `menu` VALUES ('28', '删除角色', '1', '5', '$1$2$5$', '/manager/role/del', '7', null, '1', '2015-10-16 01:23:42', '0', null);
INSERT INTO `menu` VALUES ('65', '用户列表', '1', '3', '$1$2$3$', '/manager/admin/api/list', '7', '', '1', '2015-10-16 01:11:31', '0', '');
INSERT INTO `menu` VALUES ('66', '菜单树形', '1', '4', '$1$2$', '/manager/menu/api/list', '1', '', '1', '2013-01-23 10:17:34', '0', '');
INSERT INTO `menu` VALUES ('67', '分配角色查看', '1', '3', '', '/manager/admin_role/api/tree', '6', '', '1', '2017-01-01 21:24:41', '0', null);
INSERT INTO `menu` VALUES ('68', '分配角色提交', '1', '3', '', '/manager/admin_role/save', '7', '', '1', '2017-01-01 21:28:53', '0', null);
INSERT INTO `menu` VALUES ('69', '后台主页', '1', '-1', '$', '/manager/home', '1', null, '1', '2017-01-01 21:44:07', '1', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色的父节点',
  `name` varchar(50) DEFAULT NULL COMMENT '内勤管理角色名称',
  `type` int(4) DEFAULT NULL COMMENT '角色作用人员，1作用于内勤人员，2作用于外勤人员',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `orderNo` int(11) DEFAULT '100',
  `popedom` int(4) DEFAULT NULL COMMENT '甜椒权限标识：甜椒为1001、1002等；权限值越小，权限越大，主要用于创建用户判断权限的大小',
  `projectId` bigint(20) DEFAULT '0',
  `state` int(2) DEFAULT '1' COMMENT '数据状态',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='内勤管理人员角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '0', '系统开发者', '1', '系统开发者', '1', null, '0', '1', '2013-01-21 14:24:33');
INSERT INTO `role` VALUES ('2', '1', '系统管理员', '1', '系统管理员', '2', null, '0', '1', '2013-01-21 14:33:17');
INSERT INTO `role` VALUES ('3', '2', '电站管理员', null, '电站管理员', '100', null, '0', '1', '2015-10-11 10:14:41');
INSERT INTO `role` VALUES ('5', '2', '账号管理员', null, '账号管理与电站管理', '100', null, '0', '1', '2015-12-07 21:26:55');
INSERT INTO `role` VALUES ('7', '5', '账号管理员子节点1', null, '账号管理员子节点1', '100', null, '0', '1', '2017-01-01 11:53:05');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `roleId` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色id',
  `menuId` bigint(20) NOT NULL DEFAULT '0' COMMENT '权限菜单id',
  PRIMARY KEY (`roleId`,`menuId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内勤管理角色默认对应的菜单';

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '1');
INSERT INTO `role_menu` VALUES ('1', '2');
INSERT INTO `role_menu` VALUES ('1', '3');
INSERT INTO `role_menu` VALUES ('1', '4');
INSERT INTO `role_menu` VALUES ('1', '5');
INSERT INTO `role_menu` VALUES ('1', '9');
INSERT INTO `role_menu` VALUES ('1', '10');
INSERT INTO `role_menu` VALUES ('1', '11');
INSERT INTO `role_menu` VALUES ('1', '12');
INSERT INTO `role_menu` VALUES ('1', '13');
INSERT INTO `role_menu` VALUES ('1', '16');
INSERT INTO `role_menu` VALUES ('1', '19');
INSERT INTO `role_menu` VALUES ('1', '20');
INSERT INTO `role_menu` VALUES ('1', '21');
INSERT INTO `role_menu` VALUES ('1', '22');
INSERT INTO `role_menu` VALUES ('1', '24');
INSERT INTO `role_menu` VALUES ('1', '25');
INSERT INTO `role_menu` VALUES ('1', '26');
INSERT INTO `role_menu` VALUES ('1', '27');
INSERT INTO `role_menu` VALUES ('1', '28');
INSERT INTO `role_menu` VALUES ('1', '65');
INSERT INTO `role_menu` VALUES ('1', '66');
INSERT INTO `role_menu` VALUES ('1', '67');
INSERT INTO `role_menu` VALUES ('1', '68');
INSERT INTO `role_menu` VALUES ('1', '69');
INSERT INTO `role_menu` VALUES ('2', '1');
INSERT INTO `role_menu` VALUES ('2', '2');
INSERT INTO `role_menu` VALUES ('2', '3');
INSERT INTO `role_menu` VALUES ('2', '5');
INSERT INTO `role_menu` VALUES ('2', '9');
INSERT INTO `role_menu` VALUES ('2', '10');
INSERT INTO `role_menu` VALUES ('2', '14');
INSERT INTO `role_menu` VALUES ('2', '15');
INSERT INTO `role_menu` VALUES ('2', '17');
INSERT INTO `role_menu` VALUES ('2', '19');
INSERT INTO `role_menu` VALUES ('2', '20');
INSERT INTO `role_menu` VALUES ('2', '21');
INSERT INTO `role_menu` VALUES ('2', '22');
INSERT INTO `role_menu` VALUES ('2', '24');
INSERT INTO `role_menu` VALUES ('2', '25');
INSERT INTO `role_menu` VALUES ('2', '26');
INSERT INTO `role_menu` VALUES ('2', '27');
INSERT INTO `role_menu` VALUES ('2', '28');
INSERT INTO `role_menu` VALUES ('2', '65');
INSERT INTO `role_menu` VALUES ('2', '67');
INSERT INTO `role_menu` VALUES ('2', '68');
INSERT INTO `role_menu` VALUES ('2', '69');
INSERT INTO `role_menu` VALUES ('3', '1');
INSERT INTO `role_menu` VALUES ('3', '2');
INSERT INTO `role_menu` VALUES ('3', '3');
INSERT INTO `role_menu` VALUES ('3', '19');
INSERT INTO `role_menu` VALUES ('3', '20');
INSERT INTO `role_menu` VALUES ('3', '21');
INSERT INTO `role_menu` VALUES ('3', '22');
INSERT INTO `role_menu` VALUES ('3', '65');
INSERT INTO `role_menu` VALUES ('3', '67');
INSERT INTO `role_menu` VALUES ('3', '68');
INSERT INTO `role_menu` VALUES ('4', '1');
INSERT INTO `role_menu` VALUES ('5', '1');
INSERT INTO `role_menu` VALUES ('5', '2');
INSERT INTO `role_menu` VALUES ('5', '3');
INSERT INTO `role_menu` VALUES ('5', '5');
INSERT INTO `role_menu` VALUES ('5', '9');
INSERT INTO `role_menu` VALUES ('5', '10');
INSERT INTO `role_menu` VALUES ('5', '19');
INSERT INTO `role_menu` VALUES ('5', '20');
INSERT INTO `role_menu` VALUES ('5', '21');
INSERT INTO `role_menu` VALUES ('5', '22');
INSERT INTO `role_menu` VALUES ('5', '24');
INSERT INTO `role_menu` VALUES ('5', '25');
INSERT INTO `role_menu` VALUES ('5', '26');
INSERT INTO `role_menu` VALUES ('5', '27');
INSERT INTO `role_menu` VALUES ('7', '1');
INSERT INTO `role_menu` VALUES ('7', '2');
INSERT INTO `role_menu` VALUES ('7', '3');
INSERT INTO `role_menu` VALUES ('7', '19');
INSERT INTO `role_menu` VALUES ('7', '20');
INSERT INTO `role_menu` VALUES ('7', '21');
INSERT INTO `role_menu` VALUES ('7', '22');