
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
    isCorrect BOOLEAN,
    CONSTRAINT fk_question FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
)
;
CREATE TABLE ExamQuestion (
    ExamID INT,
    QuestionID INT,
    CONSTRAINT fk_questionExam FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID),
	CONSTRAINT fk_Exam FOREIGN KEY (ExamID)
        REFERENCES Exam (ExamID)
);

CREATE TABLE product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price DECIMAL(10 , 2 ),
    Decribe TEXT
);

CREATE TABLE sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    SaleName VARCHAR(100),
    ProductID INT,
    SaleDate DATE,
    amount DECIMAL(10 , 2 ),
    CONSTRAINT FK_Product FOREIGN KEY (ProductID)
        REFERENCES Product (ProductID)
);
CREATE TABLE Exam (
    ExamID INT PRIMARY KEY AUTO_INCREMENT,
    Code VARCHAR(100),
    Title VARCHAR(255),
    CategoryID INT,
    Duration DATE,
    CreatorID INT,
    CreateDate DATE,
    CONSTRAINT FK_Category_Exam FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID),
    CONSTRAINT FK_Creator_Exam FOREIGN KEY (CreatorID)
        REFERENCES Account (AccountID)
);

alter table exam 
modify Duration int;
CREATE TABLE Employee_Table (
    Employee_Number INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    Department_Number INT,
    FOREIGN KEY (Department_Number) REFERENCES Department2 (Department_Number)
);

CREATE TABLE Employee_Skill_Table (
    Employee_Number INT,
    Skill_Code VARCHAR(20),
    Date_Registered DATE,
    FOREIGN KEY (Employee_Number) REFERENCES Employee_Table (Employee_Number)
);
									/* Câu 1 : Thêm ít nhất 10 record vào mỗi table */
                                    
-- Chèn dữ liệu vào bảng Department
INSERT INTO Department (DepartmentName) VALUES
    ('Sales'),
    ('Marketing'),
    ('HR'),
    ('Finance'),
    ('IT'),
    ('Customer Services'),
    ('Administration'),
    ('Audit'),
    ('Quality'),
    ('Reseach & Development');

-- Chèn dữ liệu vào bảng Position
INSERT INTO Position (positionName) VALUES
   ('Chairman'),
   ('The board of director'),
   ('Director'),
   ('Deputy director'),
   ('Employee'),
   ('Trainee'),
   ('Manager'),
    ('Supervisor'),
    ('Staff'),
    ('Director');

-- Chèn dữ liệu vào bảng Account
INSERT INTO Account (Email, userName, fullName, DepartmentID, PositionID, createDate) VALUES
    ('user1@example.com', 'user1', 'John Doe', 1, 3, NOW()),
    ('user2@example.com', 'user2', 'Jane Smith', 10, 2, NOW()),
    ('user3@example.com', 'user3', 'Michael Johnson', 1, 1, NOW()),
    ('user4@example.com', 'user4', 'Emily Williams', 3, 10, NOW()),
    ('user5@example.com', 'user5', 'David Brown', 4, 4, NOW()),
     ('user6@example.com', 'user6', 'David Mark', 5, 6, NOW()),
      ('user7@example.com', 'user7', 'Jark Son', 8, 7, NOW()),
       ('user8@example.com', 'user8', 'Xies Kalis', 10, 6, NOW()),
        ('user9@example.com', 'user9', 'Helena Milk', 5, 1, NOW()),
         ('user10@example.com', 'user10', 'Cena Join', 9, 10, NOW());
	-- chèn thêm account ---
    INSERT INTO Account (Email, userName, fullName, DepartmentID, PositionID, createDate) VALUES
    ('user11@example.com', 'user11', 'John Does', 2, 3, NOW()),
    ('user12@example.com', 'user12', 'Jang Smits', 2, 2, NOW()),
    ('user23@example.com', 'user23', 'Michaer Johnsan', 2, 1, NOW()),
    ('user24@example.com', 'user24', 'Amily Williamser', 2, 10, NOW()),
    ('user35@example.com', 'user35', 'Ravid Crown',2, 4, NOW());
 

