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

						/*
						(------------------- Lesson 3------------------------)
						/*
-- Câu 1 :
*/
INSERT INTO trainee(Full_Name, Birth_Date,Gender,ET_IQ,ET_Gmath, ET_English,Training_Class,Evalution_Notes,VTI_Account)
VALUES ('Nguyen Thi Kim Phung', DATE '2001-06-01','FEMALE',20,20,15,07080001,'Lop hoc rat tot','ID01'),
('Nguyen Thi Minh Phuoc', DATE '2001-12-22','FEMALE',20,10,14,07080001,'Lop hoc rat tot','ID02'),
('Nguyen Trinh Tra Giang', DATE '2001-01-18','FEMALE',15,20,8,07080002,'Lop hoc rat tot','ID03'),
('Van Phuc Huy', DATE '2001-06-01','FEMALE',12,2,5,07080002,'Lop hoc rat tot','ID04'),
('Nguyen Thi Kim', DATE '2001-06-01','FEMALE',15,14,17,07080003,'Lop hoc rat tot','ID05'),
('Nguyen Thi Kim A', DATE '2001-06-01','FEMALE',14,15,16,07080003,'Lop hoc rat tot','ID06'),
('Nguyen Thi Kim B', DATE '2001-06-01','FEMALE',4,8,19,07080003,'Lop hoc rat tot','ID07'),
('Nguyen Thi Kim C', DATE '2001-06-01','FEMALE',4,5,5,07080004,'Lop hoc rat tot','ID058'),
('Nguyen Thi Kim D', DATE '2001-06-01','FEMALE',20,20,20,07080004,'Lop hoc rat tot','ID09'),
('Nguyen Thi Kim E', DATE '2001-06-01','FEMALE',20,15,20,07080004,'Lop hoc rat tot','ID10');


/*
Cau 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
nhóm chúng thành các tháng sinh khác nhau
( -- tổng 3 môn trên 10 sẽ passed test)
*/

SELECT  full_Name,YEAR(Birth_Date) AS BirthYear, MONTH(Birth_Date) AS BirthMonth, avg((ET_IQ + ET_English + ET_Gmath) / 3) AS average_total
FROM trainee
GROUP BY  Birth_Date, full_Name
HAVING average_total > 10;
-- cách 2
select group_concat(full_Name), month(Birth_Date) from trainee group by month(birth_Date)

/*
-- Câu 3 : Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
   tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
*/

select e.full_name, e.birth_date, e.gender, e.et_iq, e.et_gmath, e.et_english, e.training_class, e.evalution_notes, e.vti_account
from trainee e
order by length(e.full_name) desc
limit 1;


/*
 -- Câu 4 : Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
			những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
					 ET_IQ + ET_Gmath>=20
					 ET_IQ>=8
					 ET_Gmath>=8
					 ET_English>=18
*/

select e.full_name, e.birth_date, e.gender, e.et_iq, e.et_gmath, e.et_english, e.training_class, e.evalution_notes, e.vti_account
from trainee e
where 
e.et_iq + e.et_gmath >= 20 and e.et_iq >= 8 and e.et_gmath >= 8 and e.et_english >= 18;

/*
-- Câu 5 : xóa thực tập sinh có TraineeID = 3
*/

Delete from trainee where traineeId = 3;

select * from trainee;

/*
-- Câu 6 : Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật
			thông tin vào database
*/

update trainee
set training_class = 2
where traineeID = 5;