drop database if exists servletex;

create database servletex;

use servletex;


DROP TABLE IF EXISTS `t_member`;

CREATE TABLE `t_member` (
  `id` varchar(10) NOT NULL,
  `pwd` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `joinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);


insert into t_member VALUES 
('admin','0000','관리자','admin@test.com','2021-10-24 11:57:30'),
('hong','1212','홍길동','hong@gmail.com','2021-10-04 00:08:20'),
('kim','1212','김유신','kim@jweb.com','2021-10-04 00:09:00'),
('lee','1212','이순신','lee@test.com','2021-10-04 00:08:43'),
('yoon','1114','윤상현','yoon92_kr@naver.com','2021-10-06 01:03:42');


DROP TABLE IF EXISTS `t_board`;

CREATE TABLE `t_board` (
  `articleNO` int(11) NOT NULL,
  `parentNO` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `imageFileName` varchar(100) DEFAULT NULL,
  `writeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(10) NOT NULL,
  `matchNO` varchar(45) NOT NULL,
  PRIMARY KEY (`articleNO`),
  KEY `id_idx` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `t_member` (`id`)
) ;


DROP TABLE IF EXISTS `t_imagefile`;

CREATE TABLE `t_imagefile` (
  `imageFileNO` int(11) NOT NULL,
  `imageFileName` varchar(50) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `articleNO` int(11) NOT NULL,
  PRIMARY KEY (`imageFileNO`),
  KEY `articleNO_idx` (`articleNO`),
  CONSTRAINT `articleNO` FOREIGN KEY (`articleNO`) REFERENCES `t_board` (`articleno`)
) ;