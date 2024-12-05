/*
 Navicat Premium Dump SQL

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : localhost:3306
 Source Schema         : javashop

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 05/12/2024 00:49:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cover` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `image1` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `image2` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `intro` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_type_id_idx`(`type_id` ASC) USING BTREE,
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (181, ' OPPO Find X8', '/picture/1.jpg', '/picture/1.jpg', '/picture/1.jpg', 4199, 'OPPO Find X8 12GB+256GB 浮光白 无影抓拍 超轻薄直屏 天玑9400 AI一键问屏 5630mAh冰川电池 5G 手机 ', 30, 5);
INSERT INTO `goods` VALUES (182, 'OPPO Reno13', '/picture/2.jpg', '/picture/2.jpg', '/picture/2.jpg', 2649, 'OPPO Reno13 12GB+256GB 午夜黑 超美小直屏 AI高清实况照片 IP69满级防水 双芯抢网 5G智能拍照手机 ', 25, 5);
INSERT INTO `goods` VALUES (183, 'HUAWEI Mate 70 Pro', '/picture/3.jpg', '/picture/3.jpg', '/picture/3.jpg', 6999, 'HUAWEI Mate 70 Pro 12GB+512GB雪域白鸿蒙AI 红枫原色影像 超可靠玄武架构华为鸿蒙智能手机 ', 5, 1);
INSERT INTO `goods` VALUES (184, 'HUAWEI Mate 70 ', '/picture/4.jpg', '/picture/4.jpg', '/picture/4.jpg', 5999, 'HUAWEI Mate 70 12GB+512GB云杉绿鸿蒙AI 红枫原色影像 超可靠玄武架构华为鸿蒙智能手机 ', 10, 1);
INSERT INTO `goods` VALUES (185, 'HUAWEI Mate X6 ', '/picture/5.jpg', '/picture/5.jpg', '/picture/5.jpg', 13999, 'HUAWEI Mate X6 12GB+512GB星云灰分布式玄武架构 鸿蒙大屏AI 红枫原色影像折叠旗舰手机 折叠屏 ', 10, 1);
INSERT INTO `goods` VALUES (186, 'HUAWEI nova 13 Pro', '/picture/6.jpg', '/picture/6.jpg', '/picture/6.jpg', 3549, '华为 nova 13 Pro 256GB 星耀黑 前后多焦段人像 AI修图 北斗卫星图片消息 鸿蒙智能曲面屏手机', 25, 1);
INSERT INTO `goods` VALUES (187, ' 小米（MI）REDMI K80 Pro', '/picture/7.jpg', '/picture/7.jpg', '/picture/7.jpg', 4299, '小米（MI）REDMI K80 Pro 骁龙8至尊版 2K新国屏 全焦段影像 澎湃OS 16GB+512GB 玄夜黑 红米5G手机', 20, 2);
INSERT INTO `goods` VALUES (188, '小米14 ', '/picture/8.jpg', '/picture/8.jpg', '/picture/8.jpg', 3559, '小米14 【12期免息】新品5G手机 徕卡光学镜头 光影猎人900 骁龙8Gen3 黑色 12+256GB ', 15, 2);
INSERT INTO `goods` VALUES (189, '小米15', '/picture/9.jpg', '/picture/9.jpg', '/picture/9.jpg', 4999, ' 小米（MI）小米15 徕卡光学Summilux高速镜头 骁龙8至尊版移动平台 小米澎湃OS 2 16+512 白色 5g手机 ', 10, 2);
INSERT INTO `goods` VALUES (190, '小米Redmi 红米K70至尊版', '/picture/10.jpg', '/picture/10.jpg', '/picture/10.jpg', 2559, '小米Redmi 红米K70至尊版 天玑9300+ IP68 小米龙晶玻璃 新品5G手机 Ultra 墨羽黑 12GB+256GB 【12期免息】 ', 25, 2);
INSERT INTO `goods` VALUES (191, 'vivo iQOO Neo10', '/picture/11.jpg', '/picture/11.jpg', '/picture/11.jpg', 2299, 'vivo iQOO Neo10 12GB+256GB 疾影黑 第三代骁龙8 自研电竞芯片Q2 120W超快闪充 超薄AI游戏学生手机 ', 30, 4);
INSERT INTO `goods` VALUES (192, 'vivo iQOO 13', '/picture/12.jpg', '/picture/12.jpg', '/picture/12.jpg', 4699, ' vivo iQOO 13 16GB+512GB 传奇版 骁龙8至尊版 自研电竞芯片Q2 长续航快充 2K Q10护眼屏 5G电竞手机 ', 15, 4);
INSERT INTO `goods` VALUES (193, 'vivo S19', '/picture/13.jpg', '/picture/13.jpg', '/picture/13.jpg', 2099, 'vivo S19 8GB+256GB 烟雨青 6000mAh超薄长续航 影棚级柔光环 百万跑分第三代骁龙7 拍照 AI 手机 ', 30, 4);
INSERT INTO `goods` VALUES (194, 'iPhone 15 Pro Max', '/picture/14.jpg', '/picture/14.jpg', '/picture/14.jpg', 7849, 'Apple/苹果 iPhone 15 Pro Max (A3108) 256GB 原色钛金属 支持移动联通电信5G 双卡双待手机 ', 30, 3);
INSERT INTO `goods` VALUES (195, 'iPhone 16 Pro Max', '/picture/15.jpg', '/picture/15.jpg', '/picture/15.jpg', 9999, ' Apple/苹果 iPhone 16 Pro Max（A3297）256GB 沙漠色钛金属 支持移动联通电信5G 双卡双待手机 ', 20, 3);
INSERT INTO `goods` VALUES (196, 'Galaxy S23', '/picture/16.jpg', '/picture/16.jpg', '/picture/16.jpg', 3699, '三星（SAMSUNG）Galaxy S23 AI手机 智能修图 拍照手机 第二代骁龙8 游戏手机 同声翻译 8GB+256GB 悠雾紫 5G手机 ', 15, 8);
INSERT INTO `goods` VALUES (197, 'iPhone SE 3代', '/picture/17.jpg', '/picture/17.jpg', '/picture/17.jpg', 2899, 'Apple 苹果 iPhone SE 3代 支持移动电信联通5G手机 全新国行 128G 黑色 官方标配 ', 30, 3);
INSERT INTO `goods` VALUES (198, 'iPhone 15 Plus', '/picture/18.jpg', '/picture/18.jpg', '/picture/18.jpg', 6999, 'Apple/苹果 iPhone 15 Plus (A3096) 256GB 粉色支持移动联通电信5G 双卡双待手机 ', 40, 3);
INSERT INTO `goods` VALUES (199, 'Samsung Galaxy Z Flip6', '/picture/19.jpg', '/picture/19.jpg', '/picture/19.jpg', 7999, '三星Samsung Galaxy Z Flip6 AI手机 折叠屏手机 披荆斩棘哥哥同款 智能外屏 双卡 12GB+256GB 青薄荷 ', 20, 8);
INSERT INTO `goods` VALUES (200, '三星（SAMSUNG）Galaxy S24 Ultra', '/picture/20.jpg', '/picture/20.jpg', '/picture/20.jpg', 6499, '三星（SAMSUNG）Galaxy S24 Ultra Al旗舰智能手机 5G 智享生活办公 SPen书写 S24 Ultra 钛羽黄 12GB+512GB 【港版24年产】店保 ', 10, 8);
INSERT INTO `goods` VALUES (201, '联想拯救者2024 Y9000P', '/picture/21.jpg', '/picture/21.jpg', '/picture/21.jpg', 12099, '联想拯救者2024 Y9000P 16英寸AI高端电竞屏游戏设计满血功耗游戏独显笔记本电脑黑神话悟空官方推荐 【24期莬息】标配14代i9/32/1T/4060 高刷新率 2.5K电竞屏 ', 20, 12);
INSERT INTO `goods` VALUES (202, '联想拯救者Y7000 2024', '/picture/22.jpg', '/picture/22.jpg', '/picture/22.jpg', 7088, '联想拯救者Y7000 2024畅玩黑神话悟空 电竞游戏笔记本电脑学生设计P图满血RTX4060独显8G 旗舰14核酷 i7-13650HX 24G 1TB 4060升级 ', 20, 12);
INSERT INTO `goods` VALUES (203, '联想笔记本电脑小新Pro14', '/picture/23.jpg', '/picture/23.jpg', '/picture/23.jpg', 4799, '联想笔记本电脑小新Pro14超能本 高性能标压酷睿i5 14英寸轻薄本 1T硬盘大内存 2.8K 120Hz高刷屏 ', 20, 12);
INSERT INTO `goods` VALUES (204, '联想（Lenovo）拯救者R9000P', '/picture/24.jpg', '/picture/24.jpg', '/picture/24.jpg', 10499, '联想（Lenovo）拯救者R9000P 16英寸电竞游戏本笔记本电脑(R9-7945HX 16G 1T RTX4070 2.5K 240Hz100%DCI-P3)灰 ', 25, 12);
INSERT INTO `goods` VALUES (205, '惠普（HP）暗影精灵乐享版', '/picture/25.jpg', '/picture/25.jpg', '/picture/25.jpg', 7298, '惠普（HP）暗影精灵乐享版16.1英寸游戏本 畅玩黑神话 笔记本(酷睿14代i7-14650HX RTX4060 16G 512G QHD240) ', 35, 13);
INSERT INTO `goods` VALUES (206, '惠普HP 星Book ', '/picture/26.jpg', '/picture/26.jpg', '/picture/26.jpg', 3499, '惠普HP 星Book 15.6英寸大屏轻薄笔记本电脑(高性能酷睿i7 16G 512G 锐炬Xe显卡 E管家7*24H服务)银 ', 25, 13);
INSERT INTO `goods` VALUES (207, '惠普（HP）战66七代 ', '/picture/27.jpg', '/picture/27.jpg', '/picture/27.jpg', 4599, '惠普（HP）战66七代 AMD锐龙16英寸轻薄笔记本电脑(高性能长续航R7 16G 1T 2.5K高色域低蓝光屏120Hz AI生态) ', 20, 13);
INSERT INTO `goods` VALUES (208, '华为MateBook GT 14 酷睿Ultra', '/picture/28.jpg', '/picture/28.jpg', '/picture/28.jpg', 7499, '华为MateBook GT 14 酷睿Ultra 笔记本电脑 2.8K OLED悬浮屏 轻薄商务办公全能本Ultra 5 32G 1T深空灰 ', 20, 1);
INSERT INTO `goods` VALUES (209, '华为MateBook D 14 SE', '/picture/29.jpg', '/picture/29.jpg', '/picture/29.jpg', 3999, '华为MateBook D 14 SE 2024笔记本电脑 13代酷睿/14英寸护眼全面屏/轻薄办公本 i5 16G 512G 皓月银', 15, 1);
INSERT INTO `goods` VALUES (210, '华为matebook14', '/picture/30.jpg', '/picture/30.jpg', '/picture/30.jpg', 4699, '华为matebook14笔记本电脑商务办公学生设计轻薄本HUAWEI14英寸2K触屏 i7-1260P/16G/512G/2K触屏 【线下零售机 支持全渠道验货】 【标配+399元赠品礼包】 ', 35, 1);
INSERT INTO `goods` VALUES (211, '2024MacBookAir', '/picture/31.jpg', '/picture/31.jpg', '/picture/31.jpg', 7399, 'Apple/苹果AI笔记本/2024MacBookAir13.6英寸M3(8+8核)8G256G深空灰电脑MRXN3CH/A ', 20, 3);
INSERT INTO `goods` VALUES (212, 'REDMI Book 16 2024', '/picture/32.jpg', '/picture/32.jpg', '/picture/32.jpg', 3598, '小米笔记本电脑 红米 REDMI Book 16 2024 酷睿i5标压 16英寸 1TB 办公学生轻薄本(i5 16G 1T) 星辰灰', 15, 2);
INSERT INTO `goods` VALUES (213, 'REDMIBook Pro 16 2024', '/picture/33.jpg', '/picture/33.jpg', '/picture/33.jpg', 7399, '小米笔记本电脑 REDMIBook Pro 16 2024 酷睿Ultra7 3.1K165hz DCI-P3广色域屏 红米轻薄本(32G 1T)', 15, 2);
INSERT INTO `goods` VALUES (214, '华硕天选5Pro 锐龙版', '/picture/34.jpg', '/picture/34.jpg', '/picture/34.jpg', 7749, '华硕天选5Pro 锐龙版 2024新款游戏本旗舰设计绘图办公2.5K高刷屏16英寸笔记本电脑 R9-7940HX/RTX4070 魔幻青 官方标配：16G内存 1T固态 ', 35, 11);
INSERT INTO `goods` VALUES (215, 'ROG魔霸新锐2024 酷睿i9', '/picture/35.jpg', '/picture/35.jpg', '/picture/35.jpg', 10495, 'ROG魔霸新锐2024 酷睿i9 16英寸星云屏游戏本笔记本电脑(i9-13980HX 液金导热 16G 1T RTX4060 2.5K) ', 20, 11);
INSERT INTO `goods` VALUES (216, '华硕无畏16', '/picture/36.jpg', '/picture/36.jpg', '/picture/36.jpg', 4399, '华硕无畏16 英特尔标压i5 16英寸2.5K 144Hz高刷屏高性能轻薄商务办公笔记本电脑(i5-13500H 16G 1T） ', 30, 11);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` float NULL DEFAULT NULL,
  `amount` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `paytype` tinyint(1) NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `datetime` datetime NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_id_idx`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (90, 19297, 3, 5, 3, '管理员', '110', 'scut', '2024-12-03 02:13:25', 1);
INSERT INTO `order` VALUES (91, 13999, 1, 5, 3, '管理员', '110', 'scut', '2024-12-03 02:14:51', 1);
INSERT INTO `order` VALUES (92, 6208, 2, 5, 2, '管理员', '110', 'scut', '2024-12-03 02:15:06', 1);
INSERT INTO `order` VALUES (93, 13999, 1, 3, 2, '管理员', '110', 'scut', '2024-12-03 02:17:51', 1);
INSERT INTO `order` VALUES (94, 21797, 3, 5, 3, '管理员', '110', 'scut', '2024-12-03 02:18:18', 1);
INSERT INTO `order` VALUES (95, 9398, 2, 5, 3, 'cl', '123456789', 'scut', '2024-12-03 02:19:05', 2);
INSERT INTO `order` VALUES (96, 4999, 1, 2, 2, '管理员', '110', 'scut', '2024-12-03 23:46:34', 1);
INSERT INTO `order` VALUES (97, 13999, 1, 5, 2, '管理员', '110', 'scut', '2024-12-04 00:09:19', 1);
INSERT INTO `order` VALUES (98, 2649, 1, 5, 2, 'cl', '123456789', 'scut', '2024-12-04 04:14:25', 2);
INSERT INTO `order` VALUES (99, 16647, 3, 5, 3, 'cl', '123456789', 'scut', '2024-12-04 11:34:09', 2);
INSERT INTO `order` VALUES (100, 17998, 2, 5, 2, 'cl', '123456789', 'scut', '2024-12-04 14:25:10', 2);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` float NULL DEFAULT NULL,
  `amount` int NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  `order_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_id_idx`(`order_id` ASC) USING BTREE,
  INDEX `fk_orderitem_goods_id_idx`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderitem_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (99, 2649, 2, 182, 90);
INSERT INTO `orderitem` VALUES (100, 13999, 1, 185, 90);
INSERT INTO `orderitem` VALUES (101, 13999, 1, 185, 91);
INSERT INTO `orderitem` VALUES (102, 2649, 1, 182, 92);
INSERT INTO `orderitem` VALUES (103, 3559, 1, 188, 92);
INSERT INTO `orderitem` VALUES (104, 13999, 1, 185, 93);
INSERT INTO `orderitem` VALUES (105, 6999, 1, 183, 94);
INSERT INTO `orderitem` VALUES (106, 4299, 1, 187, 94);
INSERT INTO `orderitem` VALUES (107, 10499, 1, 204, 94);
INSERT INTO `orderitem` VALUES (108, 4799, 1, 203, 95);
INSERT INTO `orderitem` VALUES (109, 4599, 1, 207, 95);
INSERT INTO `orderitem` VALUES (110, 4999, 1, 189, 96);
INSERT INTO `orderitem` VALUES (111, 13999, 1, 185, 97);
INSERT INTO `orderitem` VALUES (112, 2649, 1, 182, 98);
INSERT INTO `orderitem` VALUES (113, 2649, 1, 182, 99);
INSERT INTO `orderitem` VALUES (114, 6999, 2, 183, 99);
INSERT INTO `orderitem` VALUES (115, 3999, 1, 209, 100);
INSERT INTO `orderitem` VALUES (116, 13999, 1, 185, 100);

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_goods_id_idx`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (45, 2, 181);
INSERT INTO `recommend` VALUES (46, 2, 182);
INSERT INTO `recommend` VALUES (47, 2, 183);
INSERT INTO `recommend` VALUES (48, 2, 184);
INSERT INTO `recommend` VALUES (49, 2, 185);
INSERT INTO `recommend` VALUES (50, 2, 186);
INSERT INTO `recommend` VALUES (51, 2, 187);
INSERT INTO `recommend` VALUES (52, 2, 188);
INSERT INTO `recommend` VALUES (53, 2, 189);
INSERT INTO `recommend` VALUES (54, 2, 190);
INSERT INTO `recommend` VALUES (55, 2, 191);
INSERT INTO `recommend` VALUES (56, 2, 192);
INSERT INTO `recommend` VALUES (57, 2, 193);
INSERT INTO `recommend` VALUES (58, 2, 194);
INSERT INTO `recommend` VALUES (59, 2, 195);
INSERT INTO `recommend` VALUES (60, 2, 196);
INSERT INTO `recommend` VALUES (61, 2, 197);
INSERT INTO `recommend` VALUES (62, 2, 198);
INSERT INTO `recommend` VALUES (63, 2, 199);
INSERT INTO `recommend` VALUES (64, 2, 200);
INSERT INTO `recommend` VALUES (65, 3, 201);
INSERT INTO `recommend` VALUES (66, 3, 202);
INSERT INTO `recommend` VALUES (67, 3, 203);
INSERT INTO `recommend` VALUES (68, 3, 204);
INSERT INTO `recommend` VALUES (69, 3, 205);
INSERT INTO `recommend` VALUES (70, 3, 206);
INSERT INTO `recommend` VALUES (71, 3, 207);
INSERT INTO `recommend` VALUES (72, 3, 208);
INSERT INTO `recommend` VALUES (73, 3, 209);
INSERT INTO `recommend` VALUES (74, 3, 210);
INSERT INTO `recommend` VALUES (75, 3, 211);
INSERT INTO `recommend` VALUES (76, 3, 212);
INSERT INTO `recommend` VALUES (77, 3, 213);
INSERT INTO `recommend` VALUES (83, 1, 185);
INSERT INTO `recommend` VALUES (84, 1, 195);
INSERT INTO `recommend` VALUES (85, 1, 201);
INSERT INTO `recommend` VALUES (86, 1, 189);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, 'HUAWEI');
INSERT INTO `type` VALUES (2, '小米');
INSERT INTO `type` VALUES (3, 'Apple');
INSERT INTO `type` VALUES (4, 'vivo');
INSERT INTO `type` VALUES (5, 'OPPO');
INSERT INTO `type` VALUES (8, '三星');
INSERT INTO `type` VALUES (11, '华硕');
INSERT INTO `type` VALUES (12, '联想');
INSERT INTO `type` VALUES (13, '惠普');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isadmin` bit(1) NULL DEFAULT NULL,
  `isvalidate` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email_UNIQUE`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'cl19856637996@163.com', 'admin', '管理员', '110', 'scut', b'1', b'0');
INSERT INTO `user` VALUES (2, 'cl', '2748425614@qq.com', '123456', 'cl', '123456789', 'scut', b'0', b'0');

SET FOREIGN_KEY_CHECKS = 1;
