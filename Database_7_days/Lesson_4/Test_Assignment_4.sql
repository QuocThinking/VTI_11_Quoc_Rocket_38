 use Testing_System_Assignment_1;
 -- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
 select a.fullName, d.DepartmentName, d.DepartmentID, a.DepartmentID
 from 
 account a join department d 
 on a.departmentID = d.departmentID;

-- Question 2 : Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
select * from account where createDate > '2010-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer

select a.fullName, p.positionName
from account a left join position p
on a.PositionID = p.PositionID
where p.positionName = 'Developer';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
select d.DepartmentName, count(a.AccountID) as Employee
from department d left join account a
on d.departmentID = a.DepartmentID
GRoup by d.DepartmentID, d.DepartmentName
having Employee > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select q.content as ListQuestion , count(e.examID) as CountQuestion
from Question q inner join ExamQuestion e
on q.QuestionID = e.QuestionID
Group by q.content, q.questionID
order by countquestion DESC;

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
select ca.CategoryName, Count(qu.QuestionID) as AmountQuestion
from CategoryQuestion ca left join Question qu
ON ca.CategoryID = qu.CategoryID
Group by ca.categoryName, ca.CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
select q.content as QuestionContent , count(e.ExamID) as AmountExam
from Question q left join ExamQuestion e
ON q.QuestionID = e.QuestionID
Group by q.questionID, q.content;

-- Question 8 : Lấy ra Question có nhiều câu trả lời nhất
select q.content as 'Câu hỏi', a.content as 'Câu trả lời', count(a.answerID) as AmountAnswer
from Question q right join answer a
ON q.questionID = a.QuestionID
Group by q.questionID, a.content
order by AmountAnswer DESC
Limit 1;

-- Question 9: Thống kê số lượng account trong mỗi group
select ga.GroupID as 'Group', count(ga.accountID) as AmountAccount
from account a inner join groupaccount ga
on a.accountID = ga.accountID
group by ga.GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
select p.positionName, count(a.accountID) as AmountEmployee
from
Position p left join account a
on p.positionID = a.positionID
group by p.positionID, p.positionName
order by AmountEmployee asc
limit 5;
 
 -- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
 select d.departmentName,
 ( select count(*) from account a inner join position p ON a.positionID = p.positionID
   where a.departmentID = d.departmentID and p.positionName = 'Developer') as  Dev,
 ( select count(*) from account a inner join position p ON a.positionID = p.positionID
   where a.departmentID = d.departmentID and p.positionName = 'Test') as Test,
( select count(*) from account a inner join position p ON a.positionID = p.positionID
   where a.departmentID = d.departmentID and p.positionName = 'PM') as  PM,
( select count(*) from account a inner join position p ON a.positionID = p.positionID
   where a.departmentID = d.departmentID and p.positionName = 'scrum master') as  ScrumMaster
 from 
 Department d;
 
 -- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
--  question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
alter table question
add AccountID int ;
alter table question
add constraint FK_AccountQuestion foreign key(AccountID) references account(AccountID);

select q.content as 'Câu hỏi', a.Content as 'Câu trả lời', t.TypeName as 'Loại câu hỏi', aa.fullName
from Question q 
inner join typequestion t
ON q.typeID = t.typeID
inner join answer a
ON a.QuestionID = q.QuestionID
inner join account aa
ON aa.accountID = q.accountID;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm


-- Question 14:Lấy ra group không có account nào
select g.groupName, g.GroupID, ga.AccountID
from
`Group` g left join groupaccount ga
on g.groupID = ga.groupID
where ga.accountId is null;

-- Question 16: Lấy ra question không có answer nào
select q.questionID, an.content
from question q left join answer an
on q.questionID = an.questionID
where an.questionID is null;

/*
	Question 17:
	a) Lấy các account thuộc nhóm thứ 1
	b) Lấy các account thuộc nhóm thứ 2
	c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
*/
select a.AccountId, a.fullName, a.Email, ga.groupID
from account a inner join groupaccount ga
on a.accountID = ga.accountID
where ga.groupID  = 1;

select a.AccountId, a.fullName, a.Email, ga.groupID
from account a inner join groupaccount ga
on a.accountID = ga.accountID
where ga.groupID = 2;

-- Join --
select AccountID, fullname, email ,groupID
from (
	select a.AccountId, a.fullName, a.Email, ga.groupID
from account a inner join groupaccount ga
on a.accountID = ga.accountID
where ga.groupID  = 1
union
select a.AccountId, a.fullName, a.Email, ga.groupID
from account a inner join groupaccount ga
on a.accountID = ga.accountID
where ga.groupID = 2
) as CombinedAccounts;

/*
	Question 18:
	a) Lấy các group có lớn hơn 5 thành viên
	b) Lấy các group có nhỏ hơn 7 thành viên
	c) Ghép 2 kết quả từ câu a) và câu b)
*/

select ga.groupID, count(ga.AccountID) as AmountEmployee
from 
`Group` g inner join groupaccount ga
on g.GroupID = ga.GroupID
group by ga.GroupID
having
AmountEmployee > 5;

select ga.groupID, count(ga.accountID) as AmoutEmployee
from
`Group` g inner join groupaccount ga
on g.GroupID = ga.GroupID
group by ga.groupID
having AmoutEmployee < 7;

-- Join --
select GroupID, GroupName, AmountEmployee
from
(
select ga.groupID, g.groupName,count(ga.AccountID) as AmountEmployee
from 
`Group` g inner join groupaccount ga
on g.GroupID = ga.GroupID
group by ga.GroupID, g.groupName
having
AmountEmployee > 5
union
select ga.groupID, g.groupName,count(ga.accountID) as AmoutEmployee
from
`Group` g inner join groupaccount ga
on g.GroupID = ga.GroupID
group by ga.groupID, g.groupName
having AmoutEmployee <  7
) as CombinedGroup


