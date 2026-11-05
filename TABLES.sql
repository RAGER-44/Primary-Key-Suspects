CREATE TABLE `artists` (
  `Artist_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Nationailty` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Artist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ciCREATE TABLE `artworks` (
  `Artwork_ID` int NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Medium` varchar(50) DEFAULT NULL,
  `Year_Created` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Artist_ID` int DEFAULT NULL,
  `Exhibition_ID` int DEFAULT NULL,
  PRIMARY KEY (`Artwork_ID`),
  KEY `Artist_ID` (`Artist_ID`),
  KEY `Exhibition_ID` (`Exhibition_ID`),
  CONSTRAINT `artworks_ibfk_1` FOREIGN KEY (`Artist_ID`) REFERENCES `artists` (`Artist_ID`),
  CONSTRAINT `artworks_ibfk_2` FOREIGN KEY (`Exhibition_ID`) REFERENCES `exhibitions` (`Exhibition_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ciCREATE TABLE `customers` (
  `Customer_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ciCREATE TABLE `exhibitions` (
  `Exhibition_ID` int NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Exhibition_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci