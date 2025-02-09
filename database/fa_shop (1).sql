-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 19, 2022 lúc 11:52 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fa_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `username` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `password` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'mật khẩu',
  `account_type` bit(1) NOT NULL DEFAULT b'0' COMMENT 'loại tài khoản(0-người dùng, 1-admin)',
  `fullname` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'họ tên',
  `current_address` text COLLATE utf8_bin NOT NULL COMMENT 'chỗ ở hiện tại',
  `email` varchar(50) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'email',
  `phone_number` varchar(10) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'số điện thoại',
  `shipping_address` text COLLATE utf8_bin NOT NULL COMMENT 'địa chỉ nhận hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`username`, `password`, `account_type`, `fullname`, `current_address`, `email`, `phone_number`, `shipping_address`) VALUES
('AliceMr', '123Alice', b'0', 'AliceHan', '46-Phan Đình Phùng-Phạm Kim Đồng-Đà Lạt', 'Alice1111@gmail.com', '0563238915', '46-Phan Đình Phùng-Phạm Kim Đồng-Đà Lạt'),
('Henlee', '123Henlee', b'0', 'Helenka', '02-Định Văn Của-Xuân Vinh-Rạch Giá', 'Henlee123@gmail.com', '0834554432', 'KBang-Chư Pưng-Gia Lai'),
('JamesJon', '123James', b'0', 'Jon Văn James', '61-Lý Thái Tổ-Xuân Diệu-Quy Nhơn', 'James222@gmail.com', '0905232261', '61-Lý Thái Tổ-Xuân Diệu-Quy Nhơn'),
('ThompsonRobert', '123Robert', b'0', ' Robert Thompson', ' Phụng Hoài Hảo-Hoài Nhơn-Bình Định', ' RobertThompson000@gmail.com', '0394778001', '53-Nguyễn Đình Thụ-Nguyễn Văn Cừ-Hồ Chí Minh'),
('admin', '123admin', b'1', 'Nguyễn Văn Admin', '77-Nguyễn Huệ-Quang Trung-Bình Định-\r\nFashion-shop', 'admin123@gmail.com', '0920392389', ''),
('johnweak', 'doggo123', b'0', 'John Wick', '123 Wall Sred, New York', 'johnweak@gg.com', '0398166111', '123 Chợ đầu mối');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `username` varchar(20) COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `size` varchar(3) COLLATE ascii_bin NOT NULL COMMENT 'size',
  `quantity` int(11) NOT NULL COMMENT 'số lượng'
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `cate_id` tinyint(4) NOT NULL COMMENT 'mã danh mục',
  `cate_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'tên danh mục',
  `parent_cate_id` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'mã danh mục cha'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`cate_id`, `cate_name`, `parent_cate_id`) VALUES
(1, 'Nữ', 0),
(2, 'Hàng mới về', 1),
(3, 'Deal hot giảm 20%', 1),
(4, 'Áo', 1),
(5, 'Áo sơ mi', 4),
(6, 'Áo thun', 4),
(7, 'Áo croptop', 4),
(8, 'Chân váy', 1),
(9, 'Chân váy xếp li', 8),
(10, 'Chân váy chữ A', 8),
(11, 'Đầm', 1),
(12, 'Đầm maxi/voan', 11),
(13, 'Đầm thun', 11),
(14, 'Nam', 0),
(15, 'Hàng mới về', 14),
(16, 'Deal Hot giảm 10%', 14),
(17, 'Áo', 14),
(18, 'Áo sơ mi', 17),
(19, 'Áo thun', 17),
(20, 'Áo polo', 17),
(21, 'Quần', 14),
(22, 'Quần short', 21),
(23, 'Quần kaki', 21),
(24, 'Quần Jean', 21),
(25, 'Trẻ em', 0),
(26, 'Bé gái', 25),
(27, 'Áo bé gái', 26),
(28, 'Quần bé gái', 26),
(29, 'Váy bé gái', 26),
(30, 'Bé trai', 25),
(31, 'Áo bé trai', 30),
(32, 'Quần bé trai', 30),
(33, 'Sale ', 0),
(34, 'Sale 10%', 33),
(35, 'Sale 20%', 33),
(36, 'Thông tin', 0),
(37, 'Giới thiệu về 6AESN', 36),
(38, 'Chính sách hoàn trả', 36);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `description`
--

CREATE TABLE `description` (
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `introduction` text COLLATE utf8mb4_bin NOT NULL COMMENT 'giới thiệu',
  `detail` text COLLATE utf8mb4_bin NOT NULL COMMENT 'chi tiết',
  `maintenance` text COLLATE utf8mb4_bin NOT NULL COMMENT 'bảo quản'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `description`
--

INSERT INTO `description` (`prod_id`, `introduction`, `detail`, `maintenance`) VALUES
(1, '<p>Sơ mi nam tay ngắn. Trên nền vải denim được đánh bạc màu giả. Phía trước có túi ngực. Ống tay gập gấu khoảng 2-3cm. Khuy cài cùng màu với nền vải.</p>\r\n<p>Thiết kế sơ mi denim mang đến vẻ năng động và trẻ trung. Sắc đen ngả bạc giúp vẻ ngoài của các chàng trai thêm phần phong trần, mạnh mẽ. Thiết kế chú trọng vào \r\ntính cơ bản nên phù hợp để chàng diện vào nhiều dịp khác nhau.</p>', 'Cổ Áo: cổ đức<br>Tay Áo: tay cộc<br>Kiểu Áo: Regular fit<br>Độ dài: dài thường<br>Họa Tiết: trơn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(2, '<p>Áo sơ mi cổ đức, tay ngắn. Cài bằng hàng khuy phía trước. Dáng regular kết hợp với chất liệu lụa cao cấp giúp bạn mặc thoải mái và dễ chịu. MIx cùng quần jeans màu đen, sooc để có set đồ ăn ý nhất nhé!</p>', 'Cổ Áo: khác<br>Tay Áo: tay ngắn<br>Kiểu Áo: Regular<br>Độ dài: dài thường<br>Họa Tiết: in hình', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(3, '<p>Áo sơ mi dáng slim fit với cổ đức và ống tay dài. Họa tiết kẻ mờ. Độ dài vừa phải. Có viền ngoài để giấu khuy cài.</p>\r\n<p>Những chiếc áo sơ mi kẻ luôn được lòng các quý ông công sở. Thiết kế chú trọng đến sự tối giản sẽ tôn lên vẻ ngoài phong độ, chỉn chu của người mặc. Dáng slim fit ôm nhẹ phù hợp để bạn mặc khi diện vest và quần Âu.', 'Cổ Áo: cổ đức<br>Tay Áo: tay dài<br>Kiểu Áo: Slim fit<br>Độ dài: dài thường<br>Họa Tiết: kẻ', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(4, '<p>Áo sơ mi cổ đức phối màu hình tam giác. Tay dài bo gấu và 2 khuy cài đính kèm. Vạt áo hình phía trước. Cài bằng hàng khuy ẩn tà phía trước.</p>\r\n<p>Kiểu dáng Slim fit thiết kế form ôm nhẹ, tôn đường nét của cơ thể. Tông màu lịch lãm, dễ phối nhiều trang phục như quần jean, short, quần tây... Áo có thể sơ vin hoặc thả suông nhờ tà lượn thời trang.</p>', 'Cổ Áo: cổ đức<br>Tay Áo: tay dài<br>Kiểu Áo: Slim fit<br>Độ dài: dài thường, Oversize<br>Họa Tiết: trơn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(5, '<p>Áo sơ mi cổ đức. Tay dài bo gấu và 2 khuy cài đính kèm. 1 túi vuông trước ngực. Cài bằng hàng khuy phía trước. Vải họa tiết tinh tế.</p>\r\n<p>Kiểu dáng Slim fit thiết kế form ôm nhẹ, tôn đường nét của cơ thể. Tông màu lịch lãm, dễ phối nhiều trang phục như quần jean, short, quần tây... Áo có thể sơ vin hoặc thả suông nhờ tà lượn thời trang.</p>', 'Cổ Áo: cổ đức<br>Tay Áo: tay dài<br>Kiểu Áo: Slim fit<br>Độ dài: dài thường<br>Họa Tiết: khác', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(6, '<p>Zuýp chữ A 2 lớp dáng trên gối. Có 1 móc kim loại tạo kiểu phía trước. 2 viền túi giả 2 bên. Cài bằng khóa ẩn sau lưng.</p>\r\n<p>gợi ý cho bạn cứ mix theo combo ton-sur-ton với áo vest đồng bộ MS 67M7076 sẽ có vẻ ngoài trông thật sành điệu, tự tin ghi điểm tuyệt đối trong mắt người đối diện. Muốn làm mới phong cách thời trang công sở của mình, nhất định phải có ít nhất một kiểu chân váy như thế này trong tủ đồ của mình nhé!</p>', 'Kiểu dáng: chữ A<br>Độ dài: trên gối<br>Chất liệu: Tuysi', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(7, '<p>Zuýp chữ A 2 lớp. Mặt trước dưới gấu thêu chữ và đính hoa nổi khác màu tạo nổi bật. Cài bằng khóa kéo ẩn sau lưng.</p>\r\n<p>Với chiều dài trên gối cùng chất liệu Tuysi cao cấp giúp nàng trở nên trẻ trung và năng động hơn. Mix cùng áo blazer, áo sơ mi kiểu, áo thun basic là bạn có thể tự tin bước ra ngoài rồi!</p>', 'Kiểu dáng: chữ A<br>Độ dài: trên gối<br>Họa tiết: trơn<br>Chất liệu: Tuysi', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(8, '<p>Zuýp chữ A  2 lớp. Mặt trước có hàng khuy bọc vải kiểu chéo trang trí. Xẻ tạo kiểu dưới gấu. </p>\r\n<p>Chất liệu Tuysi không quá dày cũng không quá mỏng tạo form dáng cứng cáp, không xù lông đặc biệt không nhăn, dễ dàng tạo sự thoải mái, không gò bó và mang đến nét đẹp năng động, trẻ trung cho người mặc. Chân váy chữ A công sở cũng ghi điểm nhờ sự “thân thiện” có thể kết hợp cùng áo sơ mi, áo thun… đầy ấn tượng.</p>', 'Kiểu dáng: chữ A<br>Độ dài: trên gối<br>Họa tiết: trơn<br>Chất liệu: Tuysi', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(9, '<p>Zuýp chữ A 2 lớp cạp có đai liền và đỉa ở giữa. Phom chữ A basic. Trang trí bằng các đường chần chỉ nổi màu trắng tạo điểm nhấn.</p>\r\n<p>Sử dụng chất vải Tuysi  bên trong có lớp lót dính liền tạo cho nàng cảm giác thoải mái khi diện thiết kế này. Dáng chữ A dễ phối hợp với nhiều kiểu áo, và phụ kiện giúp nàng trở nên năng động và tự tin hơn.</p>', 'Kiểu dáng: chữ A<br>Độ dài: trên gối<br>Họa tiết: trơn<br>Chất liệu: Tuysi', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(10, '<p>Zuýp chữ A dáng dài ngang bắp. Cạp cao. Mặt trước trang trí hàng khuy làm điểm nhấn. Cài bằng khóa kéo ẩn phía sau. Có thể mix cùng áo croptop đồng bộ.</p>\r\n<p>Chất liệu vải Thô xước mang lại cảm giác thoáng mát, thoải mái cho người mặc bởi khả năng hút ẩm cao, thấm hút tốt.</p>', 'Kiểu dáng: chữ A<br>Độ dài: ngang bắp<br>Họa tiết: trơn<br>Chất liệu: thô', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(11, 'Áo phông chất thun, dáng Regular, độ dài thoải mái. Tay cộc, cổ tròn. Phía trước in lệch chữ Symphony. Phía sau in hình thiên nhiên khổ lớn.\r\nMột mẫu áo năng động, phối hình in sáng màu phù hợp cho chàng trẻ trung. Thiết kế có độ rộng thoải mái, cover tốt những khuyết điểm mà người mặc chưa tự tin.\r\nMàu sắc: Ghi khói - Đen', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Khác\r\nTay áo: Tay cộc\r\nKiểu dáng: Regular\r\nĐộ dài: Dài thường\r\nHọa tiết: In hình\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(12, 'Áo thun dáng Regular, độ dài vừa phải, tay cộc, cổ tròn. Phía trước in hình và chữ bắt mắt, trẻ trung.\r\nĐây là một chiếc áo thun cơ bản, năng động dành cho các chàng trai mùa hè. Gam đen dễ phối được kết hợp cùng hình in sáng màu trẻ trung. Dáng Regular vừa vặn giúp người mặc trông gọn gàng hơn.\r\nMàu sắc: Đen', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Khác\r\nTay áo: Tay cộc\r\nKiểu dáng: Regular\r\nĐộ dài: Dài thường\r\nHọa tiết: In hình\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(13, 'Áo phông chất thun trơn, tay ngắn, cổ tròn. Độ dài thoải mái. Phía trước có hình in phong cách Tropical phối cùng chữ.\r\nMột thiết kế tràn ngập hơi thở mùa hè dành cho những chàng trai hiện đại. Gam màu tươi sáng hứa hẹn sẽ giúp sáng bừng diện mạo của người mặc. Độ dài thoải mái phù hợp cho những chàng thích mặc rộng rãi. Chất thun mềm mại và thấm hút mồ hôi tốt.\r\nMàu sắc: Trắng - Nâu cà phê', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ tròn\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(14, 'Áo thun dáng cơ bản, ôm nhẹ nhưng không bó, có động rộng nhất định. Tay ngắn, cổ tròn. Phía trước được in một dòng trích dẫn từ NTK của IVY men.\r\nNhững chiếc áo phông cơ bản rất được lòng chàng khi mùa hè đến. Một chiếc áo trơn in quote vừa đảm bảo phù hợp để phối cùng mọi set đồ lại vừa năng động, trẻ trung. Với những phiên bản của mẫu áo này, chàng có thể thoải mái mix-match theo nhiều phong cách khác nhau.\r\nMàu sắc: Trắng - Đen - Nude - Xanh oliu - Xanh cổ vịt nhạt', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ tròn\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(15, 'Áo thun cổ tròn, tay ngắn, độ dài vừa phải. Phía trước được thêu chữ Sustainable cách điệu.\r\nChất liệu thun đặc trưng của IVY moda luôn đảm bảo người mặc sẽ cảm thấy thoải mái và dễ chịu nhất suốt cả ngày hè dài. Chữ thêu đơn giản phía trước giúp tổng thể trẻ trung và năng động hơn. Bạn có thể phối áo thun cùng quần jean hay quần vải đều phù hợp,\r\nMàu sắc: Cam - Xanh tím than', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ tròn\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(16, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nForm áo Regular viền chun co giãn ở tay áo giúp người mặc trở nên khỏe khoắn và năng động hơn. Phần cổ áo được may bằng thun co giãn với 3 khuy cài, viền tay bằng vải từ thân áo tạo nên thiết kế mới mẻ, trẻ trung và đầy sức sống.\r\nMàu sắc: Xanh Nước Biển - Trắng', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ bo\r\nTay áo: Tay ngắn\r\nKiểu dáng: Regular\r\nĐộ dài: Dài thường\r\nHọa tiết: Khác\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(17, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nForm áo Regular Fit viền chun co giãn ở tay áo giúp người mặc trở nên khỏe khoắn và năng động hơn. Phần cổ áo được may bằng thun co giãn với 2 khuy cài, viền tay bằng vải từ thân áo tạo nên thiết kế mới mẻ, trẻ trung và đầy sức sống.\r\nMàu sắc: Xanh Nước Biển - Trắng', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ đức\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(18, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nForm áo Regular Fit viền chun co giãn ở tay áo giúp người mặc trở nên khỏe khoắn và năng động hơn. Phần cổ áo được may bằng vải từ thân áo với 3 khuy cài tạo nên thiết kế mới mẻ, trẻ trung và đầy sức sống.\r\nMàu sắc: Kẻ Xanh Dương', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ bo\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Kẻ\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(19, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nPhần tay áo được bo viền cùng phần cổ áo được may bằng vải từ thân áo với 3 khuy kết hợp với đường kẻ ngang tạo nên thiết kế mới mẻ, trẻ trung và đầy sức sống.\r\nMàu sắc: Kẻ Đen - Kẻ Trắng', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ pyjama\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Kẻ\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(20, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nForm áo Regular Fit, thiết kế trở nên đắt giá khi được bo chun co giãn 100% ở cổ, gấu xẻ 2 bên. Các đường kẻ và phối nhiều màu sắc trở nên bắt mắt và hợp xu hướng.\r\nMàu sắc: Kẻ Trắng', 'Nhóm sản phẩm: Áo\r\nCổ áo: Cổ bo\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Kẻ\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(21, 'Quần sooc ngang gối dáng Regular. Có 2 túi chéo, 2 túi vuông có nắp bên ống quần. Có dây kéo rút, cạp chun co giãn.\r\nDễ dàng kết hợp cùng nhiều trang phục như áo thun, sơ mi,... mát mẻ. Gam màu lạ mắt trẻ trung dễ dàng phối với nhiều trang phục. Thiết kế thời trang, mang lại vẻ năng động và trẻ trung\r\nMàu sắc: Đen - Gold', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Regular\r\nĐộ dài: Ngang đùi\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(22, 'Quần lửng khaki cạp chun co giãn có dây kéo rút. 2 túi chéo và 2 túi vuông có nắp phía sau. Thiết kế ấn tượng nhưng không kém phần ấn tượng cho nam giới diện mạo cuốn hút. Màu sắc cơ bản, độ dài ngang gối, có thể linh hoạt phối hợp với nhiều trang phục khác nhau.\r\nMàu sắc: Ghi Khói - Xanh Lơ', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang gối\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(23, 'Quần lửng ngang gối. Có 2 túi phía trước và 2 túi có khuy cài phía sau. Nhấn đường ly cố định 2 bên ống quần. Cài phía trước bằng khóa kéo và khuy.\r\nKhông chỉ là chất vải Khaki thông thường mà còn được phối 50% sợi Tencel giúp thiết kế có độ mềm, mát hơn quần khaki thông thường. Màu sắc cơ bản, độ dài ngang gối, có thể linh hoạt phối hợp với nhiều trang phục khác nhau trong mùa hè.\r\nMàu sắc: Xanh Oliu - Bạc Hà ', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang gối\r\nHọa tiết: Trơn\r\nChất liệu: Khaki, 50% sợi Tencel\r\n', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(24, 'Quần lửng cạp cao có đỉa, khuy cài lệch 1 bên. 2 túi chéo và 2 túi vuông phía sau. Chiều dài ngang gối. Cài bằng dây khóa kéo và khuy\r\nLà chiếc quần lửng nam là must-have-item (món đồ không thể thiếu) của bất cứ quý ông nào. Sử dụng chất vải thô cotton họa tiết kẻ với độ thông thoáng, thoải mái phù hợp với tất cả các mùa, đặc biệt là mùa hè với tính ứng dụng cao trong đời sống hàng ngày. Đây cũng là chiếc quần tương đối dễ phối nên cánh màu râu có thể tự tin mix & match.\r\nMàu sắc: Kẻ Xanh Lơ', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang gối\r\nHọa tiết: Kẻ\r\nChất liệu: Thô', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(25, 'Quần lửng cạp cao có đỉa. 2 túi chéo và 2 túi vuông phía sau. Chiều dài ngang gối. Cài bằng dây khóa kéo và khuy\r\nLà chiếc quần lửng nam là must-have-item (món đồ không thể thiếu) của bất cứ quý ông nào. Sử dụng chất vải thô họa tiết kẻ với độ thông thoáng, thoải mái phù hợp với tất cả các mùa, đặc biệt là mùa hè với tính ứng dụng cao trong đời sống hàng ngày. Đây cũng là chiếc quần tương đối dễ phối nên cánh màu râu có thể tự tin mix & match.\r\nMàu sắc: Kẻ Xanh Tím Than', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang gối\r\nHọa tiết: Kẻ\r\nChất liệu: Thô', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(26, 'Quần khaki, có 2 túi có nắp phía giữa ống quần cài khuy. Cài phía trước bằng khóa kéo và khuy, cạp chần chun co giãn có đỉa. Ống quần bó, chần chun.\r\nChất vải khaki ít nhàu, không bai, không xù. Đường may chỉn chu, tinh tế khiến quần rất bền. Không chỉ phổ biến nơi công sở, bạn hoàn toàn có thể biến tấu cho riêng mình bằng cách mix-match cùng sơ mi, áo thun hoặc len mỏng để trở thành chàng trai lịch thiệp trong mọi trường hợp.\r\nMàu sắc: Xanh Tím Than - Đen - Bạc', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(27, 'Quần khaki ống bo chun co giãn kiểu bó, cạp chần chun có dây kéo rút. Có túi phía trước và 2 túi có nắp phía sau.\r\nQuần khaki phom dáng có độ suông nhẹ vừa vặn. Thiết kế basic không kén người mặc. Quần đứng dáng chỉn chu với đường may tỉ mỉ đến từng chi tiết. Có thể sơ vin hoặc không đều phù hợp, dễ kết hợp với nhiều trang phục theo nhiều phong cách khác nhau.\r\nMàu sắc: Gold - Đen', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(28, 'Quần dài khaki cạp có đỉa. 2 túi trước, 2 viền túi có khuy cài phía sau. Cài bằng khóa kéo và khuy.\r\nĐược may từ chất liệu Khaki thiết kế đơn giản nhưng đem đến cho người mặc cảm giác thoải mái dễ chịu. Bạn có thể kết hợp sản phẩm với trang phục, phụ kiện phù hợp để có một diện mạo hợp thời, mang đậm \"Gu\" của riêng mình.\r\nMàu sắc: Gold - Đen - Xanh Tím Than', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Slim\r\nĐộ dài: Qua mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(29, 'Quần dài khaki kiểu dáng Slim, đai quần có đỉa. 2 túi chéo trước, 2 túi sau có khuy cài. Thiết kế tối giản, các chi tiết may tỉ mỉ, tinh tế, mang đến diện mạo chỉn chu, lịch lãm cho người mặc. Cài bằng khóa kéo và khuy cài.\r\nChất liệu Khaki thoáng mát, thấm hút mồ hôi tốt và khả năng giữ bền form dáng sau nhiều lần giặt.\r\nMàu sắc: Đen - Be', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Slim\r\nĐộ dài: Qua mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(30, 'Quần khaki, có 2 túi có nắp phía giữa ống quần cài khuy. Cài phía trước bằng khóa kéo và khuy, có dây kéo rút.\r\nChất vải khaki ít nhàu, không bai, không xù. Đường may chỉn chu, tinh tế khiến quần rất bền. Không chỉ phổ biến nơi công sở, bạn hoàn toàn có thể biến tấu cho riêng mình bằng cách mix-match cùng sơ mi, áo thun hoặc len mỏng để trở thành chàng trai lịch thiệp trong mọi trường hợp.\r\nMàu sắc: Rêu Khói - Xanh Tím Than', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Qua mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `username` varchar(20) COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `size` varchar(3) COLLATE ascii_bin NOT NULL COMMENT 'size',
  `total_value` int(11) NOT NULL COMMENT 'tổng giá',
  `total_quantity` int(11) NOT NULL COMMENT 'tổng số lượng',
  `pay_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngày thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `cate_id` tinyint(4) NOT NULL COMMENT 'mã danh mục',
  `prod_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'tên sản phẩm',
  `price` int(11) NOT NULL COMMENT 'giá',
  `discount` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'giảm giá(%)',
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `date_added` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngày nhập sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`prod_id`, `cate_id`, `prod_name`, `price`, `discount`, `quantity`, `date_added`) VALUES
(1, 5, 'ÁO SƠ MI DENIM', 890000, '10.00', 200, '2022-05-17 13:19:02'),
(2, 5, 'ÁO SƠ MI NAM HỌA TIẾT', 1090000, '20.00', 90, '2022-05-18 11:33:39'),
(3, 5, 'ÁO SƠ MI KẺ MỜ', 1190000, '0.00', 199, '2022-05-18 01:26:14'),
(4, 5, 'ÁO SƠ MI CỔ PHỐI MÀU', 1099000, '10.00', 70, '2022-05-18 01:27:09'),
(5, 5, 'ÁO SƠ MI TAY DÀI TÚI VUÔNG', 990000, '30.00', 30, '2022-05-18 01:32:01'),
(6, 10, 'CHÂN VÁY CHỮ A 2 LỚP', 1090000, '30.00', 120, '2022-05-18 10:35:20'),
(7, 10, 'CHÂN VÁY CHỮ A HOA NỔI', 990000, '0.00', 20, '2022-05-18 11:05:09'),
(8, 10, 'CHÂN VÁY CHỮ A PHỐI NÚT', 790000, '30.00', 50, '2022-05-18 11:09:05'),
(9, 10, 'CHÂN VÁY CHỮ A CHẦN CHỈ NỔI', 890000, '0.00', 110, '2022-05-18 11:12:20'),
(10, 10, 'CHÂN VÁY CHỮ A DÁNG DÀI', 990000, '10.00', 160, '2022-05-18 11:20:59'),
(11, 19, 'ÁO THUN SYMPHONY', 650000, '10.00', 100, '2022-05-19 17:15:51'),
(12, 19, 'ÁO THUN ANTI-HAVEN', 650000, '0.00', 100, '2022-05-18 17:20:53'),
(13, 19, 'ÁO THUN TROPICAL', 650000, '20.00', 100, '2022-05-18 17:21:28'),
(14, 19, 'ÁO THUN IN QUOTE', 650000, '10.00', 100, '2022-05-18 17:21:28'),
(15, 19, 'ÁO THUN SUSTAINABLE', 650000, '10.00', 100, '2022-05-18 17:23:10'),
(16, 20, 'ÁO POLO NAM MÀU ĐEN', 790000, '10.00', 100, '2022-05-18 17:28:27'),
(17, 20, 'ÁO POLO PHỐI KẺ', 790000, '0.00', 100, '2022-05-18 17:28:27'),
(18, 20, 'ÁO POLO NAM VẢI KẺ', 790000, '10.00', 100, '2022-05-18 17:30:08'),
(19, 20, 'ÁO POLO NAM KẺ NGANG', 790000, '10.00', 100, '2022-05-18 17:30:08'),
(20, 20, 'ÁO POLO KẺ DỌC', 790000, '10.00', 100, '2022-05-18 17:30:08'),
(21, 22, 'QUẦN SOOC THUN CẠP DÂY KÉO RÚT', 890000, '10.00', 100, '2022-05-18 17:36:09'),
(22, 22, 'QUẦN LỬNG KHAKI', 890000, '20.00', 100, '2022-05-18 17:36:09'),
(23, 22, 'QUẦN LỬNG VẢI PHỐI SỢI TENCEL', 890000, '10.00', 100, '2022-05-18 17:36:09'),
(24, 22, 'QUẦN LỬNG KẺ KHUY LỆCH', 890000, '10.00', 100, '2022-05-18 17:36:09'),
(25, 22, 'QUẦN LỬNG KẺ', 890000, '10.00', 100, '2022-05-18 17:36:09'),
(26, 23, 'QUẦN TÂY NAM KHAIKI GẤU BO', 1090000, '30.00', 100, '2022-05-18 17:43:36'),
(27, 23, 'QUẦN TÂY NAM KHAKI DÂY KÉO RÚT', 1090000, '30.00', 100, '2022-05-18 17:43:36'),
(28, 23, 'QUẦN TÂY NAM KHAKI DÁNG SLIM', 1090000, '30.00', 100, '2022-05-18 17:43:36'),
(29, 23, 'QUẦN TÂY NAM KHAKI TÚI VIỀN ĐÔI', 1090000, '30.00', 100, '2022-05-18 17:43:36'),
(30, 23, 'QUẦN KHAKI TÚI 2 BÊN', 405000, '10.00', 100, '2022-05-18 17:43:36'),
(31, 24, 'QUẦN KHAKI KHỦNG LONG NHÍ', 790000, '10.00', 100, '2022-05-19 15:38:38'),
(32, 24, 'QUẦN DENIM BO ỐNG', 890000, '10.00', 100, '2022-05-19 15:38:38'),
(33, 24, 'QUẦN LỬNG KHAKI', 950000, '20.00', 100, '2022-05-19 15:38:38'),
(34, 24, 'QUẦN DENIM BO ỐNG', 900000, '10.00', 100, '2022-05-19 15:38:38'),
(35, 24, 'QUẦN JEAN SLIM FIT', 500000, '0.00', 100, '2022-05-19 15:38:38'),
(36, 24, 'QUẦN SOOC REGULAR', 450000, '10.00', 100, '2022-05-19 15:38:38'),
(37, 25, 'ÁO THUN AWESOME', 600000, '0.00', 90, '2022-05-19 15:38:38'),
(38, 25, 'ÁO THUN SƯ TỬ', 300000, '0.00', 100, '2022-05-18 17:43:36'),
(39, 25, 'ÁO THUN SLEEP EAT SKATE', 550000, '0.00', 100, '2022-05-19 15:38:38'),
(40, 25, 'ÁO THUN BÉ TRAI SYMPHONY', 600000, '0.00', 100, '2022-05-19 15:38:38'),
(41, 25, 'ÁO THUN CON VẬT', 600000, '10.00', 100, '2022-05-19 15:38:38'),
(42, 25, 'ÁO SƠ MI TRẮNG CỔ ĐỨC', 600000, '10.00', 100, '2022-05-19 15:38:38'),
(43, 25, 'ÁO THUN NEVER STOP', 300000, '0.00', 100, '2022-05-19 15:38:38'),
(44, 25, 'ÁO THUN SIÊU NHÂN', 600000, '10.00', 100, '2022-05-19 15:38:38'),
(45, 25, 'ÁO THUN HOLOGRAM ', 405000, '10.00', 100, '2022-05-19 15:38:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `s` int(11) NOT NULL DEFAULT 0 COMMENT 'size S',
  `m` int(11) NOT NULL DEFAULT 0 COMMENT 'size M',
  `x` int(11) NOT NULL DEFAULT 0 COMMENT 'size X',
  `l` int(11) NOT NULL DEFAULT 0 COMMENT 'size L',
  `xxl` int(11) NOT NULL DEFAULT 0 COMMENT 'size XXL'
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`prod_id`, `s`, `m`, `x`, `l`, `xxl`) VALUES
(1, 50, 70, 40, 30, 10),
(2, 25, 15, 20, 20, 10),
(3, 80, 50, 40, 10, 19),
(4, 30, 10, 10, 10, 10),
(5, 10, 5, 5, 5, 5),
(6, 20, 30, 40, 10, 20),
(7, 4, 6, 2, 6, 2),
(8, 10, 5, 5, 20, 10),
(9, 40, 20, 40, 5, 5),
(10, 20, 50, 30, 30, 30),
(11, 20, 20, 20, 20, 20),
(12, 20, 20, 20, 20, 20),
(13, 20, 20, 20, 20, 20),
(14, 20, 20, 20, 20, 20),
(15, 20, 20, 20, 20, 20),
(16, 20, 20, 20, 20, 20),
(17, 20, 20, 20, 20, 20),
(18, 20, 20, 20, 20, 20),
(19, 20, 20, 20, 20, 20),
(20, 20, 20, 20, 20, 20),
(21, 20, 20, 20, 20, 20),
(22, 20, 20, 20, 20, 20),
(23, 20, 20, 20, 20, 20),
(24, 20, 20, 20, 20, 20),
(25, 20, 20, 20, 20, 20),
(26, 20, 20, 20, 20, 20),
(27, 20, 20, 20, 20, 20),
(28, 20, 20, 20, 20, 20),
(29, 20, 20, 20, 20, 20),
(30, 20, 20, 20, 20, 20),
(31, 5, 7, 9, 11, 13),
(32, 5, 7, 9, 11, 13),
(33, 5, 7, 9, 11, 13),
(34, 5, 7, 9, 11, 13),
(35, 5, 7, 9, 11, 13),
(36, 5, 7, 9, 11, 13),
(37, 5, 7, 9, 11, 13),
(38, 5, 7, 9, 11, 13),
(39, 5, 7, 9, 11, 13),
(40, 5, 7, 9, 11, 13),
(41, 5, 7, 9, 11, 13),
(42, 5, 7, 9, 11, 13),
(43, 5, 7, 9, 11, 13),
(44, 5, 7, 9, 11, 13),
(45, 5, 7, 9, 11, 13);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `UN_email` (`email`),
  ADD UNIQUE KEY `UN_phone_number` (`phone_number`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD KEY `FK_cart-prodID` (`prod_id`),
  ADD KEY `FK_cart-username` (`username`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Chỉ mục cho bảng `description`
--
ALTER TABLE `description`
  ADD UNIQUE KEY `UN_des-prodID` (`prod_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD KEY `FK_order-username` (`username`),
  ADD KEY `FK_order-prodID` (`prod_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `FK_cate_id` (`cate_id`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD UNIQUE KEY `UN_size-prodID` (`prod_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `cate_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'mã danh mục', AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã sản phẩm', AUTO_INCREMENT=46;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_cart-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`),
  ADD CONSTRAINT `FK_cart-username` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- Các ràng buộc cho bảng `description`
--
ALTER TABLE `description`
  ADD CONSTRAINT `FK_des-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_order-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`),
  ADD CONSTRAINT `FK_order-username` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_cate_id` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
