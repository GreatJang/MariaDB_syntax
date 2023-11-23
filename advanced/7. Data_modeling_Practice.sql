-- members테이블 MemberID 컬럼 auto_increment 설정
-- ALTER TABLE members MODIFY COLUMN MemberID INT AUTO_INCREMENT;

-- 고객 정보 테이블
CREATE TABLE members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    MemberPW INT NOT NULL,
    MemberName VARCHAR(255) NOT NULL,
    MemberBirth date NOT NULL,
    MemberRole VARCHAR(255) NOT NULL
);
-- MemberRole에 ENUM설정
-- alter table members modify column MemberRole ENUM('user','admin','seller') not null default 'user'

-- 제품 정보 테이블
CREATE TABLE items (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(255) NOT NULL,
    ItemMadeIN VARCHAR(255) NOT NULL,
    ItemPrice DECIMAL(10, 2) NOT NULL
);
-- items테이블에 ItemQuantity 컬럼 추가
-- ALTER TABLE items ADD ItemQuantity INT
-- items테이블에 ItemQuantity 컬럼 NOT NULL 조건 추가
--alter table items modify column ItemQuantity INT not null

-- 주문 정보 테이블
CREATE TABLE orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT REFERENCES members(MemberID),
    OrderDate DATE NOT NULL
);

-- 주문 상세 정보 테이블
CREATE TABLE orderdetails (
    OrderID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrderID, ItemID),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES items(ItemID)
);