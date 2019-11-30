-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2019 at 04:14 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banbanh`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(1, 23, '2019-11-21', 23, NULL, NULL, '2019-11-23 12:55:32', '2019-11-23 12:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 12, 5, 2, 220000, '2019-11-23 12:55:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(1, 'NV', 'Nam', 'NV@gmail.com', 'HCM', '098765432', 'k', '2019-11-23 12:56:11', '2019-11-23 12:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `hot` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `quantity`, `hot`, `created_at`, `updated_at`) VALUES
(1, 'Bánh cookie socola chíp 1000 gram', 1, 'none', 320000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573262232_cookiesocolachip.jpg', NULL, 20, 1, NULL, NULL),
(2, ' Bánh cookie lưỡi mèo 1000 gram', 1, 'none', 220000, 200000, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573262109_cookieluoimeo.jpg', NULL, 20, 0, NULL, NULL),
(3, ' Bánh cookie hạnh nhân dừa 1000 gram', 1, 'none', 350000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261999_cookiehanhnhandua.jpg', NULL, 20, 0, NULL, NULL),
(5, ' Bánh cookie dưa hấu 1000 gram', 1, 'none', 490000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261597_cookieduahau.jpg', NULL, 20, 0, NULL, NULL),
(6, ' Kẹo hạnh phúc 500 gram', 1, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573260676_keohanhphuc.jpg', NULL, 20, 0, NULL, NULL),
(7, ' Bánh kem ô tô mầu xanh mã B1573', 1, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 0, NULL, NULL),
(8, ' Bánh Bitcosti 500 gram', 1, 'none', 490000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 1, NULL, NULL),
(9, ' Kẹo hạnh phúc 500 gram', 1, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573260676_keohanhphuc.jpg', NULL, 20, 0, NULL, NULL),
(10, ' Bánh kem sinh nhật hình quả sầu riêng Mã B17192', 1, 'none', 890000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571300092_banhkemquasaurieng.jpg', NULL, 20, 0, NULL, NULL),
(11, ' Bánh kem nhóc trùm baby boss Mã B17191', 1, 'none', 550000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571299851_banhkemnhoctrum.jpg', NULL, 20, 0, NULL, NULL),
(12, ' Bánh sinh nhật công ty mã B1191', 1, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571213018_banhsinhnhatcongty.jpg', NULL, 20, 0, NULL, NULL),
(13, ' Bánh sinh nhật mừng đại gia mã B16199', 1, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212846_banhsinhnhatdaigia.jpg', NULL, 20, 1, NULL, NULL),
(14, ' Bánh sinh nhật hình unicorn mã B16198', 1, 'none', 720000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212593_banhunicorn.jpg', NULL, 20, 0, NULL, NULL),
(15, ' Bánh hình unicorn mã B16197', 1, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212346_banhunicron2.jpg', NULL, 20, 0, NULL, NULL),
(16, ' Bánh kem sinh nhật hình con gà mã B16196', 1, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212132_conga.jpg', NULL, 20, 0, NULL, NULL),
(17, ' Bánh sinh nhật hình con heo vàng Mã B16195', 1, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211686_banhconheosinhdoi.jpg', NULL, 20, 1, NULL, NULL),
(18, ' Bánh sinh nhật hình con gà Mã B16104', 1, 'none', 630000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211000_banhconga.jpg', NULL, 20, 1, NULL, NULL),
(19, ' Bánh kem sinh nhật cây tiền', 1, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571210625_banhcaytien.jpg', NULL, 20, 1, NULL, NULL),
(20, ' Bánh Penis gây cười B16192', 1, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571209089_banhcaichim.jpg', NULL, 20, 0, NULL, NULL),
(21, ' Bánh kem hình bắp ngô Mã B10191', 1, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571208698_banhbapngo.jpg', NULL, 20, 0, NULL, NULL),
(22, ' Bánh kem ô tô mầu xanh mã B1573', 1, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 0, NULL, NULL),
(23, ' Bánh Bitcosti 500 gram', 1, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 0, NULL, NULL),
(24, 'sinh nhật hình quả sầu riêng Mã B17192', 2, 'none', 380000, NULL, 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571300092_banhkemquasaurieng.jpg', NULL, 20, 1, NULL, NULL),
(25, ' Bánh kem hình trái tim mã B5425', 2, 'none', 280000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1557996735_banhkemhinhtraitimdanhtangnguoiy.jpg', NULL, 20, 1, NULL, NULL),
(26, ' Bánh kem in ảnh mã b5412', 2, 'none', 890000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555580987_banhkeminanhlogocongtym%E1%BA%A1412.jpg', NULL, 20, 0, NULL, NULL),
(27, ' Bánh kem bắp Mã B5414', 2, 'none', 320000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555580169_banhkembapm%E1%BA%A1413.jpg', NULL, 20, 0, NULL, NULL),
(28, ' Bánh kem bắt hoa Mã B5405', 2, 'none', 220000, 200000, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555402926_banhkembatbonghoamab5405.jpg', NULL, 20, 0, NULL, NULL),
(29, ' Bánh kem Mã B5404', 2, 'none', 200000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555402147_banhkemsocolab5404.jpg', NULL, 20, 0, NULL, NULL),
(30, ' Bánh kem bắt hoa mã B5406', 2, 'none', 220000, 200000, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555397251_banhkembathoatongmauxanhduongmab.jpg', NULL, 20, 1, NULL, NULL),
(31, ' Bánh kem socola Mã B5409', 2, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555397067_banhkemsocolab5407.jpg', NULL, 20, 0, NULL, NULL),
(32, ' Bánh kem socola Mã B5389', 2, 'none', 230000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555390917_banhkemsocolab5389.jpg', NULL, 20, 0, NULL, NULL),
(33, ' Bánh kem socola Mã B5388', 2, 'none', 230000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555390469_banhkemsocolab5388.jpg', NULL, 20, 1, NULL, NULL),
(34, ' Bánh kem 2 tầng Mã B1493', 2, 'none', 780000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530011946_banhkem2tangbanhkemnhieutangbanh.jpg', NULL, 20, 0, NULL, NULL),
(35, ' Bánh kem Mã B0807', 2, 'none', 280000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498892081_banhsinhnhatbathoahongma0807.jpg', NULL, 20, 0, NULL, NULL),
(36, ' Bánh kem Mã B0307', 2, 'none', 650000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498891895_banhsinhnhattangseptangcacbannub.jpg', NULL, 20, 0, NULL, NULL),
(37, ' Bánh kem mã B0507', 2, 'none', 390000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498891771_banhsinhnhatbathoadepmab0507.jpg', NULL, 20, 1, NULL, NULL),
(38, ' Bánh kem Mã B0707', 2, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498891500_banhkemsocolakethophoatrangma070.jpg', NULL, 20, 0, NULL, NULL),
(39, ' Bánh kem mã B0607', 2, 'none', 390000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498890950_banhkembathoamauhongtrangdepbanh.jpg', NULL, 20, 0, NULL, NULL),
(40, ' Bánh kem Mã B1007', 2, 'none', 320000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498890367_banhkembathoam%C3%A1007.jpg', NULL, 20, 0, NULL, NULL),
(41, ' Bánh kem Mã B1107', 2, 'none', 400000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498888237_banhkembathoahongbanhsinhnhathoa.jpg', NULL, 20, 0, NULL, NULL),
(42, ' Bánh kem sinh nhật Mã B0907', 2, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498887990_banhkembathoadepbanhkembatbongma.jpg', NULL, 20, 1, NULL, NULL),
(43, ' Bánh kem Mã B0407', 2, 'none', 320000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498887573_banhkembathoahongdobanhkembathoa.jpg', NULL, 20, 0, NULL, NULL),
(44, ' Bánh kem Mã B0207', 2, 'none', 650000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1498879534_banhsinhnhatbathoadeptangbangait.jpg', NULL, 20, 0, NULL, NULL),
(45, ' Bánh kem ô tô mầu xanh mã B1573', 2, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 0, NULL, NULL),
(46, ' Bánh Bitcosti 500 gram', 2, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 1, NULL, NULL),
(47, ' Kẹo hạnh phúc 500 gram', 2, 'none', 490000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573260676_keohanhphuc.jpg', NULL, 20, 1, NULL, NULL),
(48, ' Bánh kem sinh nhật hình quả sầu riêng Mã B17192', 2, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571300092_banhkemquasaurieng.jpg', NULL, 20, 1, NULL, NULL),
(49, ' Bánh kem nhóc trùm baby boss Mã B17191', 2, 'none', 890000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571299851_banhkemnhoctrum.jpg', NULL, 20, 0, NULL, NULL),
(50, ' Bánh sinh nhật công ty mã B1191', 2, 'none', 550000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571213018_banhsinhnhatcongty.jpg', NULL, 20, 0, NULL, NULL),
(51, ' Bánh sinh nhật mừng đại gia mã B16199', 2, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212846_banhsinhnhatdaigia.jpg', NULL, 20, 0, NULL, NULL),
(52, ' Bánh sinh nhật hình unicorn mã B16198', 2, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212593_banhunicorn.jpg', NULL, 20, 0, NULL, NULL),
(53, ' Bánh hình unicorn mã B16197', 2, 'none', 720000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212346_banhunicron2.jpg', NULL, 20, 1, NULL, NULL),
(54, ' Bánh kem sinh nhật hình con gà mã B16196', 2, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212132_conga.jpg', NULL, 20, 1, NULL, NULL),
(55, ' Bánh sinh nhật hình con heo vàng Mã B16195', 2, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211686_banhconheosinhdoi.jpg', NULL, 20, 0, NULL, NULL),
(56, ' Bánh sinh nhật hình con gà Mã B16104', 2, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211000_banhconga.jpg', NULL, 20, 0, NULL, NULL),
(57, ' Bánh kem sinh nhật cây tiền', 2, 'none', 630000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571210625_banhcaytien.jpg', NULL, 20, 0, NULL, NULL),
(58, ' Bánh Penis gây cười B16192', 2, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571209089_banhcaichim.jpg', NULL, 20, 0, NULL, NULL),
(59, ' Bánh kem hình bắp ngô Mã B10191', 2, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571208698_banhbapngo.jpg', NULL, 20, 1, NULL, NULL),
(60, ' Bánh kem ô tô mầu xanh mã B1573', 2, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 1, NULL, NULL),
(61, ' Bánh Bitcosti 500 gram', 2, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 0, NULL, NULL),
(62, 'Bánh kem sinh nhật hình con gà mã B16196', 3, 'none', 380000, NULL, 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212132_conga.jpg', NULL, 20, 0, NULL, NULL),
(63, ' Bánh sinh nhật hình con gà Mã B16104', 3, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211000_banhconga.jpg', NULL, 20, 1, NULL, NULL),
(64, ' Bánh kem hình bắp ngô Mã B10191', 3, 'none', 620000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571208698_banhbapngo.jpg', NULL, 20, 0, NULL, NULL),
(65, ' Bánh kem mừng thôi nôi mã B5438', 3, 'none', 390000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563178362_banhkemmungthoinoichobetraibanhk.jpg', NULL, 20, 0, NULL, NULL),
(66, ' Bánh kem tuổi dậu Mã B5416', 3, 'none', 550000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555582234_banhkemsinhnhatcongabanhkemtuoid.jpg', NULL, 20, 0, NULL, NULL),
(67, ' Bánh kem nhóc trùm Mã B5411', 3, 'none', 260000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555578943_banhkemsinhnhatnhoctrummab5411.jpg', NULL, 20, 1, NULL, NULL),
(68, ' Bánh kem tuổi Rồng Mã B5387', 3, 'none', 350000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555390143_banhkeminanhbanhkemconrongb5387.jpg', NULL, 20, 0, NULL, NULL),
(69, ' Bánh sinh nhật tuổi khỉ Mã B5382', 3, 'none', 280000, 200000, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530876288_858ed834%C3%A84803165%E1%BA%A19.jpg', NULL, 20, 0, NULL, NULL),
(70, ' Bánh sinh nhật con dê mã B1763', 3, 'none', 6360000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1493459624_banhsinhnhatcondemab1763.jpg', NULL, 20, 0, NULL, NULL),
(71, ' Bánh sinh nhật vẽ chibi bé gái Mã B1743', 3, 'none', 2430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1492513038_banhkemvechibibega%C3%ADtuomab1743.jpg', NULL, 20, 0, NULL, NULL),
(72, ' Bánh sinh nhật tuổi khỉ Mã B1737', 3, 'none', 3360000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1488628556_banhkemtuoiconkh%C3%AD737.jpg', NULL, 20, 1, NULL, NULL),
(73, ' Bánh sinh nhật con dê Mã B1735', 3, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1488359986_banhsinhnhattuoid%C3%A9735.jpg', NULL, 20, 0, NULL, NULL),
(74, ' Bánh kem MÃ B1738', 3, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1488101695_banhsinhnhatdoremonvachukhidethu.jpg', NULL, 20, 0, NULL, NULL),
(75, ' Bánh sinh nhật chú khỉ đáng yêu Mã B1730', 3, 'none', 490000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1488100891_banhsinhnhattheosotuoituoikh%C3%AD73.jpg', NULL, 20, 0, NULL, NULL),
(76, ' Bánh kem tuổi khỉ mã B1723', 3, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1488020749_banhsinhnhatconkhitheosotuoim%C3%A17.jpg', NULL, 20, 1, NULL, NULL),
(77, ' Bánh sinh nhật tuổi khỉ Mã B1721', 3, 'none', 890000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1488020089_banhsinhnhattuoikhim%C3%A1721.jpg', NULL, 20, 1, NULL, NULL),
(78, ' Bánh con rắn mã B1651', 3, 'none', 550000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1432182008_ran2.jpg', NULL, 20, 1, NULL, NULL),
(79, ' Bánh con rắn mã B1650', 3, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1432181282_ran1.jpg', NULL, 20, 0, NULL, NULL),
(80, ' Bánh hình con rắn mã B1758', 3, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1432179877_4309.jpg', NULL, 20, 0, NULL, NULL),
(81, ' Bánh con rắn mã B1757', 3, 'none', 720000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1432179719_8053.jpg', NULL, 20, 0, NULL, NULL),
(82, ' Bánh hình con heo mã B110', 3, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1412181427_lon7.jpg', NULL, 20, 0, NULL, NULL),
(83, ' Bánh kem ô tô mầu xanh mã B1573', 3, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 1, NULL, NULL),
(84, ' Bánh Bitcosti 500 gram', 3, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 1, NULL, NULL),
(85, ' Kẹo hạnh phúc 500 gram', 3, 'none', 630000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573260676_keohanhphuc.jpg', NULL, 20, 0, NULL, NULL),
(86, ' Bánh kem sinh nhật hình quả sầu riêng Mã B17192', 3, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571300092_banhkemquasaurieng.jpg', NULL, 20, 0, NULL, NULL),
(87, ' Bánh kem nhóc trùm baby boss Mã B17191', 3, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571299851_banhkemnhoctrum.jpg', NULL, 20, 0, NULL, NULL),
(88, ' Bánh sinh nhật công ty mã B1191', 3, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571213018_banhsinhnhatcongty.jpg', NULL, 20, 0, NULL, NULL),
(89, ' Bánh sinh nhật mừng đại gia mã B16199', 3, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212846_banhsinhnhatdaigia.jpg', NULL, 20, 1, NULL, NULL),
(90, ' Bánh sinh nhật hình unicorn mã B16198', 3, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212593_banhunicorn.jpg', NULL, 20, 0, NULL, NULL),
(91, ' Bánh hình unicorn mã B16197', 3, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212346_banhunicron2.jpg', NULL, 20, 0, NULL, NULL),
(92, ' Bánh kem sinh nhật hình con gà mã B16196', 3, 'none', 630000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212132_conga.jpg', NULL, 20, 1, NULL, NULL),
(93, ' Bánh sinh nhật hình con heo vàng Mã B16195', 3, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211686_banhconheosinhdoi.jpg', NULL, 20, 0, NULL, NULL),
(94, ' Bánh sinh nhật hình con gà Mã B16104', 3, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211000_banhconga.jpg', NULL, 20, 0, NULL, NULL),
(95, ' Bánh kem sinh nhật cây tiền', 3, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571210625_banhcaytien.jpg', NULL, 20, 0, NULL, NULL),
(96, ' Bánh Penis gây cười B16192', 3, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571209089_banhcaichim.jpg', NULL, 20, 1, NULL, NULL),
(97, ' Bánh kem hình bắp ngô Mã B10191', 3, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571208698_banhbapngo.jpg', NULL, 20, 0, NULL, NULL),
(98, ' Bánh kem ô tô mầu xanh mã B1573', 3, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 0, NULL, NULL),
(99, ' Bánh Bitcosti 500 gram', 3, 'none', 630000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 0, NULL, NULL),
(100, 'Bánh kem 2 tầng Mã B1493', 4, 'none', 780000, NULL, 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530011946_banhkem2tangbanhkemnhieutangbanh.jpg', NULL, 20, 0, NULL, NULL),
(101, ' Bánh kem ngôi nhà in ảnh Mã B2141', 4, 'none', 480000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513670980_banhkemhinhngoinhainanhmab2141.jpg', NULL, 20, 1, NULL, NULL),
(102, ' Bánh sinh nhật ngôi nhà Mã B2140', 4, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513670508_banhkemhinhngoinhamab2140.jpg', NULL, 20, 0, NULL, NULL),
(103, ' Bánh kem ngôi nhà Mã B2139', 4, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513668804_banhkemhinhngoinhahanhphucbanhke.jpg', NULL, 20, 0, NULL, NULL),
(104, ' Bánh kem ngôi nhà Mã B2137', 4, 'none', 400000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513628714_banhkemhinhngoinhamab2137.jpg', NULL, 20, 0, NULL, NULL),
(105, ' Bánh kem khúc gỗ Mã B2136', 4, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513627720_banhkemnoelkhuccaymab2136.jpg', NULL, 20, 1, NULL, NULL),
(106, ' Bánh kem noel Mã B2135', 4, 'none', 450000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513627510_banhkemnuituyetbanhkemnoelhinhan.jpg', NULL, 20, 1, NULL, NULL),
(107, ' Bánh kem in ảnh Mã B2134', 4, 'none', 310000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513627361_banhkeminanhchudenoelmab2134.jpg', NULL, 20, 1, NULL, NULL),
(108, ' Bánh kem ngôi nhà Mã B2133', 4, 'none', 350000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513627016_banhkemnoelhinhngoinhabanhkemnoe.jpg', NULL, 20, 0, NULL, NULL),
(109, ' Bánh kem noel mã B2128', 4, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513072463_banhgiangsinhbanhnoelbanhngoinha.jpg', NULL, 20, 0, NULL, NULL),
(110, ' Bánh kem mã B2132', 4, 'none', 500000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513072261_banhkeminanhb2132.jpg', NULL, 20, 0, NULL, NULL),
(111, ' Bánh kem noel B2131', 4, 'none', 360000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513071021_banhkemnoelonggiatuyetmab2131.jpg', NULL, 20, 0, NULL, NULL),
(112, ' Bánh kem noel Mã B2130', 4, 'none', 750000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513070781_banhkemngoinhagiangsinhmab2130.jpg', NULL, 20, 1, NULL, NULL),
(113, ' Bánh kem in ảnh noel Mã B2125', 4, 'none', 310000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513069556_banhkeminanhnoelgiangsinhmab2125.jpg', NULL, 20, 1, NULL, NULL),
(114, ' Bánh kem gốc cây mã B2126', 4, 'none', 270000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513069425_banhkemnoelbanhgoccaymab2126.jpg', NULL, 20, 0, NULL, NULL),
(115, ' Banh kem noel Mã B2124', 4, 'none', 250000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513069239_banhkemnoelbanhgiangsinhmab2124.jpg', NULL, 20, 0, NULL, NULL),
(116, ' Bánh kem noel Mã B2123', 4, 'none', 370000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513069107_banhkemonggianoelbanhkemgiangsin.jpg', NULL, 20, 0, NULL, NULL),
(117, ' Bánh kem ông già Noel Mã B2129', 4, 'none', 2250000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513627829_banhkemonggianoelmab2129.jpg', NULL, 20, 0, NULL, NULL),
(118, ' Bánh kem mặt ông già noel Mã B2121', 4, 'none', 290000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513067685_banhkemsinhnhatnoelbanhgiangsinh.jpg', NULL, 20, 1, NULL, NULL),
(119, ' Bánh kem noel gốc cây Mã B2127', 4, 'none', 250000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513066653_banhnolegoccaymab2127.jpg', NULL, 20, 1, NULL, NULL),
(120, ' Bánh kem noel Mã B2122', 4, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513065755_cacmaubanhkemchomuanoelbanhkemno.jpg', NULL, 20, 0, NULL, NULL),
(121, ' Bánh kem ô tô mầu xanh mã B1573', 4, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 0, NULL, NULL),
(122, ' Bánh Bitcosti 500 gram', 4, 'none', 720000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 1, NULL, NULL),
(123, ' Kẹo hạnh phúc 500 gram', 4, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573260676_keohanhphuc.jpg', NULL, 20, 0, NULL, NULL),
(124, ' Bánh kem sinh nhật hình quả sầu riêng Mã B17192', 4, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571300092_banhkemquasaurieng.jpg', NULL, 20, 0, NULL, NULL),
(125, ' Bánh kem nhóc trùm baby boss Mã B17191', 4, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571299851_banhkemnhoctrum.jpg', NULL, 20, 0, NULL, NULL),
(126, ' Bánh sinh nhật công ty mã B1191', 4, 'none', 630000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571213018_banhsinhnhatcongty.jpg', NULL, 20, 1, NULL, NULL),
(127, ' Bánh sinh nhật mừng đại gia mã B16199', 4, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212846_banhsinhnhatdaigia.jpg', NULL, 20, 0, NULL, NULL),
(128, ' Bánh sinh nhật hình unicorn mã B16198', 4, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212593_banhunicorn.jpg', NULL, 20, 0, NULL, NULL),
(129, ' Bánh hình unicorn mã B16197', 4, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212346_banhunicron2.jpg', NULL, 20, 0, NULL, NULL),
(130, ' Bánh kem sinh nhật hình con gà mã B16196', 4, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212132_conga.jpg', NULL, 20, 0, NULL, NULL),
(131, ' Bánh sinh nhật hình con heo vàng Mã B16195', 4, 'none', 490000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211686_banhconheosinhdoi.jpg', NULL, 20, 1, NULL, NULL),
(132, ' Bánh sinh nhật hình con gà Mã B16104', 4, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211000_banhconga.jpg', NULL, 20, 0, NULL, NULL),
(133, ' Bánh kem sinh nhật cây tiền', 4, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571210625_banhcaytien.jpg', NULL, 20, 0, NULL, NULL),
(134, ' Bánh Penis gây cười B16192', 4, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571209089_banhcaichim.jpg', NULL, 20, 0, NULL, NULL),
(135, ' Bánh kem hình bắp ngô Mã B10191', 4, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571208698_banhbapngo.jpg', NULL, 20, 1, NULL, NULL),
(136, ' Bánh kem ô tô mầu xanh mã B1573', 4, 'none', 490000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 1, NULL, NULL),
(137, ' Bánh Bitcosti 500 gram', 4, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 1, NULL, NULL),
(138, 'Bánh sinh nhật công ty mã B1191', 5, 'none', 430000, NULL, 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571213018_banhsinhnhatcongty.jpg', NULL, 20, 0, NULL, NULL),
(139, ' Bánh sinh nhật mừng đại gia mã B16199', 5, 'none', 340000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212846_banhsinhnhatdaigia.jpg', NULL, 20, 0, NULL, NULL),
(140, ' Bánh kem in ảnh Mã B5436', 5, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563178564_banhkeminhinhbanhsinhnhatinanhma.jpg', NULL, 20, 0, NULL, NULL),
(141, ' Bánh kem công chúa mầu hồng Mã B5435', 5, 'none', 350000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563177374_banhkembotbienbanhkemcongchuaban.jpg', NULL, 20, 0, NULL, NULL),
(142, ' Bánh kem Masha Mã B5432', 5, 'none', 440000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563158552_banhkemmashabanhsinhnhatmashavag.jpg', NULL, 20, 1, NULL, NULL),
(143, ' Bánh kem in ảnh mã b5412', 5, 'none', 850000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555580987_banhkeminanhlogocongtym%E1%BA%A1412.jpg', NULL, 20, 1, NULL, NULL),
(144, ' Bánh sinh nhật in ảnh elsa Mã 5381', 5, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530875881_banhsinhnhatcongchuaelsabanhsinh.jpg', NULL, 20, 0, NULL, NULL),
(145, ' Bánh kem in hình elsa Mã B1506', 5, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530793848_banhsinhnhatcongchuaels%C3%A0.jpg', NULL, 20, 0, NULL, NULL),
(146, ' Bánh kem in ảnh Mã B1505', 5, 'none', 480000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530793390_banhsinhnhatcongchuaels%C3%A1b1505.jpg', NULL, 20, 0, NULL, NULL),
(147, ' Bánh kem elsa Mã B1491', 5, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530011271_banhkemcongchuaelsabanhkemnuhoan.jpg', NULL, 20, 0, NULL, NULL),
(148, ' Mã bánh công chúa B1490', 5, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1529145161_banhsinhnhatinanhcongchuasofiama.jpg', NULL, 20, 1, NULL, NULL),
(149, ' Bánh kem in ảnh Mã B1488', 5, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1529143886_banhkemcongchuaels%C3%A0tangbanhkemh.jpg', NULL, 20, 0, NULL, NULL),
(150, ' Mã bánh công chúa Elsa B1487', 5, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1529138457_banhsinhnhatcongchuaelsabanhkemn.jpg', NULL, 20, 0, NULL, NULL),
(151, ' Bánh in ảnh Mã B1486', 5, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1528854856_banhkeminanhbanhsinhnhatinanhdep.jpg', NULL, 20, 1, NULL, NULL),
(152, ' Bánh công chúa elsa Mã B1485', 5, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1528854118_banhkemcongchuaelsabanhkemnuhoan.jpg', NULL, 20, 0, NULL, NULL),
(153, ' Bánh kem công chúa Mã B1484', 5, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1528798497_banhsinhnhatcongchuabanhkembupbe.jpg', NULL, 20, 0, NULL, NULL),
(154, ' Bánh sinh nhật in ảnh Mã B1483', 5, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1523360613_banhkeminanhtuoigabanhkeminanhta.jpg', NULL, 20, 0, NULL, NULL),
(155, ' Bánh kem in ảnh 2 tầng Mã B1481', 5, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1523360292_banhkeminanhbanhsinhnhattangnguo.jpg', NULL, 20, 1, NULL, NULL),
(156, ' Bánh kem in ảnh Mã B1482', 5, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1523359751_banhkemsinhnhatinanhbanhkeminanh.jpg', NULL, 20, 0, NULL, NULL),
(157, ' Bánh kem in ảnh Mã B3132', 5, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1523359156_thegioibanhkembanhbanhsinhnhatin.jpg', NULL, 20, 0, NULL, NULL),
(158, ' Bánh kem ngôi nhà in ảnh Mã B2141', 5, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1513670980_banhkemhinhngoinhainanhmab2141.jpg', NULL, 20, 0, NULL, NULL),
(159, ' Bánh kem ô tô mầu xanh mã B1573', 5, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 0, NULL, NULL),
(160, ' Bánh Bitcosti 500 gram', 5, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 1, NULL, NULL),
(161, ' Kẹo hạnh phúc 500 gram', 5, 'none', 890000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573260676_keohanhphuc.jpg', NULL, 20, 0, NULL, NULL),
(162, ' Bánh kem sinh nhật hình quả sầu riêng Mã B17192', 5, 'none', 550000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571300092_banhkemquasaurieng.jpg', NULL, 20, 0, NULL, NULL),
(163, ' Bánh kem nhóc trùm baby boss Mã B17191', 5, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571299851_banhkemnhoctrum.jpg', NULL, 20, 0, NULL, NULL),
(164, ' Bánh sinh nhật công ty mã B1191', 5, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571213018_banhsinhnhatcongty.jpg', NULL, 20, 1, NULL, NULL),
(165, ' Bánh sinh nhật mừng đại gia mã B16199', 5, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212846_banhsinhnhatdaigia.jpg', NULL, 20, 1, NULL, NULL),
(166, ' Bánh sinh nhật hình unicorn mã B16198', 5, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212593_banhunicorn.jpg', NULL, 20, 1, NULL, NULL),
(167, ' Bánh hình unicorn mã B16197', 5, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212346_banhunicron2.jpg', NULL, 20, 0, NULL, NULL),
(168, ' Bánh kem sinh nhật hình con gà mã B16196', 5, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212132_conga.jpg', NULL, 20, 0, NULL, NULL),
(169, ' Bánh sinh nhật hình con heo vàng Mã B16195', 5, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211686_banhconheosinhdoi.jpg', NULL, 20, 0, NULL, NULL),
(170, ' Bánh sinh nhật hình con gà Mã B16104', 5, 'none', 630000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211000_banhconga.jpg', NULL, 20, 0, NULL, NULL),
(171, ' Bánh kem sinh nhật cây tiền', 5, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571210625_banhcaytien.jpg', NULL, 20, 1, NULL, NULL),
(172, ' Bánh Penis gây cười B16192', 5, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571209089_banhcaichim.jpg', NULL, 20, 1, NULL, NULL),
(173, ' Bánh kem hình bắp ngô Mã B10191', 5, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571208698_banhbapngo.jpg', NULL, 20, 0, NULL, NULL),
(174, ' Bánh kem ô tô mầu xanh mã B1573', 5, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 0, NULL, NULL),
(175, ' Bánh Bitcosti 500 gram', 5, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 0, NULL, NULL),
(176, 'Bánh kem sinh nhật hình quả sầu riêng Mã B17192', 6, 'none', 380000, NULL, 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571300092_banhkemquasaurieng.jpg', NULL, 20, 0, NULL, NULL),
(177, ' Bánh sinh nhật hình con heo vàng Mã B16195', 6, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211686_banhconheosinhdoi.jpg', NULL, 20, 1, NULL, NULL),
(178, ' Bánh sinh nhật hình con gà Mã B16104', 6, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211000_banhconga.jpg', NULL, 20, NULL, NULL, NULL),
(179, ' Bánh kem sinh nhật cây tiền', 6, 'none', 630000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571210625_banhcaytien.jpg', NULL, 20, 1, NULL, NULL),
(180, ' Bánh kem hình bắp ngô Mã B10191', 6, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571208698_banhbapngo.jpg', NULL, 20, 0, NULL, NULL),
(181, ' Bánh kem ô tô mầu xanh mã B1573', 6, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 0, NULL, NULL),
(182, ' Bánh kem hình lon bia tiger mã B5441', 6, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563186712_banhkem2dbiatigermab5441.jpg', NULL, 20, 1, NULL, NULL),
(183, ' Bánh kem máy bay vietjet mã B5440', 6, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563185803_banhsinhnhatmaybayvietjetarimab5.jpg', NULL, 20, 0, NULL, NULL),
(184, ' Bánh kem máy bay singapore Mã B5439', 6, 'none', 2430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563184309_banhkemmaybaysingaporebanhsinhnh.jpg', NULL, 20, 0, NULL, NULL),
(185, ' Bánh kem xe cẩu 3D mã B5413', 6, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1555581613_banhkemxemucbanhsinhnhat3dxecaum.jpg', NULL, 20, 0, NULL, NULL),
(186, ' Bánh kem ô tô Mã B1503', 6, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530792244_maubanhsinhnhatdepchotraidangyeu.jpg', NULL, 20, 1, NULL, NULL),
(187, ' Bánh sinh nhật ô tô Mã B1502', 6, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530791691_18%C4%91fac4c0b821%C3%AA78a9.jpg', NULL, 20, 0, NULL, NULL),
(188, ' Bánh sinh nhật ô tô Mã B1501', 6, 'none', 400000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530790229_banhsinhnhatotothegioibanhkemban.jpg', NULL, 20, 0, NULL, NULL),
(189, ' Bánh hình máy bay mã B8111', 6, 'none', 350000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1510086258_banhsinhnhathinhmaybaybanhsinhnh.jpg', NULL, 20, 0, NULL, NULL),
(190, ' Bánh kem Mã B2915', 6, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1509347843_cachlambanhhalloweenhinhquabingo.jpg', NULL, 20, 0, NULL, NULL),
(191, ' Bánh kem quả bí Mã B2914', 6, 'none', 2360000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1509346938_banhkemquabingobanhkemlehoihallo.jpg', NULL, 20, 1, NULL, NULL),
(192, ' Bánh sinh nhật chiếc bánh mì Mã B1132', 6, 'none', 400000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1499101628_banhsinhnhatchiecbanhmim%C3%A1132.jpg', NULL, 20, 0, NULL, NULL),
(193, ' Bánh kem ô tô Mã B407', 6, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1452943435_b407.jpg', NULL, 20, 0, NULL, NULL),
(194, ' Bánh kem ô tô B408', 6, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1452942855_b408.jpg', NULL, 20, 0, NULL, NULL),
(195, ' Bánh kem mô hình ô tô Mã B405', 6, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1452942531_b405.jpg', NULL, 20, 1, NULL, NULL),
(196, ' Bánh kem tô mì Mã B403', 6, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1452941837_b403.jpg', NULL, 20, 1, NULL, NULL),
(197, ' Bánh kem ô tô mầu xanh mã B1573', 6, 'none', 490000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 1, NULL, NULL),
(198, ' Bánh Bitcosti 500 gram', 6, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 0, NULL, NULL),
(199, ' Kẹo hạnh phúc 500 gram', 6, 'none', 890000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573260676_keohanhphuc.jpg', NULL, 20, 0, NULL, NULL),
(200, ' Bánh kem sinh nhật hình quả sầu riêng Mã B17192', 6, 'none', 550000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571300092_banhkemquasaurieng.jpg', NULL, 20, 0, NULL, NULL),
(201, ' Bánh kem nhóc trùm baby boss Mã B17191', 6, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571299851_banhkemnhoctrum.jpg', NULL, 20, 0, NULL, NULL),
(202, ' Bánh sinh nhật công ty mã B1191', 6, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571213018_banhsinhnhatcongty.jpg', NULL, 20, 1, NULL, NULL),
(203, ' Bánh sinh nhật mừng đại gia mã B16199', 6, 'none', 720000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212846_banhsinhnhatdaigia.jpg', NULL, 20, 1, NULL, NULL),
(204, ' Bánh sinh nhật hình unicorn mã B16198', 6, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212593_banhunicorn.jpg', NULL, 20, 0, NULL, NULL),
(205, ' Bánh hình unicorn mã B16197', 6, 'none', 530000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212346_banhunicron2.jpg', NULL, 20, 0, NULL, NULL),
(206, ' Bánh kem sinh nhật hình con gà mã B16196', 6, 'none', 580000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212132_conga.jpg', NULL, 20, 0, NULL, NULL),
(207, ' Bánh sinh nhật hình con heo vàng Mã B16195', 6, 'none', 630000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211686_banhconheosinhdoi.jpg', NULL, 20, 0, NULL, NULL),
(208, ' Bánh sinh nhật hình con gà Mã B16104', 6, 'none', 420000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571211000_banhconga.jpg', NULL, 20, 1, NULL, NULL),
(209, ' Bánh kem sinh nhật cây tiền', 6, 'none', 380000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571210625_banhcaytien.jpg', NULL, 20, 0, NULL, NULL),
(210, ' Bánh Penis gây cười B16192', 6, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571209089_banhcaichim.jpg', NULL, 20, 0, NULL, NULL),
(211, ' Bánh kem hình bắp ngô Mã B10191', 6, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571208698_banhbapngo.jpg', NULL, 20, 1, NULL, NULL),
(212, ' Bánh kem ô tô mầu xanh mã B1573', 6, 'none', 430000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1563187172_banhkemsinhnhatotomauxanhmab1573.jpg', NULL, 20, 0, NULL, NULL),
(213, ' Bánh Bitcosti 500 gram', 6, 'none', 300000, NULL, ' https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573261842_biscoti.jpg', NULL, 20, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Bánh cookie, bánh ăn kiêng', '', 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1573262109_cookieluoimeo.jpg', NULL, NULL),
(2, 'Bánh kem sinh nhật everyone - everyday\n', '', 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1557996735_banhkemhinhtraitimdanhtangnguoiy.jpg', NULL, NULL),
(3, 'Bánh sinh nhật theo số tuổi 1, 2, 3 ...', '', 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571212132_conga.jpg', NULL, NULL),
(4, 'Bánh kem Noel', '', 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1530011946_banhkem2tangbanhkemnhieutangbanh.jpg', NULL, NULL),
(5, 'Bánh sinh nhật in ảnh', '', 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571213018_banhsinhnhatcongty.jpg', NULL, NULL),
(6, 'Bánh sinh nhật mô hình', '', 'https://thegioibanhkem.com.vn/profiles/thegioibanhkemcomvn/uploads/attach/thumbnail/p1571210625_banhcaytien.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level_user` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`, `level_user`) VALUES
(1, 'nvt', 'nvt@gmail.com', '123457', '0988162476', 'hcm', NULL, NULL, NULL, 1),
(2, 'thai', 'admin', '123456', NULL, '', NULL, NULL, NULL, 2),
(3, 'admin', 'balabale', '12345', NULL, '', NULL, NULL, NULL, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
