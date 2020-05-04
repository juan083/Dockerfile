/*
 Navicat Premium Data Transfer

 Source Server         : 香港-腾讯云
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 119.28.24.109:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 04/05/2020 10:52:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE test;
USE test;
-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
BEGIN;
INSERT INTO `test` VALUES (1, 'hello-1');
INSERT INTO `test` VALUES (2, 'hello-2');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
