/*
 Navicat Premium Data Transfer

 Source Server         : link
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : oj

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 18/12/2018 10:02:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `ex_id` int(7) NOT NULL AUTO_INCREMENT COMMENT '考试编号',
  `ex_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '考试名称',
  `ex_start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `ex_end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `ex_limit` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '根据学号限制那些同学参考 如2016，只运行2016级同学参加，201601，只允许2016级计科专业同学参加',
  `ex_pb_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '根据二进制判断这个考试有那些题',
  `ex_ans_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '考试全部答案',
  PRIMARY KEY (`ex_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1025 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (666, '第666场模拟赛', '2018-12-17 12:00:00', '2018-12-17 14:00:00', NULL, '1010101010', 'BCABC');
INSERT INTO `exam` VALUES (1024, '第1024场模拟赛', '2018-12-14 12:00:00', '2018-12-14 14:00:00', NULL, '1010110010', 'BCAAC');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `pb_id` int(7) NOT NULL AUTO_INCREMENT COMMENT '问题编号',
  `pb_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '问题描述',
  `pb_A` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'A选项',
  `pb_B` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'B选项',
  `pb_C` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'C选项',
  `pb_D` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'D选项',
  `pb_answer` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '问题答案',
  `pb_tag` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '问题标签',
  `pb_level` int(7) NULL DEFAULT NULL COMMENT '问题难度',
  PRIMARY KEY (`pb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1015 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (1001, '在8位进制补码中， 10101011表示的数是十进制下的(  )。', '43', '-85', '-43', '-84', 'B', '', 3);
INSERT INTO `problem` VALUES (1002, '计算机存储数据为基本单位是(   )。', 'bit', 'Byte', 'GB', 'KB', 'B', NULL, 1);
INSERT INTO `problem` VALUES (1003, '下列协议中与电子邮件无关的是(   )。', 'POP3', 'SMTP', 'WTO', 'FTP', 'C', NULL, 1);
INSERT INTO `problem` VALUES (1004, '分辨率为800x600、16位色的位图，存储图像信息所需的空间为(  )。', '937.5KB', '4218.75KB', '4320KB', '2880KB', 'A', NULL, 2);
INSERT INTO `problem` VALUES (1005, '计算机应用的最早域是(  )。', '数值计算', '人工智能', '机器人', '过程控制', 'A', NULL, 1);
INSERT INTO `problem` VALUES (1006, '下列不属丁面向对象程序设计语言的是(  )。', 'C', 'C++', 'Java', 'C#', 'A', NULL, 1);
INSERT INTO `problem` VALUES (1007, 'NOI的中文意思是(  )。', '中国信息学联赛', '全国青少年信息学奥林匹克竞赛', '中国青少年信息学奥林匹克竞赛', '中国计算机协会', 'B', NULL, 1);
INSERT INTO `problem` VALUES (1008, '2017年10月1日是星期日，1999年10月1日是( )。', '星期三', '星期日', '星期五', '星期二', 'C', NULL, 2);
INSERT INTO `problem` VALUES (1009, '甲、乙、丙三位同学选修课程，从4门课程中，甲选修2门，乙、丙各选修3 门，则不同的选修方案共有(  )种。', '36', '48', '96', '192', 'C', NULL, 3);
INSERT INTO `problem` VALUES (1010, '设G是有n个结点m条边(n≤m) 为连通图，必项删去G的(  )条边，才能使得G 变成一棵树。', 'm-n+1', 'm-n', 'n+m+1', 'n-m+1', 'A', NULL, 3);
INSERT INTO `problem` VALUES (1011, 'AAAAA', 'A', 'B', 'C', 'D', 'A', NULL, 1);
INSERT INTO `problem` VALUES (1012, 'B', 'qwe', 'asd', 'xzc', 'rty', 'C', NULL, 5);
INSERT INTO `problem` VALUES (1013, 'qqq', 'q', 'q', 'q', 'q', 'A', NULL, 1);
INSERT INTO `problem` VALUES (1014, 'sad', '', '', '', '', 'B', NULL, 1);

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result`  (
  `rs_id` int(7) NOT NULL AUTO_INCREMENT COMMENT '结果编号',
  `us_id` int(7) NULL DEFAULT NULL COMMENT '用户编号',
  `ex_id` int(7) NULL DEFAULT NULL COMMENT '考试编号',
  `rs_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '该用户在这场考试中的答题情况',
  `rs_grades` int(7) NULL DEFAULT NULL COMMENT '该用户在这场考试中的成绩',
  PRIMARY KEY (`rs_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES (2, 1, 1024, 'ABBCA', 0);
INSERT INTO `result` VALUES (3, 1, 666, 'BBCDA', 20);
INSERT INTO `result` VALUES (4, 1, 666, 'DCCBA', 40);
INSERT INTO `result` VALUES (5, 1, 1024, 'BACAA', 40);
INSERT INTO `result` VALUES (6, 2, 666, 'CCCBA', 40);
INSERT INTO `result` VALUES (7, 2, 1024, 'ACDDA', 20);
INSERT INTO `result` VALUES (8, 1, 666, 'ADADA', 20);
INSERT INTO `result` VALUES (9, 2, 666, 'ACABA', 60);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `us_id` int(7) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `us_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '登录账号',
  `us_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '登录密码',
  `us_role` int(7) NULL DEFAULT NULL COMMENT '用户身份， 1：教师，2：学生',
  `us_student_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '学号：长度为10，4位年份；2位专业；2位班级；2位学号',
  `us_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `us_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户电话：长度为11',
  PRIMARY KEY (`us_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'ehanla0@163.com', '114210', 2, '16401010220', '马超', '15257854645');
INSERT INTO `user` VALUES (2, 'ehanla1@163.com', '114210', 1, '16401010221', '赵云', '15257854645');
INSERT INTO `user` VALUES (3, 'ehanla2@163.com', '114210', 1, '16401010222', '诸葛亮', '15257854645');
INSERT INTO `user` VALUES (4, 'ehanla3@163.com', '114210', 1, '16401010223', '黄忠', '15257854645');
INSERT INTO `user` VALUES (5, 'ehanla4@163.com', '114210', 1, '16401010224', '吕布', '15257854645');
INSERT INTO `user` VALUES (6, 'ehanla20@163.com', '123456', 1, NULL, 'DDD', NULL);

SET FOREIGN_KEY_CHECKS = 1;