-- Chèn dữ liệu vào bảng UserGroup
INSERT INTO `Group` (GroupName, CreatorID, CreateDate) VALUES
    ('Group A', 'user1', '2019-12-12'),
    ('Group B', 'user3', '2019-2-12'),
    ('Group C', 'user2', '2020-12-20'),
    ('Group E', 'user5','2019-12-14'),
    ('Group D', 'user6','2021-5-5'),
    ('Group F', 'user7','2022-6-15'),
    ('Group G', 'user8','2023-1-8'),
    ('Group J', 'user9','2019-2-28'),
    ('Group F', 'user10','2022-4-4'),
    ('Group L', 'user4','2023-3-3');
    
    

-- Chèn dữ liệu vào bảng GroupAccount
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES
    (5, 1, '2022-01-01'),
    (5, 2, '2022-02-15'),
    (5, 3, '2020-03-10'),
    (5, 4, '2020-04-20'),
    (5, 5, '2023-05-05'),
    (5, 6, '2023-06-30'),
    (5, 7, '2021-07-12'),
    (5, 8, '2019-08-25'),
    (5, 9, '2019-09-18'),
    (5, 10, '2020-10-22');
  

-- Chèn dữ liệu vào bảng TypeQuestion
INSERT INTO TypeQuestion (TypeName) VALUES
    ('Essay'),
    ('Multipe-Choice');

-- Chèn dữ liệu vào bảng CategoryQuestion
INSERT INTO CategoryQuestion (CategoryName) VALUES
   ('Java'),
   ('MySql'),
   ('C#'),
   ('C++'),
   ('.Net'),
   ('Ruby'),
   ('PHP'),
   ('CSS'),
   ('Javascript'),
   ('Reactjs');
-- Chèn dữ liệu vào bảng Question
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES
    ('Java là gì', 1, 2, 1, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY)),
    ('Tạo 1 table có tên là order trong mysql có được không', 2, 1, 2, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY)),
    ('Abstract class có hỗ trợ đa kế thừa không', 1, 2, 3, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY)),
    ('Margin trong dùng để làm gì', 8, 2, 2, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY)),
    ('Class là gì', 1, 2, 4, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY)),
    ('Object là gì', 1, 2, 5, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY)),
    ('Constructor là gì', 1, 2, 6, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY)),
    ('Trong java có bao nhiêu acces modifier', 1, 1, 8, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY));
    ----------- Chèn thêm Question-------------
    INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES
     ('Câu hỏi về C# : C# là gì', 3, 1, 5, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY)),
     ('Câu hỏi về javascript : Tại sao nên học javascript', 9, 1, 2, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY));
    

-- Chèn dữ liệu vào bảng Answer
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES
    ('có thể tạo table có tên là order trong mysql', 2, 0),
    ('Trong java Abstract class không hỗ trợ đa kế thừa', 3, 1),
    ('Java là ngôn ngữ lập trình hướng đối tượng', 1, 1),
    ('Class là  nơi để lưu trữ code java', 5, 0),
    ('Trong java có 4 access modifier', 8, 1),
    ('Trong java có 4 access modifier', 8, 1),
    ('Trong java có 4 access modifier', 8, 1),
    ('Trong java có 4 access modifier', 8, 1),
    ('Constructor được gọi khi tạo 1 object của class', 7, 1);


-- insert data to exam
insert into exam (Code, title, CategoryID, Duration, creatorID, CreateDate) values
	('Java38','Trắc nghiệm', 1, 90, 3, '2019-12-15'),
    ('MySQL38','Trắc nghiệm', 2, 70, 5, '2019-12-14'),
    ('C#','Thực hành trên máy tính', 3, 60, 1, '2023-1-5'),
    ('Javascript38','Làm giấy', 6, 50, 4, '2022-2-23'),
   ('Java38','Trắc nghiệm', 1, 90, 3, '2021-12-15'),
    ('Javascript38','Làm giấy', 6, 60, 4, '2022-2-23'),
    ('Java38','Trắc nghiệm', 1, 90, 3, '2020-12-15'),
    ('Javascript38','Làm giấy', 6, 60, 4, '2022-2-23'),
    ('Java38','Tự luận', 1, 90, 3, '2023-12-15'),
    ('CSS','Thực hành ', 8 , 30, 8, '2023-2-6');

