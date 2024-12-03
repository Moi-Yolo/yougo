/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : phonesale

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2024-11-15 13:13:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `crid` int(11) NOT NULL AUTO_INCREMENT,
  `modid` int(11) DEFAULT NULL,
  `commquantity` int(11) DEFAULT NULL,
  `purid` int(11) DEFAULT NULL,
  PRIMARY KEY (`crid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cateid` int(11) NOT NULL AUTO_INCREMENT,
  `catename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cateid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('3', '华为');
INSERT INTO `category` VALUES ('4', '小米');
INSERT INTO `category` VALUES ('5', '苹果');
INSERT INTO `category` VALUES ('6', 'OPPO');
INSERT INTO `category` VALUES ('7', 'VIVO');
INSERT INTO `category` VALUES ('8', '三星');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `commid` varchar(255) NOT NULL,
  `commnumber` varchar(255) DEFAULT NULL,
  `commname` varchar(255) DEFAULT NULL,
  `sortid` int(11) DEFAULT NULL,
  `commobject` varchar(255) DEFAULT NULL,
  `commpicture1` varchar(255) DEFAULT NULL,
  `commpicture2` varchar(255) DEFAULT NULL,
  `commpicture3` varchar(255) DEFAULT NULL,
  `commpicture4` varchar(255) DEFAULT NULL,
  `commcontent` text,
  PRIMARY KEY (`commid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('20241111041402', '1001', '小米（MI）小米15', '30', '黑色', '/upload/1731313444419.png', '/upload/1731313450404.png', '/upload/1731313456023.png', '/upload/1731313463598.png', '<ul class=\"parameter2 p-parameter-list\" style=\"color:#666666;font-family:tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif;background-color:#FFFFFF;\">\r\n	<li>\r\n		商品名称：小米15\r\n	</li>\r\n	<li class=\"shieldShopInfo\">\r\n		商品编号：100123598631\r\n	</li>\r\n	<li>\r\n		CPU型号：骁龙8 至尊版\r\n	</li>\r\n	<li>\r\n		运行内存：12GB\r\n	</li>\r\n	<li>\r\n		机身颜色：黑色\r\n	</li>\r\n	<li>\r\n		三防标准：IP68\r\n	</li>\r\n	<li>\r\n		屏幕分辨率：1.5K\r\n	</li>\r\n	<li>\r\n		机身内存：512GB\r\n	</li>\r\n	<li>\r\n		机身色系：黑色系\r\n	</li>\r\n	<li>\r\n		屏幕材质：OLED直屏\r\n	</li>\r\n	<li>\r\n		后摄主像素：5000万像素\r\n	</li>\r\n</ul>');
INSERT INTO `commodity` VALUES ('20241112014001', '100149709054', '小米（MI）小米15Pro', '30', '白色', '/upload/1731390568461.png', '/upload/1731390575573.png', '/upload/1731390581509.png', '/upload/1731390588538.png', '<ul id=\"parameter-brand\" class=\"p-parameter-list\" style=\"color:#666666;font-family:tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif;background-color:#FFFFFF;\">\r\n	<li>\r\n		品牌：&nbsp;<a href=\"https://list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_18374\" target=\"_blank\">小米（MI）</a>\r\n	</li>\r\n</ul>\r\n<ul class=\"parameter2 p-parameter-list\" style=\"color:#666666;font-family:tahoma, arial, &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;, u5b8bu4f53, sans-serif;background-color:#FFFFFF;\">\r\n	<li>\r\n		商品名称：小米15 Pro\r\n	</li>\r\n	<li class=\"shieldShopInfo\">\r\n		商品编号：100149708968\r\n	</li>\r\n	<li>\r\n		CPU型号：骁龙8 至尊版\r\n	</li>\r\n	<li>\r\n		运行内存：16GB\r\n	</li>\r\n	<li>\r\n		机身颜色：白色\r\n	</li>\r\n	<li>\r\n		三防标准：IP68\r\n	</li>\r\n	<li>\r\n		屏幕分辨率：WQHD+\r\n	</li>\r\n	<li>\r\n		特征特质：轻薄，LTPO屏幕，潜望式长焦，防水防尘，无线充电，NFC，红外遥控，等深微曲屏\r\n	</li>\r\n	<li>\r\n		机身色系：白色系\r\n	</li>\r\n	<li>\r\n		屏幕材质：OLED曲面屏\r\n	</li>\r\n	<li>\r\n		后摄主像素：5000万像素\r\n	</li>\r\n</ul>');
INSERT INTO `commodity` VALUES ('20241112015020', '100051402827', '小米（MI）Redmi 12C', '34', '黑色', '/upload/1731390830644.png', '/upload/1731390836793.png', '/upload/1731390842317.png', '/upload/1731390847668.png', '<ul class=\"parameter2 p-parameter-list\" style=\"color:#666666;font-family:tahoma, arial, \"Microsoft YaHei\", \"Hiragino Sans GB\", u5b8bu4f53, sans-serif;background-color:#FFFFFF;\">\r\n	<li>\r\n		商品名称：小米Redmi 12C\r\n	</li>\r\n	<li class=\"shieldShopInfo\">\r\n		商品编号：100051402827\r\n	</li>\r\n	<li>\r\n		CPU型号：MTK G系列\r\n	</li>\r\n	<li>\r\n		运行内存：4GB\r\n	</li>\r\n	<li>\r\n		机身颜色：黑色\r\n	</li>\r\n	<li>\r\n		三防标准：未上市\r\n	</li>\r\n	<li>\r\n		屏幕分辨率：HD+\r\n	</li>\r\n	<li>\r\n		机身内存：128GB\r\n	</li>\r\n	<li>\r\n		风格：简约风，时尚，大气\r\n	</li>\r\n	<li>\r\n		屏幕材质：LCD\r\n	</li>\r\n	<li>\r\n		后摄主像素：5000万像素\r\n	</li>\r\n	<li>\r\n		机身色系：黑色系\r\n	</li>\r\n</ul>');

-- ----------------------------
-- Table structure for controllers
-- ----------------------------
DROP TABLE IF EXISTS `controllers`;
CREATE TABLE `controllers` (
  `ctID` int(11) NOT NULL AUTO_INCREMENT,
  `ctNumber` varchar(255) DEFAULT NULL,
  `ctPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ctID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of controllers
-- ----------------------------
INSERT INTO `controllers` VALUES ('1', 'admin', '1111');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `modid` int(11) NOT NULL AUTO_INCREMENT,
  `commid` varchar(255) DEFAULT NULL,
  `modname` varchar(255) DEFAULT NULL,
  `modprice` double DEFAULT NULL,
  PRIMARY KEY (`modid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('16', '20240502032905', '6寸', '100');
INSERT INTO `model` VALUES ('17', '20240502032905', '8寸', '120');
INSERT INTO `model` VALUES ('18', '20240502032905', '10寸', '150');
INSERT INTO `model` VALUES ('24', '20240502034936', '6寸', '100');
INSERT INTO `model` VALUES ('25', '20240502034936', '8寸', '150');
INSERT INTO `model` VALUES ('26', '20240502034936', '10寸', '200');
INSERT INTO `model` VALUES ('27', '20240502034936', '12寸', '260');
INSERT INTO `model` VALUES ('31', '20240502035747', '10寸', '120');
INSERT INTO `model` VALUES ('36', '20240502040025', '6寸', '100');
INSERT INTO `model` VALUES ('37', '20240502040025', '8寸', '120');
INSERT INTO `model` VALUES ('38', '20240502040025', '10寸', '150');
INSERT INTO `model` VALUES ('39', '20240502040025', '12寸', '180');
INSERT INTO `model` VALUES ('40', '20241111035835', '是收到', '100');
INSERT INTO `model` VALUES ('41', '20241111035835', '是收到', '100');
INSERT INTO `model` VALUES ('42', '20241111035850', '是收到', '100');
INSERT INTO `model` VALUES ('43', '20241111035940', '是收到', '100');
INSERT INTO `model` VALUES ('47', '20241111041402', '12G-256G', '4000');
INSERT INTO `model` VALUES ('48', '20241111041402', '12G-512G', '4500');
INSERT INTO `model` VALUES ('49', '20241111041402', '16G-256G', '5000');
INSERT INTO `model` VALUES ('50', '20241111041402', '16G-512G', '6000');
INSERT INTO `model` VALUES ('51', '20241112014001', '12G-256G', '5000');
INSERT INTO `model` VALUES ('52', '20241112014001', '12G-512G', '5500');
INSERT INTO `model` VALUES ('53', '20241112014001', '16G-512G', '6000');
INSERT INTO `model` VALUES ('54', '20241112015020', '4G-64G', '500');
INSERT INTO `model` VALUES ('55', '20241112015020', '4G-128G', '550');
INSERT INTO `model` VALUES ('56', '20241113112456', '11', '44');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orid` int(11) NOT NULL AUTO_INCREMENT,
  `ornumber` varchar(255) NOT NULL,
  `ortime` varchar(255) DEFAULT NULL,
  `orstate` varchar(255) DEFAULT NULL,
  `commprice` decimal(10,0) DEFAULT NULL,
  `modid` int(11) DEFAULT NULL,
  `commquantity` int(11) DEFAULT NULL,
  `purid` int(11) DEFAULT NULL,
  `purname` varchar(255) DEFAULT NULL,
  `purtel` varchar(255) DEFAULT NULL,
  `puraddress` varchar(255) DEFAULT NULL,
  `ornotes` varchar(255) DEFAULT NULL,
  `assessflag` varchar(255) DEFAULT NULL,
  `assestime` varchar(255) DEFAULT NULL,
  `assrecontent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orid`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('59', '20241112025949', '2024-11-12 02:59', '未发货', '4000', '47', '1', '6', '张丽', '18364402808', '玄武区石象路58号', '请尽快发货', null, null, null);
INSERT INTO `orders` VALUES ('60', '20241112025949', '2024-11-12 02:59', '未发货', '5500', '52', '1', '6', '张丽', '18364402808', '玄武区石象路58号', '请尽快发货', null, null, null);
INSERT INTO `orders` VALUES ('61', '20241112031546', '2024-11-12 03:15', '已确认收货', '5000', '49', '1', '6', '张丽', '18364402808', '玄武区石象路58号', '请尽快发货', null, null, null);
INSERT INTO `orders` VALUES ('62', '20241112031546', '2024-11-12 03:15', '已确认收货', '6000', '53', '1', '6', '张丽', '18364402808', '玄武区石象路58号', '请尽快发货', null, null, null);
INSERT INTO `orders` VALUES ('63', '20241113111246', '2024-11-13 11:12', '未发货', '4000', '47', '2', '6', '张丽', '18364402808', '玄武区石象路58号', '', null, null, null);
INSERT INTO `orders` VALUES ('64', '20241113111246', '2024-11-13 11:12', '未发货', '5000', '51', '1', '6', '张丽', '18364402808', '玄武区石象路58号', '', null, null, null);
INSERT INTO `orders` VALUES ('65', '20241113111246', '2024-11-13 11:12', '已发货', '500', '54', '1', '6', '张丽', '18364402808', '玄武区石象路58号', '', null, null, null);

-- ----------------------------
-- Table structure for purchaser
-- ----------------------------
DROP TABLE IF EXISTS `purchaser`;
CREATE TABLE `purchaser` (
  `purid` int(11) NOT NULL AUTO_INCREMENT,
  `purnumber` varchar(255) DEFAULT NULL,
  `purpassword` varchar(255) DEFAULT NULL,
  `purname` varchar(255) DEFAULT NULL,
  `purtel` varchar(255) DEFAULT NULL,
  `puraddress` varchar(255) DEFAULT NULL,
  `puremail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`purid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of purchaser
-- ----------------------------
INSERT INTO `purchaser` VALUES ('6', 'zhangli', '111', '张丽', '18364402808', '玄武区石象路58号', '1625283358@qq.com');

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `sortid` int(11) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(255) DEFAULT NULL,
  `cateid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sortid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES ('26', 'Galaxy系列', '8');
INSERT INTO `sort` VALUES ('27', 'W系列', '8');
INSERT INTO `sort` VALUES ('28', 'Note系列', '8');
INSERT INTO `sort` VALUES ('29', 'A系列', '8');
INSERT INTO `sort` VALUES ('30', 'xiaomi MIX系列', '4');
INSERT INTO `sort` VALUES ('31', 'Redmi数字系列', '4');
INSERT INTO `sort` VALUES ('32', 'xiaomi Civi系列', '4');
INSERT INTO `sort` VALUES ('33', 'Redmi k系列', '4');
INSERT INTO `sort` VALUES ('34', 'Redmi Note系列', '4');
INSERT INTO `sort` VALUES ('35', '‌Mate系列', '3');
INSERT INTO `sort` VALUES ('36', 'Pura系列', '3');
INSERT INTO `sort` VALUES ('37', '‌nova系列', '3');
INSERT INTO `sort` VALUES ('38', '畅享系列', '3');
INSERT INTO `sort` VALUES ('39', '订单', '8');
INSERT INTO `sort` VALUES ('40', '订单', '8');
