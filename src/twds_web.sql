/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50096
 Source Host           : localhost:3306
 Source Schema         : twds_web

 Target Server Type    : MySQL
 Target Server Version : 50096
 File Encoding         : 65001

 Date: 05/11/2019 21:13:01
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `mId` int(11) NULL DEFAULT NULL,
  `cl_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cl_year` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cl_num` int(11) NOT NULL,
  PRIMARY KEY USING BTREE (`cl_id`),
  INDEX `FK_Reference_12` USING BTREE(`mId`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`mId`) REFERENCES `majors` (`mId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 18432 kB; (`mId`) REFER `twds_web/majors`(`mId`) ON UPDATE CASCADE' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (2, 3, '软件1701', '2017', 36);
INSERT INTO `classes` VALUES (3, 4, '网络1702', '2018', 40);
INSERT INTO `classes` VALUES (4, 2, '市场营销1701', '2017', 40);
INSERT INTO `classes` VALUES (5, 3, '软件1702', '2017', 36);
INSERT INTO `classes` VALUES (6, 3, '软件1902', '2017', 36);
INSERT INTO `classes` VALUES (7, 2, '市场营销1802', '2018', 39);
INSERT INTO `classes` VALUES (8, 5, '汽营1801', '2018', 52);
INSERT INTO `classes` VALUES (9, 5, '汽营1902', '2019', 56);

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY USING BTREE (`c_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '信息工程学院');
INSERT INTO `college` VALUES (2, '经济管理学院');
INSERT INTO `college` VALUES (3, '艺术设计学院');
INSERT INTO `college` VALUES (4, '车辆运用学院');
INSERT INTO `college` VALUES (5, '车辆工程学院');
INSERT INTO `college` VALUES (6, '机电管理学院');
INSERT INTO `college` VALUES (7, '士官教育学院');

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`  (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NULL DEFAULT NULL,
  `fId` int(11) NULL DEFAULT NULL,
  `co_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `co_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `co_week` double(10, 2) NOT NULL,
  `co_weNum` int(11) NOT NULL,
  `co_total` double(10, 2) NOT NULL,
  `co_term` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `state` enum('0','1') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY USING BTREE (`co_id`),
  INDEX `FK_Reference_5` USING BTREE(`c_id`),
  INDEX `fId` USING BTREE(`fId`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`fId`) REFERENCES `formula` (`fId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`c_id`) REFERENCES `college` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 18432 kB; (`fId`) REFER `twds_web/formula`(`fId`) ON UPDATE CASCADE' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES (1, 1, 1, 'Java课程设计', '必修课', 8.00, 18, 72.00, '2017年下学期', '1');
INSERT INTO `courses` VALUES (2, 1, 1, 'MySQL入门教程', '必修课', 4.00, 12, 40.00, '2019年上学期', '1');
INSERT INTO `courses` VALUES (3, 2, 1, '营销策略', '必修课', 4.00, 9, 32.00, '2019年上学期', '1');
INSERT INTO `courses` VALUES (4, 1, 1, 'HTML+CSSj基础课程', '必修课', 8.00, 10, 80.00, '2019年下学期', '1');
INSERT INTO `courses` VALUES (5, 2, 1, '营销策略', '必修课', 4.00, 10, 40.00, '2018年上学期', '1');
INSERT INTO `courses` VALUES (6, 2, 1, '统计学', '必修课', 4.00, 9, 36.00, '2019年上学期', '1');
INSERT INTO `courses` VALUES (7, 4, 1, '汽车营销理论基础', '必修课', 4.00, 9, 36.00, '2019年上学期', '0');
INSERT INTO `courses` VALUES (8, 1, 1, '商务英语', '公开课', 2.00, 19, 38.00, '2019年下学期', '0');
INSERT INTO `courses` VALUES (9, 2, 1, '商务英语', '公开课', 2.00, 19, 38.00, '2019年下学期', '0');

-- ----------------------------
-- Table structure for examines
-- ----------------------------
DROP TABLE IF EXISTS `examines`;
CREATE TABLE `examines`  (
  `eId` int(11) NOT NULL AUTO_INCREMENT,
  `tId` int(11) NULL DEFAULT NULL,
  `eWeek` int(11) NOT NULL,
  `value` double(10, 2) NOT NULL,
  `result` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `etime` datetime NOT NULL,
  PRIMARY KEY USING BTREE (`eId`),
  INDEX `FK_Reference_16` USING BTREE(`tId`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`tId`) REFERENCES `t_courses` (`tId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 18432 kB; (`tId`) REFER `twds_web/t_courses`(`tId`) ON UPDATE CASCA' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of examines
-- ----------------------------
INSERT INTO `examines` VALUES (5, 6, 1, 4.00, '1', '2019-10-26 18:29:18');
INSERT INTO `examines` VALUES (6, 6, 2, 4.00, '1', '2019-10-26 18:29:18');
INSERT INTO `examines` VALUES (7, 6, 3, 3.00, '0', '2019-10-26 18:29:18');
INSERT INTO `examines` VALUES (8, 6, 4, 4.00, '1', '2019-10-26 18:29:18');
INSERT INTO `examines` VALUES (9, 7, 1, 4.00, '0', '2019-10-26 20:15:14');
INSERT INTO `examines` VALUES (10, 7, 2, 4.00, '1', '2019-10-26 20:15:14');
INSERT INTO `examines` VALUES (11, 7, 3, 4.00, '2', '2019-10-26 20:15:14');
INSERT INTO `examines` VALUES (12, 7, 4, 2.00, '0', '2019-10-26 20:15:14');
INSERT INTO `examines` VALUES (13, 1, 1, 8.00, '0', '2019-10-26 22:14:40');
INSERT INTO `examines` VALUES (14, 1, 2, 7.00, '1', '2019-10-26 22:14:40');
INSERT INTO `examines` VALUES (15, 1, 3, 8.00, '1', '2019-10-26 22:14:40');
INSERT INTO `examines` VALUES (16, 1, 4, 8.00, '1', '2019-10-26 22:14:40');
INSERT INTO `examines` VALUES (17, 3, 1, 4.00, '1', '2019-10-28 16:43:08');
INSERT INTO `examines` VALUES (18, 3, 2, 4.00, '0', '2019-10-28 16:43:08');
INSERT INTO `examines` VALUES (19, 3, 3, 4.00, '0', '2019-10-28 16:43:08');
INSERT INTO `examines` VALUES (20, 3, 4, 4.00, '0', '2019-10-28 16:43:08');
INSERT INTO `examines` VALUES (21, 5, 1, 8.00, '0', '2019-10-28 16:44:07');
INSERT INTO `examines` VALUES (22, 5, 2, 8.00, '0', '2019-10-28 16:44:07');
INSERT INTO `examines` VALUES (23, 5, 3, 8.00, '0', '2019-10-28 16:44:07');
INSERT INTO `examines` VALUES (24, 5, 4, 7.00, '0', '2019-10-28 16:44:07');

-- ----------------------------
-- Table structure for formula
-- ----------------------------
DROP TABLE IF EXISTS `formula`;
CREATE TABLE `formula`  (
  `fId` int(11) NOT NULL AUTO_INCREMENT,
  `expression` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fName` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `p1` double(10, 2) NOT NULL DEFAULT 0.00,
  `p2` double(10, 2) NOT NULL DEFAULT 0.00,
  `p3` double(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY USING BTREE (`fId`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of formula
-- ----------------------------
INSERT INTO `formula` VALUES (1, 'P=L*X*Y', '理论课程标准工作量', 0.00, 0.00, 0.00);
INSERT INTO `formula` VALUES (3, 'P=L*X+Y', '指导竞赛工作量', 0.00, 0.00, 0.00);
INSERT INTO `formula` VALUES (8, 'P=L*X*Y+p1', '实验工作量', 12.00, 0.00, 0.00);

-- ----------------------------
-- Table structure for majors
-- ----------------------------
DROP TABLE IF EXISTS `majors`;
CREATE TABLE `majors`  (
  `mId` int(11) NOT NULL AUTO_INCREMENT,
  `mName` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c_id` int(11) NOT NULL,
  PRIMARY KEY USING BTREE (`mId`),
  INDEX `c_id` USING BTREE(`c_id`),
  CONSTRAINT `majors_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `college` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 18432 kB; (`c_id`) REFER `twds_web/college`(`c_id`) ON UPDATE CASCA' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of majors
-- ----------------------------
INSERT INTO `majors` VALUES (2, '市场营销', 2);
INSERT INTO `majors` VALUES (3, '软件技术', 1);
INSERT INTO `majors` VALUES (4, '网络技术', 1);
INSERT INTO `majors` VALUES (5, '汽车营销', 4);

-- ----------------------------
-- Table structure for oworkload
-- ----------------------------
DROP TABLE IF EXISTS `oworkload`;
CREATE TABLE `oworkload`  (
  `oId` int(11) NOT NULL AUTO_INCREMENT,
  `oType` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `oValue` double(10, 2) NOT NULL,
  PRIMARY KEY USING BTREE (`oId`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oworkload
-- ----------------------------
INSERT INTO `oworkload` VALUES (1, '监考', 4.00);
INSERT INTO `oworkload` VALUES (2, '出卷/1份', 6.00);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY USING BTREE (`roleId`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '系统管理员');
INSERT INTO `role` VALUES (2, '教务管理员');
INSERT INTO `role` VALUES (3, '系部管理员');
INSERT INTO `role` VALUES (4, '老师');

-- ----------------------------
-- Table structure for t_courses
-- ----------------------------
DROP TABLE IF EXISTS `t_courses`;
CREATE TABLE `t_courses`  (
  `tId` int(11) NOT NULL AUTO_INCREMENT,
  `co_id` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `cl_id` int(11) NULL DEFAULT NULL,
  `state` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0',
  PRIMARY KEY USING BTREE (`tId`),
  INDEX `FK_Reference_15` USING BTREE(`cl_id`),
  INDEX `FK_Reference_13` USING BTREE(`co_id`),
  INDEX `FK_Reference_14` USING BTREE(`userId`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`co_id`) REFERENCES `courses` (`co_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`cl_id`) REFERENCES `classes` (`cl_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 18432 kB; (`co_id`) REFER `twds_web/courses`(`co_id`) ON UPDATE CAS' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_courses
-- ----------------------------
INSERT INTO `t_courses` VALUES (1, 1, 5, 2, '0');
INSERT INTO `t_courses` VALUES (3, 2, 5, 5, '0');
INSERT INTO `t_courses` VALUES (4, 3, 7, 4, '0');
INSERT INTO `t_courses` VALUES (5, 4, 8, 6, '0');
INSERT INTO `t_courses` VALUES (6, 5, 7, 7, '0');
INSERT INTO `t_courses` VALUES (7, 6, 7, 7, '0');

-- ----------------------------
-- Table structure for toworkload
-- ----------------------------
DROP TABLE IF EXISTS `toworkload`;
CREATE TABLE `toworkload`  (
  `toId` int(11) NOT NULL AUTO_INCREMENT,
  `oId` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `toName` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `toTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`toId`),
  INDEX `FK_Reference_19` USING BTREE(`userId`),
  INDEX `FK_Reference_18` USING BTREE(`oId`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`oId`) REFERENCES `oworkload` (`oId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 18432 kB; (`oId`) REFER `twds_web/oworkload`(`oId`) ON UPDATE CASCA' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of toworkload
-- ----------------------------
INSERT INTO `toworkload` VALUES (1, 1, 4, '监考软件1701班MySQL期末考试', '2019-11-06 08:00:00');
INSERT INTO `toworkload` VALUES (2, 2, 8, '出一份MySQL数据库考试试卷', '2019-11-01 23:59:59');
INSERT INTO `toworkload` VALUES (3, 1, 7, '监考软件1701班MySQL期末考试', '2019-11-06 08:00:00');
INSERT INTO `toworkload` VALUES (5, 1, 9, '监考汽营1901班汽车营销理论基础期末考试', '2020-01-10 09:00:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `w_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`userId`),
  INDEX `FK_Reference_1` USING BTREE(`roleId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'InnoDB free: 18432 kB; (`roleId`) REFER `twds_web/role`(`roleId`) ON UPDATE CASC' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 1, '1', 'admin', '670b14728ad9902aecba32e22fa4f6bd', '崔老师', '666666@qq.com', '13554378723');
INSERT INTO `user` VALUES (4, 2, '1', 'admin1', '21218cca77804d2ba1922c33e0151105', '李老师', '666666@qq.com', '13554378723');
INSERT INTO `user` VALUES (5, 4, '2', 'teacher', '670b14728ad9902aecba32e22fa4f6bd', '刘老师', '666666@qq.com', '13554378723');
INSERT INTO `user` VALUES (6, 3, '2', 'Teacher', '670b14728ad9902aecba32e22fa4f6bd', '王老师', '666666@qq.com', '13554378723');
INSERT INTO `user` VALUES (7, 4, '4', 'teacher1', '670b14728ad9902aecba32e22fa4f6bd', '李老师', '666666@qq.com', '13334567635');
INSERT INTO `user` VALUES (8, 4, '1', 'teacher2', '670b14728ad9902aecba32e22fa4f6bd', '崔老师', '666666@qq.com', '13435657546');
INSERT INTO `user` VALUES (9, 4, '9', 'teacher3', '670b14728ad9902aecba32e22fa4f6bd', '吴老师', '666666@qq.com', '13562677697');

-- ----------------------------
-- Table structure for workteam
-- ----------------------------
DROP TABLE IF EXISTS `workteam`;
CREATE TABLE `workteam`  (
  `w_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `work_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY USING BTREE (`w_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of workteam
-- ----------------------------
INSERT INTO `workteam` VALUES (1, '1', '软件开发教研室');
INSERT INTO `workteam` VALUES (2, '1', '网络技术教研室');
INSERT INTO `workteam` VALUES (4, '2', '市场营销教研室');
INSERT INTO `workteam` VALUES (7, '3', '室内设计教研室1');
INSERT INTO `workteam` VALUES (9, '4', '汽车营销教研室');

-- ----------------------------
-- Table structure for xparam
-- ----------------------------
DROP TABLE IF EXISTS `xparam`;
CREATE TABLE `xparam`  (
  `xId` int(11) NOT NULL AUTO_INCREMENT,
  `fId` int(11) NULL DEFAULT NULL,
  `value` double(10, 2) NOT NULL,
  PRIMARY KEY USING BTREE (`xId`),
  INDEX `fId` USING BTREE(`fId`),
  CONSTRAINT `xparam_ibfk_1` FOREIGN KEY (`fId`) REFERENCES `formula` (`fId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '授课人数校正系数; InnoDB free: 18432 kB; (`fId`) REFER `twds_web/formula`(`fId`) ON UPDA' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xparam
-- ----------------------------
INSERT INTO `xparam` VALUES (1, 1, 1.00);
INSERT INTO `xparam` VALUES (3, 1, 1.10);
INSERT INTO `xparam` VALUES (5, 8, 1.20);
INSERT INTO `xparam` VALUES (6, 8, 0.80);

-- ----------------------------
-- Table structure for yparam
-- ----------------------------
DROP TABLE IF EXISTS `yparam`;
CREATE TABLE `yparam`  (
  `yId` int(11) NOT NULL AUTO_INCREMENT,
  `fId` int(11) NULL DEFAULT NULL,
  `floor` int(11) NOT NULL,
  `toplimit` int(11) NOT NULL,
  `value` double(10, 2) NOT NULL,
  PRIMARY KEY USING BTREE (`yId`),
  INDEX `fId` USING BTREE(`fId`),
  CONSTRAINT `yparam_ibfk_1` FOREIGN KEY (`fId`) REFERENCES `formula` (`fId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '班级或教学组织形式校正系数; InnoDB free: 18432 kB; (`fId`) REFER `twds_web/formula`(`fId`) ON' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of yparam
-- ----------------------------
INSERT INTO `yparam` VALUES (1, 1, 0, 29, 0.80);
INSERT INTO `yparam` VALUES (2, 1, 30, 55, 1.00);
INSERT INTO `yparam` VALUES (3, 1, 56, 100, 1.10);
INSERT INTO `yparam` VALUES (4, 8, 30, 50, 1.00);
INSERT INTO `yparam` VALUES (5, 8, 10, 30, 0.80);

SET FOREIGN_KEY_CHECKS = 1;
