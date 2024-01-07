/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : 127.0.0.1:3306
 Source Schema         : xiaoshuo

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 02/01/2024 20:19:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for actions
-- ----------------------------
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parent_id` int UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0第一级菜单，1第二级，2第三级，以此类推',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of actions
-- ----------------------------
INSERT INTO `actions` VALUES (1, '/book', '小说管理', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (2, '/member', '会员管理', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (3, '/pay', '充值管理', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (4, '/recharge', '提现管理', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (5, '/mini-program', '小程序管理', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (6, '/ad', '回传管理', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (7, '/statistics', '数据统计', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (8, '/notice', '公告管理', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (9, '/role', '角色管理', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (10, '/setting', '系统设置', 0, 0, 0, 0, 0);
INSERT INTO `actions` VALUES (11, '/book/bookList', '小说列表', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (12, '/book/generateLink', '小说链接生成', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (13, '/book/generatePaperWork', '小说文案生成', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (14, '/book/online', '小说上下架', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (15, '/book/removeBook', '删除小说', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (16, '/book/updateBookCate', '更新小说类目', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (17, '/book/cateList', '类目列表', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (18, '/book/addCate', '添加类目', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (19, '/book/updateCate', '更新类目', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (20, '/book/removeCate', '删除类目', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (21, '/book/commentList', '评论列表', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (22, '/book/examineComment', '评论审核', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (23, '/book/removeComment', '评论删除', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (24, '/book/detail', '小说详情', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (25, '/book/tagList', '标签列表', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (26, '/book/addTag', '添加标签', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (27, '/book/updateTag', '修改标签', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (28, '/book/removeTag', '删除标签', 1, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (30, '/member/list', '会员列表', 2, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (31, '/member/remove', '删除会员', 2, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (32, '/pay/list', '充值列表', 3, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (33, '/pay/remove', '删除充值', 3, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (34, '/recharge/list', '提现列表', 4, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (35, '/recharge/remove', '删除提现', 4, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (36, '/recharge/update', '修改提现状态', 4, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (37, '/pay/consumeList', '消费列表', 3, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (38, '/pay/removeConsume', '删除消费', 3, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (50, '/miniProgram/list', '首页Banner列表', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (51, '/miniProgram/add', '添加首页Banner', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (52, '/miniProgram/update', '修改首页Banner', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (53, '/miniProgram/remove', '删除首页Banner', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (60, '/miniProgram/indexPageList', '首页模块列表', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (61, '/miniProgram/addIndexPage', '添加首页模块', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (62, '/miniProgram/updateIndexPage', '更新首页模块', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (63, '/miniProgram/removeIndexPage', '删除首页模块', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (64, '/miniProgram/setting', '小程序设置信息', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (65, '/miniProgram/updateSetting', '修改小程序设置', 5, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (80, '/ad/list', '回传列表', 6, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (81, '/ad/remove', '删除回传数据', 6, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (82, '/ad/upload', '上报数据', 6, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (100, '/statistic/userList', '用户统计', 7, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (101, '/statistic/payList', '充值统计', 7, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (102, '/statistic/readBookList', '阅读统计', 7, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (110, '/notice/list', '公告列表', 8, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (111, '/notice/add', '添加公告', 8, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (112, '/notice/update', '更新公告', 8, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (113, '/notice/remove', '删除公告', 8, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (130, '/role/roleList', '角色列表', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (131, '/role/addRole', '添加角色', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (132, '/role/updateRole', '更新角色', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (133, '/role/removeRole', '删除角色', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (140, '/role/adminList', '用户列表', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (141, '/role/addAdmin', '添加用户', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (142, '/role/updateAdmin', '更新用户', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (143, '/role/removeAdmin', '删除用户', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (150, '/role/actionList', '功能列表', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (151, '/role/addAction', '添加功能', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (152, '/role/updateAction', '更新功能', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (153, '/role/removeAction', '删除功能', 9, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (160, '/setting/setting', '设置', 10, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (161, '/setting/rechargeType', '充值设置', 10, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (162, '/setting/updateRechargeType', '更新充值设置', 10, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (163, '/setting/removeRechargeType', '删除充值设置', 10, 1, 0, 0, 0);
INSERT INTO `actions` VALUES (164, '/setting/addRechargeType', '添加充值设置', 10, 1, 0, 0, 0);

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token_expire_at` int UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` int UNSIGNED NOT NULL DEFAULT 0,
  `role_id` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `email_verified_at` int UNSIGNED NOT NULL DEFAULT 0,
  `super_admin` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是不是超管',
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (3, 'jiangqiao', '$2y$10$wJA8TVxIcNkWIx2k6aR8FeKuNPnuVSogvMaUWPmPiMOu7IjTkGMEe', '', '33|GIr8AEklozf9n3WI9vTtojWVQIaAKEEJxSlMhaVe', 1702214074, '江桥', '', 0, 0, 0, 0, 1, 1701609274, 0);
INSERT INTO `admins` VALUES (4, '', '', '', '', 0, '32432432', '', 0, 0, 1, 0, 0, 1702049630, 1702048826);
INSERT INTO `admins` VALUES (5, '测试', '$2y$10$lp3FyqNpOpiED4bMIFSvK.s0QcB9Y16YsZKBEOBw4wxlSulFVJs9e', '', '', 0, '测试', '13212122121', 0, 2, 0, 0, 0, 1702049689, 1702049689);

-- ----------------------------
-- Table structure for ads
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0巨量广告',
  `adid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `page` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `creativeid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `creativetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `clickid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `event_type` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '\"【目前已支持如下转化事件类型】\n激活：0\n注册：1\n付费：2\n表单提交：3\n有效咨询：5 \n电话拨打：7\n商品购买：8\n有效获客：19\n下单（电商）：20\n加购（电商）：22\n关键行为：25\n授权（电商）：28\napp内详情页到站uv：29\n其他：9\nPS：更多事件类型会逐步新增支持，可以参考 转化事件回传接口-公开版 \n\"',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `age` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `scene` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ad_params` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `my_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `my_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0待上报，1已上报',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_clickid`(`clickid` ASC) USING BTREE,
  INDEX `idx_creativeid`(`creativeid` ASC) USING BTREE,
  INDEX `idx_event_type`(`event_type` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ads
-- ----------------------------
INSERT INTO `ads` VALUES (4, 3, 0, '1650693294639115', 'pages/bookCity/bookCity', '1650693294639131', '4', 'EJuQ19u_qfcCGKf2g74ZIPD89-vIATAMOAFCIjIwMTkxMTIwMTcwODI0MDEwMDI2MDc3MDY4MEEwMUQxN0ZIAQ', 2, 'lilei', 18, '025003', '{\"cid\":1650693294639131,\"log_extra\":{\"convert_component_suspend\":0,\"convert_id\":1650693283285000,\"external_action\":19,\"is_from_history\":false,\"is_pack_v2\":true,\"orit\":1,\"placement\":\"unknown\",\"req_id\":\"201911201708240100260770680A01D17F\",\"rit\":1,\"style_id\":2310,\"style_ids\":[2310],\"van_package\":130000005},\"web_url\":\"https://www.toutiao.com/?adid=1650693294639115\\u0026creativeid=1650693294639131\\u0026creativetype=4\\u0026clickid=EJuQ19u_qfcCGKf2g74ZIPD89-vIATAMOAFCIjIwMTkxMTIwMTcwODI0MDEwMDI2MDc3MDY4MEEwMUQxN0ZIAQ\",\"intercept_flag\":2}', '', '', 1, 0, 1703930266, 1703338477);

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '作者',
  `book_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '书号',
  `novel_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说封面',
  `is_end` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0连载本，1已完本',
  `free_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '免费章节',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `novel_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说名称',
  `total_chapter_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节总数',
  `classify_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `desc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说简介',
  `number_of_words` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  `novel_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说id',
  `sort` int UNSIGNED NOT NULL DEFAULT 10000 COMMENT '排行，数字越大排行越高',
  `good_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '精选内容',
  `online` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否上架，1上架，0待上架',
  `thousand_words_price` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '千字价格',
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_novel_name`(`novel_name` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '行潜', 1398456415, 'book_image/c3575046.jpg', 1, 12, 1700659469, '美人井', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 95710, 'c3575046', 10000, '', 0, 12, 1703914989, 1702566623, 0);
INSERT INTO `books` VALUES (2, '梦三年', 1398456416, 'book_image/591f987a.jpg', 1, 1, 1701083012, '诱饵', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 0, 1702566626, 0);
INSERT INTO `books` VALUES (3, '行潜', 1398456415, 'book_image/c3575046.jpg', 1, 1, 1700659469, '美人井3', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 9571, 'c3575046', 10000, '', 0, 0, 1703908748, 1702566623, 0);
INSERT INTO `books` VALUES (4, '梦三年', 1398456416, 'book_image/591f987a.jpg', 1, 1, 1701083012, '诱饵4', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 0, 1702566626, 0);
INSERT INTO `books` VALUES (5, '行潜', 1398456415, 'book_image/c3575046.jpg', 1, 1, 1700659469, '美人井5', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 9571, 'c3575046', 10000, '', 0, 0, 0, 1702566623, 0);
INSERT INTO `books` VALUES (6, '梦三年', 1398456416, 'book_image/591f987a.jpg', 1, 1, 1701083012, '诱饵6', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 0, 1702566626, 0);
INSERT INTO `books` VALUES (7, '行潜', 1398456415, 'book_image/c3575046.jpg', 1, 1, 1700659469, '美人井7', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 9571, 'c3575046', 10000, '', 0, 0, 0, 1702566623, 0);
INSERT INTO `books` VALUES (8, '梦三年', 1398456416, 'book_image/591f987a.jpg', 1, 1, 1701083012, '诱饵8', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 0, 1702566626, 0);
INSERT INTO `books` VALUES (9, '梦三年', 1398456416, 'book_image/591f987a.jpg', 1, 1, 1701083012, '诱饵9', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 1703388740, 1702566626, 0);
INSERT INTO `books` VALUES (10, '行潜', 1398456415, 'book_image/c3575046.jpg', 1, 1, 1700659469, '美人井10', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 9571, 'c3575046', 10000, '', 0, 0, 0, 1702566623, 0);
INSERT INTO `books` VALUES (11, '行潜', 1398456415, 'book_image/c3575046.jpg', 1, 1, 1700659469, '美人井11', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 9571, 'c3575046', 10000, '', 0, 0, 0, 1702566623, 0);
INSERT INTO `books` VALUES (12, '梦三年', 1398456416, 'book_image/591f987a.jpg', 1, 1, 1701083012, '诱饵12', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 0, 1702566626, 0);
INSERT INTO `books` VALUES (13, '行潜', 1398456415, 'book_image/c3575046.jpg', 1, 1, 1700659469, '美人井13', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 9571, 'c3575046', 10000, '', 0, 0, 0, 1702566623, 0);
INSERT INTO `books` VALUES (14, '梦三年', 1398456416, 'book_image/591f987a.jpg', 1, 1, 1701083012, '诱饵14', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 0, 1702566626, 0);
INSERT INTO `books` VALUES (15, '行潜', 1398456415, 'book_image/c3575046.jpg', 1, 1, 1700659469, '美人井15', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 9571, 'c3575046', 10000, '', 0, 0, 0, 1702566623, 0);
INSERT INTO `books` VALUES (16, '梦三年', 1398456416, 'book_image/591f987a.jpg', 1, 1, 1701083012, '诱饵16', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 0, 1702566626, 0);
INSERT INTO `books` VALUES (17, '行潜', 1398456415, 'book_image/c3575046.jpg', 1, 1, 1700659469, '美人井17', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 9571, 'c3575046', 10000, '', 0, 0, 0, 1702566623, 0);
INSERT INTO `books` VALUES (18, '梦三年', 1398456416, 'book_image/591f987a.jpg', 1, 1, 1701083012, '诱饵18', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 0, 1702566626, 0);
INSERT INTO `books` VALUES (19, '锦竹', 4178, 'book_image/e5d2d10c.jpg', 1, 5, 1498213609, '若你不弃，执手相依', 17, '言情青春', '傅羽修以为世界上最难过的事情是遗忘，当七年后再见到以为一辈子都不会再相见的秦所依时，他才知道，世界上最难过的事情是舍不得。 秦所依以前认为，人和人的缘分总有尽头。当她重新回到荷兰，她觉得自己和傅羽修的缘分到了尽头。这么多年过去，再相见的时候，当她注视着那张熟悉的脸庞，她想，缘分这东西，没有尽头，只看你愿不愿意随缘了。 有些人你一旦遇到，就别再分开。 若你不弃，执手相依，不离不弃。', 171274, 'e5d2d10c', 10000, '', 0, 0, 0, 1703611853, 0);
INSERT INTO `books` VALUES (20, '巫山', 6271, 'book_image/b726c3b1.jpg', 1, 0, 1498238646, '久等了，机长大人', 25, '都市现代', '机长：你是我的今天，以及所有的明天。顾曾：冲上云霄，无论多高多远，我都是你着陆的机场，延误时，我会成为你的管制员。 初次相见，在催眠室，她昏睡着，他清醒着。三年后，在长虹机场PEK控制塔的语音通话里，认出彼此的声音。禁欲系高冷机长，被誉为亚特兰大空军部的奇迹，战机十三甲，战无不胜。再见她时，他放下所有荣光，在刚刚好的时刻，成为温柔如水的人。他成了她的，就只会是她的。', 153208, 'b726c3b1', 10000, '', 0, 0, 0, 1703611940, 0);
INSERT INTO `books` VALUES (21, '锦竹', 9882, 'book_image/dde59a38.jpg', 1, 4, 1508423918, '若你不弃，此生不离', 18, '都市现代', '人一生会遇到约2920万人，而两个人相爱的概率只有0.000049。 　　曾唯一与纪齐宣订婚，是为了让另一个男人林穆森难堪。六年之后，她嫁给纪齐宣，是为了给儿子优越的生活，也让自己重新回到上流社会。只是，被她抛弃过的纪齐宣，再也不是当年那个默默爱着她的沉静少年。 　　生子、结婚、也许有爱情，曾唯一的经历与别人的完全相反，这个骄傲不懂爱的女人会收获她的幸福吗？', 240490, 'dde59a38', 10000, '', 0, 0, 0, 1703611959, 0);

-- ----------------------------
-- Table structure for books_cates
-- ----------------------------
DROP TABLE IF EXISTS `books_cates`;
CREATE TABLE `books_cates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` int UNSIGNED NOT NULL DEFAULT 0,
  `book_id` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  `created_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cate_id`(`cate_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books_cates
-- ----------------------------
INSERT INTO `books_cates` VALUES (1, 3, 1, 1, 1703389054, 0);
INSERT INTO `books_cates` VALUES (2, 4, 1, 1, 1703389054, 0);
INSERT INTO `books_cates` VALUES (3, 5, 1, 1, 0, 0);
INSERT INTO `books_cates` VALUES (4, 2, 2, 0, 0, 0);
INSERT INTO `books_cates` VALUES (5, 6, 2, 0, 0, 0);
INSERT INTO `books_cates` VALUES (6, 4, 2, 0, 0, 0);
INSERT INTO `books_cates` VALUES (7, 2, 3, 1, 1703908748, 0);
INSERT INTO `books_cates` VALUES (8, 3, 3, 1, 1703908748, 0);
INSERT INTO `books_cates` VALUES (9, 4, 3, 1, 1703908748, 0);
INSERT INTO `books_cates` VALUES (10, 2, 4, 0, 0, 0);
INSERT INTO `books_cates` VALUES (11, 3, 4, 0, 0, 0);
INSERT INTO `books_cates` VALUES (12, 4, 4, 0, 0, 0);
INSERT INTO `books_cates` VALUES (13, 2, 5, 0, 0, 0);
INSERT INTO `books_cates` VALUES (14, 3, 5, 0, 0, 0);
INSERT INTO `books_cates` VALUES (15, 4, 5, 0, 0, 0);
INSERT INTO `books_cates` VALUES (16, 2, 6, 0, 0, 0);
INSERT INTO `books_cates` VALUES (17, 3, 6, 0, 0, 0);
INSERT INTO `books_cates` VALUES (18, 4, 6, 0, 0, 0);
INSERT INTO `books_cates` VALUES (19, 2, 7, 0, 0, 0);
INSERT INTO `books_cates` VALUES (20, 3, 7, 0, 0, 0);
INSERT INTO `books_cates` VALUES (21, 4, 7, 0, 0, 0);
INSERT INTO `books_cates` VALUES (22, 2, 8, 0, 0, 0);
INSERT INTO `books_cates` VALUES (23, 3, 8, 0, 0, 0);
INSERT INTO `books_cates` VALUES (24, 4, 8, 0, 0, 0);
INSERT INTO `books_cates` VALUES (25, 3, 2, 0, 0, 0);
INSERT INTO `books_cates` VALUES (26, 4, 1, 1, 1703389570, 0);
INSERT INTO `books_cates` VALUES (27, 5, 1, 1, 1703389570, 0);
INSERT INTO `books_cates` VALUES (28, 5, 1, 1, 1703389587, 0);
INSERT INTO `books_cates` VALUES (29, 5, 1, 1, 1703390072, 0);
INSERT INTO `books_cates` VALUES (30, 5, 1, 1, 1703390383, 0);
INSERT INTO `books_cates` VALUES (31, 3, 1, 1, 1703390426, 0);
INSERT INTO `books_cates` VALUES (32, 4, 1, 1, 1703390426, 0);
INSERT INTO `books_cates` VALUES (33, 6, 1, 1, 1703390426, 0);
INSERT INTO `books_cates` VALUES (34, 3, 1, 1, 1703390514, 0);
INSERT INTO `books_cates` VALUES (35, 4, 1, 1, 1703390514, 0);
INSERT INTO `books_cates` VALUES (36, 5, 1, 1, 1703390514, 0);
INSERT INTO `books_cates` VALUES (37, 2, 1, 1, 1703390514, 0);
INSERT INTO `books_cates` VALUES (38, 3, 1, 1, 1703390648, 1703390546);
INSERT INTO `books_cates` VALUES (39, 4, 1, 1, 1703390648, 1703390546);
INSERT INTO `books_cates` VALUES (40, 5, 1, 1, 1703390648, 1703390546);
INSERT INTO `books_cates` VALUES (41, 2, 1, 1, 1703390648, 1703390546);
INSERT INTO `books_cates` VALUES (42, 3, 1, 1, 1703390764, 1703390648);
INSERT INTO `books_cates` VALUES (43, 4, 1, 1, 1703390764, 1703390648);
INSERT INTO `books_cates` VALUES (44, 5, 1, 1, 1703390764, 1703390648);
INSERT INTO `books_cates` VALUES (45, 2, 1, 1, 1703390764, 1703390648);
INSERT INTO `books_cates` VALUES (46, 3, 1, 1, 1703395976, 1703390764);
INSERT INTO `books_cates` VALUES (47, 4, 1, 1, 1703395976, 1703390764);
INSERT INTO `books_cates` VALUES (48, 5, 1, 1, 1703395976, 1703390764);
INSERT INTO `books_cates` VALUES (49, 2, 1, 1, 1703395977, 1703390764);
INSERT INTO `books_cates` VALUES (50, 3, 1, 1, 1703679024, 1703395977);
INSERT INTO `books_cates` VALUES (51, 4, 1, 1, 1703679024, 1703395977);
INSERT INTO `books_cates` VALUES (52, 5, 1, 1, 1703679024, 1703395977);
INSERT INTO `books_cates` VALUES (53, 2, 1, 1, 1703679024, 1703395977);
INSERT INTO `books_cates` VALUES (54, 3, 1, 1, 1703767438, 1703679024);
INSERT INTO `books_cates` VALUES (55, 4, 1, 1, 1703767438, 1703679024);
INSERT INTO `books_cates` VALUES (56, 5, 1, 1, 1703767438, 1703679024);
INSERT INTO `books_cates` VALUES (57, 2, 1, 1, 1703767438, 1703679024);
INSERT INTO `books_cates` VALUES (58, 3, 1, 1, 1703767455, 1703767438);
INSERT INTO `books_cates` VALUES (59, 4, 1, 1, 1703767455, 1703767438);
INSERT INTO `books_cates` VALUES (60, 5, 1, 1, 1703767455, 1703767438);
INSERT INTO `books_cates` VALUES (61, 2, 1, 1, 1703767455, 1703767438);
INSERT INTO `books_cates` VALUES (62, 3, 1, 1, 1703767911, 1703767455);
INSERT INTO `books_cates` VALUES (63, 4, 1, 1, 1703767911, 1703767455);
INSERT INTO `books_cates` VALUES (64, 5, 1, 1, 1703767911, 1703767456);
INSERT INTO `books_cates` VALUES (65, 2, 1, 1, 1703767911, 1703767456);
INSERT INTO `books_cates` VALUES (66, 3, 1, 1, 1703767942, 1703767911);
INSERT INTO `books_cates` VALUES (67, 4, 1, 1, 1703767943, 1703767911);
INSERT INTO `books_cates` VALUES (68, 5, 1, 1, 1703767943, 1703767911);
INSERT INTO `books_cates` VALUES (69, 2, 1, 1, 1703767943, 1703767911);
INSERT INTO `books_cates` VALUES (70, 3, 1, 1, 1703908416, 1703767943);
INSERT INTO `books_cates` VALUES (71, 4, 1, 1, 1703908416, 1703767943);
INSERT INTO `books_cates` VALUES (72, 5, 1, 1, 1703908416, 1703767943);
INSERT INTO `books_cates` VALUES (73, 2, 1, 1, 1703908416, 1703767943);
INSERT INTO `books_cates` VALUES (74, 3, 1, 1, 1703908573, 1703908416);
INSERT INTO `books_cates` VALUES (75, 4, 1, 1, 1703908573, 1703908417);
INSERT INTO `books_cates` VALUES (76, 5, 1, 1, 1703908573, 1703908417);
INSERT INTO `books_cates` VALUES (77, 2, 1, 1, 1703908573, 1703908417);
INSERT INTO `books_cates` VALUES (78, 3, 1, 1, 1703908795, 1703908573);
INSERT INTO `books_cates` VALUES (79, 4, 1, 1, 1703908795, 1703908573);
INSERT INTO `books_cates` VALUES (80, 5, 1, 1, 1703908795, 1703908573);
INSERT INTO `books_cates` VALUES (81, 2, 1, 1, 1703908795, 1703908573);
INSERT INTO `books_cates` VALUES (82, 2, 3, 0, 1703908748, 1703908748);
INSERT INTO `books_cates` VALUES (83, 3, 3, 0, 1703908748, 1703908748);
INSERT INTO `books_cates` VALUES (84, 4, 3, 0, 1703908748, 1703908748);
INSERT INTO `books_cates` VALUES (85, 3, 1, 1, 1703914989, 1703908795);
INSERT INTO `books_cates` VALUES (86, 4, 1, 1, 1703914989, 1703908795);
INSERT INTO `books_cates` VALUES (87, 5, 1, 1, 1703914989, 1703908795);
INSERT INTO `books_cates` VALUES (88, 2, 1, 1, 1703914990, 1703908795);
INSERT INTO `books_cates` VALUES (89, 3, 1, 0, 1703914990, 1703914990);
INSERT INTO `books_cates` VALUES (90, 4, 1, 0, 1703914990, 1703914990);
INSERT INTO `books_cates` VALUES (91, 5, 1, 0, 1703914990, 1703914990);
INSERT INTO `books_cates` VALUES (92, 2, 1, 0, 1703914990, 1703914990);

-- ----------------------------
-- Table structure for books_chapters
-- ----------------------------
DROP TABLE IF EXISTS `books_chapters`;
CREATE TABLE `books_chapters`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节数（第几章）',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '章节地址',
  `time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节发布时间',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '章节标题',
  `number_of_words` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '本章节字数',
  `price` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '本章节费用，单位分，为0时免费',
  `book_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '小说id',
  `novel_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说id',
  `is_share` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推广章节',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `updated_at` int UNSIGNED NOT NULL COMMENT '更新时间',
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_index`(`index` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books_chapters
-- ----------------------------
INSERT INTO `books_chapters` VALUES (1, 1, 'book/c3575046_1', 1700659445, '井口', 3355, 0, 1, 'c3575046', 1, 0, 1704037450, 1702566624);
INSERT INTO `books_chapters` VALUES (2, 2, 'book/c3575046_2', 1700659469, '真相', 6216, 43, 1, 'c3575046', 1, 0, 1704037454, 1702566625);
INSERT INTO `books_chapters` VALUES (3, 1, 'book/591f987a_1', 1701082981, '诱饵', 2918, 0, 2, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (4, 2, 'book/591f987a_2', 1701083012, '诱饵', 6094, 42, 2, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (5, 1, 'book/c3575046_1', 1700659445, '井口', 3355, 0, 3, 'c3575046', 0, 0, 1702566624, 1702566624);
INSERT INTO `books_chapters` VALUES (6, 2, 'book/c3575046_2', 1700659469, '真相', 6216, 43, 3, 'c3575046', 0, 0, 1702566625, 1702566625);
INSERT INTO `books_chapters` VALUES (7, 1, 'book/591f987a_1', 1701082981, '诱饵', 2918, 0, 4, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (8, 2, 'book/591f987a_2', 1701083012, '诱饵', 6094, 42, 4, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (9, 1, 'book/c3575046_1', 1700659445, '井口', 3355, 0, 5, 'c3575046', 0, 0, 1702566624, 1702566624);
INSERT INTO `books_chapters` VALUES (10, 2, 'book/c3575046_2', 1700659469, '真相', 6216, 43, 5, 'c3575046', 0, 0, 1702566625, 1702566625);
INSERT INTO `books_chapters` VALUES (11, 1, 'book/591f987a_1', 1701082981, '诱饵', 2918, 0, 6, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (12, 2, 'book/591f987a_2', 1701083012, '诱饵', 6094, 42, 6, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (13, 1, 'book/c3575046_1', 1700659445, '井口', 3355, 0, 7, 'c3575046', 0, 0, 1702566624, 1702566624);
INSERT INTO `books_chapters` VALUES (14, 2, 'book/c3575046_2', 1700659469, '真相', 6216, 43, 7, 'c3575046', 0, 0, 1702566625, 1702566625);
INSERT INTO `books_chapters` VALUES (15, 1, 'book/591f987a_1', 1701082981, '诱饵', 2918, 0, 8, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (16, 2, 'book/591f987a_2', 1701083012, '诱饵', 6094, 42, 8, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (17, 1, 'book/c3575046_1', 1700659445, '井口', 3355, 0, 9, 'c3575046', 0, 0, 1702566624, 1702566624);
INSERT INTO `books_chapters` VALUES (18, 2, 'book/c3575046_2', 1700659469, '真相', 6216, 43, 9, 'c3575046', 0, 0, 1702566625, 1702566625);
INSERT INTO `books_chapters` VALUES (19, 1, 'book/591f987a_1', 1701082981, '诱饵', 2918, 0, 10, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (20, 2, 'book/591f987a_2', 1701083012, '诱饵', 6094, 42, 10, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (21, 1, 'book/c3575046_1', 1700659445, '井口', 3355, 0, 11, 'c3575046', 0, 0, 1702566624, 1702566624);
INSERT INTO `books_chapters` VALUES (22, 2, 'book/c3575046_2', 1700659469, '真相', 6216, 43, 11, 'c3575046', 0, 0, 1702566625, 1702566625);
INSERT INTO `books_chapters` VALUES (23, 1, 'book/591f987a_1', 1701082981, '诱饵', 2918, 0, 12, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (24, 2, 'book/591f987a_2', 1701083012, '诱饵', 6094, 42, 12, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (25, 1, 'book/c3575046_1', 1700659445, '井口', 3355, 0, 13, 'c3575046', 0, 0, 1702566624, 1702566624);
INSERT INTO `books_chapters` VALUES (26, 2, 'book/c3575046_2', 1700659469, '真相', 6216, 43, 13, 'c3575046', 0, 0, 1702566625, 1702566625);
INSERT INTO `books_chapters` VALUES (27, 1, 'book/591f987a_1', 1701082981, '诱饵', 2918, 0, 14, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (28, 2, 'book/591f987a_2', 1701083012, '诱饵', 6094, 42, 14, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (29, 1, 'book/c3575046_1', 1700659445, '井口', 3355, 0, 15, 'c3575046', 0, 0, 1702566624, 1702566624);
INSERT INTO `books_chapters` VALUES (30, 2, 'book/c3575046_2', 1700659469, '真相', 6216, 43, 15, 'c3575046', 0, 0, 1702566625, 1702566625);
INSERT INTO `books_chapters` VALUES (31, 1, 'book/591f987a_1', 1701082981, '诱饵', 2918, 0, 16, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (32, 2, 'book/591f987a_2', 1701083012, '诱饵', 6094, 42, 16, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (33, 1, 'book/c3575046_1', 1700659445, '井口', 3355, 0, 17, 'c3575046', 0, 0, 1702566624, 1702566624);
INSERT INTO `books_chapters` VALUES (34, 2, 'book/c3575046_2', 1700659469, '真相', 6216, 43, 17, 'c3575046', 0, 0, 1702566625, 1702566625);
INSERT INTO `books_chapters` VALUES (35, 1, 'book/591f987a_1', 1701082981, '诱饵', 2918, 0, 18, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (36, 2, 'book/591f987a_2', 1701083012, '诱饵', 6094, 42, 18, '591f987a', 0, 0, 1702566627, 1702566627);
INSERT INTO `books_chapters` VALUES (37, 1, 'book/b726c3b1_1', 1498237990, '楔 子', 0, 0, 20, '', 0, 0, 1703611941, 1703611941);
INSERT INTO `books_chapters` VALUES (38, 2, 'book/b726c3b1_2', 1498238009, '美人是脓血', 0, 0, 20, '', 0, 0, 1703611942, 1703611942);
INSERT INTO `books_chapters` VALUES (39, 3, 'book/b726c3b1_3', 1498238027, '旧梦里故人', 0, 0, 20, '', 0, 0, 1703611943, 1703611943);
INSERT INTO `books_chapters` VALUES (40, 4, 'book/b726c3b1_4', 1498238044, '重逢在异国', 0, 32, 20, '', 0, 0, 1703611943, 1703611943);
INSERT INTO `books_chapters` VALUES (41, 5, 'book/b726c3b1_5', 1498238103, '深夜惊险斗艳', 0, 35, 20, '', 0, 0, 1703611944, 1703611944);
INSERT INTO `books_chapters` VALUES (42, 6, 'book/b726c3b1_6', 1498238121, '命定的巧合', 0, 29, 20, '', 0, 0, 1703611945, 1703611945);
INSERT INTO `books_chapters` VALUES (43, 7, 'book/b726c3b1_7', 1498238148, '一直在靠近', 0, 26, 20, '', 0, 0, 1703611945, 1703611945);
INSERT INTO `books_chapters` VALUES (44, 8, 'book/b726c3b1_8', 1498238176, '避不开的温暖', 0, 29, 20, '', 0, 0, 1703611946, 1703611946);
INSERT INTO `books_chapters` VALUES (45, 9, 'book/b726c3b1_9', 1498238199, '信任他爱慕他', 0, 30, 20, '', 0, 0, 1703611947, 1703611947);
INSERT INTO `books_chapters` VALUES (46, 10, 'book/b726c3b1_10', 1498238280, '任何时刻开始', 0, 33, 20, '', 0, 0, 1703611948, 1703611948);
INSERT INTO `books_chapters` VALUES (47, 11, 'book/b726c3b1_11', 1498238294, '怎么温柔成这样', 0, 28, 20, '', 0, 0, 1703611949, 1703611948);
INSERT INTO `books_chapters` VALUES (48, 12, 'book/b726c3b1_12', 1498238315, '对过去的释然', 0, 34, 20, '', 0, 0, 1703611949, 1703611949);
INSERT INTO `books_chapters` VALUES (49, 13, 'book/b726c3b1_13', 1498238334, '都被他看透', 0, 27, 20, '', 0, 0, 1703611950, 1703611950);
INSERT INTO `books_chapters` VALUES (50, 14, 'book/b726c3b1_14', 1498238356, '讨好的方式', 0, 36, 20, '', 0, 0, 1703611951, 1703611951);
INSERT INTO `books_chapters` VALUES (51, 15, 'book/b726c3b1_15', 1498238372, '真的好心疼他', 0, 31, 20, '', 0, 0, 1703611951, 1703611951);
INSERT INTO `books_chapters` VALUES (52, 16, 'book/b726c3b1_16', 1498238391, '太早的谎言', 0, 36, 20, '', 0, 0, 1703611952, 1703611952);
INSERT INTO `books_chapters` VALUES (53, 17, 'book/b726c3b1_17', 1498238409, '未竟的梦想', 0, 31, 20, '', 0, 0, 1703611953, 1703611953);
INSERT INTO `books_chapters` VALUES (54, 18, 'book/b726c3b1_18', 1498238426, '意外生死不明', 0, 32, 20, '', 0, 0, 1703611953, 1703611953);
INSERT INTO `books_chapters` VALUES (55, 19, 'book/b726c3b1_19', 1498238486, '不能再错过他', 0, 20, 20, '', 0, 0, 1703611954, 1703611954);
INSERT INTO `books_chapters` VALUES (56, 20, 'book/b726c3b1_20', 1498238500, '最初温暖的他', 0, 36, 20, '', 0, 0, 1703611955, 1703611955);
INSERT INTO `books_chapters` VALUES (57, 21, 'book/b726c3b1_21', 1498238529, '万众瞩目的告白', 0, 34, 20, '', 0, 0, 1703611955, 1703611955);
INSERT INTO `books_chapters` VALUES (58, 22, 'book/b726c3b1_22', 1498238544, '相濡以沫的亲近', 0, 35, 20, '', 0, 0, 1703611956, 1703611956);
INSERT INTO `books_chapters` VALUES (59, 23, 'book/b726c3b1_23', 1498238560, '鲜为人知的故事', 0, 26, 20, '', 0, 0, 1703611957, 1703611957);
INSERT INTO `books_chapters` VALUES (60, 24, 'book/b726c3b1_24', 1498238629, '丢失的勇敢', 0, 20, 20, '', 0, 0, 1703611958, 1703611958);
INSERT INTO `books_chapters` VALUES (61, 25, 'book/b726c3b1_25', 1498238646, '后记：我们都值得这个世上最好的人', 0, 46, 20, '', 0, 0, 1703611958, 1703611958);
INSERT INTO `books_chapters` VALUES (62, 1, 'book/dde59a38_1', 1508514960, 'chapter.1重逢', 0, 0, 21, '', 0, 0, 1703611960, 1703611960);
INSERT INTO `books_chapters` VALUES (63, 2, 'book/dde59a38_2', 1508514966, 'chapter.2 得子', 0, 0, 21, '', 0, 0, 1703611961, 1703611961);
INSERT INTO `books_chapters` VALUES (64, 3, 'book/dde59a38_3', 1508514973, 'chapter.3报恩', 0, 0, 21, '', 0, 0, 1703611962, 1703611962);
INSERT INTO `books_chapters` VALUES (65, 4, 'book/dde59a38_4', 1508514979, 'chapter.4爱护', 0, 0, 21, '', 0, 0, 1703611963, 1703611963);
INSERT INTO `books_chapters` VALUES (66, 5, 'book/dde59a38_5', 1508515077, 'chapter.5 事业', 0, 62, 21, '', 0, 0, 1703611963, 1703611963);
INSERT INTO `books_chapters` VALUES (67, 6, 'book/dde59a38_6', 1508515100, '　　chapter.6 毁容', 0, 91, 21, '', 0, 0, 1703611964, 1703611964);
INSERT INTO `books_chapters` VALUES (68, 7, 'book/dde59a38_7', 1508423918, 'chapter.7真爱', 0, 56, 21, '', 0, 0, 1703611965, 1703611965);
INSERT INTO `books_chapters` VALUES (69, 8, 'book/dde59a38_8', 1508423918, 'chapter.8蜜月', 0, 75, 21, '', 0, 0, 1703611965, 1703611965);
INSERT INTO `books_chapters` VALUES (70, 9, 'book/dde59a38_9', 1508423918, 'chapter.9深爱', 0, 99, 21, '', 0, 0, 1703611966, 1703611966);
INSERT INTO `books_chapters` VALUES (71, 10, 'book/dde59a38_10', 1508423918, '番外', 0, 13, 21, '', 0, 0, 1703611966, 1703611966);
INSERT INTO `books_chapters` VALUES (72, 11, 'book/dde59a38_11', 1431007525, 'chapter.3报恩', 0, 32, 21, '', 0, 0, 1703611967, 1703611967);

-- ----------------------------
-- Table structure for books_tags
-- ----------------------------
DROP TABLE IF EXISTS `books_tags`;
CREATE TABLE `books_tags`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` int UNSIGNED NOT NULL DEFAULT 0,
  `book_id` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  `created_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cate_id`(`tag_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_tag_id`(`tag_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books_tags
-- ----------------------------
INSERT INTO `books_tags` VALUES (1, 3, 1, 1, 1703389054, 0);
INSERT INTO `books_tags` VALUES (2, 4, 1, 1, 1703389054, 0);
INSERT INTO `books_tags` VALUES (3, 5, 1, 1, 0, 0);
INSERT INTO `books_tags` VALUES (4, 2, 2, 0, 0, 0);
INSERT INTO `books_tags` VALUES (5, 6, 2, 0, 0, 0);
INSERT INTO `books_tags` VALUES (6, 4, 2, 0, 0, 0);
INSERT INTO `books_tags` VALUES (7, 2, 3, 1, 1703908748, 0);
INSERT INTO `books_tags` VALUES (8, 3, 3, 1, 1703908748, 0);
INSERT INTO `books_tags` VALUES (9, 4, 3, 1, 1703908748, 0);
INSERT INTO `books_tags` VALUES (10, 2, 4, 0, 0, 0);
INSERT INTO `books_tags` VALUES (11, 3, 4, 0, 0, 0);
INSERT INTO `books_tags` VALUES (12, 4, 4, 0, 0, 0);
INSERT INTO `books_tags` VALUES (13, 2, 5, 0, 0, 0);
INSERT INTO `books_tags` VALUES (14, 3, 5, 0, 0, 0);
INSERT INTO `books_tags` VALUES (15, 4, 5, 0, 0, 0);
INSERT INTO `books_tags` VALUES (16, 2, 6, 0, 0, 0);
INSERT INTO `books_tags` VALUES (17, 3, 6, 0, 0, 0);
INSERT INTO `books_tags` VALUES (18, 4, 6, 0, 0, 0);
INSERT INTO `books_tags` VALUES (19, 2, 7, 0, 0, 0);
INSERT INTO `books_tags` VALUES (20, 3, 7, 0, 0, 0);
INSERT INTO `books_tags` VALUES (21, 4, 7, 0, 0, 0);
INSERT INTO `books_tags` VALUES (22, 2, 8, 0, 0, 0);
INSERT INTO `books_tags` VALUES (23, 3, 8, 0, 0, 0);
INSERT INTO `books_tags` VALUES (24, 4, 8, 0, 0, 0);
INSERT INTO `books_tags` VALUES (25, 3, 2, 0, 0, 0);
INSERT INTO `books_tags` VALUES (26, 4, 1, 1, 1703389570, 0);
INSERT INTO `books_tags` VALUES (27, 5, 1, 1, 1703389570, 0);
INSERT INTO `books_tags` VALUES (28, 5, 1, 1, 1703389587, 0);
INSERT INTO `books_tags` VALUES (29, 5, 1, 1, 1703390072, 0);
INSERT INTO `books_tags` VALUES (30, 5, 1, 1, 1703390383, 0);
INSERT INTO `books_tags` VALUES (31, 3, 1, 1, 1703390426, 0);
INSERT INTO `books_tags` VALUES (32, 4, 1, 1, 1703390426, 0);
INSERT INTO `books_tags` VALUES (33, 6, 1, 1, 1703390426, 0);
INSERT INTO `books_tags` VALUES (34, 3, 1, 1, 1703390514, 0);
INSERT INTO `books_tags` VALUES (35, 4, 1, 1, 1703390514, 0);
INSERT INTO `books_tags` VALUES (36, 5, 1, 1, 1703390514, 0);
INSERT INTO `books_tags` VALUES (37, 2, 1, 1, 1703390514, 0);
INSERT INTO `books_tags` VALUES (38, 3, 1, 1, 1703390648, 1703390546);
INSERT INTO `books_tags` VALUES (39, 4, 1, 1, 1703390648, 1703390546);
INSERT INTO `books_tags` VALUES (40, 5, 1, 1, 1703390648, 1703390546);
INSERT INTO `books_tags` VALUES (41, 2, 1, 1, 1703390648, 1703390546);
INSERT INTO `books_tags` VALUES (42, 3, 1, 1, 1703390764, 1703390648);
INSERT INTO `books_tags` VALUES (43, 4, 1, 1, 1703390764, 1703390648);
INSERT INTO `books_tags` VALUES (44, 5, 1, 1, 1703390764, 1703390648);
INSERT INTO `books_tags` VALUES (45, 2, 1, 1, 1703390764, 1703390648);
INSERT INTO `books_tags` VALUES (46, 3, 1, 1, 1703395976, 1703390764);
INSERT INTO `books_tags` VALUES (47, 4, 1, 1, 1703395976, 1703390764);
INSERT INTO `books_tags` VALUES (48, 5, 1, 1, 1703395976, 1703390764);
INSERT INTO `books_tags` VALUES (49, 2, 1, 1, 1703395977, 1703390764);
INSERT INTO `books_tags` VALUES (50, 3, 1, 1, 1703679024, 1703395977);
INSERT INTO `books_tags` VALUES (51, 4, 1, 1, 1703679024, 1703395977);
INSERT INTO `books_tags` VALUES (52, 5, 1, 1, 1703679024, 1703395977);
INSERT INTO `books_tags` VALUES (53, 2, 1, 1, 1703679024, 1703395977);
INSERT INTO `books_tags` VALUES (54, 3, 1, 1, 1703767438, 1703679024);
INSERT INTO `books_tags` VALUES (55, 4, 1, 1, 1703767438, 1703679024);
INSERT INTO `books_tags` VALUES (56, 5, 1, 1, 1703767438, 1703679024);
INSERT INTO `books_tags` VALUES (57, 2, 1, 1, 1703767438, 1703679024);
INSERT INTO `books_tags` VALUES (58, 3, 1, 1, 1703767455, 1703767438);
INSERT INTO `books_tags` VALUES (59, 4, 1, 1, 1703767455, 1703767438);
INSERT INTO `books_tags` VALUES (60, 5, 1, 1, 1703767455, 1703767438);
INSERT INTO `books_tags` VALUES (61, 2, 1, 1, 1703767455, 1703767438);
INSERT INTO `books_tags` VALUES (62, 3, 1, 1, 1703767911, 1703767455);
INSERT INTO `books_tags` VALUES (63, 4, 1, 1, 1703767911, 1703767455);
INSERT INTO `books_tags` VALUES (64, 5, 1, 1, 1703767911, 1703767456);
INSERT INTO `books_tags` VALUES (65, 2, 1, 1, 1703767911, 1703767456);
INSERT INTO `books_tags` VALUES (66, 3, 1, 1, 1703767942, 1703767911);
INSERT INTO `books_tags` VALUES (67, 4, 1, 1, 1703767943, 1703767911);
INSERT INTO `books_tags` VALUES (68, 5, 1, 1, 1703767943, 1703767911);
INSERT INTO `books_tags` VALUES (69, 2, 1, 1, 1703767943, 1703767911);
INSERT INTO `books_tags` VALUES (70, 3, 1, 1, 1703908573, 1703767943);
INSERT INTO `books_tags` VALUES (71, 4, 1, 1, 1703908573, 1703767943);
INSERT INTO `books_tags` VALUES (72, 5, 1, 1, 1703908573, 1703767943);
INSERT INTO `books_tags` VALUES (73, 2, 1, 1, 1703908573, 1703767943);
INSERT INTO `books_tags` VALUES (74, 3, 1, 1, 1703908795, 1703908573);
INSERT INTO `books_tags` VALUES (75, 4, 1, 1, 1703908795, 1703908573);
INSERT INTO `books_tags` VALUES (76, 5, 1, 1, 1703908795, 1703908573);
INSERT INTO `books_tags` VALUES (77, 2, 1, 1, 1703908795, 1703908573);
INSERT INTO `books_tags` VALUES (78, 2, 3, 0, 1703908748, 1703908748);
INSERT INTO `books_tags` VALUES (79, 3, 3, 0, 1703908748, 1703908748);
INSERT INTO `books_tags` VALUES (80, 4, 3, 0, 1703908748, 1703908748);
INSERT INTO `books_tags` VALUES (81, 3, 1, 1, 1703914990, 1703908795);
INSERT INTO `books_tags` VALUES (82, 4, 1, 1, 1703914990, 1703908795);
INSERT INTO `books_tags` VALUES (83, 5, 1, 1, 1703914990, 1703908795);
INSERT INTO `books_tags` VALUES (84, 2, 1, 1, 1703914990, 1703908795);
INSERT INTO `books_tags` VALUES (85, 25, 1, 0, 1703914990, 1703914990);
INSERT INTO `books_tags` VALUES (86, 24, 1, 0, 1703914990, 1703914990);
INSERT INTO `books_tags` VALUES (87, 23, 1, 0, 1703914990, 1703914990);

-- ----------------------------
-- Table structure for cates
-- ----------------------------
DROP TABLE IF EXISTS `cates`;
CREATE TABLE `cates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cates
-- ----------------------------
INSERT INTO `cates` VALUES (1, '言情', 0, 1, 1701790828, 1701737607);
INSERT INTO `cates` VALUES (2, '小说小说', 0, 0, 1703392287, 1701738339);
INSERT INTO `cates` VALUES (3, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (4, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (5, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (6, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (7, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (8, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (9, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (10, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (11, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (12, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (13, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (14, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (15, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (16, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (17, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (18, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (19, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (20, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (21, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (22, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (23, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (24, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (25, '水电费', 11, 0, 1703907234, 1703907169);
INSERT INTO `cates` VALUES (26, '222', 222, 0, 0, 1703907239);

-- ----------------------------
-- Table structure for index_banners
-- ----------------------------
DROP TABLE IF EXISTS `index_banners`;
CREATE TABLE `index_banners`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `page` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sort` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title` ASC) USING BTREE,
  INDEX `idx_sort`(`sort` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_banners
-- ----------------------------
INSERT INTO `index_banners` VALUES (1, 'banner1', 'images/1702212792468.png', '2', 0, 0, 1702214432, 0);
INSERT INTO `index_banners` VALUES (2, 'banner2', 'images/1702215482241.png', '2', 4, 0, 1702217663, 0);
INSERT INTO `index_banners` VALUES (3, '标题', 'images/1702295171526.png', '1', 122, 1, 1702298009, 0);
INSERT INTO `index_banners` VALUES (4, '1', 'images/1702297873741.png', '1', 1, 0, 1702298081, 0);
INSERT INTO `index_banners` VALUES (5, '个梵蒂冈地方', 'images/1702694321520.png', '2', 1, 0, 0, 0);

-- ----------------------------
-- Table structure for index_pages
-- ----------------------------
DROP TABLE IF EXISTS `index_pages`;
CREATE TABLE `index_pages`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cate_id` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `sort` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title` ASC) USING BTREE,
  INDEX `idx_sort`(`sort` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_pages
-- ----------------------------
INSERT INTO `index_pages` VALUES (1, '测试', '4', 3, 3, 1, 1702649055, 1702301216);
INSERT INTO `index_pages` VALUES (2, '模块1', '2,4,3,5,6', 1, 100, 0, 1702794558, 1702649073);
INSERT INTO `index_pages` VALUES (3, '模块2', '2,3,4,5', 2, 90, 0, 1702794998, 1702649089);
INSERT INTO `index_pages` VALUES (4, '模式3', '2,4,3,5', 3, 80, 0, 1702795005, 1702649103);

-- ----------------------------
-- Table structure for koulings
-- ----------------------------
DROP TABLE IF EXISTS `koulings`;
CREATE TABLE `koulings`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `book_id` int UNSIGNED NOT NULL DEFAULT 0,
  `use_count` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_token`(`token` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of koulings
-- ----------------------------
INSERT INTO `koulings` VALUES (1, 3, '658594c3', 1, 0, 0, 1703253187, 1703253187);
INSERT INTO `koulings` VALUES (2, 3, '65859507', 1, 0, 0, 1703253255, 1703253255);
INSERT INTO `koulings` VALUES (3, 3, '6585951b', 1, 0, 0, 1703253275, 1703253275);
INSERT INTO `koulings` VALUES (4, 3, '6585951f', 1, 0, 0, 1703253279, 1703253279);
INSERT INTO `koulings` VALUES (5, 3, '6585952a', 1, 0, 0, 1703253290, 1703253290);
INSERT INTO `koulings` VALUES (6, 3, '1iob5b5', 1, 0, 0, 1703253349, 1703253349);
INSERT INTO `koulings` VALUES (7, 3, '1iob5b9', 1, 0, 0, 1703253353, 1703253353);
INSERT INTO `koulings` VALUES (8, 3, '1iob5bf', 1, 0, 0, 1703253359, 1703253359);
INSERT INTO `koulings` VALUES (9, 3, '1iob5cg', 1, 0, 0, 1703253392, 1703253392);
INSERT INTO `koulings` VALUES (10, 3, '1iob5cn', 1, 0, 0, 1703253399, 1703253399);
INSERT INTO `koulings` VALUES (11, 3, '1iob5dj', 1, 0, 0, 1703253427, 1703253427);
INSERT INTO `koulings` VALUES (12, 3, '1iodhj1', 1, 0, 0, 1703331425, 1703331425);
INSERT INTO `koulings` VALUES (13, 3, '1iodj4b', 1, 0, 0, 1703333003, 1703333003);
INSERT INTO `koulings` VALUES (14, 3, '1iofsv1', 1, 0, 0, 1703408609, 1703408609);
INSERT INTO `koulings` VALUES (15, 3, '1iofsv5', 1, 0, 0, 1703408613, 1703408613);
INSERT INTO `koulings` VALUES (16, 3, '1ioft3s', 1, 0, 0, 1703408764, 1703408764);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES (1, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (2, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (3, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (4, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (5, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (6, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (7, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (8, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (9, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (10, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (11, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (12, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (13, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (14, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (15, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (16, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (17, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (18, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (19, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (20, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (21, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (22, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (23, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (24, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (25, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (26, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (27, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (28, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (29, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (30, '公告32', '公告内容333', 0, 1702394719, 1702394552);
INSERT INTO `notices` VALUES (31, '标题', '内容', 0, 1702394546, 1702394542);
INSERT INTO `notices` VALUES (32, '公告32', '公告内容333', 0, 1702394719, 1702394552);

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_key`(`key` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (1, 'mini_program_setting', '{\"mobile\":\"1212121\",\"url\":\"images\\/1703168592932.jpg\",\"weixin\":\"drtgdrwtger\",\"avatar\":\"images\\/1703168604737.png\",\"kouling_url\":\"images\\/1703168611067.png\",\"open_member_url\":\"images\\/1703168598460.png\",\"shuku_background_url\":\"images\\/1703261850503.webp\"}', 0, 1703261854, 1702383807);
INSERT INTO `options` VALUES (3, 'setting', '{\"type\":\"2\",\"value\":\"22\"}', 0, 1703263400, 1703262793);

-- ----------------------------
-- Table structure for pays
-- ----------------------------
DROP TABLE IF EXISTS `pays`;
CREATE TABLE `pays`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `out_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `book_id` int UNSIGNED NOT NULL DEFAULT 0,
  `pattern` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '充值类型，1金币， 2会员',
  `pay` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付金额',
  `item_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `kouling_money` int UNSIGNED NOT NULL DEFAULT 0,
  `kouling` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `kouling_user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '分享口令的用户',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `way` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '1-微信支付，2-支付宝支付，10-抖音支付',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `page` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recharge_type_id` int UNSIGNED NOT NULL DEFAULT 0,
  `recharge_type_num` int UNSIGNED NOT NULL DEFAULT 0,
  `recharge_type_type` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int NOT NULL,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  `recharge_type_coin` int UNSIGNED NOT NULL DEFAULT 0,
  `recharge_type_give_coin` int UNSIGNED NOT NULL DEFAULT 0,
  `recharge_type_pattern` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_out_order_no`(`out_order_no` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_kouling_user_id`(`kouling_user_id` ASC) USING BTREE,
  INDEX `idx_recharge_type_id`(`recharge_type_id` ASC) USING BTREE,
  INDEX `idx_kouling`(`kouling` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pays
-- ----------------------------
INSERT INTO `pays` VALUES (1, '342232', '', '', 1, 1, 0, 2222, '', 345, 'gdfsgsd', 3, 1, 0, '', '', '', 0, 0, 0, 0, 1705156875, 1705156875, 0, 0, 0);
INSERT INTO `pays` VALUES (3, 'a1iodjao3', '', '', 3, 1, 0, 8888, '', 543, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703333208, 1703333208, 0, 0, 0);
INSERT INTO `pays` VALUES (4, 'a1iodjff3', '', '', 3, 1, 0, 3600, '', 2456, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703333359, 1703333359, 0, 0, 0);
INSERT INTO `pays` VALUES (5, 'a1iodjko3', '', '', 3, 1, 0, 8888, '', 443, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703333528, 1703333528, 0, 0, 0);
INSERT INTO `pays` VALUES (6, 'a1iodkag3', '', '', 3, 1, 0, 3600, '', 677, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334224, 1703334224, 0, 0, 0);
INSERT INTO `pays` VALUES (7, 'a1iodkck3', '', '', 3, 1, 0, 8888, '', 44, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334292, 1703334292, 0, 0, 0);
INSERT INTO `pays` VALUES (8, 'a1iodkdf3', '', '', 3, 1, 0, 3600, '', 333, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334319, 1703334319, 0, 0, 0);
INSERT INTO `pays` VALUES (9, 'a1iodkg73', '', '', 3, 1, 0, 8888, '', 2222, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334407, 1703334407, 0, 0, 0);
INSERT INTO `pays` VALUES (10, 'a1iodkic3', '', '', 3, 1, 0, 3600, '', 792, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334476, 1703334476, 0, 0, 0);
INSERT INTO `pays` VALUES (11, 'a1iodkma3', '', '', 3, 1, 0, 8888, '', 792, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334602, 1703334602, 0, 0, 0);
INSERT INTO `pays` VALUES (12, 'a1iodkpp3', '', '', 3, 1, 0, 3600, '', 792, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334713, 1703334713, 0, 0, 0);
INSERT INTO `pays` VALUES (21, '342232', '', '', 1, 1, 0, 2222, '', 345, 'gdfsgsd', 3, 1, 0, '', '', '', 0, 0, 0, 0, 1705156875, 1705156875, 0, 0, 0);
INSERT INTO `pays` VALUES (23, 'a1iodjao3', '', '', 3, 1, 0, 8888, '', 543, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703333208, 1703333208, 0, 0, 0);
INSERT INTO `pays` VALUES (24, 'a1iodjff3', '', '', 3, 1, 0, 3600, '', 2456, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703333359, 1703333359, 0, 0, 0);
INSERT INTO `pays` VALUES (25, 'a1iodjko3', '', '', 3, 1, 0, 8888, '', 443, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703333528, 1703333528, 0, 0, 0);
INSERT INTO `pays` VALUES (26, 'a1iodkag3', '', '', 3, 1, 0, 3600, '', 677, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334224, 1703334224, 0, 0, 0);
INSERT INTO `pays` VALUES (27, 'a1iodkck3', '', '', 3, 1, 0, 8888, '', 44, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334292, 1703334292, 0, 0, 0);
INSERT INTO `pays` VALUES (28, 'a1iodkdf3', '', '', 3, 1, 0, 3600, '', 333, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334319, 1703334319, 0, 0, 0);
INSERT INTO `pays` VALUES (29, 'a1iodkg73', '', '', 3, 1, 0, 8888, '', 2222, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334407, 1703334407, 0, 0, 0);
INSERT INTO `pays` VALUES (30, 'a1iodkic3', '', '', 3, 1, 0, 3600, '', 792, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334476, 1703334476, 0, 0, 0);
INSERT INTO `pays` VALUES (31, 'a1iodkma3', '', '', 3, 1, 0, 8888, '', 792, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334602, 1703334602, 0, 0, 0);
INSERT INTO `pays` VALUES (32, 'a1iodkpp3', '', '', 3, 1, 0, 3600, '', 792, '1iodj4b', 3, 1, 0, '会员充值', '会员充值', '/pages/detail/detail?id=1', 0, 0, 0, 0, 1703334713, 1703334713, 0, 0, 0);
INSERT INTO `pays` VALUES (33, 'a1ioojai9', 'N71016888186626816', '', 9, 1, 0, 1500, '', 63, '1ioft3s', 3, 1, 2, '会员充值', '会员充值', '', 0, 0, 0, 0, 1704116494, 1703693650, 0, 0, 0);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\Admin', 1, 'jiangqiao', '0964d80e97d0f5c3116bdd2597dfb8a1b43b0bf2a2fa5f10f2757f5cf246e3a2', '[\"*\"]', NULL, '2023-12-03 12:02:27', '2023-12-03 12:02:27');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\Admin', 1, 'jiangqiao', '3b3c943b4447ac3b07e71edacea6cc1d21e6191d61efa24afdae15551124f42e', '[\"*\"]', NULL, '2023-12-03 12:08:37', '2023-12-03 12:08:37');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\Admin', 1, 'jiangqiao', '68de011c7f7315d1e5e1d384f7b8dae5d1ac4a6d1b32cf52a0b4b3bac075a1a1', '[\"*\"]', NULL, '2023-12-03 12:14:08', '2023-12-03 12:14:08');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\Admin', 1, 'jiangqiao', 'aaf0f73c4879e626bb00c051222f3837e953b3767bd2d3043506965cccda1efa', '[\"*\"]', NULL, '2023-12-03 12:15:23', '2023-12-03 12:15:23');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\Admin', 1, 'jiangqiao', 'a3a7ebfc26e968a8d0b008a6d9e04c06aff0d9b61b55e71c90298cde25da8311', '[\"*\"]', NULL, '2023-12-03 12:26:22', '2023-12-03 12:26:22');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\Admin', 1, 'jiangqiao', '8fee3a62d78739dce3c8d96a0b50818a69ccf690d75d9d8b3ffafeef5c8f4ced', '[\"*\"]', NULL, '2023-12-03 12:27:46', '2023-12-03 12:27:46');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\Models\\Admin', 1, 'jiangqiao', '3c51e49916d4f7dd551e44725fef6eaf3e18eecc236f881827f455a097120c59', '[\"*\"]', NULL, '2023-12-03 12:29:15', '2023-12-03 12:29:15');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\Models\\Admin', 1, 'jiangqiao', '14517093fa98ede98c25cf593ba8dee1eaa72f69985a6ddfbe29ae0b8e83c697', '[\"*\"]', NULL, '2023-12-03 12:30:40', '2023-12-03 12:30:40');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\Models\\Admin', 1, 'jiangqiao', 'ca1321800c94eec27e86588cbeb53d42c067ed8ccbbbdd53e21162e82c409972', '[\"*\"]', NULL, '2023-12-03 12:31:43', '2023-12-03 12:31:43');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\Admin', 1, 'jiangqiao', 'c0e44b17c1535b8110f32ca455f53791e45085eaf16c0e6ee865029b990729dd', '[\"*\"]', NULL, '2023-12-03 12:32:14', '2023-12-03 12:32:14');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\Admin', 1, 'jiangqiao', '8a92037d8a5e437080ea4ee429f497dde5c575b6d186005b9c4165c4ae4525a2', '[\"*\"]', NULL, '2023-12-03 12:32:16', '2023-12-03 12:32:16');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\Admin', 1, 'jiangqiao', 'd4bf4709070124f318d18eea37dcf7a08bc9648296768bad3b9d78ee1e9ff050', '[\"*\"]', NULL, '2023-12-03 12:33:43', '2023-12-03 12:33:43');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\Admin', 1, 'jiangqiao', 'b12dc4af9c2a06b53fb404794371bafaa5ad346f238d6640ae775966d8291705', '[\"*\"]', NULL, '2023-12-03 12:33:45', '2023-12-03 12:33:45');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\Models\\Admin', 1, 'jiangqiao', 'dc4379ba8a16ee692b92f17cd0467054d641585c867678cc47ae6ec2df38f33c', '[\"*\"]', NULL, '2023-12-03 12:34:32', '2023-12-03 12:34:32');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\Models\\Admin', 1, 'jiangqiao', 'ed58e2fcca0c04b3fabacb7cef9c6b775d5dafc6010aba339c04d1ace14649a1', '[\"*\"]', NULL, '2023-12-03 12:34:33', '2023-12-03 12:34:33');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\Models\\Admin', 1, 'jiangqiao', 'd5aa0379ad1493f85d21ad10267371a9228a2a9baa07f187c8e872ef938f9446', '[\"*\"]', NULL, '2023-12-03 12:35:37', '2023-12-03 12:35:37');
INSERT INTO `personal_access_tokens` VALUES (17, 'App\\Models\\Admin', 2, 'jiangqiao', '0845f995aed739c8603ce11ccafc36a5e085dd026ec81556b69bb68d9f9999e3', '[\"*\"]', NULL, '2023-12-03 12:42:18', '2023-12-03 12:42:18');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\Models\\Admin', 2, 'jiangqiao', 'a750bb31c184c0c3eed16ea2f3c841e6be0a7dc4c5a59005573c0b87be8503ae', '[\"*\"]', NULL, '2023-12-03 12:42:37', '2023-12-03 12:42:37');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\Models\\Admin', 3, 'jiangqiao', '333539401363478168fc6bd7ffd67dbed0b92698b0f37618c5532c50ee53e562', '[\"*\"]', NULL, '2023-12-03 12:43:18', '2023-12-03 12:43:18');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\Models\\Admin', 3, 'jiangqiao', '0c6f71e3cf5babc9e9e2731c6a5ddd592a22d862154cbae8140501f0791c336a', '[\"*\"]', NULL, '2023-12-03 12:43:19', '2023-12-03 12:43:19');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\Models\\Admin', 3, 'jiangqiao', '8b2da2c6eaf68be88d260e44d7d26e1ac8f75d34511adf71e04531304567c37a', '[\"*\"]', NULL, '2023-12-03 12:43:20', '2023-12-03 12:43:20');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\Models\\Admin', 3, 'jiangqiao', '50510356bf42fc041348ac8b772497514a83e76b882ab620ae4ac30610a390cd', '[\"*\"]', NULL, '2023-12-03 12:45:24', '2023-12-03 12:45:24');
INSERT INTO `personal_access_tokens` VALUES (23, 'App\\Models\\Admin', 3, 'jiangqiao', '2be06716d74bba26dc465d86522b4e1c6fef927c596837d2eb47c4f0b27cf364', '[\"*\"]', NULL, '2023-12-03 12:45:25', '2023-12-03 12:45:25');
INSERT INTO `personal_access_tokens` VALUES (24, 'App\\Models\\Admin', 3, 'jiangqiao', '782937a890f3c93c10aafb92432ecb09a3d165cf46dd31a3403bb6ec8e6c1ff8', '[\"*\"]', NULL, '2023-12-03 12:45:26', '2023-12-03 12:45:26');
INSERT INTO `personal_access_tokens` VALUES (25, 'App\\Models\\Admin', 3, 'jiangqiao', 'ee5070f3e43c24406d86507e983c0971928758fabef4c061aa13278282c28481', '[\"*\"]', NULL, '2023-12-03 12:45:59', '2023-12-03 12:45:59');
INSERT INTO `personal_access_tokens` VALUES (26, 'App\\Models\\Admin', 3, 'jiangqiao', '40644d45165c0a6cece8a6f08579b074585a47949eac86aa92e5ec4982043f43', '[\"*\"]', NULL, '2023-12-03 12:46:01', '2023-12-03 12:46:01');
INSERT INTO `personal_access_tokens` VALUES (27, 'App\\Models\\Admin', 3, 'jiangqiao', '950602f9ee0b01c45f81c3366b3219b4a81c43bda8db05899acf264a12733afe', '[\"*\"]', NULL, '2023-12-03 12:46:24', '2023-12-03 12:46:24');
INSERT INTO `personal_access_tokens` VALUES (28, 'App\\Models\\Admin', 3, 'jiangqiao', 'de63b60d9615678cb82a759cd6c058847139d44085580dee807a51af014d43cc', '[\"*\"]', NULL, '2023-12-03 12:46:25', '2023-12-03 12:46:25');
INSERT INTO `personal_access_tokens` VALUES (29, 'App\\Models\\Admin', 3, 'jiangqiao', '8899423f7c12e824922791473e80af3933f0f3c1ed818adf86194396e2ea91b2', '[\"*\"]', NULL, '2023-12-03 12:46:27', '2023-12-03 12:46:27');
INSERT INTO `personal_access_tokens` VALUES (30, 'App\\Models\\Admin', 3, 'jiangqiao', 'f82d751585fb369272182bce25a2540344894b6ebb7030f560b878db2e4f797a', '[\"*\"]', NULL, '2023-12-03 12:47:42', '2023-12-03 12:47:42');
INSERT INTO `personal_access_tokens` VALUES (31, 'App\\Models\\Admin', 3, 'jiangqiao', '6187cab30f7dc0d2040068a7386ef1e542eb8169e39571eebbb49a8d14aac320', '[\"*\"]', NULL, '2023-12-03 12:47:43', '2023-12-03 12:47:43');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\Models\\Admin', 3, 'jiangqiao', '60a0dd75a0864e5558683fb465266b4b79c5e43b763aa356de5123f3fde05581', '[\"*\"]', NULL, '2023-12-03 12:59:48', '2023-12-03 12:59:48');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\Models\\Admin', 3, 'jiangqiao', '415698a306f7c80348f86c1d0ffa5fe4b6acbea83452160c81c50a262d8cd846', '[\"*\"]', NULL, '2023-12-03 13:14:34', '2023-12-03 13:14:34');

-- ----------------------------
-- Table structure for recharge_types
-- ----------------------------
DROP TABLE IF EXISTS `recharge_types`;
CREATE TABLE `recharge_types`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '充值名称',
  `pattern` tinyint(1) NOT NULL COMMENT '0充值会员，1充值金币',
  `short_title` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小标题',
  `price` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '金额，分',
  `old_price` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '原价，分',
  `num` int UNSIGNED NOT NULL COMMENT '有效天数，周数，年数',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0天，1周，2月，3季度，4年',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `coin` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '金币数',
  `is_first` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '针对未充值用户0，针对已充值用户1',
  `give_coin` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '赠送金币数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharge_types
-- ----------------------------
INSERT INTO `recharge_types` VALUES (1, '周会员29999', 0, '热门', 99900, 199000, 1, 1, 0, 1703952655, 1703952655, 0, 0, 0);
INSERT INTO `recharge_types` VALUES (2, '月会员', 0, '限时', 3600, 5600, 1, 2, 0, 0, 1703088751, 0, 0, 0);
INSERT INTO `recharge_types` VALUES (3, '季度会员', 0, '本周', 8888, 19800, 1, 3, 0, 0, 1703088774, 0, 0, 0);
INSERT INTO `recharge_types` VALUES (4, '年费会员', 0, '爆款', 99900, 199000, 1, 4, 0, 0, 1703088798, 0, 0, 0);
INSERT INTO `recharge_types` VALUES (5, '测试', 0, '菜单', 33, 33, 8, 0, 1, 1703090078, 1703090061, 0, 0, 0);
INSERT INTO `recharge_types` VALUES (6, '买500赠送300', 1, '性价比', 5000, 0, 0, 0, 0, 0, 1703770693, 500, 0, 300);
INSERT INTO `recharge_types` VALUES (7, '截止01月20日', 1, '限时特惠', 1, 0, 0, 0, 0, 0, 1703771295, 5000, 0, 2000);
INSERT INTO `recharge_types` VALUES (8, '元旦活动', 1, '活动', 1, 0, 0, 0, 0, 0, 1703771339, 2000, 0, 1000);
INSERT INTO `recharge_types` VALUES (9, '全年仅此一次', 1, '限购', 10000, 0, 0, 0, 0, 0, 1703771375, 20000, 0, 5000);
INSERT INTO `recharge_types` VALUES (11, '周会员（首充2222）', 0, '热门', 99900, 199000, 1, 1, 1, 1703952439, 1703952435, 0, 1, 0);
INSERT INTO `recharge_types` VALUES (12, '首充', 0, '限时', 3600, 5600, 1, 2, 0, 1704111255, 1704111255, 0, 1, 0);
INSERT INTO `recharge_types` VALUES (13, '季度会员', 0, '本周', 8888, 19800, 1, 3, 0, 0, 1703088774, 0, 1, 0);
INSERT INTO `recharge_types` VALUES (14, '年费会员', 0, '爆款', 99900, 199000, 1, 4, 0, 0, 1703088798, 0, 1, 0);
INSERT INTO `recharge_types` VALUES (15, '测试', 0, '菜单', 33, 33, 8, 0, 1, 1703090078, 1703090061, 0, 1, 0);
INSERT INTO `recharge_types` VALUES (16, '买500赠送300', 1, '性价比', 5000, 0, 0, 0, 0, 0, 1703770693, 500, 1, 300);
INSERT INTO `recharge_types` VALUES (17, '截止01月20日', 1, '限时特惠', 1, 0, 0, 0, 0, 0, 1703771295, 5000, 1, 2000);
INSERT INTO `recharge_types` VALUES (18, '元旦活动', 1, '活动', 1, 0, 0, 0, 0, 0, 1703771339, 2000, 1, 1000);
INSERT INTO `recharge_types` VALUES (19, '全年仅此一次', 1, '限购', 10000, 0, 0, 0, 0, 0, 1703771375, 20000, 1, 5000);
INSERT INTO `recharge_types` VALUES (20, 'cc', 0, 'cc', 1, 1, 1, 0, 0, 0, 1704108374, 0, 0, 0);
INSERT INTO `recharge_types` VALUES (21, '首充2', 0, '爆款', 1, 1, 1, 0, 0, 0, 1704108725, 0, 1, 0);
INSERT INTO `recharge_types` VALUES (22, '首充23', 1, '的说法的', 3, 0, 0, 0, 0, 0, 1704112105, 2, 1, 1);

-- ----------------------------
-- Table structure for recharges
-- ----------------------------
DROP TABLE IF EXISTS `recharges`;
CREATE TABLE `recharges`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `money` int UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int NOT NULL,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharges
-- ----------------------------
INSERT INTO `recharges` VALUES (2, 3, 68790, 1, 0, 1703861318, 1703258211);
INSERT INTO `recharges` VALUES (3, 3, 0, 0, 0, 1703258235, 1703258235);
INSERT INTO `recharges` VALUES (4, 3, 0, 0, 0, 1703258256, 1703258256);
INSERT INTO `recharges` VALUES (5, 3, 0, 0, 0, 1703258276, 1703258276);
INSERT INTO `recharges` VALUES (6, 3, 0, 0, 0, 1703258297, 1703258297);
INSERT INTO `recharges` VALUES (7, 3, 0, 0, 0, 1703258299, 1703258299);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '运营', 1, 1701872839, 1701872660);
INSERT INTO `roles` VALUES (2, '运营订单22', 0, 1702131592, 1701873345);
INSERT INTO `roles` VALUES (3, '测试', 0, 0, 1702085986);
INSERT INTO `roles` VALUES (7, '34232', 0, 1702089471, 1702089471);
INSERT INTO `roles` VALUES (8, '运营订单', 1, 1702131055, 1702130382);
INSERT INTO `roles` VALUES (9, '运营订单', 1, 1702131326, 1702131061);
INSERT INTO `roles` VALUES (10, '运营订单', 1, 1702131456, 1702131332);
INSERT INTO `roles` VALUES (11, '运营订单', 1, 1702131566, 1702131462);

-- ----------------------------
-- Table structure for roles_actions
-- ----------------------------
DROP TABLE IF EXISTS `roles_actions`;
CREATE TABLE `roles_actions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `action_id` int UNSIGNED NOT NULL DEFAULT 0,
  `role_id` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles_actions
-- ----------------------------

-- ----------------------------
-- Table structure for share_code_users
-- ----------------------------
DROP TABLE IF EXISTS `share_code_users`;
CREATE TABLE `share_code_users`  (
  `id` int UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `share_code_id` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_share_code_id`(`share_code_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '根据分享口令进来的用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of share_code_users
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (1, '言情', 0, 1, 1701790828, 1701737607);
INSERT INTO `tags` VALUES (2, '小说小说', 0, 1, 1703907658, 1701738339);
INSERT INTO `tags` VALUES (3, '爽文22', 111, 0, 1703907870, 1701738441);
INSERT INTO `tags` VALUES (4, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `tags` VALUES (5, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `tags` VALUES (6, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `tags` VALUES (7, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `tags` VALUES (8, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `tags` VALUES (9, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `tags` VALUES (10, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `tags` VALUES (11, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `tags` VALUES (12, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `tags` VALUES (13, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `tags` VALUES (14, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `tags` VALUES (15, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `tags` VALUES (16, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `tags` VALUES (17, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `tags` VALUES (18, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `tags` VALUES (19, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `tags` VALUES (20, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `tags` VALUES (21, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `tags` VALUES (22, '言情', 0, 0, 1701779673, 1701737607);
INSERT INTO `tags` VALUES (23, '小说', 0, 0, 1701738341, 1701738339);
INSERT INTO `tags` VALUES (24, '爽文', 0, 0, 1701738494, 1701738441);
INSERT INTO `tags` VALUES (25, '1222', 1, 0, 0, 1703907876);

-- ----------------------------
-- Table structure for uids
-- ----------------------------
DROP TABLE IF EXISTS `uids`;
CREATE TABLE `uids`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uids
-- ----------------------------
INSERT INTO `uids` VALUES (1, 1702823606);
INSERT INTO `uids` VALUES (2, 1702823635);
INSERT INTO `uids` VALUES (3, 1702824369);
INSERT INTO `uids` VALUES (4, 1703603991);
INSERT INTO `uids` VALUES (5, 1704041573);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT 'uid',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `gender` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0未知，1男，2女',
  `province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'access_token',
  `vip_end_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员结束时间',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `share_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分享码',
  `recharge_money` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '累计提现',
  `wait_recharge_money` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '待提现',
  `money` int UNSIGNED NOT NULL COMMENT '会员金币余额，用于抵扣阅读',
  `pay_money` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '累计充值',
  `pay_coin` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '累计消耗金币',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_access_token`(`access_token` ASC) USING BTREE,
  INDEX `idx_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_nickname`(`nickname` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 12345, '游客3242', 'images/1703678646260.png', 0, '', '', '38d1d3a108f7a13046dad1baa37a1bed', 0, '222', 'ce7cce5b-2952-59f2-b0f3-d48a7dd41285', '', 0, 0, 0, 0, 0, 1, 1703166765, 1702823606);
INSERT INTO `users` VALUES (3, 3, '哈哈哈', 'images/1703678646260.png', 0, '', '', '941b85d24864ede6ca94e1da126bab91', 0, '_000rWuSpAlRlDZWZHVwCCFNZHjuWtaarwvv', 'ce7cce5b-2952-59f2-b0f3-d48a7dd41285', '122222', 888555, 252, 0, 0, 0, 0, 1704116494, 1702824369);
INSERT INTO `users` VALUES (4, 4, '游客1703603991', 'images/1703678646260.png', 0, '', '', 'c51ce410c124a10e0db5e4b97fc2af39', 0, '', '', '', 0, 0, 0, 0, 0, 0, 1703604013, 1703603991);
INSERT INTO `users` VALUES (5, 5, '谜鹿1704041573', 'images/1703168604737.png', 0, '', '', '9afd910db3b748620dce8ce1550c8644', 0, '_000Ex-_8I3pUbX7yx4CRjPSMkdhfn6_Mc-m', '1c71feac-f52f-5fdb-9c6b-25034f90898a', '', 0, 0, 0, 0, 0, 0, 1704088863, 1704041573);

-- ----------------------------
-- Table structure for users_books
-- ----------------------------
DROP TABLE IF EXISTS `users_books`;
CREATE TABLE `users_books`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `book_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '书籍id',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `is_collection` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否收藏',
  `is_viewing` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '正在阅读的书籍',
  `view_chapter` int NOT NULL COMMENT '阅读的章节',
  `view_index` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '阅读的位置',
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '作者浏览书籍的记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_books
-- ----------------------------
INSERT INTO `users_books` VALUES (2, 3, 1, 0, 1, 1, 1, 850.29, 1703427976, 1702834861);
INSERT INTO `users_books` VALUES (5, 3, 2, 0, 1, 1, 0, 0.00, 0, 1702908932);
INSERT INTO `users_books` VALUES (6, 3, 3, 0, 1, 1, 0, 0.00, 0, 1702908939);
INSERT INTO `users_books` VALUES (7, 3, 4, 0, 1, 1, 0, 0.00, 0, 1702908961);
INSERT INTO `users_books` VALUES (8, 3, 5, 0, 1, 1, 0, 0.00, 0, 1702908964);
INSERT INTO `users_books` VALUES (9, 3, 6, 0, 1, 1, 0, 0.00, 0, 1702913742);
INSERT INTO `users_books` VALUES (10, 3, 7, 0, 1, 1, 0, 0.00, 0, 1702913754);
INSERT INTO `users_books` VALUES (11, 3, 8, 0, 1, 1, 0, 0.00, 0, 1702913925);
INSERT INTO `users_books` VALUES (12, 3, 9, 0, 1, 1, 0, 0.00, 0, 1702913928);
INSERT INTO `users_books` VALUES (13, 3, 10, 0, 1, 1, 0, 0.00, 1703385354, 1702914520);
INSERT INTO `users_books` VALUES (15, 3, 11, 0, 1, 1, 1, 6666.86, 1703008435, 1703000513);
INSERT INTO `users_books` VALUES (16, 3, 12, 0, 1, 1, 0, 0.00, 0, 1702913754);
INSERT INTO `users_books` VALUES (17, 3, 13, 0, 1, 1, 1, 0.00, 1703346434, 1702913925);
INSERT INTO `users_books` VALUES (18, 3, 14, 0, 1, 1, 0, 0.00, 0, 1702913928);
INSERT INTO `users_books` VALUES (19, 3, 15, 0, 1, 1, 0, 0.00, 0, 1702914520);
INSERT INTO `users_books` VALUES (20, 3, 16, 0, 1, 1, 1, 6666.86, 1703008435, 1703000513);
INSERT INTO `users_books` VALUES (21, 3, 17, 0, 1, 1, 2, 13328.00, 1703334743, 1703165303);
INSERT INTO `users_books` VALUES (31, 3, 18, 0, 1, 1, 2, 744.00, 1703428200, 1703165303);

-- ----------------------------
-- Table structure for users_books_chapters
-- ----------------------------
DROP TABLE IF EXISTS `users_books_chapters`;
CREATE TABLE `users_books_chapters`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` int UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `index` int UNSIGNED NOT NULL DEFAULT 0,
  `coin` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `pattern` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '付费方式，0会员，1金币，2免费章节，3分享章节',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_index`(`index` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_books_chapters
-- ----------------------------
INSERT INTO `users_books_chapters` VALUES (1, 1, 4, 1, 11, 1, 0, 1111111111, 1111111111);
INSERT INTO `users_books_chapters` VALUES (2, 1, 4, 1, 0, 0, 0, 1111111111, 1111111111);

-- ----------------------------
-- Table structure for users_books_comments
-- ----------------------------
DROP TABLE IF EXISTS `users_books_comments`;
CREATE TABLE `users_books_comments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` int UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_books_comments
-- ----------------------------
INSERT INTO `users_books_comments` VALUES (1, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 1, 1, 1703440618, 1712345678);
INSERT INTO `users_books_comments` VALUES (2, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 1, 1, 1703440622, 1712345678);
INSERT INTO `users_books_comments` VALUES (3, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 1, 1, 1703441077, 1712345678);
INSERT INTO `users_books_comments` VALUES (4, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 2, 1703441526, 1712345678);
INSERT INTO `users_books_comments` VALUES (5, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (6, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (7, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (8, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (9, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (10, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (11, 3, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和呢大师傅和责编呢大师傅师傅', 0, 0, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (12, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (13, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (14, 3, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师', 0, 0, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (15, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (16, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (17, 3, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 0, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (18, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 1, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (19, 1, 1, '和责编呢大和责编呢大师傅和责编呢大师傅和责编呢大师傅大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅和责编呢大师傅师傅', 0, 0, 1712345678, 1712345678);
INSERT INTO `users_books_comments` VALUES (21, 1, 1, '324234', 0, 0, 1703433927, 1703433927);
INSERT INTO `users_books_comments` VALUES (22, 1, 1, '22222', 0, 0, 1703434050, 1703434050);
INSERT INTO `users_books_comments` VALUES (23, 1, 1, '111', 0, 0, 1703434101, 1703434101);
INSERT INTO `users_books_comments` VALUES (24, 1, 1, '666', 0, 0, 1703434225, 1703434225);
INSERT INTO `users_books_comments` VALUES (25, 1, 1, '666', 0, 0, 1703434351, 1703434351);
INSERT INTO `users_books_comments` VALUES (26, 1, 1, '666', 0, 0, 1703434383, 1703434383);
INSERT INTO `users_books_comments` VALUES (27, 1, 3, '888', 0, 0, 1703434473, 1703434473);

-- ----------------------------
-- Table structure for users_notice
-- ----------------------------
DROP TABLE IF EXISTS `users_notice`;
CREATE TABLE `users_notice`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0系统通知，1管理员通知，2支付通知，3收益通知',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_notice
-- ----------------------------

-- ----------------------------
-- Table structure for users_recharge
-- ----------------------------
DROP TABLE IF EXISTS `users_recharge`;
CREATE TABLE `users_recharge`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `recharge_type_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '充值id',
  `pay` int UNSIGNED NOT NULL COMMENT '充值金额，分',
  `day` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '可以免费看多少天',
  `status` tinyint(1) NOT NULL COMMENT '状态，是否支付成功',
  `created_at` int UNSIGNED NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_recharge_type_id`(`recharge_type_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for users_setting
-- ----------------------------
DROP TABLE IF EXISTS `users_setting`;
CREATE TABLE `users_setting`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设置内容',
  `created_at` int NOT NULL COMMENT '用户设置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_setting
-- ----------------------------

-- ----------------------------
-- Table structure for users_share_code
-- ----------------------------
DROP TABLE IF EXISTS `users_share_code`;
CREATE TABLE `users_share_code`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `book_id` int UNSIGNED NOT NULL DEFAULT 0,
  `share_code` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE,
  INDEX `idx_share_code`(`share_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '创建分享口令的用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_share_code
-- ----------------------------

-- ----------------------------
-- Table structure for users_statistics
-- ----------------------------
DROP TABLE IF EXISTS `users_statistics`;
CREATE TABLE `users_statistics`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `day` int UNSIGNED NOT NULL DEFAULT 0,
  `user_count` int UNSIGNED NOT NULL DEFAULT 0,
  `user_inc_count` int NOT NULL DEFAULT 0,
  `pay` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '每日充值金额',
  `read_book_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读书籍总数',
  `read_user_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读用户数',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_day`(`day` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_statistics
-- ----------------------------
INSERT INTO `users_statistics` VALUES (4, 1703462400, 1, 0, 124880, 0, 0, 0, 1703525988, 1703525988);
INSERT INTO `users_statistics` VALUES (5, 1703376000, 1, 0, 0, 0, 0, 0, 1703526229, 1703526229);

SET FOREIGN_KEY_CHECKS = 1;
