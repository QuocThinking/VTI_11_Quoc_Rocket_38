 use Testing_System_Assignment_1;
 /* Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
account thuộc phòng ban đó */
-- 1 .

DROP PROCEDURE IF EXISTS get_Department_Name_1;
DELIMITER //
Create procedure get_Department_Name_1 ( in dept_name varchar(100), out dept_account varchar(1000))
Begin
	Select Group_concat(concat(A.AccountID , ' : ', A.FullName) separator ', ' )
    into dept_account
    From Account A inner join Department D
    ON A.DepartmentID = D.DepartmentID
    Where  dept_name = D.DepartmentName;
    End//
DELIMITER ;
-- USE

set @dept_part = '';
Call get_Department_Name_1  ('IT', @dept_part );
select @dept_part;

/* Question 2: Tạo store để in ra số lượng account trong mỗi group */

Drop Procedure if exists get_Account_Group ;
Delimiter //
Create procedure get_Account_Group ()
Begin
	Select ga.GroupID, ga1.GroupName, count(distinct ga.AccountID) as AmountAccount
	From  GroupAccount ga
	inner join `Group` ga1
    ON ga.GroupID = ga1.GroupID
	Group By ga.GroupID,ga1.GroupName;
End//
Delimiter ;

-- USE--
Call get_Account_Group();

select A.*, g.groupID
from `account` A inner join `groupaccount` g
On A.AccountID = g.AccountID
Where g.GroupID = 5;

/* Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
trong tháng hiện tại */

/* Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất */

Drop procedure if exists get_Type_Question;
Delimiter //
create procedure get_Type_Question()
			Begin
			Select T.TypeID , count(Q.QuestionID) As AmountQuestion
			From
			Question Q inner join TypeQuestion T
			ON Q.TypeID = T.TypeID
			Group By T.TypeID
			Having count(Q.QuestionID) = ( Select max(AmountQuestion)
												From (
														Select  TypeID , count(QuestionID) As AmountQuestion
															From Question 
															Group By TypeID
															) As AmountType ) ;
End//
Delimiter ;

-- USE --

call get_Type_Question();

/* Question 5: Sử dụng store ở question 4 để tìm ra tên của type question */
Drop procedure if exists get_Type_Name;
Delimiter //
create procedure get_Type_Name()
			Begin
			Select T.TypeID , T.TypeName, count(Q.QuestionID) As AmountQuestion
			From
			Question Q inner join TypeQuestion T
			ON Q.TypeID = T.TypeID
			Group By T.TypeID
			Having count(Q.QuestionID) = ( Select max(AmountQuestion)
												From (
														Select  TypeID , count(QuestionID) As AmountQuestion
															From Question 
															Group By TypeID
															) As AmountType ) ;
End//
Delimiter ;

-- USE --

Call get_Type_Name();

/* Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
chuỗi của người dùng nhập vào */

Drop procedure if exists get_Name_Gr_Ac;
Delimiter //
Create procedure get_Name_Gr_Ac( IN search_string varchar(255))
Begin
If exists (Select 1 from `Group` where GroupName like concat('%', search_string , '%')) then
Select 'group' as ResultType, GroupName as IsName
	From 
    `Group`
    Where GroupName like Concat('%', search_string, '%');
Else
Select 'User' as ResultType , FullName as IsName
	From 
    Account
    Where FullName like Concat('%' , search_string, '%');

End If ;
End//
Delimiter ;

-- USE --
call get_Name_Gr_Ac('W');

/* Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
trong store sẽ tự động gán:

username sẽ giống email nhưng bỏ phần @..mail đi
positionID: sẽ có default là developer
departmentID: sẽ được cho vào 1 phòng chờ

Sau đó in ra kết quả tạo thành công */




 