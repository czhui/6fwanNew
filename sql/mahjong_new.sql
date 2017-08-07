/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mahjong_new

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-08-07 15:45:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for helps
-- ----------------------------
DROP TABLE IF EXISTS `helps`;
CREATE TABLE `helps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT '名称',
  `contents` longtext NOT NULL COMMENT '内容',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `gameid` int(6) DEFAULT NULL COMMENT '游戏id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='玩法表';

-- ----------------------------
-- Records of helps
-- ----------------------------
INSERT INTO `helps` VALUES ('1', '1', '推倒胡', '&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;strong&gt;牌数：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;136张（带风） 108张（不带风）&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&lt;br/&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;strong&gt;玩法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;可以碰、杠，不能吃，只能自摸，不能点炮&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;可抢杠胡：&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;玩家碰过之后，摸牌补杠，这张牌可以被抢杠胡&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;暗杠不可抢：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;玩家手中3张牌，其它玩家打出第4张，此玩家直杠的时候，其他玩家可以抢杠胡；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;玩家手中3张牌，暗杠时，其他玩家不可抢杠胡；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;抢杠全包：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;被抢杠的玩家包其它三家的马分和胡牌分&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;杠爆全包：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;A给B点杠，B杠上开花胡牌，此时A玩家包其它三家的所有分数&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;可胡七对：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;七对牌型可以胡牌&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;七对加番：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;七对胡牌为基础分的2倍&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;无鬼加倍：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;在没有鬼牌的情况下胡牌，胡牌分数翻倍&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;不带风：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;去掉东南西北中发白&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;跟庄：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;开局庄家打出一张牌，其它玩家依次打出这张牌（鬼牌也可），算作跟庄，庄家输给其他人每人1分。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;连庄：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;庄家每多连庄1次，胡牌时分数多加2分。&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;白板做鬼：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;白板当作鬼牌&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;翻鬼：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;翻出一张牌，此张牌的下一张牌当作鬼牌。（翻二万，则三万是鬼）&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;双鬼：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;同翻鬼，下两张牌都为鬼牌&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;马跟底分：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;胡牌的基础分数为几分，每个马就为几分&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;马跟杠：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;勾选马跟杠，默认荒庄荒杠，马牌会对胡牌分进行二次计算&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;strong&gt;计分规则：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;明杠 3分 &amp;nbsp;暗杠 6分 &amp;nbsp;自摸 2分&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-04-20 18:33:10', '2017-08-07 11:37:59', '1');
INSERT INTO `helps` VALUES ('2', '2', '潮汕麻将', '&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;strong&gt;牌数：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;136张牌&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;&lt;strong&gt;玩法：&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;吃胡：可以碰、杠，可以吃胡，可以自摸；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;自摸：可以碰、杠，不能吃胡（大于20分可吃胡或抢杠胡）只能自摸；&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;抢杠胡2倍：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;玩家碰过之后，摸牌补杠，这张牌可以被抢杠胡，抢杠胡分数加倍；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;杠上开花2倍：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;A给B点杠，B杠上开花胡牌，胡牌分数翻倍；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;豪华6倍、双豪华9倍、三豪华12倍：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;七对的牌型中，有4张牌是一样的，为豪华七对；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;天地胡18倍：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;庄家起手胡牌为天胡，庄家打出一张牌，其它玩家吃炮胡牌为地胡；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;白板做鬼：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;白板当作鬼牌，鬼牌即为百变牌；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;翻鬼：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;翻出一张牌，此张牌的下一张牌当作鬼牌。（翻二万，则三万是鬼）&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;马跟底分：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;勾选马跟底分，胡牌的基础底数为2分，每增加一个马就增加2分；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;马跟杠：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;勾选马跟杠，默认荒庄荒杠，马牌会对胡牌分进行二次计算；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;抓码：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;胡牌后抓一码，码中胡牌玩家、码为几即为几倍，例如码为7索，即奖与胡牌玩家7倍；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;计分规则：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;基础分 2分、明杠1分 、暗杠2分；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;牌型加倍：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;碰碰胡 *2 、七小对 *3、 混一色 *2 、豪华 *6、双豪华*9、三豪华*12、 十三幺 *18、混碰*4、清碰*6、清一色*4、幺九*5 ；&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;额外番数：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;抢杠胡 *2、杠上开花 *2、抢杠胡*2、海底捞月*2&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;&lt;strong&gt;特殊加番：&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span class=&quot;Apple-tab-span&quot; style=&quot;white-space: pre;&quot;&gt;&lt;/span&gt;天地胡 * 18（天地胡不计牌型倍数）&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-04-20 18:41:49', '2017-08-07 11:38:02', '1');
INSERT INTO `helps` VALUES ('3', '1', '1', '<p>1</p>', '2017-08-07 13:52:40', '2017-08-07 13:52:40', '1');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '菜单关系',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单对应的权限',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单链接地址',
  `active` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单高亮地址',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '0', '首页', 'fa fa-dashboard', 'system.index', 'admin/dash', 'admin/dash', '后台首页', '99', '2017-08-01 11:21:52', '2017-08-02 11:39:59');
INSERT INTO `menus` VALUES ('2', '0', '系统管理', 'fa fa-cog', 'system.manage', '', 'admin/role*,admin/permission*,admin/user*,admin/menu*,admin/log*', '系统功能管理', '0', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `menus` VALUES ('3', '2', '用户管理', 'fa fa-users', 'user.list', 'admin/user', 'admin/user*', '显示用户管理', '0', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `menus` VALUES ('4', '2', '角色管理', 'fa fa-male', 'role.list', 'admin/role', 'admin/role*', '显示角色管理', '0', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `menus` VALUES ('5', '2', '权限管理', 'fa fa-paper-plane', 'permission.list', 'admin/permission', 'admin/permission*', '显示权限管理', '0', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `menus` VALUES ('6', '2', '菜单管理', 'fa fa-navicon', 'menu.list', 'admin/menu', 'admin/menu*', '显示菜单管理', '0', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `menus` VALUES ('7', '2', '系统日志', 'fa fa-file-text-o', 'log.all', 'admin/log', 'admin/log*', '显示系统日志', '0', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `menus` VALUES ('8', '0', '微信玩家管理', 'fa fa-user', 'system.wxuser', 'admin/wxuser', 'admin/wxuser*', '微信玩家管理', '4', '2017-08-01 14:11:21', '2017-08-04 15:40:53');
INSERT INTO `menus` VALUES ('10', '0', ' 服务器管理', 'fa fa-share-alt', 'system.servers', 'admin/servers', 'admin/servers*', '服务器管理', '2', '2017-08-02 11:41:06', '2017-08-04 15:41:00');
INSERT INTO `menus` VALUES ('11', '0', '通告管理', 'fa fa-bullhorn', 'system.notice', 'admin/notice', 'admin/notice*', '通告管理', '3', '2017-08-04 15:39:10', '2017-08-05 16:14:35');
INSERT INTO `menus` VALUES ('16', '0', '游戏管理', 'fa fa-gamepad', 'system.game', 'system.game', '1', '游戏管理', '1', '2017-08-05 16:13:23', '2017-08-05 16:13:23');
INSERT INTO `menus` VALUES ('17', '16', '玩法管理', 'fa fa-fire', 'help.list', 'admin/help', 'admin/help*', '玩法管理', '0', '2017-08-05 17:08:13', '2017-08-05 18:42:16');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2015_01_15_105324_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('4', '2015_01_15_114412_create_role_user_table', '1');
INSERT INTO `migrations` VALUES ('5', '2015_01_26_115212_create_permissions_table', '1');
INSERT INTO `migrations` VALUES ('6', '2015_01_26_115523_create_permission_role_table', '1');
INSERT INTO `migrations` VALUES ('7', '2015_02_09_132439_create_permission_user_table', '1');
INSERT INTO `migrations` VALUES ('8', '2016_11_03_173731_create_menus_table', '1');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` longtext NOT NULL COMMENT '内容',
  `type` enum('messages','agreement','marquee','affiche') NOT NULL COMMENT '类型',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `gameid` int(5) NOT NULL COMMENT '游戏ID',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='通告表';

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('1', '<p>亲爱的玩家，您好：        </p><p><br></p><p>广东六方麻将公测期间诚招代理，充值返现100%。</p><p><br></p><p>期待您的加入，让我们一起共享快乐棋牌游戏。     </p><p>         </p><p>代理招募详情请关注微信公众号：广东六方科技       </p><div><br></div>', 'affiche', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `notices` VALUES ('3', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 六方游戏服务协议</p><p><br></p><p>广东六方科技有限公司（下称“六方科技”或“甲方”）在此特别提醒用户（下称“您”或“乙方”）仔细阅读本《六方游戏服务协议》（下称“本《服务协议》”）中的各个条款，包括但不限于免除或者限制六方科技责任、对用户权利进行限制以及约定争议解决方式、司法管辖的条款。</p><p><br></p><p>请您仔细阅读本《服务协议》（未成年人应当在其法定监护人陪同下阅读），并选择接受或者不接受本《服务协议》。</p><p>除非您同意并接受本《服务协议》中的所有条款，否则您无权接收、下载、安装、启动、升级、登录、显示、运行、截屏六方游戏，亦无权使用该游戏软件的某项功能或某一部分或者以其他的方式使用该游戏软件。您接收、下载、安装、启动、升级、登录、显示、运行、截屏六方游戏，或者使用该游戏软件的某项功能、某一部分，或者以其他的方式使用该游戏软件的行为，即视为您同意并接受本《服务协议》，愿意接受本《服务协议》所有条款的约束。</p><p><br></p><p>本《服务协议》条款的订立、执行和解释及争议的解决均应适用中华人民共和国法律、行政法规和广州市的有关规定。如双方就本服务协议条款以及公司相关规定的内容和执行发生争议，双方应尽量友好协商解决；协商不成时，双方均有权向六方科技所在地的广东省广州市有管辖权的人民法院提起诉讼。</p><p><br></p><p>本《服务协议》分为两大部分，第一部分是文化部根据《网络游戏管理暂行办法》（文化部令第49号）制定的《网络游戏服务格式化协议必备条款》，第二部分是六方科技根据《中华人民共和国著作权法》、《中华人民共和国合同法》、《著作权行政处罚实施办法》、《网络游戏管理暂行办法》等国家法律法规拟定的网络游戏服务协议条款。</p><p><br></p><p>内容如下：</p><p>根据《网络游戏管理暂行办法》（文化部令第49号），文化部制定《网络游戏服务格式化协议必备条款》。</p><p><br></p><p>甲方为网络游戏运营企业，乙方为网络游戏用户；</p><p><br></p><p>1.账户注册：</p><p><br></p><p>1.1本游戏暂仅能通过微信验证登录，未来不排除将引入其他第三方账户体系用于登录本游戏。请您妥善保管您的各类账户和密码，确保账户安全。如您将账户、密码转让、出售或出借予他人使用，或授权他人使用账号，应对被授权人在该账号下发生所有行为负全部责任，闲来对您前述所造成的任何后果，不承担任何法律责任。</p><p>1.2如果六方科技在今后自建账号体系，则账户的所以权属六方科技，您在完成注册申请手续后，仅获得六方科技账户的使用权。您应提供及时、详尽及准确的个人资料，并不断更新注册信息。因注册信息不真实而导致的问题及后果，六方科技对此不负任何责任。因黑客行为等等第三方因素或用户自身原因导致的账号安全问题，六方科技对受影响玩家不承担任何法律责任。</p><p><br></p><p>2.用户账号使用与保管：</p><p><br></p><p>2.1 &nbsp; 根据必备条款的约定，甲方有权审查乙方注册所提供的身份信息是否真实、有效，并应积极地采取技术与管理等合理措施保障用户账号的安全、有效；乙方有义务妥善保管其账号及密码，并正确、安全地使用其账号及密码。任何一方未尽上述义务导致账号密码遗失、账号被盗等情形而给乙方和他人的民事权利造成损害的，应当承担由此产生的法律责任。</p><p>2.2 &nbsp; 乙方对登录后所持账号产生的行为依法享有权利和承担责任。</p><p>2.3 &nbsp; 乙方发现其账号或密码被他人非法使用或有使用异常的情况的，应及时根据甲方公布的处理方式通知甲方，并有权通知甲方采取措施暂停该账号的登录和使用。</p><p>2.4 &nbsp; 甲方根据乙方的通知采取措施暂停乙方账号的登录和使用的，甲方应当要求乙方提供并核实与其注册身份信息相一致的个人有效身份信息。</p><p>2.4.1 &nbsp; 甲方核实乙方所提供的个人有效身份信息与所注册的身份信息相一致的，应当及时采取措施暂停乙方账号的登录和使用。</p><p>2.4.2 &nbsp; 甲方违反2.4.1款项的约定，未及时采取措施暂停乙方账号的登录和使用，因此而给乙方造成损失的，应当承担其相应的法律责任。</p><p>2.4.3 &nbsp; 乙方没有提供其个人有效身份证件或者乙方提供的个人有效身份证件与所注册的身份信息不一致的，甲方有权拒绝乙方上述请求。</p><p>2.5 &nbsp; 乙方为了维护其合法权益，向甲方提供与所注册的身份信息相一致的个人有效身份信息时，甲方应当为乙方提供账号注册人证明、原始注册信息等必要的协助和支持，并根据需要向有关行政机关和司法机关提供相关证据信息资料。</p><p><br></p><p>3.服务的中止与终止：</p><p><br></p><p>3.1 &nbsp;乙方有发布违法信息、严重违背社会公德、以及其他违反法律禁止性规定的行为，甲方应当立即终止对乙方提供服务。</p><p>3.2 &nbsp;乙方在接受甲方服务时实施不正当行为的，甲方有权终止对乙方提供服务。该不正当行为的具体情形应当在本协议中有明确约定或属于甲方事先明确告知的应被终止服务的禁止性行为，否则，甲方不得终止对乙方提供服务。</p><p>3.3 &nbsp;乙方提供虚假注册身份信息，或实施违反本协议的行为，甲方有权中止对乙方提供全部或部分服务；甲方采取中止措施应当通知乙方并告知中止期间，中止期间应该是合理的，中止期间届满甲方应当及时恢复对乙方的服务。</p><p>3.4 &nbsp; 甲方根据本条约定中止或终止对乙方提供部分或全部服务的，甲方应负举证责任。</p><p><br></p><p>4.用户信息保护：</p><p><br></p><p>4.1 &nbsp; 甲方要求乙方提供与其个人身份有关的信息资料时，应当事先以明确而易见的方式向乙方公开其隐私权保护政策和个人信息利用政策，并采取必要措施保护乙方的个人信息资料的安全。</p><p>4.2 &nbsp;未经乙方许可甲方不得向任何第三方提供、公开或共享乙方注册资料中的姓名、个人有效身份证件号码、联系方式、家庭住址等个人身份信息，但下列情况除外：</p><p>4.2.1 &nbsp; 乙方或乙方监护人授权甲方披露的；</p><p>4.2.2 &nbsp; 有关法律要求甲方披露的；</p><p>4.2.3 &nbsp; 司法机关或行政机关基于法定程序要求甲方提供的；</p><p>4.2.4 &nbsp; 甲方为了维护自己合法权益而向乙方提起诉讼或者仲裁时；</p><p>4.2.5 &nbsp; 应乙方监护人的合法要求而提供乙方个人身份信息时。</p><p><br></p><p>5.名词解释：</p><p><br></p><p>本《服务协议》的第二大部分中所用到的下列专有名词，均采用如下解释：</p><p>5.1 &nbsp;《六方游戏服务协议》，即本《服务协议》，简称“服务协议”，指当前的您与六方科技订立的，关于您在使用和享受六方科技向您提供的六方游戏产品及服务的过程中，所享有的权利和所负有的义务的软件许可及服务协议。</p><p>5.2 &nbsp;“用户”或“您”，又称“玩家”，即指使用和享受六方游戏产品及服务的自然人，在《文化部网络游戏服务格式化协议必备条款》当中又被称为“乙方”，是本《服务协议》的一方合同当事人。</p><p>5.3 &nbsp;软件要素作品，指从游戏软件当中分离出来的可以单独使用的单个作品的统称，是该游戏软件不可分割的组成部分，包括但不限于其中的：</p><p>（1）电子文档、文字、资料库、图片、图表、图饰、图示、照片、程序、音乐、舞蹈、色彩、版面框架、界面设计；</p><p>（2）可以单独构成著作权法意义上的作品的电脑程序、美术图片、文字内容、音乐、歌曲以及舞蹈等内容（又被分别称之为软件要素程序作品、软件要素美术作品、软件要素文字作品、软件要素音乐作品、软件要素歌曲作品和软件要素舞蹈作品）。</p><p>5.4 &nbsp;游戏数据，指您或其他用户在使用和享受六方游戏产品及服务的过程中产生的被服务器软件所即时记录、存储的各种数字、字母、符号和模拟量等的统称，它以电脑语言的形式反映您或其他用户在使用和享受六方游戏产品及服务的过程及结果，包括但不限于记录用户使用和享受六方游戏产品及服务过程的游戏日志以及游戏安全系统检测并记录下来的安全日志。</p><p>5.5 &nbsp;游戏衍生品，指以某一游戏软件为原型，通过直接使用、修改、改编或者其他方式，利用该游戏软件或该游戏软件的软件要素作品、LOGO、名称和/或商标制作出来的物品的统称。</p><p>5.6 &nbsp;知识产权，指下列任一和全部的知识产权以及其中所有内在的、衍生的和/或相关的权利：</p><p>（1）规程、设计、发明、发现以及由此已经申请到的和正在申请的专利；</p><p>（2）软件、软件要素作品、作品类衍生品、游戏过程衍生品、游戏编辑衍生品及其他作品的著作权、版权以及由其派生的各项权利；</p><p>（3）软件、软件要素作品、作品类衍生品、游戏过程衍生品、游戏编辑衍生品及其他作品的名称权、商标权以及其他形式的公司或产品标识所产生的权利。</p><p>5.7 &nbsp;实名注册，即根据文化部颁布的《网络游戏管理暂行办法》第二十一条规定，六方科技要求您使用有效的身份证件实名注册自己的个人信息，从而使得您的个人信息与您在六方游戏当中使用的游戏账号之间建立起一一对应的匹配关系。</p><p><br></p><p>6.合同目的：</p><p><br></p><p>6.1 &nbsp;本《服务协议》的合同目的，旨在为六方科技许可您使用和享受六方游戏产品及服务提供合同依据，对您基于本《服务协议》在使用和享受六方游戏产品及服务的过程中所享有的权利、所负有的义务进行约定。</p><p>6.2 六方游戏的部分功能，并不是通过或者单独通过六方游戏实现的，而是需要同时使用六方科技和/或其合作单位开发的或运营的其他软件所实现的互联网服务才能实现。因此，您使用上述这部分功能的行为，不仅仅要受本《服务协议》的约束，亦同时受相应的其他软件许可使用协议或服务协议（以下统称“关联协议”）的约束。</p><p>6.3 &nbsp;您在使用和享受六方游戏产品及服务的过程中，可能会使用到第三方授权六方科技使用的软件或知识产权，该等使用必须是第三方授权范围内的、服从本《服务协议》合同目的的使用。您如果需要将其用于本《服务协议》合同目的之外的用途，请您直接与该等第三方联系，并取得其合法授权。</p><p><br></p><p>7.知识产权：</p><p><br></p><p>7.1 &nbsp;本《服务协议》以及下列任何一项作品或资料的所有权及包括著作权在内的全部知识产权均由六方享有，受《中华人民共和国著作权法》、《计算机软件保护条例》、《信息网络传播权保护条例》、《中华人民共和国商标法》和相关的国际条约以及其他的法律法规保护：</p><p>（1）六方游戏之游戏软件；</p><p>（2）六方游戏之软件要素作品；</p><p>（3）六方游戏之游戏数据；</p><p>（4）六方游戏之游戏过程衍生品、游戏编辑衍生品；</p><p>（5）您应六方科技邀请，为六方科技提供有关六方游戏的测试、BUG及外挂跟踪汇报、软文撰写及推广、竞争情报收集等服务的过程中，向六方科技提交的相应的作品或资料，如游戏测试报告、软文等。</p><p>7.2 &nbsp;应六方科技邀请，您提供给六方科技用于六方游戏的个人作品之著作权归您单独享有，六方科技享有无期限的、全球范围内的、不可撤销、完全免费的使用权。该等作品一经您提供给六方科技，即视为您授予了六方科技该等使用权，而且六方科技还可以将该等使用权转让或者转授权给其关联公司或者合作单位。双方另有约定的，从其约定。</p><p>7.3 &nbsp;六方科技基于本《服务协议》许可您的是您对六方游戏享有非专有使用权。该等非专有使用权，是您对正在使用的六方游戏当前版本所享有的非专有使用权。而且，该等非专有使用权是临时的、可撤销的、本《服务协议》约定范围内的使用权。</p><p>7.4 &nbsp;本《服务协议》没有也不会将六方游戏的发行权、信息网络传播权和/或出租权等某一项或某几项著作权权利、及其他的本《服务协议》未明示的权利许可给您，这些权利（或权能）都为六方科技单独享有。六方科技通过本《服务协议》许可您的，只是通过互联网线上使用和享受六方游戏产品及服务的权利。</p><p><br></p><p>8.游戏账号：</p><p><br></p><p>8.1 &nbsp;您对您的账号、密码、实名注册以及防沉迷登记的个人信息负有保管责任，并就其账号及密码项下之一切活动负全部责任。您须重视账号密码和公开邮箱的密码保护。您保证在您的游戏账号、密码未经授权而被使用、或者发生其他任何安全问题时，立即通知六方科技。</p><p>8.2 &nbsp;您充分理解到：为了提高六方游戏的安全性能，防止您的密码、实名注册以及防沉迷登记的个人信息被他人窃取而导致您无法凭借对应的账号登录该游戏，六方科技可能会随时将电脑病毒查杀技术、操作系统修复技术、电脑加密技术等有助于提高六方游戏软件安全性能的电脑硬件或软件运用到六方游戏当中。即便是如此，并不能免除或者减轻您对账号及密码等有关资料所负有妥善保管义务。对此，您是完全同意的；您如果不同意，请您与六方科技联系。</p><p>8.3 &nbsp;六方科技一向遵守国家有关保护青少年身心健康的法律、政策，按照国家颁布的《网络游戏防沉迷系统开发标准》在六方游戏当中开发、内置了防沉迷系统。您充分理解到：六方科技可能会将您的实名注册信息运用于防沉迷系统之中，即六方科技可能会根据您的实名注册信息判断您是否年满18周岁，从而决定是否对您相应的游戏账号予以防沉迷限制。对此，您是完全同意的。</p><p><br></p><p>9.用户行为守则及六方科技权利：</p><p><br></p><p>9.1 &nbsp;六方游戏与其他的线上使用的互联网软件一样，您如果要进行下载、安装、启动、登录、显示和/或运行，您至少必须自备一台（电脑/手机），在该（电脑/手机）上安装六方游戏的客户端软件，并保证其能够通过互联网与六方游戏的服务器软件进行即时的信息（即电子数据）交互。</p><p>9.2 &nbsp;您在使用六方游戏的收费功能时，应当按照六方科技的要求支付相应的费用。而且，该等权利属于六方科技的经营自主权，六方科技保留随时改变经营模式的权利，即保留变更收费的费率标准、收费的软件功能、收费对象及收费时间等权利。同时，六方科技也保留对六方游戏进行升级、改版，增加、删除、修改、变更其功能或者变更其游戏规则的权利。您如果不接受该等变更的，应当立即停止使用六方游戏；您继续使用六方游戏的行为，视为您接受改变后的经营模式。</p><p>9.3 &nbsp;基于本《服务协议》，您可以：</p><p>（1）接收、下载、安装、启动、升级、登录、显示、运行和/或截屏六方游戏；和/或</p><p>（2）创建六方游戏角色，设置网名，查阅游戏规则、用户个人资料、游戏对局结果，开设游戏房间、设置游戏参数，使用聊天功能，在游戏中购买、赠送游戏币、游戏筹码、游戏道具和/或</p><p>（3）使用六方游戏上列功能之外的其他的某一项或某几项功能。</p><p>9.4 &nbsp; 您除了可以按照本《服务协议》的约定使用六方游戏之外，不得进行任何侵犯六方游戏或其软件要素作品的知识产权的行为，或者侵害线上游戏运行环境和公平性的行为及进行其他的有损于六方科技或其他用户合法权益的行为。六方科技也绝对不会允许您从事这些行为，亦有权采取技术措施防止您从事这些行为，包括但不限于：</p><p>（1）删除或修改六方游戏上的版权信息，或者伪造ICP/IP地址或者数据包的名称；</p><p>（2）进行编译、反编译、反向工程或者以其他方式破解六方游戏的行为；</p><p>（3）进行任何破坏六方游戏公平性或者其他影响游戏正常秩序的行为，如主动使用外挂或被动刷分、合伙作弊、使用游戏外挂或者其他的作弊软件、利用BUG（又叫“漏洞”或者“缺陷”）来获得不正当的非法利益，或者利用互联网或其他方式将游戏外挂、作弊软件、BUG公之于众；</p><p>（4）利用劫持功能变数名称服务器等技术非法侵入、破坏六方游戏之服务器软件系统，或者修改、增加、删除、窃取、截留、替换六方游戏之客户端和/或服务器软件系统中的数据，或者非法挤占六方游戏之服务器空间，或者实施其他的使之超负荷运行的行为；</p><p>（5）进行任何诸如发布广告、销售商品的商业行为，或者进行任何非法的侵害六方科技利益的行为，如贩卖六方科技币、游戏币、游戏道具、外挂或倒币、刷币等；</p><p>（6）发表、转发、传播含有谩骂、诅咒、诋毁、攻击、诽谤、骚扰六方科技和/或第三方内容的，或者含有封建迷信、淫秽、色情、下流、恐怖、暴力、凶杀、赌博、反动、扇动民族仇恨、危害祖国统一、颠覆国家政权等让人反感、厌恶的内容的非法言论，或者设置含有上述内容的网名、游戏角色名；</p><p>（7）在六方游戏当中进行恶意刷屏、恶意耗时等恶意破坏游戏公共秩序的行为；</p><p>（8）利用六方游戏故意传播恶意程序或电脑病毒，或者利用六方游戏发表、转发、传播侵犯第三方知识产权、肖像权、姓名权、名誉权、隐私或其他合法权益的文字、图片、照片、程序、视频、图象和/或动画等资料，发布假冒六方游戏官方网站网址或链接。</p><p>9.5 &nbsp;用户在此完全同意并接受，当用户的数据明显异常时，六方科技有权通过查找用户IP地址或运用相关技术手段自行判断用户是否存在作弊以及其他违规行为并作出处罚措施。</p><p>9.6 &nbsp;未经六方科技允许，您不得进行下列任何一种行为；您如果要进行下列任何一种行为，请您与六方科技联系，取得六方科技的同意，并应六方科技的要求与之签订电子的或者纸版的书面合同：</p><p>（1）对六方游戏进行扫描、探查、测试，以检测、发现、查找其中可能存在的BUG或弱点；</p><p>（2）修改、复制、发行、出租、出版、翻译、汇编、改编和/或转载六方游戏，或其软件要素作品、游戏过程衍生品、游戏编辑衍生品，或者利用互联网或其他的方式将其公之于众；</p><p>（3）建立有关六方游戏，或其软件要素作品、游戏过程衍生品、游戏编辑衍生品的镜像站点，或者进行网页（络）快照，或者利用六方游戏架设服务器，为他人提供与之完全相同或者类似的互联网服务；</p><p>（4）在六方游戏当中内置各种插件程序或者其他的第三方程式；</p><p>（5）将软件要素作品从六方游戏中分离出来单独使用，或者进行其他的不符合本《服务协议》合同目的的使用；</p><p>（6）生产、制作、批发、销售、出版和/或发行游戏改编衍生品；</p><p>（7）使用六方游戏的名称、商标和/或其软件要素作品；</p><p>（8）实施上列行为之外的需要六方科技同意的其他的有关六方游戏的行为。</p><p>9.7 &nbsp;如果您当前使用的账号并不是您申请或者通过六方科技提供的其他途径取得的，但您却知悉了该账号当前的密码，则请您在第一时间内通知六方科技或者该账号的申请人。而且，您不得：</p><p>（1）使用该账号及密码登录六方游戏、六方科技客服官方网站、六方科技邮箱和/或享受六方科技提供的其他的互联网服务；和/或和/或</p><p>（2）修改该账号项下的密码、申请资料、个人资料、邮件，和/或</p><p>（3）利用该账号买卖、转让、赠与、接受赠与六方科技币、游戏币、游戏道具等虚拟货币或物品；和/或</p><p>（4）以转让、贩卖、赠与的方式将该账号或其项下的密码、个人资料、六方科技币、游戏币、游戏道具等资料提供给六方科技和申请人之外的无关的第三方，或者对该账号或其项下的上述资料进行其他形式的处分；和/或</p><p>（5）通过互联网或者其他的方式将该账号及其项下的密码、个人资料、六方科技币、游戏币、游戏道具等虚拟货币或物品公之于众；和/或</p><p>（6）以其他的方式使用或处分该账号、密码以及该账号项下的资料。</p><p>9.8 &nbsp;六方科技可能在六方游戏官方网站或第三方合作平台为用户提供了六方科技客户端软件的下载服务，请您到该网站或第三方合作平台上下载该客户端软件及其升级版本。</p><p>9.9 &nbsp;六方科技可能通过六方游戏官方网站或其他方式，为您提供了诸如“游戏商城”等获得六方科技币、游戏币、游戏道具等虚拟物品的途径，您可以从六方科技提供的这些途径获得上述虚拟物品。六方科技禁止通过接受赠与或者其他的方式从非六方科技及六方科技合作方的第三方获得上述游戏物品，因为上述途径获得的虚拟物品可能是盗号分子盗窃得来的赃物或者存在其他的权利瑕疵，受害者可能会通过各种手段要求索回。</p><p>9.10 &nbsp;六方科技可能通过六方游戏官方网站、六方客服官方网站、客服电话、游戏管理员或者其他的途径，向您提供诸如游戏规则说明、游戏BUG或外挂投诉、游戏物品找回、游戏物品锁定或解除锁定、账号申诉、账号暂时封停、六方游戏账号实名注册信息修改和/或查验等客户服务，您应当：</p><p>（1）通过六方科技客服官方网站、六方科技客服电话或者六方科技提供的其他途径了解这些客户服务的内容、要求以及资费，谨慎选择是否需要享受相应的客户服务，向六方科技真实地准确地表达您的需求；</p><p>（2）不得在接受六方科技提供的服务的过程中进行本《服务协议》第9.4条所述的第（6）项行为；</p><p>（3）同意并接受六方科技关于该等客户服务的专门协议或条款；</p><p>（4）按照六方科技的要求如实提供您的包括有效身份信息在内的个人信息和游戏情况，及您掌握的其他用户或六方游戏本身的情况，例如：您的六方科技账户及其项下的个人资料、六方游戏的登录情况和游戏物品情况，六方游戏当中存在的BUG、外挂及您知晓的其他玩家使用BUG或外挂的情况。</p><p>9.11 &nbsp;六方科技在向您提供本《服务协议》第9.10条所述的客户服务的过程中，有利要求您通过线上填写投诉单，发送电子邮件、截屏、录影，邮寄纸质书信，提供本人有效身份证件或者其他的方式，向六方科技书面说明您的需求、提供有关情况及证据，您应当如实地、最大限度地、毫无保留地提供。</p><p>9.12 &nbsp;您在享受本《服务协议》第9.10条所述的客户服务的过程中，六方科技可能需要通过互联网对您使用的电脑进行远程协助。您如果请求六方科技提供该等客户服务，则需要您授予六方科技进行远程协助的许可权，并自行承担由此可能给您造成的损失。</p><p>9.13 &nbsp;六方科技将会尽最大的努力提高本《服务协议》第9.10条所述的客户服务的品质、满足您的服务要求。即便是如此，六方科技仍保留向您收取相应的服务费或者其他报酬的权利，而且不保证其提供的服务就一定能够满足您的要求。</p><p>9.14 &nbsp;六方游戏可能根据六方游戏的内容在网络游戏的显著位置，向您介绍六方游戏的游戏规则。您完全同意并承诺按照这种游戏规则进行相应的游戏的；您如果不同意，请您不要下载、安装、启动、登录、显示、运行六方游戏，您下载、安装、启动、登录、显示和/或运行的行为，即视为您同意并接受这些游戏规则。</p><p>9.15 &nbsp;如果在使用和享受六方游戏产品及服务的过程中，您发现六方游戏完全或者部分不能实现六方科技所介绍的对应的游戏规则的，请您立即停止使用不符合游戏规则的这一部分游戏内容或者游戏区域，并在第一时间内通知六方科技，六方科技将会尽快进行修复，使之符合这些游戏规则。</p><p>9.16 六方科技如果尚未将六方游戏的某一款或某几款六方游戏注册商标的，您不得擅自将其注册商标。否则，您应当配合六方科技申请商标局撤销该注册商标，或者将您取得注册商标无偿地、完全地、不可撤销地转让给六方科技。</p><p>9.17 &nbsp;您充分理解到：六方科技可能会不定期地通过发布软件升级包或软件补丁、线上升级等方式对六方游戏进行更新。更新的过程中，六方科技可能通过互联网调取、收集您的个人电脑上的关于六方游戏的客户端软件版本信息、数据及其他有关资料，并自动进行替换、修改、删除和/或补充。此种行为是软件更新的所必须的一种操作或步骤，您如果不同意六方科技进行此种操作，请您不要进行更新；您更新的行为即视为您同意六方科技进行此种操作。</p><p>9.18 &nbsp;您充分理解到：对于六方游戏来说，本《服务协议》第9.17条所述的某些更新可能是软件版本的更新，如果您不进行此种更新则将无法登录六方游戏。而且，此种更新将会导致您使用的电脑上原有的软件版本完全被新的软件版本替换掉。</p><p>9.19 &nbsp;您充分理解到：游戏数据将会占据六方游戏的服务器空间。长时间保留您在使用和享受六方游戏产品及服务的过程中所产生的全部游戏数据，将会大量地挤占服务器空间，影响您及其他六方游戏用户的游戏速度，增加六方科技的运营成本，是完全没有必要的。因此，六方科技将会定期将服务器上存储的一些过往的游戏数据转移或者永久地删除。对此，您是完全同意的。</p><p>9.20 &nbsp;为了测试六方游戏的功能、用户承载能力、查找其中可能存在的BUG或者进行其他的检测其品质的行为，六方科技可能会在六方游戏对外正式发布（又称“公测”）之前或之后发布一些供用户体验、测试并回馈意见的软件测试版本（一般都是正式运营版本以及不删档内测版本和公测版本之外的其他的软件测试版本，包括但不限于封测版本、内测版本和外部测试版本），并通过向您提供启动码、该版本客户端软件下载的网路链接地址、发送客户端软件等形式邀请您参加体验、测试。而且，六方科技可能会向用户同时提供两种或两种以上版本的六方游戏产品，而其中的某些版本仅限于由某一部分用户登录使用，其他的用户则不能登录使用。</p><p>9.21 &nbsp;您充分理解到：本《服务协议》第9.20条所述的软件测试版本，并不是向所有的用户公开的，请您不要把您知晓的启动码、客户端软件下载的网路链接地址告诉他人，也不要将客户端软件提供给他人。而且，您应当按照六方科技的要求如实地、毫无保留地、准确地、完全地将您在体验、测试过程中发现的诸如存在BUG情况告诉六方科技。而且，未经六方科技同意，您不得将该等情况提供给第三方，或者通过互联网或其他方式将其公之于众。</p><p>9.22 &nbsp;您充分理解到：本《服务协议》第9.20条所述的软件测试版本，只是六方科技用来供部分用户体验、测试的临时的版本，六方科技将会在认为其已经完成使命的时候将该版本之服务器软件从服务器上删除，或者用新的软件版本将其替换掉。一经删除或者替换：</p><p>（1）您将不能继续登录、使用该版本；且</p><p>（2）您在体验、测试过程中产生的游戏数据将会被永久性删除；和/或</p><p>（3）您在体验、测试过程中取得的游戏币、游戏道具、积分、等级或者荣誉等将会被永久性删除，您将永远不能在六方游戏使用这些资料，即便是您使用同一个游戏帐号登录、使用该软件的其他的版本，亦是如此。</p><p>9.23 &nbsp;您充分理解到：您在使用和享受六方游戏产品及服务（包括但不限于享受本《服务协议》上述第9.10条所述的客户服务）的过程中，六方科技可能会借助cookie收集您使用六方游戏的情况。对此，您是充分理解并完全同意的。您如果不同意，可以通过设置您使用的电脑上的Internet选项来进行规避。</p><p>9.24 &nbsp;您承诺并保证：您对您通过本《服务协议》所述的方式提供给六方科技的作品享有完全的著作权，或者虽然不享有著作权，但享有将其许可给六方科技用于六方游戏之中的权利。而且，该等使用既可能是将其用于六方游戏开发之中，也可能是将其用于六方游戏的市场推广活动（如广告）之中。</p><p>9.25 &nbsp;六方科技可能会在使用您提供的作品之前，要求您出具书面的授权证明及您的身份证明（如身份证复印件）。如果六方科技在使用您提供的作品的同时，需要一并使用您的肖像、姓名或者其他合法权益的，您同意将您的肖像、姓名和/或其他合法权益一并授权给六方科技使用。</p><p><br></p><p>10.用户违规处罚规则：</p><p><br></p><p>10.1 &nbsp;您如有违反本《服务协议》第9条约定的用户行为守则，六方科技有权采取本《服务协议》第10.2条所述措施中的一种或几种行为，如您的行为给六方科技造成经济损失的或者有损六方科技商业信誉、企业形象的，六方科技可以要求您给予赔偿并公开赔礼道歉；构成国务院《著作权行政处罚实施办法》或者其他法律法规所规定的违法行为的，六方科技将提请国家版权局等有关行政管理机关对您进行行政处罚；构成犯罪的，六方科技将向有关的司法机关举报，追究您的刑事责任。</p><p>10.2 &nbsp;六方科技有权根据用户的违规行为采取下列措施当中的一种或几种：</p><p>（1）暂时禁言，即暂时禁止您凭藉当前使用的游戏账号在六方游戏当中发表任何言论，使之在禁言期限不能发表任何言论；</p><p>（2）暂时或永久封号，即暂时或永久封停您的游戏账号，使之在封停期限内不能登录六方游戏；</p><p>（3）删除广告、虚假信息和/或非法言论，即永久性地、不可撤销地将您发布的广告、虚假信息或者非法言论删除，或者采取其他的阻止其传播的措施；</p><p>（4）删除赃物，即永久性地、不可撤销地将您非法获取的六方科技币、游戏币、游戏道具等游戏物品删除，或者将其返还给原来的通过合法途径取得其使用权的其他用户；</p><p>（5）扣除或清零游戏币，即永久性地、不可撤销地将您非法获取或违反本协议规定取得或通过非六方科技授权渠道取得的游戏币、积分、等级和/或荣誉扣除或清零；</p><p>（6）拒绝受理账号申诉；</p><p>（7）其他措施，即采取上列措施之外的其他措施。</p><p>该违规罚则不限定语言，不论符合该项违规罚则的名称是中文或是其它语言，都将遵照处罚措施进行处罚。上述游戏违规罚则内容，非永久内容，六方科技有权依据国家法规以及环境不同进行内容上的修改、变更，并将变更后的违规罚则公布于官方网站。如您因对变更后的游戏违规罚则不熟悉而引起的损失，六方科技一律不予以赔偿。</p><p>10.3 &nbsp;针对您实施的本《服务协议》第10.1条所述的行为，六方科技可能会连续地、间断地或者交替地采取本《服务协议》第10.2条所述的措施当中的一种或几种，并视情节轻重永久或暂时中止您之全部或部份网络服务使用权，由此造成的账号内虚拟货币、积分、虚拟道具等电子记录之损失应由您自行承担。</p><p>10.4 &nbsp;六方科技可能会通过在六方科技登录窗口及其官方网站或者其他的途径公布该游戏存在的BUG。 即便是如此，亦不能免除在六方科技公布之前您负有的本《服务协议》第9.4条所述的第（3）项义务。换言之，即便是没有对外公布BUG，六方科技也可以自行判断您是否使用了BUG。而且，六方科技一经判断您使用了BUG，即可对您当前使用的游戏账号采取本《服务协议》第10.2条所述的措施。</p><p>10.5 &nbsp;您提请六方科技提供本《服务协议》第9.10条所述的客户服务时，如不按照第9.11条之约定提供相应的资料及证据的，六方科技有权拒绝提供相应的客户服务。</p><p><br></p><p>11. 用户纠纷处理机制：</p><p><br></p><p>11.1　用户就游戏账号的使用权归属或游戏数据等存在争议，可以通过六方科技或六方游戏官方网站“在线提问”或六方科技提供的其他方式请求六方科技公司客户服务人员处理。</p><p>11.2　用户承诺遵守六方科技处理此类事务的要求、流程，对自己的主张提供相应的材料予以证明。如用户不能提供充分材料证明其主张成立，因此致使其受到损害，则由用户独立承担全部责任。</p><p>11.3　用户同意以六方科技服务器或系统所记载的数据作为处理用户之间或用户与六方科技之间纠纷的判断标准。</p><p>11.4　用户自行承担其因处理此类纠纷而产生之通讯费、邮寄费、交通费等一切费用。</p><p>11.5　用户如对六方科技做出的纠纷处理存在争议，可以在六方科技作出处罚之日起10天内通过六方科技或六方游戏官方网站“在线提问”或六方科技提供的其他方式提出申诉申请，请求六方科技客户服务人员处理，说明您的异议理由，并根据六方科技的要求提供相关资料。但这不会导致该等处罚措施无效，也不影响异议期间该等处罚措施的执行。如因用户未在10天内对处罚措施提出异议或是虽提出异议但无法在10天内提供充足的证明资料的，则视为您没有任何异议，六方科技不再接受任何有关的反馈。</p><p><br></p><p>12. 通知和送达：</p><p><br></p><p>12.1　六方科技对违规用户处以本《服务协议》第10.2条所述的处罚措施时不负处罚前通知的义务。</p><p>12.2 &nbsp;六方科技会通过六方科技网站、六方科技论坛、游戏通告栏以及游戏系统信息等发布公告为主要通知方式，自公告发布之日起即为送达。</p><p>12.3　六方科技在个别情况下有可能会通过登录提示、电子邮件、常规信件或电话等方式通知，但六方科技没有以此方式进行个别通知的义务。</p><p>12.4　用户承诺谨慎注意六方科技的通知，因用户自身原因没有及时看到通知而产生的损害，六方科技对此不承担任何责任。</p><p><br></p><p>13.服务风险和免责条款：</p><p><br></p><p>13.1 &nbsp;如果您不具备本《服务协议》第9.1所述的条件，您将不能使用六方游戏或六方游戏的部分功能。六方科技对此无须向您承担任何责任。</p><p>13.2 &nbsp;六方游戏与其他的线上使用的互联网软件一样，也会受到各种不良信息、网路安全和网路故障问题的困扰，包括但不限于：</p><p>（1）其他用户可能会发布诈骗或虚假信息，或者发表含有谩骂、诅咒、诋毁、攻击内容的，或含有淫秽、色情、下流、反动、煽动民族仇恨等让人反感、厌恶的内容的非法言论；</p><p>（2）其他用户可能会发布一些侵犯您或者其他第三方知识产权、肖像权、姓名权、名誉权、隐私和/或其他合法权益的图片、照片、文字等资料；</p><p>（3）面临着诸如骇客攻击、电脑病毒困扰、系统崩溃、网路掉线、网速缓慢、程序漏洞等问题的困扰和威胁。</p><p>13.3 &nbsp;您充分理解到：上述第13.2条所述的各种不良信息、网路安全和网路故障问题，并不是六方科技或六方游戏所导致的问题，由此可能会造成您感到反感、恶心、呕吐等精神损害，或者给您造成其他的损失，一概由您自行承担，六方科技和/或六方游戏无须向您承担任何责任。</p><p>13.4 &nbsp;您充分理解到：您从非官方授权的第三方获得六方科技币、游戏币、游戏道具等游戏物品可能存在各种风险。您不得从第三方获得上述游戏物品，您如果坚持从第三方获得上述游戏物品，则您应当自行承担相应的风险，六方科技不保证该等游戏物品在六方游戏能够正常使用，也不保证该等物品不被索回。</p><p>13.5 &nbsp; 您充分理解到：六方科技通过本《服务协议》第9.14条所述的方式向您介绍的游戏规则可能是不充分的、有限的。六方科技不保证对六方游戏规则的介绍是完全的、充分的、没有任何错漏的，也不保证六方游戏能够完全地、充分地、没有任何错漏地实现这些游戏规则。</p><p>13.6 &nbsp;您充分理解到：六方科技为了有效遏制六方游戏中用户使用BUG或外挂的行为，可能会采取停机维护或者回档的处理措施。停机维护期间，您可能会不能登录六方科技。回档，则是将所有用户游戏账号项下的游戏数据从某一个时刻的记录返回到此前的另一个时刻的记录，由此可能会导致您在这期间通过正常游戏行为获得的游戏币、游戏道具等游戏物品和等级、积分、荣誉等永久性丧失，或者给您造成其他的损失。对此，您充分理解并愿意自行承担，六方科技将不给予任何赔偿。</p><p>13.7 &nbsp;您充分理解到：六方科技可能会将合作单位提供的某些服务（如合作单位提供的某些软件的有期限限制的使用权或旅游服务）或者实物作为奖品赠送给您，六方科技将会按照您提供的联系方式与您联系，并将这些服务或实物提供给您。但六方科技对该等服务和/或服务的品质不作任何明示或者默示的担保，如该等服务和/或实物存在品质问题，请直接与相应的合作单位联系，并自行与之解决相关的争议或纠纷，一概与六方科技无关。</p><p>13.8 &nbsp;您充分理解到：六方游戏可能会因六方科技本身或者合作单位的互联网系统软硬件设备的故障、失灵、或人为操作的疏失而全部或一部分中断、暂时无法使用、迟延，或因他人侵入六方游戏系统篡改或伪造变造资料等，造成六方游戏的停止或中断者或用户档案缺失，您不得要求六方科技给予您任何的补偿或赔偿。</p><p>13.9 &nbsp;您同意您使用和享受六方游戏产品及服务是出于您个人意愿，并愿自行承担任何风险及由此给您造成的任何直接、间接、衍生的损害，六方科技不承担任何责任。若依法无法完全排除损害赔偿责任时，六方科技的赔偿责任亦以返还用户因此支付六方科技的价款为限。</p><p>13.10 &nbsp;六方科技保留随时地、不事先通知地、不需要任何理由地、单方面地中止履行本《服务协议》及终止本《服务协议》的权利。该等中止、终止，可能是因为六方科技解散、注销、合并、分立，也可能是因为六方科技将六方游戏的著作权，或其运营权转让给了第三方，还可能是因为国家法律、法规、政策及国家机关的命令或者其他的诸如地震、火灾、海啸、台风、罢工、战争等不可抗力事件，还可能是上列原因之外的其他原因。</p><p>13.11 &nbsp;本《服务协议》如因为本《服务协议》第13.10条所述原因：</p><p>(1) 被中止，则包括您在内的所有用户将暂时不能凭借游戏账号登录六方，直至本《服务协议》中止期限届满之日止；</p><p>(2) 被终止，则包括您在内的所有用户将永远不能凭借游戏账号登录六方科技，六方科技将以公告或者以其他的形式处理相关事宜。</p><p><br></p><p>14.用户信息保护：</p><p><br></p><p>14.1 &nbsp;您充分理解到：保护用户信息是六方科技一贯的政策。对于您和其他六方游戏用户的个人信息，六方科技将按照《网络游戏管理暂行办法》、本《服务协议》以及《六方游戏用户隐私权保护和个人信息利用政策》的有关条款进行保护。六方科技绝对不会将其披露给无关的第三方，更不会将其公之于众，但因下列原因而披露给第三方的除外：</p><p>（1）基于国家法律法规的规定而对外披露；</p><p>（2）应国家司法机关及有法律赋予许可权的政府机关基于法定程序的要求而披露；</p><p>（3）为保护六方科技、合作单位或您的合法权益而披露；</p><p>（4）在紧急情况下，为保护其他用户及第三人人身安全而披露；</p><p>（5）经用户本人（或其监护人）同意或应用户（或其监护人）的要求而披露。</p><p>14.2 &nbsp;您充分理解到：与其他的互联网企业及互联网软件产品一样，您通过下列途径产生或者主动提供给六方科技的个人信息、数据、作品或其他资料，均有可能被六方科技所保存或销毁，六方科技亦有可能对其进行整理、统计和分析，从而最终形成并获得一种仅仅揭示和反映六方游戏产品使用情况而不显示您的个人信息的统计数据（例如六方游戏注册用户数、同时线上用户数、付费用户比例等），以供六方科技用于了解六方游戏的使用情况、持续改进六方游戏的功能、提升六方游戏产品的品质：</p><p>（1）您在进行实名注册时，在实名注册系统当中填写的实名注册信息；</p><p>（2）您在申请、申诉账号、享受本《服务协议》第9.10条所述的客户服务的过程中填写、提供给六方科技的个人信息、作品或其他资料；</p><p>（3）您为六方科技提供有关六方游戏的测试、BUG及外挂跟踪汇报、软文撰写及推广、竞争情报收集等服务时提供给六方科技的个人信息、数据、作品、游戏过程衍生品或其他资料；</p><p>（4）您通过互联网或其他方式向六方科技上传、提供照片、图片、视频、文字等个人作品或者游戏过程衍生品；</p><p>（5）您在使用和享受六方游戏产品及服务的过程中产生的游戏数据；</p><p>（6）您以其他方式向六方科技提供的，或者让六方科技知晓的个人信息、数据、作品、游戏过程衍生品或其他资料。</p><p><br></p><p>15.其他约定：</p><p><br></p><p>15.1 &nbsp;六方科技保留随时地、不事先通知地、不需要任何理由地、单方面地修订本《服务协议》的权利。本《服务协议》一经修订，六方科技将会用修订后的协议版本完全替代修订前的协议版本，并通过原有方式向所有用户公布。您应当及时关注和了解本《服务协议》的修订情况，如果您不同意修订后协议版本，请您立即停止使用和享受六方游戏产品及服务，否则即视同您同意并完全接受修订后的协议版本。</p><p>15.2 &nbsp;本《服务协议》各条款是可分的，所约定的任何条款如果部分或者全部无效，不影响该条款其他部分及本《服务协议》其他条款的法律效力。</p><p>15.3 &nbsp;本《服务协议》各条款的标题只是为了方便用户阅读而起到提示、醒目的作用，对本《服务协议》的解释及适用没有任何指引作用。</p><p>15.4 &nbsp;本《服务协议》签订地为广东省广州市天河区，受中华人民共和国法律、法规管辖，六方科技保留最终解释权。</p><p>15.5 六方棋牌游戏由六方科技研发运营，六方科技致力于倡导绿色健康文明的棋牌文化推广。</p><p>六方游戏中使用到的游戏币、房卡等均不具有任何财产性价值及功能，只限用户本人在游戏中使用。六方科技严禁用户之间在游戏线上或线下进行任何无偿或有偿的游戏币、房卡赠予或转让等行为，六方科技及其子公司亦不会为用户所持有的游戏币、房卡等虚拟物品提供任何形式的回兑、回购、变相兑换为现金或实物等变现服务或功能。</p><p>广东六方科技有限公司严格遵守国家法律法规以及相关政府规定，依法合规经营游戏产品，力求为棋牌爱好者打造一个健康、绿色的游戏休闲氛围。同时，我司专门设立客服举报监督专线：020-38917624，亦可关注我司官方微信公众号“广东六方科技”联系客服办理，欢迎广大用户玩家对游戏中的违法行为进行举报！</p><div><br></div>', 'agreement', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `notices` VALUES ('2', '<p>《广东六方麻将》将于2017年6月26日24：00 结束公测正式上线。丰富的游戏活动，精彩的游戏内容等您来参与</p><p><br></p><p>活动一：全天免房卡，快乐共分享</p><p>活动时间：6月1日~6月26日</p><p>活动内容：</p><p>游戏全网公测期间，所有游戏创建房间免房卡，约上三五好友尽情玩；</p><p><br></p><p>活动二：代理大招募，充值返利100%</p><p>活动时间：即日起至7月31日</p><p>活动内容：</p><p>凡是游戏全网公测期间成为代理、购买房卡将获得100%返利。</p><p>详情请关注官方微信公众号：广东六方科技&nbsp;</p><p>圆梦肯定是越早越好，快来加入我们吧。</p>', 'messages', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '登录后台权限', 'system.login', '登录后台权限', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('2', '后台首页', 'system.index', '后台首页', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('3', '系统管理', 'system.manage', '系统管理', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('4', '显示菜单列表', 'menu.list', '显示菜单列表', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('5', '创建菜单', 'menu.create', '创建菜单', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('6', '删除菜单', 'menu.destroy', '删除菜单', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('7', '修改菜单', 'menu.edit', '修改菜单', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('8', '查看菜单', 'menu.show', '查看菜单', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('9', '显示角色列表', 'role.list', '显示角色列表', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('10', '创建角色', 'role.create', '创建角色', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('11', '删除角色', 'role.destroy', '删除角色', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('12', '修改角色', 'role.edit', '修改角色', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('13', '查看角色权限', 'role.show', '查看角色权限', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('14', '显示权限列表', 'permission.list', '显示权限列表', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('15', '创建权限', 'permission.create', '创建权限', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('16', '删除权限', 'permission.destroy', '删除权限', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('17', '修改权限', 'permission.edit', '修改权限', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('18', '显示用户列表', 'user.list', '显示用户列表', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('19', '创建用户', 'user.create', '创建用户', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('20', '修改用户', 'user.edit', '修改用户', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('21', '删除用户', 'user.destroy', '删除用户', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('22', '查看用户信息', 'user.show', '查看用户信息', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('23', '修改用户密码', 'user.reset', '修改用户密码', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('24', '日志管理', 'log.list', '日志管理', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('25', '删除日志', 'log.destroy', '删除日志', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('26', '查看日志', 'log.show', '查看日志', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('27', '下载日志', 'log.download', '下载日志', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('28', '筛选日志信息', 'log.filter', '筛选日志信息', null, '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permissions` VALUES ('29', '服务器管理', 'system.servers', '服务器管理', '', '2017-08-02 11:42:44', '2017-08-02 11:42:44');
INSERT INTO `permissions` VALUES ('30', '创建服务器', 'servers.create', '创建服务器', '', '2017-08-02 15:56:40', '2017-08-02 15:56:40');
INSERT INTO `permissions` VALUES ('31', '显示服务器列表', 'servers.list', '显示服务器列表', '', '2017-08-02 16:30:09', '2017-08-02 16:30:09');
INSERT INTO `permissions` VALUES ('32', '修改服务器', 'servers.edit', '修改服务器', '', '2017-08-02 16:57:06', '2017-08-02 16:57:06');
INSERT INTO `permissions` VALUES ('33', '微信玩家管理', 'system.wxuser', '微信玩家管理', '', '2017-08-03 18:25:36', '2017-08-03 18:25:36');
INSERT INTO `permissions` VALUES ('34', '显示微信玩家列表', 'wxuser.list', '显示微信玩家列表', '', '2017-08-03 18:26:22', '2017-08-03 18:26:22');
INSERT INTO `permissions` VALUES ('35', '通告管理', 'system.notice', '通告管理', '', '2017-08-04 18:20:37', '2017-08-05 10:48:20');
INSERT INTO `permissions` VALUES ('36', '显示通告列表', 'notice.list', '显示通告列表', '', '2017-08-04 18:22:10', '2017-08-05 10:48:31');
INSERT INTO `permissions` VALUES ('37', '修改通告', 'notice.edit', '修改通告', '', '2017-08-05 15:17:32', '2017-08-05 15:17:32');
INSERT INTO `permissions` VALUES ('38', '游戏管理', 'system.game', '游戏管理', '', '2017-08-05 17:20:31', '2017-08-05 17:21:29');
INSERT INTO `permissions` VALUES ('39', '玩法管理', 'help.list', '玩法管理', '', '2017-08-05 17:20:58', '2017-08-05 18:41:56');
INSERT INTO `permissions` VALUES ('40', '创建玩法', 'help.create', '创建玩法', '', '2017-08-07 11:38:55', '2017-08-07 11:39:15');
INSERT INTO `permissions` VALUES ('41', '修改玩法', 'help.edit', '修改玩法', '', '2017-08-07 11:39:37', '2017-08-07 11:39:37');
INSERT INTO `permissions` VALUES ('42', '删除玩法', 'help.destroy', '删除玩法', '', '2017-08-07 11:40:03', '2017-08-07 11:40:03');
INSERT INTO `permissions` VALUES ('43', '查看玩法', 'help.show', '查看玩法', '', '2017-08-07 11:40:24', '2017-08-07 11:40:24');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('32', '1', '1', '2017-08-02 15:57:16', '2017-08-02 15:57:16');
INSERT INTO `permission_role` VALUES ('2', '2', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('3', '3', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('4', '4', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('5', '5', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('6', '6', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('7', '7', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('8', '8', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('9', '9', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('10', '10', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('11', '11', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('12', '12', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('13', '13', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('14', '14', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('15', '15', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('16', '16', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('17', '17', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('18', '18', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('19', '19', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('20', '20', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('21', '21', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('22', '22', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('23', '23', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('24', '24', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('25', '25', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('26', '26', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('27', '27', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('28', '28', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('29', '1', '2', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('30', '2', '2', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `permission_role` VALUES ('31', '29', '1', '2017-08-02 11:43:26', '2017-08-02 11:43:26');
INSERT INTO `permission_role` VALUES ('33', '30', '1', '2017-08-02 15:57:16', '2017-08-02 15:57:16');
INSERT INTO `permission_role` VALUES ('34', '31', '1', '2017-08-02 16:30:19', '2017-08-02 16:30:19');
INSERT INTO `permission_role` VALUES ('35', '32', '1', '2017-08-02 17:11:58', '2017-08-02 17:11:58');
INSERT INTO `permission_role` VALUES ('36', '33', '1', '2017-08-03 18:26:35', '2017-08-03 18:26:35');
INSERT INTO `permission_role` VALUES ('37', '34', '1', '2017-08-03 18:26:43', '2017-08-03 18:26:43');
INSERT INTO `permission_role` VALUES ('40', '35', '1', '2017-08-04 18:40:31', '2017-08-04 18:40:31');
INSERT INTO `permission_role` VALUES ('39', '36', '1', '2017-08-04 18:22:30', '2017-08-04 18:22:30');
INSERT INTO `permission_role` VALUES ('41', '37', '1', '2017-08-05 15:17:51', '2017-08-05 15:17:51');
INSERT INTO `permission_role` VALUES ('42', '38', '1', '2017-08-05 17:21:38', '2017-08-05 17:21:38');
INSERT INTO `permission_role` VALUES ('43', '39', '1', '2017-08-05 17:21:38', '2017-08-05 17:21:38');
INSERT INTO `permission_role` VALUES ('44', '40', '1', '2017-08-07 11:40:32', '2017-08-07 11:40:32');
INSERT INTO `permission_role` VALUES ('45', '41', '1', '2017-08-07 11:40:32', '2017-08-07 11:40:32');
INSERT INTO `permission_role` VALUES ('46', '42', '1', '2017-08-07 11:40:32', '2017-08-07 11:40:32');

-- ----------------------------
-- Table structure for permission_user
-- ----------------------------
DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_user
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '超级管理员', 'admin', '超级管理员', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `roles` VALUES ('2', '普通用户', 'user', '普通用户', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1', '1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `role_user` VALUES ('2', '2', '2', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `role_user` VALUES ('3', '2', '3', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `role_user` VALUES ('4', '2', '4', '2017-08-01 11:21:52', '2017-08-01 11:21:52');

-- ----------------------------
-- Table structure for servers
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '服务器默认名称',
  `config` text NOT NULL COMMENT '服务器配置信息JSON',
  `status` enum('normal','stop') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `gameid` int(5) DEFAULT NULL COMMENT '游戏ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='服务器表';

-- ----------------------------
-- Records of servers
-- ----------------------------
INSERT INTO `servers` VALUES ('4', 'IOS服', '{\"game_ip\":\"123\",\"game_port\":\"123\",\"charge_ip\":\"123\",\"charge_port\":\"123\",\"gm_ip\":\"123\",\"gm_port\":\"123\"}', 'stop', '2017-08-01 15:18:38', '2017-08-02 15:18:43', '1');
INSERT INTO `servers` VALUES ('5', '123', '123', 'normal', '2017-08-03 10:17:57', '2017-08-03 10:17:57', '1');
INSERT INTO `servers` VALUES ('7', '1', '1', 'normal', '2017-08-07 13:53:48', '2017-08-07 13:53:48', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '账号',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'admin', 'admin@admin.com', '$2y$10$yVvlDRT7WX9km5vTITtjYe5YeO/OxXcNXKDdf6YlVobcAN66Pn4cC', 'bmCrngtKsq88lU1sYan8HGuUREYOQAdbhDEmm2PPT4W7RxzfzcIuV9J39FeN', '2017-08-01 11:21:52', '2017-08-04 18:24:23');
INSERT INTO `users` VALUES ('2', 'Tom Buckridge III', 'Helene', 'boyer.amely@example.net', '$2y$10$THT7lqPNVqVC9uhcVqDtWuwjNIi5KkMVrsO0ari23nPSY2s03JGSe', 'R4zvOAV4IL', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `users` VALUES ('3', 'Khalid Wiza', 'Josiah', 'emilia.dooley@example.net', '$2y$10$4RDCkIFMmaMbC2.8ZlgUMuquMqsSK42OTgqJqTaUkCzs2WdHdw.Um', '8V8BSFRw9I', '2017-08-01 11:21:52', '2017-08-01 11:21:52');
INSERT INTO `users` VALUES ('4', 'Alexandrine Turner', 'Cicero', 'romaine51@example.org', '$2y$10$gHAjfHXDNF65V4u0ELWExeGuYUlmLYslL912pzKpuwz5Pe4OLVytW', 'kVm2IGIlJ1', '2017-08-01 11:21:52', '2017-08-01 11:21:52');