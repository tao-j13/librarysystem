start transaction;
create database library;
use library;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL primary key,
  `password` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `admin` (`admin_id`, `password`) VALUES (123, '123');
CREATE TABLE `book_info` (
  `book_id` bigint(20) NOT NULL primary key auto_increment,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publish` varchar(30) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `introduction` text,
  `language` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `pubdate` date DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `pressmark` int(11) DEFAULT NULL,
  `state` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `class_info` (
  `class_id` int(11) NOT NULL primary key,
  `class_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `class_info` (`class_id`, `class_name`) VALUES
(1, '马克思主义'),
(2, '哲学'),
(3, '社会科学总论'),
(4, '政治法律'),
(5, '军事'),
(6, '经济'),
(7, '文化'),
(8, '语言'),
(9, '文学'),
(10, '艺术'),
(11, '历史地理'),
(12, '自然科学总论'),
(13, ' 数理科学和化学'),
(14, '天文学、地球科学'),
(15, '生物科学'),
(16, '医药、卫生'),
(17, '农业科学'),
(18, '工业技术'),
(19, '交通运输'),
(20, '航空、航天'),
(21, '环境科学'),
(22, '综合');
CREATE TABLE `lend_list` (
  `sernum` bigint(20) NOT NULL primary key auto_increment,
  `book_id` bigint(20) NOT NULL,
  `reader_id` int(11) NOT NULL,
  `lend_date` date DEFAULT NULL,
  `back_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lend_list`
--

INSERT INTO `lend_list` (`sernum`, `book_id`, `reader_id`, `lend_date`, `back_date`) VALUES
(2015040139, 10000001, 1501014101, '2017-03-15', '2017-06-16'),
(2015040140, 10000003, 1501014101, '2017-06-10', '2017-09-02'),
(2015040141, 10000006, 1501014101, '2017-06-12', '2017-09-02'),
(2015040142, 10000012, 1501014101, '2017-03-15', '2017-09-03'),
(2015040143, 10000005, 1501014103, '2017-06-15', NULL),
(2015040144, 10000010, 1501014104, '2017-06-15', NULL),
(2015040145, 10000001, 1501014101, '2017-09-02', '2017-09-02');

-- --------------------------------------------------------

--
-- 表的结构 `reader_card`
--

CREATE TABLE `reader_card` (
  `reader_id` int(11) primary key NOT NULL,
  `name` varchar(16) NOT NULL,
  `passwd` varchar(15) NOT NULL DEFAULT '111111',
  `card_state` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reader_card`
--

INSERT INTO `reader_card` (`reader_id`, `name`, `passwd`, `card_state`) VALUES
(1501014101, '张华', '111111', 1),
(1501014102, '王小伟', '111111', 1),
(1501014103, '王莞尔', '111111', 1),
(1501014104, '张明华', '111111', 1),
(1501014105, '李一琛', '111111', 1),
(1501014106, '李二飞', '111111', 1);

-- --------------------------------------------------------

--
-- 表的结构 `reader_info`
--

CREATE TABLE `reader_info` (
  `reader_id` int(11) primary key NOT NULL,
  `name` varchar(16) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `telcode` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reader_info`
--

INSERT INTO `reader_info` (`reader_id`, `name`, `sex`, `birth`, `address`, `telcode`) VALUES
(1501014101, '张华', '男', '1995-06-10', '天津市', '12345678900'),
(1501014102, '王小伟', '男', '1996-02-01', '北京市', '12345678909'),
(1501014103, '王莞尔', '女', '1995-04-15', '浙江省杭州市', '12345678908'),
(1501014104, '张明华', '男', '1996-08-29', '陕西省西安市', '12345678907'),
(1501014105, '李一琛', '男', '1996-01-01', '陕西省西安市', '15123659875'),
(1501014106, '李二飞', '男', '1996-05-03', '山东省青岛市', '15369874123');
commit;