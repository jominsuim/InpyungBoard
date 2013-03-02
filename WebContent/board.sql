CREATE TABLE `board` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `subject` varchar(80) NOT NULL,
  `content` text NOT NULL,
  `regdate` varchar(45) NOT NULL,
  `hit` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8