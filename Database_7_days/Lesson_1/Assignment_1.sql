
drop database if exists Testing_System_Assignment_1;
create database Testing_System_Assignment_1;
use Testing_System_Assignment_1;


CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Position (
    PositionID INT PRIMARY KEY AUTO_INCREMENT,
    positionName VARCHAR(100)
)
;

CREATE TABLE Account (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(100),
    userName VARCHAR(100),
    fullName VARCHAR(100),
    DepartmentID INT,
    PositionID INT,
    createDate DATETIME,
    CONSTRAINT FK_Deparment FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID),
    CONSTRAINT FK_Position FOREIGN KEY (PositionID)
        REFERENCES `Position` (PositionID)
)
;
CREATE TABLE `Group` (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(100),
    CreatorID VARCHAR(10),
    CreateDate DATE
);
drop table if exists GroupAccount;
CREATE TABLE GroupAccount (
    GroupID INT,
    AccountID INT,
    JoinDate DATE,
    CONSTRAINT FK_Account FOREIGN KEY (AccountID)
        REFERENCES Account (AccountID)
);

CREATE TABLE TypeQuestion (
    TypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName ENUM('Essay', 'Multipe-Choice')
)
;
CREATE TABLE CategoryQuestion (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100)
);
CREATE TABLE Question (
    QuestionID INT PRIMARY KEY AUTO_INCREMENT,
    Content TEXT,
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE,
    CONSTRAINT FK_Category FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID),
    CONSTRAINT FK_Type FOREIGN KEY (TypeID)
        REFERENCES TypeQuestion (TypeID)
);
CREATE TABLE Answer (
    AnswerID INT PRIMARY KEY AUTO_INCREMENT,
    Content TEXT,
    QuestionID INT,
    isCorrect Boolean,
    CONSTRAINT fk_question FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
)
;
CREATE TABLE ExamQuestion (
    ExamID INT,
    QuestionID INT,
    CONSTRAINT fk_questionExam FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
);

CREATE TABLE product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price DECIMAL(10 , 2 ),
    Decribe TEXT
);

create table sales 
(
	SaleID int primary key auto_increment,
    SaleName varchar(100),
    ProductID int,
    SaleDate date,
    amount decimal(10,2),
    constraint FK_Product foreign key (ProductID)
    references Product(ProductID)
)


