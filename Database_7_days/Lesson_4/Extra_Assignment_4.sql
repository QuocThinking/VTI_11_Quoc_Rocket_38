use Testing_System_Assignment_1;
CREATE TABLE Department2 (
    Department_Number INT PRIMARY KEY,
    Department_Name VARCHAR(100)
);

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
-- Thêm 10 bản ghi vào bảng Department
-- Thêm 10 bản ghi vào bảng Department
INSERT INTO Department2 (Department_Number, Department_Name)
VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'IT'),
    (4, 'Marketing'),
    (5, 'Operations'),
    (6, 'Sales'),
    (7, 'Research'),
    (8, 'Admin'),
    (9, 'Customer Service'),
    (10, 'Production');

-- Thêm 10 bản ghi vào bảng Employee_Table
INSERT INTO Employee_Table (Employee_Number, Employee_Name, Department_Number)
VALUES
    (101, 'John Doe', 3),
    (102, 'Jane Smith', 2),
    (103, 'Michael Johnson', 5),
    (104, 'Emily Brown', 1),
    (105, 'William Davis', 6),
    (106, 'Olivia Wilson', 4),
    (107, 'James Lee', 3),
    (108, 'Sophia Martinez', 7),
    (109, 'Liam Anderson', 9),
    (110, 'Emma Jackson', 8);

-- Thêm 10 bản ghi vào bảng Employee_Skill_Table
INSERT INTO Employee_Skill_Table (Employee_Number, Skill_Code, Date_Registered)
VALUES
    (101, 'JAVA', '2023-01-01'),
    (102, 'JAVA', '2023-02-15'),
    (103, 'Python', '2023-03-10'),
    (104, 'C++', '2023-04-20'),
    (105, 'HTML/CSS', '2023-05-05'),
    (106, 'Marketing', '2023-06-12'),
    (107, 'JAVA', '2023-07-18'),
    (108, 'Research', '2023-08-22'),
    (109, 'Customer Service', '2023-09-03'),
    (110, 'JAVA', '2023-10-30');
INSERT INTO Employee_Skill_Table (Employee_Number, Skill_Code, Date_Registered)
VALUES
    (101, 'c#', '2023-01-01'),
    (102, 'python', '2023-02-15'),
    (101, 'MySql', '2023-03-10'),
    (104, 'Reactjs', '2023-04-20');
   
-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java

select e1.Employee_Name, e2.Skill_Code
from employee_table e1 left join employee_skill_table e2 
on e1.Employee_Number = e2.Employee_Number
where e2.Skill_Code = "JAVA";

SELECT d.Department_Name, e.Employee_Name
FROM Employee_Table e
JOIN Department d ON e.Department_Number = d.Department_Number;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

select d.departmentName , count(aa.accountID) as AmountAccount
from 
Department d inner join account aa
ON d.DepartmentID = aa.DepartmentID
Group by d.departmentID, d.departmentName
having amountaccount > 3;

-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
select aa.fullname as 'Họ và tên', d.departmentName as 'Tên phỏng ban'
from 
account aa left join Department d
ON aa.DepartmentID = d.DepartmentID
group by aa.fullname,  d.departmentName;

-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
-- Hướng dẫn: sử dụng DISTINCT

select e2.Employee_Number,e1.Employee_Name, count(e2.skill_code) as AmountSkill
from employee_table e1 right join employee_skill_table e2
ON e1.Employee_Number = e2.Employee_Number
Group by e2.Employee_Number
having AmountSkill > 1;

SELECT e2.Employee_Number, e1.employee_name, COUNT(DISTINCT e2.Skill_Code) AS AmountSkill, group_concat(distinct e2.skill_code) as Skill
FROM Employee_Skill_Table e2 inner join employee_table e1
on e2.employee_number = e1.employee_number
GROUP BY e2.Employee_Number
HAVING AmountSkill > 1;
