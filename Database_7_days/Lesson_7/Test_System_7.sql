 use Testing_System_Assignment_1;
 
 /*-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo
		trước 1 năm trước */

DROP TRIGGER IF EXISTS get_Enter_Group;
DELIMITER //
CREATE TRIGGER get_Enter_Group
BEFORE INSERT ON `Group`
FOR EACH ROW
BEGIN
		DECLARE year_current YEAR;
        DECLARE limit_year YEAR;
        
        SET year_current = YEAR(CURRENT_DATE());
        SET limit_year = year_current -1;
	
    IF YEAR(NEW.CreateDate) <= limit_year THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngày tạo group phải bằng năm hiện tại';
	END IF;
END//
DELIMITER ;

INSERT INTO `Group` (GroupName, CreatorID, CreateDate) VALUES
    ('Group A', 'user1', '2023-12-12');

/* Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
"Sale" cannot add more user" */

DROP TRIGGER IF EXISTS Not_AddUser;
DELIMITER //
CREATE TRIGGER Not_AddUser
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
	IF NEW.DepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = 'Sales') THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phòng sale đã đầy';
	END IF;
END//
DELIMITER ;

INSERT INTO Account (Email, userName, fullName, DepartmentID, PositionID, createDate) VALUES
    ('user10@example.com', 'user10', 'John Nguyen', 1, 3, NOW());

/*-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user */
/* -- Nếu 1 group có 5 account sử dụng thì chặn ko cho tạo account nữa*/
DROP TRIGGER IF EXISTS limit_group;
DELIMITER //
CREATE TRIGGER limit_group
BEFORE INSERT ON GroupAccount
FOR EACH ROW
BEGIN
	DECLARE UserCount INT;
    
    SELECT COUNT(*) INTO UserCount
    FROM
    GroupAccount
    WHERE GroupID = NEW.GroupID;
    
    IF UserCount > 5 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = ' 1 group chỉ được chứa 5 user';
	END IF;
END//
DELIMITER ;
    
INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES
    (5, 1, '2022-01-01');


