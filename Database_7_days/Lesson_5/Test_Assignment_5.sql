 use Testing_System_Assignment_1;
 
 /* -- Tạo view có chứa danh sách nhân viên thuộc phòng ban sale */
 
 create or replace view Account_sales as
 select aa.fullName, de.DepartmentName
 from account aa inner join department de
 ON aa.departmentID = de.departmentID
 where DepartmentName = 'Sales';

 
 select * from Account_sales;
 
 /* -- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất */
 
create view Account_Group as
Select a.*, Count(a.AccountID) as Amount_Group
From
`Account`a Inner Join GroupAccount g
On a.AccountID = g.AccountID
Group by a.AccountID
Having count(a.AccountID) =  (
								 select count(a.accountID)
								 from account a inner join groupaccount g
								 on a.accountID = g.accountID
								 group by a.accountID
								 order by g.accountID desc
								 Limit 1);

Select * from Account_Group;

/* -- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
						được coi là quá dài) và xóa nó đi  -- */
create or replace  view Content_Question as
select q.content
from 
Question q
where length(q.content) > 10;

/*-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất */

Create view DepartmentAccount as
Select D.DepartmentID, D.DepartmentName, count(A.AccountID) as AmountAccount
From
`Account` A inner join Department D
ON A.DepartmentID = D.DepartmentID
group by D.DepartmentID, D.DepartmentName
Having AmountAccount = (Select max(AmountAccount)
							from (
                            Select DepartmentID, count(AccountID) AS AmountAccount
							from
                            `Account` 
                            Group By DepartmentID) as DepartmentCounts );



/* Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo */
Create view ContentQuestion as 
Select Q.Content, A.FullName as Creator
From
`Account` A inner join Question Q
On A.AccountID = Q.AccountID
group by Q.Content, A.fullName
Having Creator Like 'Nguyễn%';
 



