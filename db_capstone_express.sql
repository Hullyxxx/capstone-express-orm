/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `binh_luan` (
  `binh_luan_id` int NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` int NOT NULL,
  `hinh_id` int NOT NULL,
  `ngay_binh_luan` date DEFAULT NULL,
  `noi_dung` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`binh_luan_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  KEY `hinh_id` (`hinh_id`),
  CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hinh_anh` (
  `hinh_id` int NOT NULL AUTO_INCREMENT,
  `ten_hinh` varchar(255) DEFAULT NULL,
  `duong_dan` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `nguoi_dung_id` int DEFAULT NULL,
  PRIMARY KEY (`hinh_id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `luu_anh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nguoi_dung_id` int DEFAULT NULL,
  `hinh_id` int DEFAULT NULL,
  `ngay_luu` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nguoi_dung_id` (`nguoi_dung_id`),
  KEY `hinh_id` (`hinh_id`),
  CONSTRAINT `luu_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung` (`nguoi_dung_id`),
  CONSTRAINT `luu_anh_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh` (`hinh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nguoi_dung` (
  `nguoi_dung_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `mat_khau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ho_ten` varchar(50) NOT NULL,
  `tuoi` int NOT NULL,
  `anh_dai_dien` varchar(255) NOT NULL,
  PRIMARY KEY (`nguoi_dung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(1, 5, 6, NULL, 'Bình luận 1');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(2, 5, 6, NULL, 'Bình luận 2');
INSERT INTO `binh_luan` (`binh_luan_id`, `nguoi_dung_id`, `hinh_id`, `ngay_binh_luan`, `noi_dung`) VALUES
(3, 5, 6, NULL, 'Bình luận 2');

INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(6, '1688437895545_logoAirBNB.png', '1688437895545_logoAirBNB.png', 'Mô tả hình 1', 5);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(7, '1688438081704_logoAirBNB.png', '1688438081704_logoAirBNB.png', 'Mô tả hình 1', 5);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(8, '1688438553997_logoAirBNB.png', '1688438553997_logoAirBNB.png', 'Mô tả hình 1', 5);
INSERT INTO `hinh_anh` (`hinh_id`, `ten_hinh`, `duong_dan`, `mo_ta`, `nguoi_dung_id`) VALUES
(9, '1688438600197_logoAirBNB.png', '1688438600197_logoAirBNB.png', 'Mô tả hình 1', 5),
(10, '1688438624718_logoAirBNB.png', '1688438624718_logoAirBNB.png', 'Mô tả hình 1', 5),
(13, '1688439111432_logoAirBNB.png', '1688439111432_logoAirBNB.png', 'Mô tả hình 1', 5),
(14, '1688439172402_logoAirBNB.png', '1688439172402_logoAirBNB.png', 'Mô tả hình 1', 5),
(15, '1688439179328_logoAirBNB.png', '1688439179328_logoAirBNB.png', 'Mô tả hình 1', 5),
(16, '1688439187098_logoAirBNB.png', '1688439187098_logoAirBNB.png', 'Mô tả hình 1', 5),
(17, '1688439196595_logoAirBNB.png', '1688439196595_logoAirBNB.png', 'Mô tả hình 1', 5),
(18, '1688439279583_logoAirBNB.png', '1688439279583_logoAirBNB.png', 'Mô tả hình 1', 5),
(19, '1688439296198_logoAirBNB.png', '1688439296198_logoAirBNB.png', 'Mô tả hình 1', 5),
(20, '1688439334542_logoAirBNB.png', '1688439334542_logoAirBNB.png', 'Mô tả hình 1', 5),
(21, '1688439575317_logoAirBNB.png', '1688439575317_logoAirBNB.png', 'Mô tả hình 1', 5),
(22, '1688439583952_logoAirBNB.png', '1688439583952_logoAirBNB.png', 'Mô tả hình 1', 5),
(23, '1688439600068_logoAirBNB.png', '1688439600068_logoAirBNB.png', 'Mô tả hình 1', 5),
(24, '1688439802261_logoAirBNB.png', '1688439802261_logoAirBNB.png', 'Mô tả hình 1', 5),
(25, '1688439852329_logoAirBNB.png', '1688439852329_logoAirBNB.png', 'Mô tả hình 1', 5),
(26, '1688439947277_logoAirBNB.png', '1688439947277_logoAirBNB.png', 'Mô tả hình 1', 5),
(27, '1688439986730_logoAirBNB.png', '1688439986730_logoAirBNB.png', 'Mô tả hình 1', 5),
(28, '1688440046349_logoAirBNB.png', '1688440046349_logoAirBNB.png', 'Mô tả hình 1', 5),
(29, '1688440104087_logoAirBNB.png', '1688440104087_logoAirBNB.png', 'Mô tả hình 1', 5),
(30, '1688440133199_logoAirBNB.png', '1688440133199_logoAirBNB.png', 'Mô tả hình 1', 5),
(31, '1688440160947_logoAirBNB.png', '1688440160947_logoAirBNB.png', 'Mô tả hình 1', 5),
(32, '1688440332088_logoAirBNB.png', '1688440332088_logoAirBNB.png', 'Mô tả hình 1', 5),
(33, '1688442035672_logoAirBNB.png', '1688442035672_logoAirBNB.png', 'Mô tả hình 1', 5),
(34, '1688442073286_logoAirBNB.png', '1688442073286_logoAirBNB.png', 'Mô tả hình 1', 5),
(35, '1688442125096_logoAirBNB.png', '1688442125096_logoAirBNB.png', 'Mô tả hình 1', 5),
(36, '1688442158227_logoAirBNB.png', '1688442158227_logoAirBNB.png', 'Mô tả hình 1', 5),
(37, '1688442184973_logoAirBNB.png', '1688442184973_logoAirBNB.png', 'Mô tả hình 1', 5),
(38, '1688442191989_logoAirBNB.png', '1688442191989_logoAirBNB.png', 'Mô tả hình 1', 5),
(39, '1688442201185_logoAirBNB.png', '1688442201185_logoAirBNB.png', 'Mô tả hình 1', 5),
(40, '1688442242705_logoAirBNB.png', '1688442242705_logoAirBNB.png', 'Mô tả hình 1', 5),
(41, '1688442276662_logoAirBNB.png', '1688442276662_logoAirBNB.png', 'Mô tả hình 1', 5),
(42, '1688442284255_logoAirBNB.png', '1688442284255_logoAirBNB.png', 'Mô tả hình 1', 5),
(43, '1688442374304_logoAirBNB.png', '1688442374304_logoAirBNB.png', 'Mô tả hình 1', 5),
(44, '1688442375891_logoAirBNB.png', '1688442375891_logoAirBNB.png', 'Mô tả hình 1', 5),
(45, '1688442389993_logoAirBNB.png', '1688442389993_logoAirBNB.png', 'Mô tả hình 1', 5),
(46, '1688442454033_logoAirBNB.png', '1688442454033_logoAirBNB.png', 'Mô tả hình 1', 5),
(47, '1688442468489_logoAirBNB.png', '1688442468489_logoAirBNB.png', 'Mô tả hình 1', 5),
(48, '1688442495250_logoAirBNB.png', '1688442495250_logoAirBNB.png', 'Mô tả hình 1', 5),
(49, '1688442506540_logoAirBNB.png', '1688442506540_logoAirBNB.png', 'Mô tả hình 1', 5),
(50, '1688442547680_logoAirBNB.png', '1688442547680_logoAirBNB.png', 'Mô tả hình 1', 5);

INSERT INTO `luu_anh` (`id`, `nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(1, 5, 6, '2023-04-07');
INSERT INTO `luu_anh` (`id`, `nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(2, 5, 33, NULL);
INSERT INTO `luu_anh` (`id`, `nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(3, 5, 41, NULL);
INSERT INTO `luu_anh` (`id`, `nguoi_dung_id`, `hinh_id`, `ngay_luu`) VALUES
(4, 5, 45, NULL),
(5, 5, 46, NULL),
(6, 5, 50, NULL);

INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(5, 'phihung4112@gmail.com', '$2a$04$mnAGyxRUJ2ICrQEPjDzOvOljhzcAJGTLPYVkoO3oA3JecDG/J81DW', 'Hung nguyen', 23, '1234344.png');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(6, 'alexander.wong@example.com', '$2a$04$alq980asRKZ0TmU4Ccus/.H7YD.rGZNOQkPvmWWImTgaaluzhnX9W', 'Alexander Wong', 28, 'https://example.com/alexander_wong.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(7, 'hung.wong@example.com', '$2a$04$XjVVhL93zJri21xYXTRjiOiMrg7Od/j4mU7equafKYpot0Vir12sa', 'Alexander Wong', 28, 'https://example.com/alexander_wong.jpg');
INSERT INTO `nguoi_dung` (`nguoi_dung_id`, `email`, `mat_khau`, `ho_ten`, `tuoi`, `anh_dai_dien`) VALUES
(8, 'nguyenvana.wong@example.com', '$2b$04$.fGHNCxTJWPP/7Pt/SYbHOHRypoxs9Rfd/X5kHRMjpI22zPUoZ/Fy', 'Alexander Wong', 28, 'https://example.com/alexander_wong.jpg');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;