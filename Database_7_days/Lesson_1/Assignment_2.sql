drop database if exists testing_system_assignment_2;
create database testing_system_assignment_2;
use testing_system_assignment_2;

-- 1. Exercise 1
/* Question 1 */
CREATE TABLE Trainee (
    TraineeID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(100),
    Birth_Date DATE,
    Gender VARCHAR(10),
    ET_IQ INT,
    ET_Gmath INT,
    ET_English INT,
    Training_Class VARCHAR(100),
    Evalution_Notes TEXT
);
/* Question 2 :add a filed name is VTI_Account with condition 
not null & Unique */
alter table Trainee
add column VTI_Account varchar(100) not null  unique;

-- 2. Exercise 2 
CREATE TABLE Developer (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Code CHAR(5),
    ModifiedDate DATETIME
)
;

-- Exercise 3 :
CREATE TABLE Fresher (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    BirthDate DATETIME,
    Gender TINYINT,
    IsDeletedFlag BIT
);
insert into  trainee(TraineeID,Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evalution_Notes,VTI_Account)
values (1, 'Nguyễn Văn A', '2000-01-01', 'Nam', 120, 85, 90, 'Toán101', 'Tiến bộ tốt', 'nguyenvana@example.com'),
(2, 'Trần Thị B', '1999-03-15', 'Nữ', 110, 70, 80, 'Anh101', 'Cần cải thiện', 'tranthib@example.com'),
(3, 'Lê Hoàng C', '2001-07-20', 'Nam', 130, 95, 85, 'Vật Lý101', ' xuất sắc', 'lehoangc@example.com'),
(4, 'Phạm Minh D', '2002-05-10', 'Nam', 115, 78, 88, 'Toán101', 'Trung bình', 'phamminhd@example.com'),
(5, 'Nguyễn Thị E', '2000-11-22', 'Nữ', 105, 60, 75, 'Anh101', 'Nỗ lực tốt', 'nguyenthie@example.com'),
(6, 'Trần Văn F', '2002-02-28', 'Nam', 135, 92, 92, 'Hóa101', 'Xuất sắc', 'tranvanf@example.com'),
(7, 'Lê Thị G', '2001-09-05', 'Nữ', 125, 85, 83, 'Toán101', 'Nỗ lực tốt', 'lethig@example.com'),
(8, 'Phạm Văn H', '1999-12-12', 'Nam', 100, 50, 70, 'Vật Lý101', 'Cần nhiều thực hành hơn', 'phamvanh@example.com'),
(9, 'Nguyễn Hoài I', '2003-08-18', 'Nam', 140, 98, 95, 'Toán101', 'Kết quả ấn tượng', 'nguyenhoaii@example.com'),
(10, 'Trần Thu J', '2001-04-30', 'Nữ', 110, 65, 78, 'Anh101', 'thực hành chưa tốt', 'tranthuj@example.com');

insert into  trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evalution_Notes,VTI_Account)
values ('Nguyễn Văn Mỹ', '2006-06-07', 'Nữ', 19, 15, 10, 'Anh101', 'Khá', 'nguyenvanmy@example.com');

delete from trainee where TraineeID >=2 and TraineeID <= 10;

SET SQL_SAFE_UPDATES = 0;
alter table trainee modify ET_IQ int check (ET_IQ between 0 and 20);
alter table trainee modify ET_Gmath int check (ET_Gmath between 0 and 20);
alter table trainee modify ET_English int check (ET_English between 0 and 20);

-- Cau 2

SELECT Full_Name, Birth_Date, Gender, sum((ET_IQ + ET_English + ET_Gmath) / 3) AS average_total
FROM trainee
GROUP BY Full_Name, Birth_Date, Gender
HAVING average_total > 10;