-- Chèn dữ liệu vào bảng ExamQuestion
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 2),
    (5, 1),
    (6, 1),
    (7, 3),
    (8, 2),
    (9, 3),
    (10,1);

-- Chèn dữ liệu vào bảng Product
INSERT INTO Product (ProductName, Price, Description) VALUES
    ('Product A', 100.50, 'Description for Product A'),
    ('Product B', 75.25, 'Description for Product B'),
    ('Product C', 200.00, 'Description for Product C'),
    ('Product D', 50.75, 'Description for Product D'),
    ('Product E', 150.00, 'Description for Product E');
    
									/* Câu 2 : lấy ra tất cả các phòng ban */
SELECT 
    *
FROM
    department;

									/* Câu 3 : lấy ra id của phòng ban "Sale"*/
SELECT 
    DepartmentID, DepartmentName
FROM
    department
WHERE
    DepartmentName LIKE 'sales';

									/* Câu 4 : lấy ra thông tin account có full name dài nhất */

SELECT 
    AccountID,
    Email,
    userName,
    fullName,
    DepartmentID,
    PositionID,
    createDate
FROM
    account
ORDER BY LENGTH(fullname) DESC;
									/* Câu 5 : Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3 */

SELECT 
    AccountID,
    Email,
    userName,
    fullName,
    DepartmentID,
    PositionID,
    createDate
FROM
    account
WHERE
    DepartmentID = 3
ORDER BY LENGTH(fullname) DESC;

									/* Câu 6 : Lấy ra tên group đã tham gia trước ngày 20/12/2019 */
SELECT 
    *
FROM
    `group`;
SELECT 
    groupID, GroupName, CreatorID, CreateDate
FROM
    `group`
WHERE
    CreateDate <= '2019-12-20';

									/* Câu 7 : Lấy ra ID của question có >= 4 câu trả lời */

SELECT 
    MIN(content) AS AnswerContent,
    QuestionID,
    COUNT(*) AS AmountQuestionID
FROM
    answer
GROUP BY QuestionID
HAVING COUNT(*) >= 4
LIMIT 0 , 100;

									/* Câu 8 : Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 */

SELECT 
    Code, Title, CategoryID, Duration, CreateDate
FROM
    exam
WHERE
    Duration >= 60
        AND CreateDate <= '2019-12-20';

									/* Câu 9 : Lấy ra 5 group được tạo gần đây nhất */

SELECT 
    GroupID, GroupName, creatorID, createDate
FROM
    `group`
ORDER BY createdate DESC
LIMIT 5;

									/* Câu 10 : Đếm số nhân viên thuộc department có id = 2 */
SELECT 
    COUNT(*) AS AmountEmployee
FROM
    account
WHERE
    DepartmentID = 2;

									/* Câu 11 : Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" */

SELECT 
    fullName
FROM
    account
WHERE
    fullName LIKE 'D%o';

									/* Câu 12 : Xóa tất cả các exam được tạo trước ngày 20/12/2019 */
DELETE FROM exam 
WHERE
    CreateDate < '2019-12-20' AND examID > 0;

									/* Câu 13 :  Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" */
DELETE FROM Question 
WHERE
    content LIKE 'Câu hỏi%'
    AND QuestionID > 0;

									/* Câu 14 : Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
											email thành loc.nguyenba@vti.com.vn */

UPDATE account 
SET 
    fullname = 'Nguyễn Bá Lộc ',
    email = 'loc.nguyenba@vti.com.vn'
WHERE
    accountID = 5;

									/* Câu 15 : update account có id = 5 sẽ thuộc group có id = 4 */

UPDATE groupaccount 
SET 
    GroupID = 4
WHERE
    accountID = 5;