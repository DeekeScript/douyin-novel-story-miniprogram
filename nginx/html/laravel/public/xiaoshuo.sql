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

 Date: 11/12/2023 23:43:15
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of actions
-- ----------------------------
INSERT INTO `actions` VALUES (1, '/role/action/list', '小说管理', 0, 0, 0, 1701876045, 1701876010);
INSERT INTO `actions` VALUES (2, '/role/action/list', '小说列表', 1, 1, 0, 1701876045, 1701876010);
INSERT INTO `actions` VALUES (3, '', '会员管理', 0, 0, 1, 1702040597, 1702040478);
INSERT INTO `actions` VALUES (4, '', '会员管理', 0, 0, 1, 1702040683, 1702040623);
INSERT INTO `actions` VALUES (5, '/member/list', '会员管理', 0, 0, 0, 0, 1702040687);
INSERT INTO `actions` VALUES (6, '/member/list', '会员列表', 5, 1, 0, 0, 1702042268);

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
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '作者',
  `bookNum` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '书号',
  `novelPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说封面',
  `isEnd` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0连载本，1已完本',
  `freeNum` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '免费章节',
  `updateTime` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `novelName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说名称',
  `totalChapterNum` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '章节总数',
  `classifyName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说简介',
  `numberOfWords` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '字数',
  `novelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说id',
  `sort` int UNSIGNED NOT NULL DEFAULT 10000 COMMENT '排行，数字越大排行越高',
  `good_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '精选内容',
  `online` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否上架，1上架，0待上架',
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '行潜', 1398456415, 'http://cdn.miluzw.com/e6e8bb1d-be51-4ca4-8171-7f6b76b25ece-_74df1e394951eb675d9989f9488148c3_-584103850_1700629498535.jpg', 1, 1, 1700659469, '美人井', 2, '悬疑推理', '我们村里，有口美人井。 　　将女子丢入其中，巨石贴黄符镇压，泡出的井水可令人容光焕发，重病痊愈。 　　我们村因为这口井，成了附近一片最有钱的村子。 　　而这次被选中填井的女子里，是我。 　　听见消息，我勾起唇角。 　　终于等到这一天了。', 9571, 'c3575046', 10000, '', 1, 1702302698, 1701789562, 0);
INSERT INTO `books` VALUES (2, '梦三年', 1398456416, 'http://cdn.miluzw.com/97bb5334-274f-4b53-a988-6a19da38f76f-微信图片_20231127094207.jpg', 1, 1, 1701083012, '诱饵', 2, '都市现代', '与徐牧在一起三年，我便养了他三年。 可他却把我送进夜店，感染性病，甚至用偷拍的私密照来威胁我继续供养他。 心灰意冷的我从楼顶一跃而下。 我母亲去为我讨回公道，被他从楼梯上推下致死。 再次睁眼，我回到了他跟我告白那一天，我微笑的接受了他。 这一次，我定让你加倍奉还……', 9012, '591f987a', 10000, '', 0, 0, 1701789562, 0);

-- ----------------------------
-- Table structure for books_cates
-- ----------------------------
DROP TABLE IF EXISTS `books_cates`;
CREATE TABLE `books_cates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` int UNSIGNED NOT NULL DEFAULT 0,
  `book_id` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cate_id`(`cate_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books_cates
-- ----------------------------

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
  `numberOfWords` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '本章节字数',
  `price` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '本章节费用，单位分，为0时免费',
  `book_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '小说id',
  `novelId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '小说id',
  `updated_at` int UNSIGNED NOT NULL COMMENT '更新时间',
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books_chapters
-- ----------------------------
INSERT INTO `books_chapters` VALUES (1, 1, '', 1700659445, '井口', 3355, 0, 1, 'c3575046', 1701789562, 1701789562);
INSERT INTO `books_chapters` VALUES (2, 2, '', 1700659469, '真相', 6216, 43, 1, 'c3575046', 1701789562, 1701789562);
INSERT INTO `books_chapters` VALUES (3, 1, '', 1701082981, '诱饵', 2918, 0, 2, '591f987a', 1701789562, 1701789562);
INSERT INTO `books_chapters` VALUES (4, 2, '', 1701083012, '诱饵', 6094, 42, 2, '591f987a', 1701789562, 1701789562);

-- ----------------------------
-- Table structure for cates
-- ----------------------------
DROP TABLE IF EXISTS `cates`;
CREATE TABLE `cates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cates
-- ----------------------------
INSERT INTO `cates` VALUES (1, '言情', 1, 1701790828, 1701737607);
INSERT INTO `cates` VALUES (2, '小说', 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (3, '爽文', 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (4, '言情', 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (5, '小说', 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (6, '爽文', 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (7, '言情', 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (8, '小说', 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (9, '爽文', 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (10, '言情', 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (11, '小说', 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (12, '爽文', 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (13, '言情', 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (14, '小说', 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (15, '爽文', 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (16, '言情', 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (17, '小说', 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (18, '爽文', 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (19, '言情', 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (20, '小说', 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (21, '爽文', 0, 1701738494, 1701738441);
INSERT INTO `cates` VALUES (22, '言情', 0, 1701779673, 1701737607);
INSERT INTO `cates` VALUES (23, '小说', 0, 1701738341, 1701738339);
INSERT INTO `cates` VALUES (24, '爽文', 0, 1701738494, 1701738441);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_banners
-- ----------------------------
INSERT INTO `index_banners` VALUES (1, 'banner1', 'images/1702212792468.png', '/page/book/book?id=591', 0, 0, 1702214432, 0);
INSERT INTO `index_banners` VALUES (2, 'banner2', 'images/1702215482241.png', '/page/book/book?id=591', 4, 0, 1702217663, 0);
INSERT INTO `index_banners` VALUES (3, '标题', 'images/1702295171526.png', '1', 122, 1, 1702298009, 0);
INSERT INTO `index_banners` VALUES (4, '1', 'images/1702297873741.png', '1', 1, 0, 1702298081, 0);

-- ----------------------------
-- Table structure for index_pages
-- ----------------------------
DROP TABLE IF EXISTS `index_pages`;
CREATE TABLE `index_pages`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cate_id` int UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `sort` int UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_pages
-- ----------------------------
INSERT INTO `index_pages` VALUES (1, '测试', 4, 3, 3, 0, 1702302308, 1702301216);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notices
-- ----------------------------

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of options
-- ----------------------------

-- ----------------------------
-- Table structure for pays
-- ----------------------------
DROP TABLE IF EXISTS `pays`;
CREATE TABLE `pays`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `pay` int UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int NOT NULL,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pays
-- ----------------------------

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
-- Table structure for recharge_type
-- ----------------------------
DROP TABLE IF EXISTS `recharge_type`;
CREATE TABLE `recharge_type`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '充值名称',
  `price` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '金额，分',
  `old_price` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '原价，分',
  `day` int UNSIGNED NOT NULL COMMENT '有效天数',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已删除',
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharge_type
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharges
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles_actions
-- ----------------------------
INSERT INTO `roles_actions` VALUES (45, 1, 2, 1, 1702132425, 0);
INSERT INTO `roles_actions` VALUES (46, 2, 2, 1, 1702132425, 0);
INSERT INTO `roles_actions` VALUES (47, 5, 2, 1, 1702132425, 0);
INSERT INTO `roles_actions` VALUES (48, 6, 2, 1, 1702132425, 0);
INSERT INTO `roles_actions` VALUES (49, 2, 2, 1, 1702132433, 0);
INSERT INTO `roles_actions` VALUES (50, 5, 2, 1, 1702132433, 0);
INSERT INTO `roles_actions` VALUES (51, 6, 2, 1, 1702132433, 0);
INSERT INTO `roles_actions` VALUES (52, 2, 2, 1, 1702132442, 0);
INSERT INTO `roles_actions` VALUES (53, 5, 2, 1, 1702132442, 0);
INSERT INTO `roles_actions` VALUES (54, 1, 2, 1, 1702132442, 0);
INSERT INTO `roles_actions` VALUES (55, 2, 2, 1, 1702132565, 0);
INSERT INTO `roles_actions` VALUES (56, 5, 2, 1, 1702132565, 0);
INSERT INTO `roles_actions` VALUES (57, 1, 2, 1, 1702132565, 0);
INSERT INTO `roles_actions` VALUES (58, 6, 2, 1, 1702132565, 0);
INSERT INTO `roles_actions` VALUES (59, 2, 2, 1, 1702132572, 0);
INSERT INTO `roles_actions` VALUES (60, 5, 2, 1, 1702132572, 0);
INSERT INTO `roles_actions` VALUES (61, 1, 2, 1, 1702132572, 0);
INSERT INTO `roles_actions` VALUES (62, 6, 2, 1, 1702132572, 0);
INSERT INTO `roles_actions` VALUES (63, 2, 2, 0, 0, 0);
INSERT INTO `roles_actions` VALUES (64, 5, 2, 0, 0, 0);
INSERT INTO `roles_actions` VALUES (65, 1, 2, 0, 0, 0);
INSERT INTO `roles_actions` VALUES (66, 6, 2, 0, 0, 0);

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
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT 'uid',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'access_token',
  `vip_end_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员结束时间',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

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
  `view_index` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读的位置',
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_book_id`(`book_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '作者浏览书籍的记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_books
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
  INDEX `idx_recharge_type_id`(`recharge_type_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '创建分享口令的用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_share_code
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
