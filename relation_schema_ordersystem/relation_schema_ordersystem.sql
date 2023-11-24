CREATE TABLE `members` (
  `MemberID` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `MemberPW` int(11) NOT NULL,
  `MemberName` varchar(255) NOT NULL,
  `MemberBirth` date NOT NULL,
  `MemberRole` ENUM ('user', 'admin', 'seller') NOT NULL DEFAULT "user"
);

CREATE TABLE `items` (
  `ItemID` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(255) NOT NULL,
  `ItemMadeIN` varchar(255) NOT NULL,
  `ItemPrice` decimal(10,2) NOT NULL,
  `ItemQuantity` int(11) NOT NULL,
  `SellerID` int(11) NOT NULL
);

CREATE TABLE `orders` (
  `OrderID` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `MemberID` int(11) NOT NULL,
  `OrderDate` date NOT NULL
);

CREATE TABLE `orderdetails` (
  `OrderID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`, `ItemID`)
);

CREATE INDEX `MemberID` ON `orders` (`MemberID`);

CREATE INDEX `ItemID` ON `orderdetails` (`ItemID`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`);

ALTER TABLE `orderdetails` ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);

ALTER TABLE `orderdetails` ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`);

ALTER TABLE `items` ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`SellerID`) REFERENCES `members` (`MemberID`);
