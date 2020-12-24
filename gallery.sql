/*
 Navicat Premium Data Transfer

 Source Server         : AliyunSQL6612
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : 123.56.103.167:6612
 Source Schema         : gallery

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 18/05/2020 16:38:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `anid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'announcement',
  `userid` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `link` varchar(100) DEFAULT NULL,
  `click` int(10) unsigned DEFAULT '0',
  `uploadtime` datetime DEFAULT NULL COMMENT '推送时间',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `isdelete` int(1) unsigned DEFAULT '0',
  PRIMARY KEY (`anid`) USING BTREE,
  KEY `fk_userid_user_announcement` (`userid`),
  CONSTRAINT `fk_userid_user_announcement` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------
BEGIN;
INSERT INTO `announcement` VALUES (1, 2, 'test', '测试文本test', 'http://bing.com', 58, '2020-05-13 11:40:04', '2020-05-13 11:40:12', '2020-05-13 11:40:09', 0);
INSERT INTO `announcement` VALUES (2, 2, 'test2', '测试测试测试test', '测试链接baidu.com', 36, '2020-05-13 14:32:19', '2020-05-13 14:32:23', '2020-05-13 14:32:26', 0);
INSERT INTO `announcement` VALUES (3, 1, 'test123', 'qweqwetest123', 'http://bing.com', 3, '2020-05-14 18:37:01', '2020-05-14 18:37:06', '2020-05-14 18:37:10', 0);
INSERT INTO `announcement` VALUES (4, 2, 'test161', 'test163', NULL, 0, '2020-05-16 07:59:32', '2020-05-16 07:59:32', '2020-05-16 07:59:32', 0);
INSERT INTO `announcement` VALUES (5, 2, 'test161', 'test163', NULL, 0, '2020-05-16 08:00:42', '2020-05-16 08:00:42', '2020-05-16 08:00:42', 0);
INSERT INTO `announcement` VALUES (6, 2, 'sss', 'sss', NULL, 0, '2020-05-16 08:15:53', '2020-05-16 08:15:53', '2020-05-16 08:15:53', 1);
INSERT INTO `announcement` VALUES (7, 2, 'fff', 'fff', NULL, 0, '2020-05-16 08:19:19', '2020-05-16 08:19:19', '2020-05-16 08:19:19', 1);
COMMIT;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `arid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `label` varchar(40) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `click` int(10) unsigned DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `isdelete` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`arid`),
  KEY `fk_userid_user_article` (`userid`),
  CONSTRAINT `fk_userid_user_article` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commenttype` char(20) DEFAULT NULL,
  `arid` int(10) unsigned DEFAULT NULL,
  `anid` int(10) unsigned DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `totype` char(20) DEFAULT NULL,
  `touserid` int(10) unsigned DEFAULT NULL,
  `toarid` int(10) unsigned DEFAULT NULL,
  `toanid` int(10) unsigned DEFAULT NULL,
  `isdelete` int(1) unsigned DEFAULT '0',
  `text` text,
  `click` int(10) unsigned DEFAULT NULL,
  `sendtime` datetime DEFAULT NULL,
  PRIMARY KEY (`coid`),
  KEY `fk_userid_user_comment` (`userid`),
  CONSTRAINT `fk_userid_user_comment` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 0, '111', 0, '2020-05-13 15:21:00');
INSERT INTO `comment` VALUES (4, NULL, NULL, NULL, 2, NULL, NULL, NULL, 2, 0, '333333', NULL, NULL);
INSERT INTO `comment` VALUES (6, NULL, NULL, NULL, 3, NULL, NULL, NULL, 2, 0, 'qweqwe', NULL, '2020-05-14 00:31:24');
INSERT INTO `comment` VALUES (7, NULL, NULL, NULL, 3, NULL, NULL, NULL, 2, 0, '123465\r\n', NULL, '2020-05-14 00:34:37');
INSERT INTO `comment` VALUES (8, NULL, NULL, NULL, 2, NULL, NULL, NULL, 2, 0, 'asdasdasdasdasd', NULL, '2020-05-14 00:34:51');
INSERT INTO `comment` VALUES (9, NULL, NULL, NULL, 2, NULL, NULL, NULL, 2, 0, 'qweqwe', NULL, '2020-05-14 21:41:20');
INSERT INTO `comment` VALUES (12, NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, 0, '123', NULL, '2020-05-15 07:41:20');
INSERT INTO `comment` VALUES (18, NULL, NULL, NULL, 2, NULL, NULL, NULL, 2, 0, 'é»ç', NULL, '2020-05-16 10:29:40');
COMMIT;

-- ----------------------------
-- Table structure for databaseelement
-- ----------------------------
DROP TABLE IF EXISTS `databaseelement`;
CREATE TABLE `databaseelement` (
  `eid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `label` text,
  `diseasespestsinfo` text,
  `ismark` int(1) unsigned DEFAULT '0',
  `upuserid` int(10) unsigned DEFAULT NULL,
  `markuserid` int(10) unsigned DEFAULT NULL,
  `autosave` int(1) unsigned DEFAULT '0',
  `aiscan` int(1) unsigned DEFAULT '0',
  `isdelete` int(1) unsigned DEFAULT '0',
  `filename` text,
  PRIMARY KEY (`eid`),
  KEY `fk_did_databasepool_databaseelement` (`did`),
  KEY `fk_userid_user_datebaseelement` (`upuserid`),
  KEY `fk_markuserid_user_databaseelement` (`markuserid`),
  CONSTRAINT `fk_did_databasepool_databaseelement` FOREIGN KEY (`did`) REFERENCES `databasepool` (`did`),
  CONSTRAINT `fk_markuserid_user_databaseelement` FOREIGN KEY (`markuserid`) REFERENCES `user` (`userid`),
  CONSTRAINT `fk_userid_user_datebaseelement` FOREIGN KEY (`upuserid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databaseelement
-- ----------------------------
BEGIN;
INSERT INTO `databaseelement` VALUES (6, 0, '病虫害图片标题test', '病虫害描述', 'testtesttest', 'test', 1, 5, 2, 0, 0, 0, '2020_05_12_10_33_46_截屏2020-05-08上午9.10.08.png');
INSERT INTO `databaseelement` VALUES (7, 2, 'é»ç', 'é»çé»ç', 'é»çé»çé»ç', 'é»çé»ç', 1, 5, 2, 0, 0, 0, '2020_05_12_10_42_46_截屏2020-05-09下午2.22.59.png');
INSERT INTO `databaseelement` VALUES (10, 3, 'q', 'w', 'e', 'r', 1, 2, 2, 0, 0, 0, '2020_05_15_07_27_22_截屏2020-05-13下午6.07.04.png');
INSERT INTO `databaseelement` VALUES (11, 3, 'abc', 'abc', 'abc', 'abc', NULL, 2, NULL, 0, 0, 0, '2020_05_15_08_43_22_截屏2020-05-13下午6.07.04.png');
INSERT INTO `databaseelement` VALUES (12, 3, 'qwe', 'qwe', 'qwe', 'qwe', 1, 2, 2, 0, 0, 0, '2020_05_15_08_36_24_截屏2020-05-13下午6.07.04.png');
INSERT INTO `databaseelement` VALUES (13, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, 0, 0, '2020_05_16_10_31_24_苦瓜.png');
INSERT INTO `databaseelement` VALUES (14, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, 0, 0, '2020_05_16_10_30_26_');
COMMIT;

-- ----------------------------
-- Table structure for databasepool
-- ----------------------------
DROP TABLE IF EXISTS `databasepool`;
CREATE TABLE `databasepool` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  `introduction` text,
  `link` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databasepool
-- ----------------------------
BEGIN;
INSERT INTO `databasepool` VALUES (0, '未分类', '默认上传为未分类分组', '0', '0');
INSERT INTO `databasepool` VALUES (1, '番茄', '番茄病害主要有六种：脐腐病、裂果、烟草花叶病、炭疽病、枯萎病、叶斑。番茄全生育期均可发病。幼苗染病：真叶从下向.上打蔫，叶柄或胚轴上出现凹陷坏死斑，横剖病茎可见维管束变褐，髓部出现空洞。成株期染病：常从植株下部叶片边缘枯萎，逐渐向.上卷起，随后全叶发病，叶片青褐色，皱缩，干枯，垂悬于茎上而不脱落，似干旱缺水枯死状。茎部染病： 出现褪绿条斑，溃疡状，内部中空且维管束变褐，后期下陷或开裂，茎变粗，生出许多庆刺或不定根；湿度大时，有污白色菌脓溢出。果实染病： 严重时产生鸟眼状凸起。', '1', '番茄.png');
INSERT INTO `databasepool` VALUES (2, '黄瓜', '黄瓜病害有20多种，主要有靶斑病、霜霉病、炭疽病、白粉病、细菌性角斑病、叶枯病、褐斑病、猝倒病、立枯病、疫病、灰霉病等病害。其发病主要原因是随天气转暖、气温回升、管理不当出现高温高湿的环境而造成的。黄瓜病害多属混发，且多种病害的发病症状往往很相似，给诊断造成了一定的困难。', '2', '黄瓜.png');
INSERT INTO `databasepool` VALUES (3, '苦瓜', '苦瓜常见病害：苦瓜菌核病、苦瓜斑点病、苦瓜（链格孢）叶枯病、苦瓜灰斑病、苦瓜炭疽病、苦瓜霜霉病、苦瓜白粉病。\n苦瓜发病症状主要危害叶片：不同的病害发病初期叶面出现颜色不同的小斑，病斑扩大受叶脉限制呈不规则形，颜色由浅逐渐变为深，病斑能融合为大病斑。湿度大时在叶背面长出白色霉状物，天气干燥时则很少见到霉层。', '3', '苦瓜.png');
INSERT INTO `databasepool` VALUES (4, '西瓜', '幼苗时期：西瓜猝倒病、西瓜立枯病、西瓜绵腐病。成株期染病：西瓜枯萎病、西瓜黏菌病、西瓜花腐病。西瓜全生育期均可发病：西瓜炭疽病、西瓜蔓枯病、西瓜叶枯病、西瓜细菌性叶斑病、 西瓜病毒病、西瓜白粉病、西瓜褐色腐败病、西瓜黑斑病、 西瓜菌核病、西瓜白绢病、西瓜霜霉病。果实期间：西瓜细菌性软腐病、西瓜脐腐病、西瓜疫病。', '4', '西瓜.png');
COMMIT;

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `msgid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned DEFAULT NULL,
  `touserid` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `sendtime` datetime DEFAULT NULL,
  `isarrive` int(1) unsigned DEFAULT NULL,
  `isread` int(1) unsigned DEFAULT '0',
  `isback` int(1) unsigned DEFAULT '0',
  `idelete` int(1) unsigned DEFAULT '0',
  PRIMARY KEY (`msgid`),
  KEY `fk_userid_user_msg` (`userid`),
  CONSTRAINT `fk_userid_user_msg` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usertoken` char(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `sex` char(5) DEFAULT NULL,
  `tel` char(11) DEFAULT NULL,
  `subscribe` text,
  `usertype` varchar(40) DEFAULT NULL,
  `isadmin` int(1) unsigned DEFAULT '0',
  `isdelete` int(1) unsigned DEFAULT '0',
  `uplogindate` datetime DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'root', 'root', 'root', 'root@root.root', '男', '17863607936', '0,1,2,3,4', 'root', 1, 0, '2020-05-14 17:08:57', '2020-05-14 17:09:00', '2020-05-14 17:09:03');
INSERT INTO `user` VALUES (2, 'admin', 'admin', 'admin', 'admin@admin.admin', '男', '17863607936', '0,1,2,3,4', '管理员', 1, 0, '2020-05-14 17:09:06', '2020-05-14 17:09:10', '2020-05-14 17:09:14');
INSERT INTO `user` VALUES (3, 'zhuanjia', 'zhuanjia', 'zhuanjia', 'zhuanjia@zhuanjia.com', '女', '17863607936', '0,1,2,3,4', '农业专家', 1, 0, '2020-05-10 23:17:50', '2020-05-10 23:17:54', '2020-05-10 23:17:58');
INSERT INTO `user` VALUES (4, 'yanjiuyuan', 'yanjiuyuan', 'yanjiuyuan', 'yanjiuyuan@yanjiuyuan.com', '女', '17863607936', '0,1,2,3,4', '研究员', 1, 0, '2020-05-10 22:05:06', '2020-05-10 22:05:06', '2020-05-10 22:05:06');
INSERT INTO `user` VALUES (5, 'yonghu', 'yonghu', 'yonghu', 'yonghu@yonghu.yonghu', '男', '17863607936', '0,1,2,3,4', '农户', 0, 0, '2020-05-10 22:08:24', '2020-05-10 22:08:24', '2020-05-10 22:08:24');
INSERT INTO `user` VALUES (6, '123', '123', '123', '123@123.123', '男', '17863607936', '0,1,2,3,4', '农户', 0, 0, '2020-05-11 22:52:28', '2020-05-11 22:52:28', '2020-05-11 22:52:28');
INSERT INTO `user` VALUES (7, 'test', 'test', 'test', 'test@test.test', '男', '17863607936', '0,1,2,3,4', '管理员', 1, 0, '2020-05-14 17:09:17', '2020-05-14 17:09:21', '2020-05-14 17:09:25');
INSERT INTO `user` VALUES (48, NULL, 'xxx', 'xxx', 'xxx', '男', 'xxx', NULL, '农业专家', 0, 0, '2020-05-16 07:05:42', '2020-05-16 07:05:42', '2020-05-16 07:05:42');
INSERT INTO `user` VALUES (49, NULL, 's', '4', 'asd@asd.QWe', '男', 'dsadaasda', NULL, '农户', 0, 0, '2020-05-16 07:06:57', '2020-05-16 07:06:57', '2020-05-16 07:06:57');
COMMIT;

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `usertypeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) DEFAULT NULL,
  `authority` varchar(255) DEFAULT '0',
  PRIMARY KEY (`usertypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertype
-- ----------------------------
BEGIN;
INSERT INTO `usertype` VALUES (10001, 'root', '0');
INSERT INTO `usertype` VALUES (10002, '管理员', '1');
INSERT INTO `usertype` VALUES (10003, '农户', '5');
INSERT INTO `usertype` VALUES (10004, '农业专家', '3');
INSERT INTO `usertype` VALUES (10005, '研究员', '4');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
