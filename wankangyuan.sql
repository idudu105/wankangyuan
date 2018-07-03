/*
Navicat MySQL Data Transfer

Source Server         : 140.143.36.150
Source Server Version : 50173
Source Host           : 140.143.36.150:3306
Source Database       : wankangyuan

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-07-03 18:12:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `application`
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '应用编号',
  `app_name` varchar(20) DEFAULT NULL COMMENT '应用名称',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `app_type` varchar(20) DEFAULT NULL COMMENT '应用类别',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `versions` varchar(20) DEFAULT NULL COMMENT '版本',
  `is_save_system` int(1) DEFAULT NULL COMMENT '是否存储系统 0-否 1-是',
  `is_async` int(1) DEFAULT NULL COMMENT '同步/异步 0-同步 1-异步',
  `is_display` int(1) DEFAULT NULL COMMENT '是否显示 0-否 1-是',
  `para_address` varchar(255) DEFAULT NULL COMMENT '参数地址',
  `result_address` varchar(255) DEFAULT NULL COMMENT '结果地址',
  `app_intro` varchar(255) DEFAULT NULL COMMENT '应用简介',
  `file_result` varchar(255) DEFAULT NULL COMMENT '文件结果',
  `file_result_address` varchar(255) DEFAULT NULL COMMENT '文件结果地址',
  `description` text COMMENT '应用详细描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COMMENT='ltj-应用';

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('174', 'dzjin测试应用', 'dzjin', null, null, null, null, null, '0', null, null, 'dzjin测试应用描述', null, null, null, '2018-06-26 14:46:14', null);
INSERT INTO `application` VALUES ('175', 'dzjin测试应用2', 'dzjin', '', '', '', null, null, '0', 'http://localhost:8021/bd-visualapps/apps/heatmap/param.html?', 'http://localhost:8021/bd-visualapps/apps/heatmap/visual_v0.1.html?', 'dzjin测试应用2描述', '', 'http://localhost:8021/bd-visualapps/apps/file.html?', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '2018-06-26 14:48:54', '2018-06-26 14:53:01');
INSERT INTO `application` VALUES ('176', 'dzjin测试应用3', 'dzjin', null, null, null, null, null, '0', null, null, 'dzjin测试应用3描述', null, null, null, '2018-06-26 14:49:11', null);
INSERT INTO `application` VALUES ('177', '应用20180626', 'a121bc', '测序', '类别、测试', 'version-1', '1', '1', '1', 'http://localhost:8021/bd-visualapps/apps/heatmap/param.html?project.id={project.id}&userid={userid}&username={username}&app.id={app.id}', 'http://localhost:8021/bd-visualapps/apps/heatmap/visual_v0.1.html?taskId={taskId}&userid={userid}&username={username}', '描述~~', '内容~~', 'http://localhost:8021/bd-visualapps/apps/file.html?taskId={taskId}&userid={userid}&username={username}', '<p>测试<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\" _src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/></p>', '2018-06-26 15:28:37', '2018-06-26 15:38:46');
INSERT INTO `application` VALUES ('178', '应用201806262', 'a121bc', null, null, null, null, null, '0', null, null, 'xinx', null, null, '', '2018-06-26 15:53:11', null);
INSERT INTO `application` VALUES ('179', '新应用03', 'a121bc', null, null, null, null, null, '0', null, null, '0303', null, null, '', '2018-06-26 15:54:58', null);
INSERT INTO `application` VALUES ('180', 'dddd', 'admin', 'd', 'd', 'd', '1', '1', '1', 'http://www.baidu.com', 'http://www.shanghai.com', 'dddd', 'dd', 'http://www.beijing.com', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '2018-06-27 09:04:37', '2018-06-27 09:06:33');
INSERT INTO `application` VALUES ('181', 'ffff', 'admin', '', '', '', null, null, '0', 'http://192.168.1.199:4030/bd-visualapps/apps/riverplot/param_v0.1.html?project.id={project.id}&userid={userid}&username={username}&app.id={app.id}&server=productcclink', 'http://192.168.1.199:4030/bd-visualapps/apps/riverplot/visual_0_2.html?taskId={taskId}&userid={userid}&username={username}&server=productcclink', 'fff', 'dd', 'http://192.168.1.199:4030/bd-visualapps/apps/file.html?taskId={taskId}&userid={userid}&username={username}&server=productcclink', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '2018-06-27 09:12:15', '2018-06-27 09:32:48');
INSERT INTO `application` VALUES ('182', '22', 'dzjin', '', '', '', null, null, '0', 'http://localhost:8021/bd-visualapps/apps/heatmap/param.html?project.id={project.id}&userid={userid}&username={username}&app.id={app.id}', 'http://localhost:8021/bd-visualapps/apps/heatmap/param.html?project.id={project.id}&userid={userid}&username={username}&app.id={app.id}', '22', 'http://localhost:8021/bd-visualapps/apps/heatmap/param.html?project.id={project.id}&userid={userid}&username={username}&app.id={app.id}', 'http://localhost:8021/bd-visualapps/apps/heatmap/param.html?project.id={project.id}&userid={userid}&username={username}&app.id={app.id}', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss&nbsp; &nbsp; &nbsp;&nbsp;<span style=\"white-space: normal;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss&nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"white-space: normal;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss</span></p><p>\r\n	</p><p>\r\n	</p>', '2018-06-27 09:20:19', '2018-06-27 13:40:19');
INSERT INTO `application` VALUES ('183', '627', '李菲菲_test_1', 'ddd', 'dd', '1', null, null, '0', 'sss', 'sss', 'ssssss', 'ss', 'ss', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '2018-06-27 11:37:06', '2018-06-27 11:38:25');
INSERT INTO `application` VALUES ('184', '627', '李菲菲_test_1', null, null, null, null, null, '0', null, null, 'ssss', null, null, null, '2018-06-27 11:46:55', null);
INSERT INTO `application` VALUES ('185', 'myapp', 'wul', null, null, null, null, null, '1', null, null, 'myappmyappmyappmyappmyappmyappmyappmyappmyappmyappmyappmyappmyappmyappmyappmyappmyapp', null, null, null, '2018-06-27 13:52:22', null);
INSERT INTO `application` VALUES ('186', 'myapp1', 'wul', null, null, null, null, null, '1', null, null, 'myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1', null, null, null, '2018-06-27 13:52:43', null);
INSERT INTO `application` VALUES ('187', 'myapp2', 'wul', null, null, null, null, null, '1', null, null, 'myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2', null, null, null, '2018-06-27 13:52:53', null);
INSERT INTO `application` VALUES ('189', '627', 'lifeifei', 'ddd', 'EREG', '1', null, null, '0', 'd', 'd', 'dd', 'd', 'd', '<p>qqqqqqqqqqqqqqqqq&nbsp; &nbsp; &nbsp;</p>', '2018-06-27 13:55:11', '2018-06-27 13:56:21');
INSERT INTO `application` VALUES ('190', 'ddddd627', 'lifeifei', null, null, null, null, null, '0', null, null, '', null, null, null, '2018-06-27 13:56:34', null);
INSERT INTO `application` VALUES ('191', 'test', 'lifeifei', 'type1', '', '', null, null, '1', '', '', '111111111111', '', '', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '2018-06-27 15:37:07', '2018-06-27 15:37:48');

-- ----------------------------
-- Table structure for `collection_source`
-- ----------------------------
DROP TABLE IF EXISTS `collection_source`;
CREATE TABLE `collection_source` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '采集源ID',
  `cs_name` varchar(255) DEFAULT NULL COMMENT '采集源名',
  `is_view` tinyint(4) DEFAULT '1' COMMENT '是否显示到前端 0不显示；1显示',
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='采集源-kong';

-- ----------------------------
-- Records of collection_source
-- ----------------------------
INSERT INTO `collection_source` VALUES ('47', '龚永辉测试', '0');
INSERT INTO `collection_source` VALUES ('49', 'ceshi628', '1');
INSERT INTO `collection_source` VALUES ('50', '数据集', '1');
INSERT INTO `collection_source` VALUES ('62', '测试勿动', '1');

-- ----------------------------
-- Table structure for `collection_source_field`
-- ----------------------------
DROP TABLE IF EXISTS `collection_source_field`;
CREATE TABLE `collection_source_field` (
  `csf_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '采集源字段ID',
  `csf_name` varchar(255) DEFAULT NULL COMMENT '采集字段名',
  `cs_id` int(11) DEFAULT NULL COMMENT '采集源ID',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `check_rule` varchar(255) DEFAULT NULL COMMENT '校验规则',
  `enumerated` tinyint(4) DEFAULT NULL COMMENT '是否可枚举 0 不可；1 可枚举',
  `not_null` tinyint(4) DEFAULT NULL COMMENT '是否必填 0 可空；1 必填',
  `description` varchar(255) DEFAULT NULL COMMENT '字段描述信息',
  `error_msg` varchar(255) DEFAULT NULL COMMENT '错误信息提示',
  `create_datetime` varchar(255) DEFAULT '' COMMENT '创建时间',
  `create_uid` int(11) DEFAULT '0' COMMENT '创建人ID',
  `update_datetime` varchar(255) DEFAULT '' COMMENT '更新时间',
  `update_uid` int(11) DEFAULT '0' COMMENT '更新人ID',
  PRIMARY KEY (`csf_id`),
  KEY `cs_id` (`cs_id`),
  KEY `create_uid` (`create_uid`),
  KEY `update_uid` (`update_uid`),
  CONSTRAINT `collection_source_field_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `collection_source` (`cs_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='采集源字段配置-kong';

-- ----------------------------
-- Records of collection_source_field
-- ----------------------------
INSERT INTO `collection_source_field` VALUES ('65', 'sss', '47', '字符', '', '1', '1', 'ddd', 'bbb', '2018-06-26 17:06:06', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('66', 'ccc', '47', '字符', '', '1', '1', 'ff', 'f', '2018-06-26 17:06:20', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('71', 'f1', '49', '字符', '', '1', '0', 'ss', 'sss', '2018-06-28 09:15:37', '1', ' ', '1');
INSERT INTO `collection_source_field` VALUES ('72', 'f2', '49', '数值', '', '1', '0', '', '', '2018-06-28 09:16:07', '1', ' ', '1');
INSERT INTO `collection_source_field` VALUES ('74', 'projectId', '50', '字符', '', '1', '1', 'project id for the data first import', '', '2018-06-28 09:23:16', '1', ' ', '1');
INSERT INTO `collection_source_field` VALUES ('75', 'datasetId', '50', '字符', '', '1', '0', 'D%03s%s%04d formated unique dataset ID', '', '2018-06-28 09:23:36', '1', ' ', '1');
INSERT INTO `collection_source_field` VALUES ('76', 'datasetOriginalId', '50', '字符', '', '1', '0', 'dataset original ID, e.g. SRP036033', '', '2018-06-28 09:35:34', '1', ' ', '1');
INSERT INTO `collection_source_field` VALUES ('77', 'datasetName', '50', '字符', '', '1', '1', 'dataset name, e.g. TCGA-BRCA', '', '2018-06-28 09:38:44', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('78', 'datasetDescription', '50', '字符', '', '1', '0', 'dataset description info', '', '2018-06-28 09:39:25', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('79', 'datasetLink', '50', '字符', '', '1', '0', 'dataset link URL', '', '2018-06-28 09:39:48', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('80', 'datasetDirectSource', '50', '字符', '', '1', '0', 'dataset direct source, e.g. SRA', '', '2018-06-28 09:40:14', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('81', 'datasetOperateInstitute', '50', '字符', '', '1', '0', 'dataset operate institute, e.g. BGI', '', '2018-06-28 09:40:37', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('82', 'f4', '49', '数值', '', '0', '1', '', '', '2018-06-28 10:02:20', '1', ' ', '1');
INSERT INTO `collection_source_field` VALUES ('89', '1', '62', '字符', '', '1', '1', '', '', '2018-06-29 17:01:00', '1', '  ', '0');
INSERT INTO `collection_source_field` VALUES ('90', '2', '62', '字符', '', '1', '1', '', '', '2018-06-29 17:01:20', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('91', '3', '62', '字符', '', '1', '1', '', '', '2018-06-29 17:01:28', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('93', '33', '62', '字符', '', '0', '1', '', '', '2018-07-02 10:32:33', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('94', '份饭', '62', '字符', '', '0', '0', '', '', '2018-07-02 10:33:31', '1', ' ', '0');
INSERT INTO `collection_source_field` VALUES ('96', 'ww', '49', '字符', '', '0', '0', '', '', '2018-07-03 11:41:58', '1', '', '0');
INSERT INTO `collection_source_field` VALUES ('97', 'sss', '47', '字符', '', '0', '0', '', '', '2018-07-03 11:47:09', '1', '', '0');
INSERT INTO `collection_source_field` VALUES ('98', 'ssssss', '47', '字符', 'ss', '0', '0', '', '', '2018-07-03 11:47:33', '1', '', '0');

-- ----------------------------
-- Table structure for `format_field`
-- ----------------------------
DROP TABLE IF EXISTS `format_field`;
CREATE TABLE `format_field` (
  `ff_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '格式字段ID',
  `ff_name` varchar(255) DEFAULT NULL COMMENT '格式字段名',
  `ft_id` int(11) DEFAULT NULL COMMENT '格式类型ID',
  `is_meta` tinyint(4) DEFAULT '0' COMMENT '是否 meta 0否；1是',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `check_rule` varchar(255) DEFAULT NULL COMMENT '校验规则',
  `enumerated` tinyint(4) DEFAULT NULL COMMENT '是否可枚举 0 不可；1 可枚举',
  `not_null` tinyint(4) DEFAULT NULL COMMENT '是否必填 0 可空；1 必填',
  `is_view` tinyint(4) DEFAULT '1' COMMENT '是否显示到前端 0不显示；1显示',
  `description` varchar(255) DEFAULT NULL COMMENT '字段描述信息',
  `error_msg` varchar(255) DEFAULT NULL COMMENT '错误信息提示',
  `create_datetime` varchar(255) DEFAULT '' COMMENT '创建时间',
  `create_uid` int(11) DEFAULT '0' COMMENT '创建人ID',
  `update_datetime` varchar(255) DEFAULT '' COMMENT '更新时间',
  `update_uid` int(11) DEFAULT '0' COMMENT '更新人ID',
  PRIMARY KEY (`ff_id`),
  KEY `ft_id` (`ft_id`),
  CONSTRAINT `format_field_ibfk_1` FOREIGN KEY (`ft_id`) REFERENCES `format_type` (`ft_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='格式字段表-kong';

-- ----------------------------
-- Records of format_field
-- ----------------------------
INSERT INTO `format_field` VALUES ('47', 'fffdfdfd', '34', '1', '', '', '1', '1', '1', '', '', '2018-06-26 17:07:14', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('48', 'ffffff', '34', '0', '', '', '1', '1', '1', '', '', '2018-06-26 17:07:26', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('49', 'vbbcvbv', '34', '0', '', '', '1', '1', '1', '', '', '2018-06-26 17:07:51', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('57', 'ee1', '38', '0', '', '', '1', '1', '1', 'ddd', '', '2018-06-28 09:53:14', '1', '2018-06-28 09:53:54', '1');
INSERT INTO `format_field` VALUES ('58', 'ee2', '38', '0', '', '', '1', '1', '1', '', '', '2018-06-28 09:53:25', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('59', 'ff1', '41', '1', '', '', '1', '1', '1', '', '', '2018-06-28 09:58:01', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('60', 'ff2', '41', '1', '', '', '1', '1', '1', '', '', '2018-06-28 09:58:11', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('61', 'ff3', '41', '1', '', '', '1', '1', '1', '', '', '2018-06-28 09:58:29', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('62', 'donorId', '39', '0', '', '', '1', '1', '1', 'I%03s%07d formated unique donor ID', '', '2018-06-28 10:26:02', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('63', 'donorOriginalId', '39', '0', '', '', '1', '0', '1', '', '', '2018-06-28 10:26:39', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('73', 'A', '45', '1', '', '', '1', '1', '1', '', '', '2018-06-29 17:02:46', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('74', 'A', '45', '1', '', '', '1', '1', '1', '', '', '2018-06-29 17:36:52', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('75', 'A', '45', '1', '', '', '1', '1', '1', '', '', '2018-06-29 17:36:57', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('76', 'A', '45', '1', '', '', '1', '1', '1', '', '', '2018-06-29 17:37:05', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('77', 'a', '45', '0', '', '', '1', '1', '1', '', '', '2018-06-29 17:37:36', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('78', 'b', '45', '0', '', '', '1', '1', '1', '', '', '2018-06-29 17:37:42', '1', '  ', '0');
INSERT INTO `format_field` VALUES ('79', 'AA', '46', '1', '', '', '1', '1', '1', '', '', '2018-06-29 19:40:55', '1', ' ', '0');
INSERT INTO `format_field` VALUES ('81', 'aa', '46', '0', '', '', '1', '1', '1', '', '', '2018-06-29 19:45:28', '1', ' ', '0');

-- ----------------------------
-- Table structure for `format_type`
-- ----------------------------
DROP TABLE IF EXISTS `format_type`;
CREATE TABLE `format_type` (
  `ft_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '格式类型ID',
  `ft_name` varchar(255) DEFAULT NULL COMMENT '格式类型名',
  `cs_id` int(11) DEFAULT NULL COMMENT '采集源ID',
  `floder` varchar(255) DEFAULT NULL COMMENT '目录树叶节点',
  `create_datetime` varchar(255) DEFAULT '' COMMENT '创建时间',
  `create_uid` int(11) DEFAULT '0' COMMENT '创建人ID',
  `update_datetime` varchar(255) DEFAULT '' COMMENT '更新时间',
  `update_uid` int(11) DEFAULT '0' COMMENT '更新人ID',
  `is_view` tinyint(4) DEFAULT '1' COMMENT '状态 0隐藏；1显示',
  PRIMARY KEY (`ft_id`),
  KEY `cs_id` (`cs_id`),
  KEY `higher_ft_id` (`floder`),
  KEY `create_uid` (`create_uid`),
  KEY `update_uid` (`update_uid`),
  CONSTRAINT `format_type_ibfk_2` FOREIGN KEY (`cs_id`) REFERENCES `collection_source` (`cs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `format_type_ibfk_3` FOREIGN KEY (`create_uid`) REFERENCES `user` (`id`),
  CONSTRAINT `format_type_ibfk_4` FOREIGN KEY (`update_uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='格式类型表-kong';

-- ----------------------------
-- Records of format_type
-- ----------------------------
INSERT INTO `format_type` VALUES ('34', 'ffff', '47', '', '2018-06-26 17:06:55', '1', ' ', '0', '1');
INSERT INTO `format_type` VALUES ('38', 'g2', '49', '', '2018-06-28 09:48:40', '1', ' ', '0', '1');
INSERT INTO `format_type` VALUES ('39', '样本', '50', '样本信息', '2018-06-28 09:51:07', '1', ' ', '0', '1');
INSERT INTO `format_type` VALUES ('41', 'g1', '49', '', '2018-06-28 09:57:45', '1', ' ', '0', '1');
INSERT INTO `format_type` VALUES ('45', '1', '62', '', '2018-06-29 17:01:47', '1', ' ', '0', '1');
INSERT INTO `format_type` VALUES ('46', '2', '62', '', '2018-06-29 17:02:05', '1', ' ', '0', '1');
INSERT INTO `format_type` VALUES ('47', null, null, null, '', '0', '', '0', '1');

-- ----------------------------
-- Table structure for `friend_message`
-- ----------------------------
DROP TABLE IF EXISTS `friend_message`;
CREATE TABLE `friend_message` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sender_id` int(30) DEFAULT NULL COMMENT '发送人ID',
  `sender_name` varchar(20) DEFAULT NULL COMMENT '发送人名',
  `sender_headimg` varchar(255) DEFAULT NULL COMMENT '发送人头像',
  `receiver_id` int(30) DEFAULT NULL COMMENT '接收人ID',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '接收人名',
  `receiver_headimg` varchar(255) DEFAULT NULL COMMENT '接收人头像',
  `content` varchar(255) DEFAULT NULL COMMENT '发送内容',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='好友消息表';

-- ----------------------------
-- Records of friend_message
-- ----------------------------
INSERT INTO `friend_message` VALUES ('185', '36', 'lifeifei', '/wankangyuan/static/img/touxiang_4.png', '34', 'wul', '/wankangyuan/userFiles/34/headImg.jpg', 'aaaaaaaaaaaa', '2018-06-28 11:14:45');
INSERT INTO `friend_message` VALUES ('187', '36', 'lifeifei', '/wankangyuan/static/img/touxiang_4.png', '1', 'admin', '/wankangyuan/userFiles/1/headImg.jpg', 'aaa', '2018-07-03 17:36:52');

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(30) DEFAULT NULL COMMENT '用户ID',
  `friend_id` int(30) DEFAULT NULL COMMENT '好友ID',
  `friend_org_id` int(30) DEFAULT NULL COMMENT '好友组织id',
  `friend_name` varchar(50) DEFAULT NULL COMMENT '好友名',
  `friend_rolename` varchar(50) DEFAULT NULL COMMENT '角色名',
  `friend_headimg` varchar(255) DEFAULT NULL COMMENT '好友头像',
  `friend_email` varchar(128) DEFAULT NULL COMMENT '好友邮箱',
  `friend_profile` varchar(255) DEFAULT NULL COMMENT '好友简介',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='ltj-用户好友关系表';

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('39', '32', '1', null, 'admin', '超级管理员', '/wankangyuan/userFiles/1/headImg.jpg', 'bbb@qq.com', '简介23333', '2018-06-26 16:01:19', '2018-06-26 16:02:43');
INSERT INTO `friends` VALUES ('40', '1', '32', null, '472746759', '普通用户', '/wankangyuan/static/img/touxiang_7.png', '472746759@qq.com', null, '2018-06-26 16:01:19', '2018-07-03 14:33:06');
INSERT INTO `friends` VALUES ('41', '36', '1', null, 'admin', '超级管理员', '/wankangyuan/userFiles/1/headImg.jpg', '472746759@qq.com', '简介23333', '2018-06-28 09:40:31', '2018-07-03 17:46:39');
INSERT INTO `friends` VALUES ('42', '1', '36', null, 'lifeifei', '超级管理员', '/wankangyuan/static/img/touxiang_4.png', 'feifei.li@myhealthgene.com', '11111', '2018-06-28 09:40:31', '2018-07-03 14:33:06');
INSERT INTO `friends` VALUES ('43', '34', '1', null, 'admin', '超级管理员', '/wankangyuan/userFiles/1/headImg.jpg', '472746759@qq.com', '简介23333', '2018-06-28 10:57:56', '2018-07-03 16:27:34');
INSERT INTO `friends` VALUES ('44', '1', '34', null, 'wul', '超级管理员', '/wankangyuan/userFiles/34/headImg.jpg', 'wuling199102@gmail.com', 'this is a description about ...', '2018-06-28 10:57:56', '2018-07-03 14:33:06');
INSERT INTO `friends` VALUES ('55', '1', '1', null, 'admin', '超级管理员', '/wankangyuan/userFiles/1/headImg.jpg', 'bbb@qq.com', '简介23333', '2018-06-29 14:09:55', '2018-07-03 14:33:06');
INSERT INTO `friends` VALUES ('64', '30', '30', null, 'dzjin', '普通用户', '/wankangyuan/userFiles/30/headImg.jpg', 'dzjin5678@163.com', null, '2018-07-02 14:38:57', '2018-07-02 15:48:30');
INSERT INTO `friends` VALUES ('63', '43', '43', null, 'a121bc1', '普通用户', '/wankangyuan/static/img/head.jpg', 'a121bc@163.com', null, '2018-06-29 16:58:35', '2018-06-29 16:58:35');
INSERT INTO `friends` VALUES ('61', '31', '1', null, 'admin', '超级管理员', '/wankangyuan/userFiles/1/headImg.jpg', 'bbb@qq.com', '简介23333', '2018-06-29 15:25:54', '2018-07-02 11:17:57');
INSERT INTO `friends` VALUES ('62', '1', '31', null, 'a121bc', '普通用户', '/wankangyuan/static/img/touxiang_6.png', 'a121bc1@163.com', null, '2018-06-29 15:25:54', '2018-07-03 14:33:07');
INSERT INTO `friends` VALUES ('56', '31', '31', null, 'a121bc', '普通用户', '/wankangyuan/static/img/touxiang_6.png', 'a121bc1@163.com', null, '2018-06-29 15:25:40', '2018-07-02 11:17:57');
INSERT INTO `friends` VALUES ('65', '36', '36', null, 'lifeifei', '超级管理员', '/wankangyuan/static/img/touxiang_4.png', 'feifei.li@myhealthgene.com', '11111', '2018-07-02 17:14:06', '2018-07-03 17:46:39');
INSERT INTO `friends` VALUES ('66', '34', '34', null, 'wul', '超级管理员', '/wankangyuan/userFiles/34/headImg.jpg', 'wuling199102@gmail.com', 'this is a description about ...', '2018-07-03 14:30:11', '2018-07-03 16:27:34');
INSERT INTO `friends` VALUES ('67', '37', '37', null, 'max', '超级管理员', '/wankangyuan/static/img/touxiang_3.png', 'xi.ma@myhealthgene.com', null, '2018-07-03 16:37:02', '2018-07-03 16:37:02');
INSERT INTO `friends` VALUES ('68', '47', '47', null, 'wuling', '普通用户', '/wankangyuan/static/img/head.jpg', '1169804109@qq.com', 'gkhj', '2018-07-03 17:14:23', '2018-07-03 17:45:34');
INSERT INTO `friends` VALUES ('74', '36', '47', null, 'wuling', '普通用户', '/wankangyuan/static/img/head.jpg', '1169804109@qq.com', 'gkhj', '2018-07-03 17:43:54', '2018-07-03 17:46:39');
INSERT INTO `friends` VALUES ('73', '47', '36', null, 'lifeifei', '超级管理员', '/wankangyuan/static/img/touxiang_4.png', 'feifei.li@myhealthgene.com', '11111', '2018-07-03 17:43:54', '2018-07-03 17:45:34');
INSERT INTO `friends` VALUES ('75', '35', '35', null, '李菲菲_test_1', '普通用户', null, 'feifei.li@myhealthgene.com', 'lifeifei123', '2018-07-03 17:46:09', null);
INSERT INTO `friends` VALUES ('76', '35', '1', null, 'admin', '超级管理员', '/wankangyuan/userFiles/1/headImg.jpg', '472746759@qq.com', '简介23333', '2018-07-03 17:46:09', null);
INSERT INTO `friends` VALUES ('77', '1', '35', null, '李菲菲_test_1', '普通用户', null, 'feifei.li@myhealthgene.com', 'lifeifei123', '2018-07-03 17:46:09', null);
INSERT INTO `friends` VALUES ('78', '35', '36', null, 'lifeifei', '超级管理员', '/wankangyuan/static/img/touxiang_4.png', 'feifei.li@myhealthgene.com', '11111', '2018-07-03 17:46:10', null);
INSERT INTO `friends` VALUES ('79', '36', '35', null, '李菲菲_test_1', '普通用户', null, 'feifei.li@myhealthgene.com', 'lifeifei123', '2018-07-03 17:46:10', '2018-07-03 17:46:39');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(30) DEFAULT NULL COMMENT '用户ID',
  `obj_id` int(30) DEFAULT NULL COMMENT '对象ID',
  `obj_name` varchar(50) DEFAULT NULL COMMENT '对象名',
  `type` int(1) DEFAULT NULL COMMENT '消息类型 0:系统通知 1:好友申请 2:话题回复',
  `content` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `status` int(1) DEFAULT NULL COMMENT '消息状态 0:未处理 1:已处理',
  `result` varchar(20) DEFAULT NULL COMMENT '处理结果',
  `headimg` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='ltj-通知表';

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('198', '35', '36', null, '1', 'lifeifei申请加您为好友，请及时处理。', '1', '已通过', null, '2018-07-03 17:45:36', '2018-07-03 17:46:10');
INSERT INTO `message` VALUES ('197', '36', '47', null, '1', 'wuling申请加您为好友，请及时处理。', '1', '已通过', null, '2018-07-03 17:38:51', '2018-07-03 17:39:19');
INSERT INTO `message` VALUES ('196', '47', '36', null, '1', 'lifeifei申请加您为好友，请及时处理。', '1', '已通过', null, '2018-07-03 17:38:09', '2018-07-03 17:43:53');
INSERT INTO `message` VALUES ('195', '42', '36', null, '1', 'lifeifei申请加您为好友，请及时处理。', '0', null, null, '2018-07-03 17:38:09', null);
INSERT INTO `message` VALUES ('172', '1', '25', null, '0', '新组织申请创建：组织结构名称:组织结构1 真实姓名:测试员1 联系电话:18111111111 单位简介:单位名', '1', '已通过', null, '2018-06-26 15:59:43', '2018-06-26 16:00:04');
INSERT INTO `message` VALUES ('173', '32', '1', null, '1', 'admin申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-26 16:01:10', '2018-06-26 16:01:19');
INSERT INTO `message` VALUES ('174', '1', '27', null, '0', '新组织申请创建：组织结构名称:yyyyy 真实姓名:dddd 联系电话:ddd 单位简介:dd', '1', '已通过', null, '2018-06-27 09:25:02', '2018-06-27 09:25:18');
INSERT INTO `message` VALUES ('175', '31', '1', null, '1', 'admin申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-27 09:26:26', '2018-06-29 15:25:54');
INSERT INTO `message` VALUES ('176', '1', '30', null, '0', '新组织申请创建：组织结构名称:万康源 真实姓名:max 联系电话:bb 单位简介:公司', '1', '已通过', null, '2018-06-27 14:00:26', '2018-06-27 15:07:32');
INSERT INTO `message` VALUES ('177', '1', '31', null, '0', '新组织申请创建：组织结构名称:万康源 真实姓名:雷文婕 联系电话:18511898292 单位简介:', '1', '已通过', null, '2018-06-27 14:04:11', '2018-06-27 15:07:35');
INSERT INTO `message` VALUES ('178', '1', '32', null, '0', '新组织申请创建：组织结构名称:万康源 真实姓名:max 联系电话:123456 单位简介:啊速度发', '1', '已通过', null, '2018-06-27 14:35:24', '2018-06-27 15:07:28');
INSERT INTO `message` VALUES ('179', '1', '33', null, '0', '新组织申请创建：组织结构名称:aa 真实姓名:年内 联系电话:13810377500 单位简介:asdf', '1', '已通过', null, '2018-06-27 14:36:25', '2018-06-27 15:07:25');
INSERT INTO `message` VALUES ('180', '30', '1', null, '1', 'admin申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-28 09:31:30', '2018-06-28 16:57:03');
INSERT INTO `message` VALUES ('181', '30', '1', null, '1', 'admin申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-28 09:32:19', '2018-06-28 16:57:02');
INSERT INTO `message` VALUES ('182', '36', '1', null, '1', 'admin申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-28 09:39:05', '2018-06-28 09:40:31');
INSERT INTO `message` VALUES ('183', '34', '1', null, '1', 'admin申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-28 09:40:10', '2018-06-28 10:57:56');
INSERT INTO `message` VALUES ('184', '1', '36', null, '0', '新组织申请创建：组织结构名称:wky 真实姓名:wul 联系电话:123456789 单位简介:sfdwfweg', '0', null, null, '2018-06-28 10:56:15', null);
INSERT INTO `message` VALUES ('185', '36', '34', null, '1', 'wul申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-28 10:59:01', '2018-06-28 11:00:02');
INSERT INTO `message` VALUES ('186', '36', '34', null, '1', 'wul申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-28 11:00:07', '2018-06-28 11:08:58');
INSERT INTO `message` VALUES ('187', '36', '34', null, '1', 'wul申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-28 11:29:10', '2018-06-28 13:10:47');
INSERT INTO `message` VALUES ('188', '31', '1', null, '1', 'admin申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-28 14:46:16', '2018-06-29 15:25:53');
INSERT INTO `message` VALUES ('189', '1', '40', null, '0', '新组织申请创建：组织结构名称:新测试 真实姓名:aa 联系电话:11111111 单位简介:aa', '1', '已通过', null, '2018-06-29 10:59:45', '2018-06-29 10:59:51');
INSERT INTO `message` VALUES ('190', '31', '1', null, '1', 'admin申请加您为好友，请及时处理。', '1', '已通过', null, '2018-06-29 15:25:17', '2018-06-29 15:25:40');
INSERT INTO `message` VALUES ('191', '1', '44', null, '0', '新组织申请创建：组织结构名称:新测试2 真实姓名:a121bc 联系电话:123 单位简介:111', '1', '已通过', null, '2018-06-29 16:01:20', '2018-06-29 16:01:25');
INSERT INTO `message` VALUES ('192', '35', '1', null, '1', 'admin申请加您为好友，请及时处理。', '1', '已通过', null, '2018-07-02 17:31:12', '2018-07-03 17:46:09');
INSERT INTO `message` VALUES ('193', '47', '36', null, '1', 'lifeifei申请加您为好友，请及时处理。', '1', '已通过', null, '2018-07-03 17:37:41', '2018-07-03 17:43:54');
INSERT INTO `message` VALUES ('194', '34', '36', null, '1', 'lifeifei申请加您为好友，请及时处理。', '0', null, null, '2018-07-03 17:38:09', null);

-- ----------------------------
-- Table structure for `org_member`
-- ----------------------------
DROP TABLE IF EXISTS `org_member`;
CREATE TABLE `org_member` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '组内成员名',
  `headimg` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `org_role` varchar(50) DEFAULT NULL COMMENT '组内角色',
  `org_id` int(100) DEFAULT NULL COMMENT '组织机构ID',
  `group_id` int(100) DEFAULT NULL COMMENT '组ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_member
-- ----------------------------
INSERT INTO `org_member` VALUES ('6', '1', 'admin', '/wankangyuan/userFiles/1/headImg.jpg', 'bbb@qq.com', '管理员', '40', '27', '2018-06-29 14:21:47', null);
INSERT INTO `org_member` VALUES ('12', '36', 'lifeifei', '/wankangyuan/static/img/touxiang_4.png', 'feifei.li@myhealthgene.com', null, '40', '43', '2018-06-29 14:37:09', null);
INSERT INTO `org_member` VALUES ('11', '1', 'admin', '/wankangyuan/userFiles/1/headImg.jpg', 'bbb@qq.com', '管理员', '40', '43', '2018-06-29 14:36:28', null);
INSERT INTO `org_member` VALUES ('15', '31', 'a121bc', '/wankangyuan/static/img/touxiang_6.png', 'a121bc@163.com', '成员', '40', '43', '2018-06-29 16:00:26', null);
INSERT INTO `org_member` VALUES ('14', '1', 'admin', '/wankangyuan/userFiles/1/headImg.jpg', 'bbb@qq.com', '管理员', '40', '42', '2018-06-29 15:27:24', null);
INSERT INTO `org_member` VALUES ('16', '1', 'admin', '/wankangyuan/userFiles/1/headImg.jpg', 'bbb@qq.com', '成员', '44', '45', '2018-06-29 16:18:07', null);
INSERT INTO `org_member` VALUES ('17', '31', 'a121bc', '/wankangyuan/static/img/touxiang_6.png', 'a121bc@163.com', '管理员', '44', '45', '2018-06-29 16:18:45', null);

-- ----------------------------
-- Table structure for `organization`
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '组名',
  `parent_id` int(30) DEFAULT NULL COMMENT '父ID',
  `parent_ids` varchar(255) DEFAULT NULL COMMENT 'id结构',
  `root_id` int(30) DEFAULT NULL COMMENT '根id',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建者',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `unit_info` varchar(255) DEFAULT NULL COMMENT '单位简介',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(1) DEFAULT NULL COMMENT '状态 0:审核中 1:有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='ltj-组织关系表';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('31', '万康源', '0', null, '31', 'admin', 'admin', '18511898292', '', '2018-06-27 14:04:11', null, '1');
INSERT INTO `organization` VALUES ('32', '万康源', '0', null, '32', 'max', 'max', '123456', '啊速度发', '2018-06-27 14:35:24', null, '1');
INSERT INTO `organization` VALUES ('33', 'aa', '0', null, null, '年内', 'max', '13810377500', 'asdf', '2018-06-27 14:36:25', null, '1');
INSERT INTO `organization` VALUES ('34', 'nn', '32', null, '32', '32', 'admin', null, null, '2018-06-27 15:08:40', null, '1');
INSERT INTO `organization` VALUES ('35', 'bb', '32', null, null, null, 'max', null, null, '2018-06-27 15:10:40', null, '1');
INSERT INTO `organization` VALUES ('25', '组织结构1', '0', null, null, '测试员1', '472746759', '18111111111', '单位名', '2018-06-26 15:59:43', null, '1');
INSERT INTO `organization` VALUES ('26', '小组1', '34', null, '32', null, '472746759', null, null, '2018-06-26 16:00:14', null, '1');
INSERT INTO `organization` VALUES ('27', 'yyyyy', '26', null, '32', 'dddd', 'admin', 'ddd', 'dd', '2018-06-27 09:25:02', null, '1');
INSERT INTO `organization` VALUES ('36', 'wky', '0', null, null, 'wul', 'wul', '123456789', 'sfdwfweg', '2018-06-28 10:56:15', null, '0');
INSERT INTO `organization` VALUES ('30', '万康源', '0', null, null, 'max', 'max', 'bb', '公司', '2018-06-27 14:00:26', null, '1');
INSERT INTO `organization` VALUES ('40', '新测试', '0', null, '40', 'aa', 'admin', '11111111', 'aa', '2018-06-29 10:59:45', null, '1');
INSERT INTO `organization` VALUES ('41', '分组01', '40', null, '40', null, 'admin', null, null, '2018-06-29 11:00:29', null, '1');
INSERT INTO `organization` VALUES ('42', '分组01-02', '41', null, '40', null, 'admin', null, null, '2018-06-29 11:00:53', null, '1');
INSERT INTO `organization` VALUES ('43', '分组02', '40', null, '40', null, 'admin', null, null, '2018-06-29 11:01:04', null, '1');
INSERT INTO `organization` VALUES ('44', '新测试2', '0', null, '44', 'a121bc', 'a121bc', '123', '111', '2018-06-29 16:01:20', null, '1');
INSERT INTO `organization` VALUES ('45', '分组02', '44', null, '44', null, 'a121bc', null, null, '2018-06-29 16:17:54', null, '1');
INSERT INTO `organization` VALUES ('47', '分组02-01', '41', null, '40', null, 'admin', null, null, '2018-06-29 17:31:51', null, '1');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `p_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `p_number` varchar(255) DEFAULT NULL COMMENT '项目编号',
  `creator` varchar(255) DEFAULT '1' COMMENT '创建者',
  `create_datetime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `is_open` smallint(6) DEFAULT '0' COMMENT '是否公开 0未公开；1公开',
  `is_asy` smallint(6) DEFAULT '0' COMMENT '是否是异步 0同步；1异步',
  `is_show` smallint(6) DEFAULT '0' COMMENT '是否显示在欢迎页',
  `key_words` varchar(255) DEFAULT NULL COMMENT '项目关键字',
  `introduction` varchar(10000) DEFAULT '无简介' COMMENT '项目简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目基础信息表';

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('74', 'dzjin的测试项目名称', 'dzjin的测试项目编号', '30', '2018-06-26 14:34:44', '1', '0', '1', 'dzjin的测试关键字', '无简介');
INSERT INTO `project` VALUES ('76', 'dzjin的测试项目名称2', 'dzjin的测试项目编号2', '30', '2018-06-26 14:41:12', '0', '0', '1', 'dzjin的测试关键字2', 'dzjin的测试项目2的简介，dzjin的测试项目2的简介dzjin的测试项目2的简介dzjin的测试项目2的简介dzjin的测试项目2的简介dzjin的测试项目2的简介dzjin的测试项目2的简介dzjin的测试项目2的简介dzjin的测试项目2的简介');
INSERT INTO `project` VALUES ('77', 'gyh_project', '123', '1', '2018-06-26 17:12:04', '1', '0', '1', 'fff', '无简介');
INSERT INTO `project` VALUES ('78', '3', '3', '30', '2018-06-26 22:40:30', '0', '0', '1', '3', '无简介');
INSERT INTO `project` VALUES ('80', '5', '5', '30', '2018-06-26 22:40:39', '1', '0', '1', '5', '无简介');
INSERT INTO `project` VALUES ('81', '6', '6', '30', '2018-06-26 22:40:42', '1', '0', '1', '6', '无简介');
INSERT INTO `project` VALUES ('82', '7', '7', '30', '2018-06-26 22:40:46', '1', '0', '1', '7', '无简介');
INSERT INTO `project` VALUES ('83', '8', '8', '30', '2018-06-26 22:40:50', '1', '0', '1', '8', '无简介');
INSERT INTO `project` VALUES ('84', '9', '9', '30', '2018-06-26 22:40:53', '1', '0', '1', '9', '无简介');
INSERT INTO `project` VALUES ('85', '10', '10', '30', '2018-06-26 22:40:58', '1', '0', '1', '10', '无简介');
INSERT INTO `project` VALUES ('87', '12', '12', '30', '2018-06-26 22:41:08', '1', '0', '0', '12', '无简介');
INSERT INTO `project` VALUES ('88', '13', '13', '30', '2018-06-26 22:41:13', '1', '0', '0', '13', '无简介');
INSERT INTO `project` VALUES ('89', '14', '14', '30', '2018-06-26 22:41:18', '1', '0', '0', '14', '无简介');
INSERT INTO `project` VALUES ('90', '临时测试项目', '临时测试项目', '30', '2018-06-26 22:41:23', '1', '0', '0', '临时测试项目', '无简介1112323\n测试简介能不能\n当你有梦想的时候，就要去捍卫它\n梦想的天空分外蓝');
INSERT INTO `project` VALUES ('91', '测试627', 'ceshi627', '35', '2018-06-27 10:13:34', '0', '0', '0', '测试', '用于测试 6月27日');
INSERT INTO `project` VALUES ('94', 'myproject_test2', 'myproject_test2', '34', '2018-06-27 10:53:30', '1', '0', '0', 'test2', '无简介');
INSERT INTO `project` VALUES ('97', '测试627-2', 'ceshi627', '35', '2018-06-27 11:08:27', '0', '0', '0', '测试', '无简介');
INSERT INTO `project` VALUES ('98', '测试627-3', 'ceshi627', '35', '2018-06-27 11:08:35', '0', '0', '0', '测试', '无简介');
INSERT INTO `project` VALUES ('99', '测试627-4', 'ceshi627', '35', '2018-06-27 11:08:45', '0', '0', '0', '测试', '无简介');
INSERT INTO `project` VALUES ('100', '测试627', 'ceshi627', '36', '2018-06-27 13:16:41', '0', '0', '0', '测试', 'ssssss');
INSERT INTO `project` VALUES ('101', '测试627-2', 'ceshi627', '36', '2018-06-27 13:16:48', '0', '0', '0', '测试', '无简介');
INSERT INTO `project` VALUES ('104', 'myproject_test3', 'myproject_test3', '34', '2018-06-27 13:18:44', '1', '0', '0', 'test3', '无简介');
INSERT INTO `project` VALUES ('105', 'myproject_test1', 'myproject_test1', '34', '2018-06-27 13:40:29', '1', '0', '1', 'test1', '无简介');
INSERT INTO `project` VALUES ('106', '科研测试1', '123', '37', '2018-06-27 14:25:55', '0', '0', '0', 'asdf', '无简介');
INSERT INTO `project` VALUES ('107', '啦啦啦啦啦', '122', '38', '2018-06-27 14:57:04', '0', '0', '0', '的', '不知道什么的什么的项目');
INSERT INTO `project` VALUES ('108', '测试627-3', 'ceshi627', '36', '2018-06-27 15:22:46', '0', '0', '0', '测试', '无简介');
INSERT INTO `project` VALUES ('109', 'sfwefg', 'afwserfg', '34', '2018-06-28 14:57:21', '1', '0', '0', 'afewtf', '无简介');
INSERT INTO `project` VALUES ('110', '628', '', '36', '2018-06-28 15:02:49', '0', '0', '0', '', '无简介');
INSERT INTO `project` VALUES ('114', '角色测试项目', '角色测试项目', '30', '2018-06-29 17:21:32', '1', '0', '0', '角色测试项目', '无简介保存项目简介');
INSERT INTO `project` VALUES ('115', 'test703', 'test703', '47', '2018-07-03 17:01:24', '1', '0', '0', 'test', '无简介');
INSERT INTO `project` VALUES ('116', 'test703-1', 'test703-1', '47', '2018-07-03 17:02:59', '0', '0', '0', 'test', '无简介');
INSERT INTO `project` VALUES ('117', '李菲菲测试703-1', 'ceshi703', '36', '2018-07-03 17:23:24', '1', '0', '0', '测试', '无简介');

-- ----------------------------
-- Table structure for `project_app_relation`
-- ----------------------------
DROP TABLE IF EXISTS `project_app_relation`;
CREATE TABLE `project_app_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目-应用关系表ID',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `app_id` int(11) DEFAULT NULL COMMENT '应用ID',
  `bind_datetime` varchar(30) DEFAULT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目-应用绑定关系表';

-- ----------------------------
-- Records of project_app_relation
-- ----------------------------
INSERT INTO `project_app_relation` VALUES ('63', '76', '175', '2018-06-26 14:49:23');
INSERT INTO `project_app_relation` VALUES ('64', '77', '180', '2018-06-27 09:08:06');
INSERT INTO `project_app_relation` VALUES ('65', '77', '181', '2018-06-27 09:33:05');
INSERT INTO `project_app_relation` VALUES ('66', '91', '183', '2018-06-27 11:45:55');
INSERT INTO `project_app_relation` VALUES ('67', '100', '189', '2018-06-27 13:55:24');
INSERT INTO `project_app_relation` VALUES ('68', '100', '187', '2018-06-27 13:59:22');
INSERT INTO `project_app_relation` VALUES ('69', '105', '180', '2018-06-27 13:59:24');
INSERT INTO `project_app_relation` VALUES ('70', '105', '185', '2018-06-27 14:02:02');
INSERT INTO `project_app_relation` VALUES ('76', '90', '175', '2018-06-28 08:50:46');
INSERT INTO `project_app_relation` VALUES ('79', '90', '176', '2018-06-28 20:42:26');
INSERT INTO `project_app_relation` VALUES ('80', '90', '175', '2018-06-28 20:42:26');
INSERT INTO `project_app_relation` VALUES ('81', '90', '174', '2018-06-28 20:42:26');
INSERT INTO `project_app_relation` VALUES ('82', '77', '177', '2018-07-02 17:34:43');

-- ----------------------------
-- Table structure for `project_app_task`
-- ----------------------------
DROP TABLE IF EXISTS `project_app_task`;
CREATE TABLE `project_app_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '应用运行结果',
  `param` varchar(255) DEFAULT NULL COMMENT '应用参数',
  `project_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名，甲方传过来的',
  `taskDescription` varchar(255) DEFAULT NULL,
  `taskName` varchar(255) DEFAULT NULL,
  `create_datetime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `isRelease` varchar(255) DEFAULT '0' COMMENT '发布状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='dzjin-应用运行结果';

-- ----------------------------
-- Records of project_app_task
-- ----------------------------
INSERT INTO `project_app_task` VALUES ('40', '参数', '90', '30', '175', 'dzjin', '应用描述信息', '应用结果名称', '2018-06-28', '0');
INSERT INTO `project_app_task` VALUES ('41', '参数', '90', '30', '175', 'dzjin', '应用结果描述信息', '应用结果名称', '2018-06-28', '0');
INSERT INTO `project_app_task` VALUES ('42', '参数', '90', '30', '175', 'dzjin', '应用结果描述信息', '应用结果名称', '2018-06-28', '0');
INSERT INTO `project_app_task` VALUES ('43', '参数', '90', '30', '175', 'dzjin', '应用结果描述信息', '应用结果名称', '2018-06-28', '0');

-- ----------------------------
-- Table structure for `project_authority`
-- ----------------------------
DROP TABLE IF EXISTS `project_authority`;
CREATE TABLE `project_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `authority_name` varchar(255) DEFAULT NULL COMMENT '权限名称',
  `authority_number` int(11) DEFAULT NULL COMMENT '权限编号',
  `parent_id` int(11) DEFAULT NULL COMMENT '上一级权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目内权限表';

-- ----------------------------
-- Records of project_authority
-- ----------------------------
INSERT INTO `project_authority` VALUES ('1', '保存简介', '10', '25');
INSERT INTO `project_authority` VALUES ('2', '添加根', '20', '26');
INSERT INTO `project_authority` VALUES ('3', '添加叶', '21', '26');
INSERT INTO `project_authority` VALUES ('4', '上传文件', '22', '26');
INSERT INTO `project_authority` VALUES ('5', '修改文件夹名称', '23', '26');
INSERT INTO `project_authority` VALUES ('6', '删除文件夹', '24', '26');
INSERT INTO `project_authority` VALUES ('7', '删除文件', '25', '26');
INSERT INTO `project_authority` VALUES ('8', '下载文件', '26', '26');
INSERT INTO `project_authority` VALUES ('9', '运行应用', '40', '28');
INSERT INTO `project_authority` VALUES ('10', '移除应用', '41', '28');
INSERT INTO `project_authority` VALUES ('11', '重运行应用', '50', '29');
INSERT INTO `project_authority` VALUES ('12', '发布应用运行结果', '51', '29');
INSERT INTO `project_authority` VALUES ('13', '取消发布应用运行结果', '52', '29');
INSERT INTO `project_authority` VALUES ('14', '移除应用运行结果', '53', '29');
INSERT INTO `project_authority` VALUES ('15', '打开应用结果地址', '54', '29');
INSERT INTO `project_authority` VALUES ('16', '查看应用运行结果参数', '55', '29');
INSERT INTO `project_authority` VALUES ('17', '查看应用运行结果文件', '56', '29');
INSERT INTO `project_authority` VALUES ('18', '创建主题', '70', '31');
INSERT INTO `project_authority` VALUES ('19', '删除主题', '71', '31');
INSERT INTO `project_authority` VALUES ('20', '回复主题', '72', '31');
INSERT INTO `project_authority` VALUES ('21', '删除主题回复', '73', '31');
INSERT INTO `project_authority` VALUES ('22', '添加成员', '60', '30');
INSERT INTO `project_authority` VALUES ('23', '权限管理', '61', '30');
INSERT INTO `project_authority` VALUES ('24', '删除成员', '62', '30');
INSERT INTO `project_authority` VALUES ('25', '基本信息', '1', null);
INSERT INTO `project_authority` VALUES ('26', '文件管理', '2', null);
INSERT INTO `project_authority` VALUES ('27', '格式数据管理', '3', null);
INSERT INTO `project_authority` VALUES ('28', '应用管理', '4', null);
INSERT INTO `project_authority` VALUES ('29', '应用结果管理', '5', null);
INSERT INTO `project_authority` VALUES ('30', '成员管理', '6', null);
INSERT INTO `project_authority` VALUES ('31', '主题管理', '7', null);
INSERT INTO `project_authority` VALUES ('32', '移除格式数据', '30', '27');
INSERT INTO `project_authority` VALUES ('33', '浏览基本信息', '11', '25');
INSERT INTO `project_authority` VALUES ('34', '浏览文件', '27', '26');
INSERT INTO `project_authority` VALUES ('35', '浏览应用', '42', '28');
INSERT INTO `project_authority` VALUES ('36', '浏览应用结果', '57', '29');
INSERT INTO `project_authority` VALUES ('37', '浏览主题', '74', '31');
INSERT INTO `project_authority` VALUES ('38', '浏览成员', '63', '30');
INSERT INTO `project_authority` VALUES ('39', '浏览格式数据', '31', '27');

-- ----------------------------
-- Table structure for `project_custom_role`
-- ----------------------------
DROP TABLE IF EXISTS `project_custom_role`;
CREATE TABLE `project_custom_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL COMMENT '角色名',
  `p_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `authorities` varchar(255) DEFAULT NULL COMMENT '权限编号列表',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `create_datetime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `updater_id` int(11) DEFAULT NULL COMMENT '更新人ID',
  `update_datetime` varchar(255) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目内定制角色';

-- ----------------------------
-- Records of project_custom_role
-- ----------------------------
INSERT INTO `project_custom_role` VALUES ('1', '创建者', '113', '23,22,21,20,11,10,24,25,26,27,30,31,40,41,42,50,51,52,53,54,55,56,57,60,61,62,63,70,71,72,73,74,', '30', '2018-06-29 15:55:37', null, null);
INSERT INTO `project_custom_role` VALUES ('2', '项目成员', '113', '74,63,57,42,31,27,11,', '30', '2018-06-29 15:55:37', null, null);
INSERT INTO `project_custom_role` VALUES ('3', '访问者', '113', '11,27,31,42,57,63,74,', '30', '2018-06-29 15:55:37', null, null);
INSERT INTO `project_custom_role` VALUES ('4', '创建者', '114', '23,22,21,20,11,10,24,25,26,27,30,31,40,41,42,50,51,52,53,54,55,56,57,60,61,62,63,70,71,72,73,74,', '30', '2018-06-29 17:21:33', null, null);
INSERT INTO `project_custom_role` VALUES ('5', '项目成员', '114', '11,10,27,20,21,22,23,24,25,26,31,30,42,40,41,57,56,63,74', '30', '2018-06-29 17:21:33', '30', '2018-07-02 15:24:26');
INSERT INTO `project_custom_role` VALUES ('6', '访问者', '114', '11,27,31,42,57,63,74,', '30', '2018-06-29 17:21:33', null, null);
INSERT INTO `project_custom_role` VALUES ('8', '自定义角色1', '114', '11', '30', '2018-07-02 09:47:30', '30', '2018-07-02 09:56:29');
INSERT INTO `project_custom_role` VALUES ('10', '自定义角色2', '114', '10', '30', '2018-07-02 09:55:16', '30', '2018-07-02 10:01:03');
INSERT INTO `project_custom_role` VALUES ('11', '创建者', '115', '23,22,21,20,11,10,24,25,26,27,30,31,40,41,42,50,51,52,53,54,55,56,57,60,61,62,63,70,71,72,73,74,', '47', '2018-07-03 17:01:24', null, null);
INSERT INTO `project_custom_role` VALUES ('12', '项目成员', '115', '74,63,57,42,31,27,11,', '47', '2018-07-03 17:01:24', null, null);
INSERT INTO `project_custom_role` VALUES ('13', '访问者', '115', '11,27,31,42,57,63,74,', '47', '2018-07-03 17:01:24', null, null);
INSERT INTO `project_custom_role` VALUES ('14', '创建者', '116', '23,22,21,20,11,10,24,25,26,27,30,31,40,41,42,50,51,52,53,54,55,56,57,60,61,62,63,70,71,72,73,74,', '47', '2018-07-03 17:02:59', null, null);
INSERT INTO `project_custom_role` VALUES ('15', '项目成员', '116', '74,63,57,42,31,27,11,', '47', '2018-07-03 17:02:59', null, null);
INSERT INTO `project_custom_role` VALUES ('16', '访问者', '116', '11,27,31,42,57,63,74,', '47', '2018-07-03 17:02:59', null, null);
INSERT INTO `project_custom_role` VALUES ('17', '创建者', '117', '23,22,21,20,11,10,24,25,26,27,30,31,40,41,42,50,51,52,53,54,55,56,57,60,61,62,63,70,71,72,73,74,', '36', '2018-07-03 17:23:24', null, null);
INSERT INTO `project_custom_role` VALUES ('18', '项目成员', '117', '74,63,57,42,31,27,11,', '36', '2018-07-03 17:23:24', null, null);
INSERT INTO `project_custom_role` VALUES ('19', '访问者', '117', '11,27,31,42,57,63,74,', '36', '2018-07-03 17:23:24', null, null);

-- ----------------------------
-- Table structure for `project_data_relation`
-- ----------------------------
DROP TABLE IF EXISTS `project_data_relation`;
CREATE TABLE `project_data_relation` (
  `p_id` int(11) NOT NULL COMMENT '项目ID',
  `source_data_id` varchar(50) NOT NULL COMMENT '格式数据类型ID',
  `cs_id` int(11) NOT NULL COMMENT '采集源ID',
  PRIMARY KEY (`p_id`,`source_data_id`,`cs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='dzjin-项目格式数据关系表';

-- ----------------------------
-- Records of project_data_relation
-- ----------------------------
INSERT INTO `project_data_relation` VALUES ('77', '1_48_1', '48');
INSERT INTO `project_data_relation` VALUES ('77', '1_48_2', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_1', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_10', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_11', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_12', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_13', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_14', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_15', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_16', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_17', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_2', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_3', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_4', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_5', '48');
INSERT INTO `project_data_relation` VALUES ('90', '30_48_6', '48');
INSERT INTO `project_data_relation` VALUES ('91', '35_48_10', '48');
INSERT INTO `project_data_relation` VALUES ('91', '35_48_11', '48');
INSERT INTO `project_data_relation` VALUES ('91', '35_48_12', '48');
INSERT INTO `project_data_relation` VALUES ('92', '34_48_2', '48');
INSERT INTO `project_data_relation` VALUES ('92', '34_48_3', '48');

-- ----------------------------
-- Table structure for `project_file`
-- ----------------------------
DROP TABLE IF EXISTS `project_file`;
CREATE TABLE `project_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `floder_id` int(11) DEFAULT NULL COMMENT '文件夹ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `file_location` varchar(1024) DEFAULT NULL COMMENT '文件存储地址',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `file_size` double(10,0) DEFAULT NULL COMMENT '文件大小',
  `create_datetime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目文件\r\n';

-- ----------------------------
-- Records of project_file
-- ----------------------------
INSERT INTO `project_file` VALUES ('31', '59', 'Android Studio自带侧滑栏的解析.docx', '1529996324354.docx', '.docx', '295', '2018-06-26 14:58:44', '30');
INSERT INTO `project_file` VALUES ('32', '59', 'Android 开发.docx', '1529996592459.docx', '.docx', '21', '2018-06-26 15:03:12', '1');
INSERT INTO `project_file` VALUES ('33', '59', 'Centos shell.docx', '1529996595294.docx', '.docx', '15', '2018-06-26 15:03:15', '1');
INSERT INTO `project_file` VALUES ('38', '74', 'test.docx', '1530069256332.docx', '.docx', '0', '2018-06-27 11:14:16', '35');
INSERT INTO `project_file` VALUES ('39', '75', 'desk7.jpg', '1530069258138.jpg', '.jpg', '821', '2018-06-27 11:14:18', '34');
INSERT INTO `project_file` VALUES ('40', '74', 'test-2.docx', '1530069260394.docx', '.docx', '14', '2018-06-27 11:14:20', '35');
INSERT INTO `project_file` VALUES ('41', '75', 'desk6.jpg', '1530069288130.jpg', '.jpg', '1524', '2018-06-27 11:14:48', '34');
INSERT INTO `project_file` VALUES ('42', '79', 'test.docx', '1530069306899.docx', '.docx', '0', '2018-06-27 11:15:06', '35');
INSERT INTO `project_file` VALUES ('43', '79', 'test-2.docx', '1530069310651.docx', '.docx', '14', '2018-06-27 11:15:10', '35');
INSERT INTO `project_file` VALUES ('44', '75', 'desk5.jpg', '1530069313104.jpg', '.jpg', '90', '2018-06-27 11:15:13', '34');
INSERT INTO `project_file` VALUES ('45', '81', 'test.txt', '1530069347993.txt', '.txt', '0', '2018-06-27 11:15:47', '35');
INSERT INTO `project_file` VALUES ('46', '81', 'test2.txt', '1530069379514.txt', '.txt', '0', '2018-06-27 11:16:19', '35');
INSERT INTO `project_file` VALUES ('47', '76', 'selenium_scrollTop.note', '1530069392921.note', '.note', '1', '2018-06-27 11:16:32', '34');
INSERT INTO `project_file` VALUES ('48', '76', 'python_stylerules.note', '1530069413496.note', '.note', '4', '2018-06-27 11:16:53', '34');
INSERT INTO `project_file` VALUES ('49', '82', 'test.docx', '1530069420202.docx', '.docx', '0', '2018-06-27 11:17:00', '35');
INSERT INTO `project_file` VALUES ('50', '82', 'test-2.docx', '1530069425230.docx', '.docx', '14', '2018-06-27 11:17:05', '35');
INSERT INTO `project_file` VALUES ('52', '87', 'test.docx', '1530083886456.docx', '.docx', '0', '2018-06-27 15:18:06', '36');
INSERT INTO `project_file` VALUES ('53', '87', 'test-2.docx', '1530083889596.docx', '.docx', '14', '2018-06-27 15:18:09', '36');
INSERT INTO `project_file` VALUES ('54', '88', 'test.txt', '1530083902904.txt', '.txt', '0', '2018-06-27 15:18:22', '36');
INSERT INTO `project_file` VALUES ('55', '88', 'test2.txt', '1530083912405.txt', '.txt', '0', '2018-06-27 15:18:32', '36');
INSERT INTO `project_file` VALUES ('61', '89', '运行应用的对接材料.docx', '1530143571007.docx', '.docx', '544', '2018-06-28 07:52:51', '30');
INSERT INTO `project_file` VALUES ('62', '89', '平台权限管理注意事项.docx', '1530143580310.docx', '.docx', '14', '2018-06-28 07:53:00', '30');
INSERT INTO `project_file` VALUES ('64', '89', 'usermanage.html', '1530144650501.html', '.html', '24', '2018-06-28 08:10:50', '30');
INSERT INTO `project_file` VALUES ('70', '99', 'word list 8.mp3', '1530606427955.mp3', '.mp3', '9705', '2018-07-03 16:27:07', '30');

-- ----------------------------
-- Table structure for `project_floder`
-- ----------------------------
DROP TABLE IF EXISTS `project_floder`;
CREATE TABLE `project_floder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `floder_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父节点ID',
  `is_root` smallint(6) DEFAULT '0' COMMENT '是否是根节点 0不是；1是',
  `p_id` int(11) DEFAULT NULL COMMENT '项目ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目文件目录';

-- ----------------------------
-- Records of project_floder
-- ----------------------------
INSERT INTO `project_floder` VALUES ('59', '测试文件夹名称', null, '1', '76');
INSERT INTO `project_floder` VALUES ('60', '测试文件夹名称2', null, '1', '76');
INSERT INTO `project_floder` VALUES ('61', '一级文件夹', '60', '0', null);
INSERT INTO `project_floder` VALUES ('62', 'ddd', null, '1', '77');
INSERT INTO `project_floder` VALUES ('63', 'dddd', '62', '0', null);
INSERT INTO `project_floder` VALUES ('64', '测试', null, '1', '91');
INSERT INTO `project_floder` VALUES ('65', '测试2', null, '1', '91');
INSERT INTO `project_floder` VALUES ('66', 'root_test1', null, '1', '92');
INSERT INTO `project_floder` VALUES ('67', 'toot_test2', null, '1', '92');
INSERT INTO `project_floder` VALUES ('68', 'child_2_1', '67', '0', null);
INSERT INTO `project_floder` VALUES ('69', 'child_2_2', '67', '0', null);
INSERT INTO `project_floder` VALUES ('70', 'child_1_1', '66', '0', null);
INSERT INTO `project_floder` VALUES ('71', 'child_1_2', '66', '0', null);
INSERT INTO `project_floder` VALUES ('72', 'child_1_2', '66', '0', null);
INSERT INTO `project_floder` VALUES ('73', 'root_test2', null, '1', '92');
INSERT INTO `project_floder` VALUES ('75', 'child_1_1_1', '70', '0', null);
INSERT INTO `project_floder` VALUES ('76', 'child_1_2_1', '71', '0', null);
INSERT INTO `project_floder` VALUES ('77', 'child_1_2_2', '71', '0', null);
INSERT INTO `project_floder` VALUES ('78', 'child_1_2_3', '71', '0', null);
INSERT INTO `project_floder` VALUES ('79', 'word', '64', '0', null);
INSERT INTO `project_floder` VALUES ('81', 'txt', '64', '0', null);
INSERT INTO `project_floder` VALUES ('82', '测试word', '65', '0', null);
INSERT INTO `project_floder` VALUES ('86', '627', null, '1', '100');
INSERT INTO `project_floder` VALUES ('87', 'word', '86', '0', null);
INSERT INTO `project_floder` VALUES ('88', 'txt', '86', '0', null);
INSERT INTO `project_floder` VALUES ('89', '根文件夹1', null, '1', '90');
INSERT INTO `project_floder` VALUES ('90', '根文件夹2', null, '1', '90');
INSERT INTO `project_floder` VALUES ('91', '子文件1', '89', '0', null);
INSERT INTO `project_floder` VALUES ('92', '子文件2', '89', '0', null);
INSERT INTO `project_floder` VALUES ('93', '子文件3', '89', '0', null);
INSERT INTO `project_floder` VALUES ('94', '子文件1', '90', '0', null);
INSERT INTO `project_floder` VALUES ('95', '子文件2', '90', '0', null);
INSERT INTO `project_floder` VALUES ('96', '111', null, '1', '114');
INSERT INTO `project_floder` VALUES ('98', '222', null, '1', '114');
INSERT INTO `project_floder` VALUES ('99', '1111', '96', '0', null);
INSERT INTO `project_floder` VALUES ('100', '测试703', null, '1', '117');
INSERT INTO `project_floder` VALUES ('101', 'text', '100', '0', null);

-- ----------------------------
-- Table structure for `project_role`
-- ----------------------------
DROP TABLE IF EXISTS `project_role`;
CREATE TABLE `project_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `create_datetime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `update_datetime` varchar(255) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目内成员角色表';

-- ----------------------------
-- Records of project_role
-- ----------------------------
INSERT INTO `project_role` VALUES ('1', '创建者', '2018-06-24 09:57:12', '2018-06-27 11:076:17');
INSERT INTO `project_role` VALUES ('2', '项目成员', '2018-06-26 11:01:41', '2018-06-27 13:246:53');
INSERT INTO `project_role` VALUES ('3', '访问者', '2018-06-26 11:02:54', '2018-06-27 10:546:04');

-- ----------------------------
-- Table structure for `project_role_authority`
-- ----------------------------
DROP TABLE IF EXISTS `project_role_authority`;
CREATE TABLE `project_role_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `authority_id` int(11) DEFAULT NULL COMMENT '权限ID',
  `bind_datetime` varchar(255) DEFAULT NULL COMMENT '绑定时间',
  `user_id` int(11) DEFAULT NULL COMMENT '绑定人ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目角色权限关系表';

-- ----------------------------
-- Records of project_role_authority
-- ----------------------------
INSERT INTO `project_role_authority` VALUES ('128', '3', '33', '2018-06-27 10:546:04', '30');
INSERT INTO `project_role_authority` VALUES ('169', '1', '5', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('168', '1', '4', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('167', '1', '3', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('166', '1', '2', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('165', '1', '33', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('164', '1', '1', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('215', '2', '37', '2018-06-27 13:246:54', '30');
INSERT INTO `project_role_authority` VALUES ('214', '2', '38', '2018-06-27 13:246:54', '30');
INSERT INTO `project_role_authority` VALUES ('213', '2', '36', '2018-06-27 13:246:54', '30');
INSERT INTO `project_role_authority` VALUES ('212', '2', '35', '2018-06-27 13:246:54', '30');
INSERT INTO `project_role_authority` VALUES ('211', '2', '39', '2018-06-27 13:246:54', '30');
INSERT INTO `project_role_authority` VALUES ('210', '2', '34', '2018-06-27 13:246:54', '30');
INSERT INTO `project_role_authority` VALUES ('209', '2', '33', '2018-06-27 13:246:54', '30');
INSERT INTO `project_role_authority` VALUES ('129', '3', '34', '2018-06-27 10:546:04', '30');
INSERT INTO `project_role_authority` VALUES ('130', '3', '39', '2018-06-27 10:546:04', '30');
INSERT INTO `project_role_authority` VALUES ('131', '3', '35', '2018-06-27 10:546:04', '30');
INSERT INTO `project_role_authority` VALUES ('132', '3', '36', '2018-06-27 10:546:04', '30');
INSERT INTO `project_role_authority` VALUES ('133', '3', '38', '2018-06-27 10:546:04', '30');
INSERT INTO `project_role_authority` VALUES ('134', '3', '37', '2018-06-27 10:546:04', '30');
INSERT INTO `project_role_authority` VALUES ('170', '1', '6', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('171', '1', '7', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('172', '1', '8', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('173', '1', '34', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('174', '1', '32', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('175', '1', '39', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('176', '1', '9', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('177', '1', '10', '2018-06-27 11:076:17', '30');
INSERT INTO `project_role_authority` VALUES ('178', '1', '35', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('179', '1', '11', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('180', '1', '12', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('181', '1', '13', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('182', '1', '14', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('183', '1', '15', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('184', '1', '16', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('185', '1', '17', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('186', '1', '36', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('187', '1', '22', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('188', '1', '23', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('189', '1', '24', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('190', '1', '38', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('191', '1', '18', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('192', '1', '19', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('193', '1', '20', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('194', '1', '21', '2018-06-27 11:076:18', '30');
INSERT INTO `project_role_authority` VALUES ('195', '1', '37', '2018-06-27 11:076:18', '30');

-- ----------------------------
-- Table structure for `project_topic`
-- ----------------------------
DROP TABLE IF EXISTS `project_topic`;
CREATE TABLE `project_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL COMMENT '帖子内容',
  `create_datetime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `last_datetime` varchar(255) DEFAULT NULL COMMENT '最后发言时间',
  `follow_up_num` int(11) DEFAULT '0' COMMENT '跟帖数量',
  `look_num` int(11) DEFAULT '0' COMMENT '查看次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目主题表';

-- ----------------------------
-- Records of project_topic
-- ----------------------------
INSERT INTO `project_topic` VALUES ('36', '77', '1', 'xxxx', '2018-06-27 09:34:02', '2018-06-27 09:34:18', '1', '3');
INSERT INTO `project_topic` VALUES ('39', '92', '34', 'topic1', '2018-06-27 11:41:44', '2018-06-27 11:42:01', '2', '3');
INSERT INTO `project_topic` VALUES ('42', '107', '38', '讨论', '2018-06-27 14:57:55', '2018-06-27 14:57:55', '0', '1');
INSERT INTO `project_topic` VALUES ('43', '90', '30', '111', '2018-06-27 16:37:49', '2018-06-28 19:39:39', '1', '3');
INSERT INTO `project_topic` VALUES ('44', '90', '30', '222', '2018-06-27 16:37:53', '2018-06-27 16:37:53', '0', '0');
INSERT INTO `project_topic` VALUES ('45', '90', '30', '333', '2018-06-27 16:37:58', '2018-06-27 16:37:58', '0', '1');
INSERT INTO `project_topic` VALUES ('46', '90', '30', '4', '2018-06-27 16:40:39', '2018-06-27 16:40:39', '0', '0');
INSERT INTO `project_topic` VALUES ('47', '90', '30', '555', '2018-06-27 16:40:43', '2018-06-27 16:40:43', '0', '0');
INSERT INTO `project_topic` VALUES ('48', '90', '30', '666', '2018-06-27 16:40:47', '2018-06-27 16:40:47', '0', '0');
INSERT INTO `project_topic` VALUES ('49', '90', '30', '777', '2018-06-27 16:40:50', '2018-06-27 16:40:50', '0', '0');
INSERT INTO `project_topic` VALUES ('56', '114', '30', '222', '2018-07-03 16:58:12', '2018-07-03 16:58:19', '1', '2');
INSERT INTO `project_topic` VALUES ('54', '90', '30', '121212', '2018-06-27 16:41:15', '2018-06-28 19:58:39', '14', '39');

-- ----------------------------
-- Table structure for `project_topic_follow`
-- ----------------------------
DROP TABLE IF EXISTS `project_topic_follow`;
CREATE TABLE `project_topic_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_topic_id` int(11) DEFAULT NULL COMMENT '项目内主题ID',
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_datetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目主题跟帖表';

-- ----------------------------
-- Records of project_topic_follow
-- ----------------------------
INSERT INTO `project_topic_follow` VALUES ('44', '54', '30', '33', '2018-06-28 19:57:46');
INSERT INTO `project_topic_follow` VALUES ('29', '36', '1', 'xxxxx', '2018-06-27 09:34:18');
INSERT INTO `project_topic_follow` VALUES ('30', '37', '34', 'hi ~~~~~~~~~~~', '2018-06-27 11:39:34');
INSERT INTO `project_topic_follow` VALUES ('34', '39', '34', 'hi~~~~~~~~~~~~~~~~~~~````', '2018-06-27 11:41:55');
INSERT INTO `project_topic_follow` VALUES ('32', '37', '34', 'sdfgedgergwgg', '2018-06-27 11:40:41');
INSERT INTO `project_topic_follow` VALUES ('35', '39', '34', 'sdsf werwgfw4rf', '2018-06-27 11:42:01');
INSERT INTO `project_topic_follow` VALUES ('36', '40', '35', 'ssssssssssssssssssssss', '2018-06-27 11:42:03');
INSERT INTO `project_topic_follow` VALUES ('38', '43', '30', '222', '2018-06-28 19:39:39');
INSERT INTO `project_topic_follow` VALUES ('43', '54', '30', '22', '2018-06-28 19:57:42');
INSERT INTO `project_topic_follow` VALUES ('41', '55', '30', '11', '2018-06-28 19:57:29');
INSERT INTO `project_topic_follow` VALUES ('42', '54', '30', '11', '2018-06-28 19:57:38');
INSERT INTO `project_topic_follow` VALUES ('45', '54', '30', '44', '2018-06-28 19:57:50');
INSERT INTO `project_topic_follow` VALUES ('46', '54', '30', '55', '2018-06-28 19:57:56');
INSERT INTO `project_topic_follow` VALUES ('47', '54', '30', '66', '2018-06-28 19:58:00');
INSERT INTO `project_topic_follow` VALUES ('48', '54', '30', '77', '2018-06-28 19:58:04');
INSERT INTO `project_topic_follow` VALUES ('49', '54', '30', '88', '2018-06-28 19:58:08');
INSERT INTO `project_topic_follow` VALUES ('50', '54', '30', '99', '2018-06-28 19:58:13');
INSERT INTO `project_topic_follow` VALUES ('51', '54', '30', '10', '2018-06-28 19:58:17');
INSERT INTO `project_topic_follow` VALUES ('52', '54', '30', '11', '2018-06-28 19:58:21');
INSERT INTO `project_topic_follow` VALUES ('53', '54', '30', '12', '2018-06-28 19:58:27');
INSERT INTO `project_topic_follow` VALUES ('54', '54', '30', '13', '2018-06-28 19:58:31');
INSERT INTO `project_topic_follow` VALUES ('55', '54', '30', '14', '2018-06-28 19:58:35');
INSERT INTO `project_topic_follow` VALUES ('57', '56', '30', '222', '2018-07-03 16:58:19');

-- ----------------------------
-- Table structure for `project_user`
-- ----------------------------
DROP TABLE IF EXISTS `project_user`;
CREATE TABLE `project_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目-用户关系表ID',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `bind_date_time` datetime DEFAULT NULL COMMENT '绑定时间',
  `role_id` int(11) DEFAULT '0' COMMENT '项目成员角色ID',
  `linkman_id` int(11) DEFAULT NULL COMMENT '联系人ID(也就是邀请人ID）',
  `authoritys` varchar(255) DEFAULT NULL COMMENT '实际包含的权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COMMENT='dzjin-项目-用户关系表';

-- ----------------------------
-- Records of project_user
-- ----------------------------
INSERT INTO `project_user` VALUES ('143', '74', '30', '2018-06-26 14:36:58', '2', '30', null);
INSERT INTO `project_user` VALUES ('145', '76', '30', '2018-06-26 14:41:12', '1', '30', null);
INSERT INTO `project_user` VALUES ('146', '77', '1', '2018-06-26 17:12:04', '1', '1', null);
INSERT INTO `project_user` VALUES ('148', '79', '30', '2018-06-26 22:40:35', '1', '30', null);
INSERT INTO `project_user` VALUES ('150', '81', '30', '2018-06-26 22:40:42', '1', '30', null);
INSERT INTO `project_user` VALUES ('151', '82', '30', '2018-06-26 22:40:46', '1', '30', null);
INSERT INTO `project_user` VALUES ('152', '83', '30', '2018-06-26 22:40:50', '1', '30', null);
INSERT INTO `project_user` VALUES ('153', '84', '30', '2018-06-26 22:40:53', '1', '30', null);
INSERT INTO `project_user` VALUES ('154', '85', '30', '2018-06-26 22:40:58', '1', '30', null);
INSERT INTO `project_user` VALUES ('157', '88', '30', '2018-06-26 22:41:13', '1', '30', null);
INSERT INTO `project_user` VALUES ('158', '89', '30', '2018-06-26 22:41:19', '1', '30', null);
INSERT INTO `project_user` VALUES ('160', '77', '30', '2018-06-27 09:36:03', '2', '1', null);
INSERT INTO `project_user` VALUES ('161', '91', '35', '2018-06-27 10:13:34', '1', '35', null);
INSERT INTO `project_user` VALUES ('164', '94', '34', '2018-06-27 10:53:30', '1', '34', null);
INSERT INTO `project_user` VALUES ('165', '95', '34', '2018-06-27 11:05:44', '1', '34', null);
INSERT INTO `project_user` VALUES ('166', '96', '35', '2018-06-27 11:06:33', '1', '35', null);
INSERT INTO `project_user` VALUES ('167', '97', '35', '2018-06-27 11:08:27', '1', '35', null);
INSERT INTO `project_user` VALUES ('168', '98', '35', '2018-06-27 11:08:35', '1', '35', null);
INSERT INTO `project_user` VALUES ('169', '99', '35', '2018-06-27 11:08:45', '1', '35', null);
INSERT INTO `project_user` VALUES ('174', '91', '31', '2018-06-27 11:35:17', '1', '35', null);
INSERT INTO `project_user` VALUES ('175', '91', '32', '2018-06-27 11:35:17', '1', '35', null);
INSERT INTO `project_user` VALUES ('176', '92', '30', '2018-06-27 11:35:53', '1', '34', null);
INSERT INTO `project_user` VALUES ('177', '92', '33', '2018-06-27 11:35:53', '2', '34', null);
INSERT INTO `project_user` VALUES ('178', '92', '31', '2018-06-27 11:36:06', '3', '34', null);
INSERT INTO `project_user` VALUES ('180', '100', '36', '2018-06-27 13:16:41', '1', '36', null);
INSERT INTO `project_user` VALUES ('184', '104', '34', '2018-06-27 13:18:44', '1', '34', null);
INSERT INTO `project_user` VALUES ('185', '77', '34', '2018-06-27 13:19:03', '1', '34', null);
INSERT INTO `project_user` VALUES ('187', '77', '33', '2018-06-27 13:25:20', '1', '34', null);
INSERT INTO `project_user` VALUES ('190', '105', '34', '2018-06-27 13:40:30', '1', '34', null);
INSERT INTO `project_user` VALUES ('191', '106', '37', '2018-06-27 14:25:55', '1', '37', null);
INSERT INTO `project_user` VALUES ('192', '107', '38', '2018-06-27 14:57:04', '1', '38', null);
INSERT INTO `project_user` VALUES ('198', '90', '30', '2018-06-27 16:20:34', '1', '30', null);
INSERT INTO `project_user` VALUES ('203', '90', '31', '2018-06-27 16:32:13', '2', '30', null);
INSERT INTO `project_user` VALUES ('204', '90', '32', '2018-06-27 16:32:13', '2', '30', null);
INSERT INTO `project_user` VALUES ('210', '111', '30', '2018-06-28 21:06:46', '1', '30', null);
INSERT INTO `project_user` VALUES ('211', '112', '30', '2018-06-28 21:10:27', '1', '30', null);
INSERT INTO `project_user` VALUES ('213', '90', '34', '2018-06-29 09:26:32', '2', '30', null);
INSERT INTO `project_user` VALUES ('214', '90', '36', '2018-06-29 09:26:32', '2', '30', null);
INSERT INTO `project_user` VALUES ('216', '113', '34', '2018-06-29 17:20:33', '2', '30', null);
INSERT INTO `project_user` VALUES ('217', '113', '36', '2018-06-29 17:20:33', '2', '30', null);
INSERT INTO `project_user` VALUES ('218', '114', '30', '2018-06-29 17:21:33', '4', '30', null);
INSERT INTO `project_user` VALUES ('219', '114', '34', '2018-06-29 17:25:09', '2', '30', null);
INSERT INTO `project_user` VALUES ('220', '114', '36', '2018-06-29 17:25:09', '6', '30', null);
INSERT INTO `project_user` VALUES ('221', '114', '1', '2018-07-02 15:21:02', '5', '1', null);
INSERT INTO `project_user` VALUES ('222', '77', '12', '2018-07-03 10:35:46', '2', '1', null);
INSERT INTO `project_user` VALUES ('223', '115', '47', '2018-07-03 17:01:24', '11', '47', null);
INSERT INTO `project_user` VALUES ('224', '116', '47', '2018-07-03 17:02:59', '14', '47', null);
INSERT INTO `project_user` VALUES ('226', '117', '36', '2018-07-03 17:23:24', '17', '36', null);
INSERT INTO `project_user` VALUES ('227', '115', '34', '2018-07-03 17:26:31', '2', '34', null);
INSERT INTO `project_user` VALUES ('229', '114', '47', '2018-07-03 17:36:50', '2', '47', null);
INSERT INTO `project_user` VALUES ('230', '117', '47', '2018-07-03 17:37:21', '2', '47', null);

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT '资源名',
  `type` varchar(50) DEFAULT NULL COMMENT '资源类型',
  `url` varchar(200) DEFAULT NULL COMMENT '资源地址',
  `parent_id` int(20) DEFAULT NULL COMMENT '父id',
  `parent_ids` varchar(100) DEFAULT NULL COMMENT '父ids',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限',
  `available` int(1) DEFAULT '0' COMMENT '是否有效 0：否 1：是',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='ltj-资源表';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('11', '项目管理', 'menu', 'project', '0', '0/', 'project:*', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('12', '项目新增', 'button', null, '11', '0/11/', 'project:create', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('13', '项目修改', 'button', null, '11', '0/11/', 'project:update', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('14', '项目删除', 'button', null, '11', '0/11/', 'project:delete', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('15', '项目查看', 'button', null, '11', '0/11/', 'project:view', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('21', '格式数据', 'menu', 'format', '0', '0/', 'format:*', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('22', '格式数据新增', 'button', null, '21', '0/21/', 'format:create', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('23', '格式数据修改', 'button', null, '21', '0/21/', 'format:update', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('24', '格式数据删除', 'button', null, '21', '0/21/', 'format:delete', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('25', '格式数据查看', 'button', null, '21', '0/21/', 'format:view', '0', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('31', '应用管理', 'menu', 'application', '0', '0/', 'application:*', '1', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('32', '应用新增', 'button', null, '31', '0/31/', 'application:create', '1', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('33', '应用修改', 'button', null, '31', '0/31/', 'application:update', '1', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('34', '应用删除', 'button', null, '31', '0/31/', 'application:delete', '1', '2018-05-29 11:51:17', null);
INSERT INTO `resource` VALUES ('35', '应用查看', 'button', '', '31', '0/31/', 'application:view', '1', '2018-05-29 11:51:17', '2018-06-20 17:20:41');
INSERT INTO `resource` VALUES ('41', '组织管理', 'menu', 'organization', '0', '0/', 'organization:*', '1', '2018-05-29 11:51:17', '0000-00-00 00:00:00');
INSERT INTO `resource` VALUES ('42', '组织新增', 'button', '', '41', '0/41/', 'organization:create', '1', '2018-06-21 12:04:54', '2018-06-21 12:05:22');
INSERT INTO `resource` VALUES ('43', '组织修改', 'button', '', '41', '0/41/', 'organization:update', '1', '2018-06-21 12:13:13', null);
INSERT INTO `resource` VALUES ('44', '组织删除', 'button', '', '41', '0/41/', 'organization:delete', '1', '2018-06-21 12:13:40', null);
INSERT INTO `resource` VALUES ('45', '组织查看', 'button', '', '41', '0/41/', 'organization:view', '1', '2018-06-21 12:13:54', null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `resource_ids` varchar(100) DEFAULT NULL COMMENT '资源ids',
  `available` int(1) DEFAULT '0' COMMENT '是否可用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ltj-角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '超级管理员', '12,13,14,15,22,23,24,25,32,33,34,35,42,43,44,45', '1', '2018-05-02 13:46:26', '2018-06-21 12:14:52');
INSERT INTO `role` VALUES ('3', 'user', '普通用户', '32,33,34,35,42,43,44,45', null, null, '2018-06-21 14:33:35');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(1) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `is_registrable` int(1) DEFAULT NULL COMMENT '可注册 0-否 1-是',
  `size` int(10) DEFAULT NULL COMMENT '用户空间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ltj-系统配置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '1', '20');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) DEFAULT NULL COMMENT '盐',
  `gender` int(1) DEFAULT NULL COMMENT '性别 0:女 1:男',
  `research_direction` varchar(255) DEFAULT NULL COMMENT '研究方向',
  `personal_profile` varchar(255) DEFAULT NULL COMMENT '个人简介',
  `role_ids` varchar(100) DEFAULT NULL COMMENT '角色ids',
  `organization_id` int(20) DEFAULT NULL COMMENT '组织id',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机号',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `headimg` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='ltj-用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', ' ', ' ', ' ', '0', ' ', ' ', ' ', null, null, null, null, null, null, '1');
INSERT INTO `user` VALUES ('1', 'admin', 'd3c59d25033dbf980d29554025c23a75', '8d78869f470951332959580424d4bf4f', '1', '核心技术', '简介23333', '1', '0', '18611111111', '472746759@qq.com', '/wankangyuan/userFiles/1/headImg.jpg', null, '2018-07-03 16:59:41', '1');
INSERT INTO `user` VALUES ('30', 'dzjin', '58ce44846be5935a817d0b6f5e9f3896', '4a541b41c59a668568383e8ced500063', null, null, null, '3', '28', '13821951017', 'dzjin5678@163.com', '/wankangyuan/userFiles/30/headImg.jpg', '2018-06-26 14:21:41', '2018-07-03 18:11:52', '1');
INSERT INTO `user` VALUES ('31', 'a121bc', 'cff2685f019157ea9a5fe3393214fac0', '9c4559a6da6a577a5704cd3b8f6e0b0f', null, null, null, '3', '26', '18322069238', 'a121bc1@163.com', '/wankangyuan/static/img/touxiang_6.png', '2018-06-26 15:27:33', '2018-07-03 13:46:48', '1');
INSERT INTO `user` VALUES ('32', '472746759', '45ea6008ba6f66b0f59ce5620d5a3cdf', '197f8929faefd7c1bf1375433abcc754', null, null, null, '3', '26', '18322069239', '472746759@qq.com', '/wankangyuan/static/img/touxiang_7.png', '2018-06-26 15:58:01', '2018-06-26 15:58:34', '1');
INSERT INTO `user` VALUES ('33', 'julien', '4c6355e0d3403203e17ca9ed01123697', '167d430e39ecd61d42f559953e4cea7c', null, null, null, '3', '28', '15822117400', '849647122@qq.com', null, '2018-06-26 16:12:13', '2018-06-26 16:57:22', '1');
INSERT INTO `user` VALUES ('34', 'wul', '4451537a3b47362c27e8fcc88a4c0d9a', '1fa516e0ed515cf2228339e447da4d51', '0', 'bioinfomatics', 'this is a description about ...', '1', '34', '13502114315', 'wuling199102@gmail.com', '/wankangyuan/userFiles/34/headImg.jpg', '2018-06-27 10:10:03', '2018-07-03 17:28:45', '1');
INSERT INTO `user` VALUES ('35', '李菲菲_test_1', '4f944e97519e104bb62fe68b3358f7df', 'c39deb88b90e115e9e672e43388671cf', '0', '123', 'lifeifei123', '3', '0', '15111112223', 'feifei.li@myhealthgene.com', null, '2018-06-27 10:10:29', '2018-07-03 17:45:56', '1');
INSERT INTO `user` VALUES ('36', 'lifeifei', '2c6577200f47fb4cd52a3c703a02f800', 'cf8a194483df947ef735e008c38fe2ea', '0', '11111', '11111', '1', '34', '11111', 'feifei.li@myhealthgene.com', '/wankangyuan/static/img/touxiang_4.png', '2018-06-27 12:46:01', '2018-07-03 17:46:36', '1');
INSERT INTO `user` VALUES ('37', 'max', '5f2808a2af679d4dcc10bfaa6b43b718', '7895ba866ccc9bc9989d52e1229f67a4', null, null, null, '1', '0', '12345678910', 'xi.ma@myhealthgene.com', '/wankangyuan/static/img/touxiang_3.png', '2018-06-27 13:58:41', '2018-07-03 16:36:58', '1');
INSERT INTO `user` VALUES ('38', 'ray', '2872bbb2b4135674055c6bb5d8dbf1c9', 'bfedc2c0f8a284b33658487fff04d223', '0', '7788', '1234567...', '3', '0', '18511898292', 'wenjie.lei@myhealthgene.com', '/wankangyuan/static/img/touxiang_7.png', '2018-06-27 14:00:34', '2018-06-27 14:32:43', '1');
INSERT INTO `user` VALUES ('39', 'ray01', '832dcbd32ec895cab3cf7ad9285102cd', 'd0ccd064541fcbd7014761825a471320', null, null, null, '3', '0', '17602278292', 'leiwenjie0829@126.com', '/wankangyuan/static/img/touxiang_6.png', '2018-06-27 14:19:53', '2018-06-27 14:20:15', '1');
INSERT INTO `user` VALUES ('40', 'ray', '9c42791d243760440698e2fc7348be0e', '7a3cb7fa963aa59669eccb4625d1331c', null, null, null, '3', '0', '12345678912', '18511898292@163.com', '/wankangyuan/static/img/touxiang_2.png', '2018-06-27 14:29:50', null, '1');
INSERT INTO `user` VALUES ('41', 'wul', 'f2a26536cb0a0b1e7a8a412982354b48', 'd8728d5d5febe04ba4ba0050de44bc20', null, null, null, '3', '0', '15711260611', 'yonghui.gong@myhealthgene.com', '/wankangyuan/static/img/touxiang_6.png', '2018-06-28 09:28:09', null, '1');
INSERT INTO `user` VALUES ('42', 'wultest1', '93abb00ec49ff9d984a52a8763447bab', '06c4b0aceb2c361dc019d1e01262568a', '0', 'bioinfo', 'this is  a description about me', '3', '0', '18920121295', 'ling.wu@myhealthgene.com', '/wankangyuan/static/img/touxiang_7.png', '2018-06-28 11:06:26', '2018-06-28 14:39:20', '1');
INSERT INTO `user` VALUES ('43', 'a121bc1', '615db8cb6bce06723a3cdb610eb1eae8', '5ee51ed318ba3e3ef8b88bfcd0827c23', null, null, null, '3', '0', '18322069338', 'a121bc@163.com', '/wankangyuan/static/img/head.jpg', '2018-06-29 16:58:09', '2018-06-29 16:58:25', '1');
INSERT INTO `user` VALUES ('45', 'xxx', 'be4251bd5b87f577b5e01243531e33e2', '2b79c02b900efa79c3f3d35b09dbd399', null, null, null, '3', '0', '123456', 'q223@qq.com', '/wankangyuan/static/img/head.jpg', '2018-07-02 15:50:44', '2018-07-03 13:39:50', '1');
INSERT INTO `user` VALUES ('46', 'test1', 'b73a1b2caecbdd93e7b42d0d81f7b408', 'dd5bd201aa3c3f75407096e3eade5676', null, null, null, '3', '0', '', 'a2018@qq.com', '/wankangyuan/static/img/head.jpg', '2018-07-03 14:47:59', null, '1');
INSERT INTO `user` VALUES ('47', 'wuling', '846fe80bb14e8962722cf384ea510be1', 'f4b8ae065bcf3581c10c61ed2bb7d40f', '1', 'bio', 'gkhj', '3', '0', '18900000002', '1169804109@qq.com', '/wankangyuan/static/img/head.jpg', '2018-07-03 16:40:47', '2018-07-03 17:36:28', '1');

-- ----------------------------
-- Table structure for `user_app_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_app_relation`;
CREATE TABLE `user_app_relation` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(30) DEFAULT NULL COMMENT '用户名',
  `app_id` int(30) DEFAULT NULL COMMENT '我的应用id',
  `app_name` varchar(20) DEFAULT NULL COMMENT '应用名称',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `app_type` varchar(20) DEFAULT NULL COMMENT '应用类别',
  `is_async` int(1) DEFAULT NULL COMMENT '同步/异步 0-同步 1-异步',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `app_overview` varchar(255) DEFAULT NULL COMMENT '应用概述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='ltj-用户应用关系';

-- ----------------------------
-- Records of user_app_relation
-- ----------------------------
INSERT INTO `user_app_relation` VALUES ('53', '1', '180', 'dddd', 'admin', 'd', '1', 'd', '2018-06-27 09:04:37', 'dddd');
INSERT INTO `user_app_relation` VALUES ('54', '1', '177', '应用20180626', 'a121bc', '测序', '1', '类别、测试', '2018-06-26 15:28:37', '描述~~');
INSERT INTO `user_app_relation` VALUES ('55', '34', '180', 'dddd', 'admin', 'd', '1', 'd', '2018-06-27 09:04:37', 'dddd');
INSERT INTO `user_app_relation` VALUES ('56', '36', '186', 'myapp1', 'wul', null, null, null, '2018-06-27 13:52:43', 'myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1myapp1');
INSERT INTO `user_app_relation` VALUES ('57', '36', '187', 'myapp2', 'wul', null, null, null, '2018-06-27 13:52:53', 'myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2myapp2');

-- ----------------------------
-- View structure for `view_collection_source_field`
-- ----------------------------
DROP VIEW IF EXISTS `view_collection_source_field`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_collection_source_field` AS select `collection_source_field`.`csf_id` AS `csf_id`,`collection_source_field`.`cs_id` AS `cs_id`,`collection_source_field`.`csf_name` AS `csf_name`,`collection_source_field`.`type` AS `type`,`collection_source_field`.`check_rule` AS `check_rule`,`collection_source_field`.`enumerated` AS `enumerated`,`collection_source_field`.`not_null` AS `not_null`,`collection_source_field`.`description` AS `description`,`collection_source_field`.`error_msg` AS `error_msg`,`collection_source_field`.`create_datetime` AS `create_datetime`,`creator`.`id` AS `create_uid`,`creator`.`username` AS `creator`,`collection_source_field`.`update_datetime` AS `update_datetime`,`updater`.`id` AS `update_uid`,`updater`.`username` AS `updater` from ((`collection_source_field` left join `user` `creator` on((`collection_source_field`.`create_uid` = `creator`.`id`))) left join `user` `updater` on((`collection_source_field`.`update_uid` = `updater`.`id`))) ;

-- ----------------------------
-- View structure for `view_format_type`
-- ----------------------------
DROP VIEW IF EXISTS `view_format_type`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_format_type` AS select `format_type`.`ft_id` AS `ft_id`,`format_type`.`ft_name` AS `ft_name`,`format_type`.`cs_id` AS `cs_id`,`format_type`.`floder` AS `floder`,`format_type`.`create_datetime` AS `create_datetime`,`format_type`.`create_uid` AS `create_uid`,`creator`.`username` AS `creator`,`format_type`.`update_datetime` AS `update_datetime`,`format_type`.`update_uid` AS `update_uid`,`updater`.`username` AS `updater`,`format_type`.`is_view` AS `is_view` from ((`format_type` join `user` `creator` on((`format_type`.`create_uid` = `creator`.`id`))) join `user` `updater` on((`format_type`.`update_uid` = `updater`.`id`))) ;
