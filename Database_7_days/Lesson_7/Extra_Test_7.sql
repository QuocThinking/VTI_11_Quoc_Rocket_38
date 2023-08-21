USE Extra_TestingSystem6;
/* -- Viết triggers để tránh trường hợp người dùng nhập thông tin module Project không hợplệ
		(Project_Modules.ProjectModulesDate < Projects.ProjectStartDate,
		Project_Modules.ProjectModulesCompletedOn > Projects.ProjectCompletedOn) */

/* Giải thích 1 vài field:
			 Projects.ProjectCompletedOne: ngày thời gian hoàn thành project.
			 Project_Modules.ProjectModulesDate: ngày nhân viên hoàn thành module (theo
			kế hoạch).
			 ProjectModulesCompletedOn: ngày thực tế nhân viên hoàn thành module.
			 Work_Done.WorkDoneDate: ngày nhân viên hoàn thành work, (date = null nếu
			work chưa hoàn thành).
			 Employee.SupervisorID: ID của người giám sát nhân viên (cũng là employee). */


-- Insert--

DROP TRIGGER IF EXISTS before_insert_project_module;
DELIMITER //
CREATE TRIGGER before_insert_project_module
BEFORE INSERT ON project_modules
FOR EACH ROW
BEGIN
	DECLARE Project_Start_Date DATE;
    DECLARE Project_Completed_Date DATE;
    DECLARE has_error INT DEFAULT 0; -- Kiểm tra lỗi và gán ngày
    
    SELECT ProjectCompletedOn , ProjectStartDate INTO Project_Completed_Date,Project_Start_Date
    FROM Projects
    WHERE ProjectID = NEW.ProjectID;
    
    IF NEW.ProjectModulesDate < Project_Start_Date THEN
		SET has_error = 1; -- Nếu ngày nvien hoàn thành project < hơn ngày start project thì gán 1
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngày nhân viên HT project phải lớn hơn ngày Start dự án';
	END IF;
    
    IF NEW.ProjectModulesCompletedOn > Project_Completed_Date THEN
		SET has_error = 1;
        SIGNAL SQLSTATE '45001'
        SET MESSAGE_TEXT = 'Ngày thực tế nhân viên hoàn thành phải nhỏ hơn ngày hoàn thành dự án';
	END IF;
    
    -- Nếu có lỗi, gán ProjectModulesCompletedOn bằng ngày hiện tại + 3 tháng
    -- 
    
    IF has_error = 1 AND NEW.ProjectModulesDate < Project_Start_Date THEN
		SET NEW.ProjectModulesDate = DATE_ADD(CURRENT_DATE, INTERVAL 3 MONTH);
	END IF;
	IF has_error = 1 AND NEW.ProjectModulesCompletedOn > Project_Completed_Date THEN
		SET NEW.ProjectModulesCompletedOn = DATE_ADD(CURRENT_DATE, INTERVAL 3 MONTH);
	END IF;
    
END//

DELIMITER ;


-- UPDATE --

DROP TRIGGER IF EXISTS Before_Update_Project;
DELIMITER //
CREATE TRIGGER Before_Update_Project BEFORE UPDATE ON project_modules
FOR EACH ROW
BEGIN 
	DECLARE Project_Start_Date DATE;
    DECLARE Project_End_Date DATE;
    DECLARE has_error INT DEFAULT 0;
	
    SELECT ProjectStartDate, ProjectCompletedOn INTO Project_Start_Date, Project_End_Date
    FROM Projects
    WHERE ProjectID = NEW.ProjectID;
    
    IF NEW.ProjectModulesDate < Project_Start_Date THEN
		SET has_error = 1; -- Nếu ngày nvien hoàn thành project < hơn ngày start project thì gán 1
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngày nhân viên hoàn thành project phải lớn hơn ngày Start dự án';
	END IF;
    
	IF NEW.ProjectModulesDate > Project_End_Date THEN
		SET has_error = 1; -- Nếu ngày nvien hoàn thành project > hơn ngày gia hạn dự án
        SIGNAL SQLSTATE '45001'
        SET MESSAGE_TEXT = 'Ngày nhân viên hoàn thành project phải nhỏ hơn ngày hoàn thành gia hạn dự án';
	END IF;
    
    IF NEW.ProjectModulesCompletedOn > Project_End_Date THEN
		SET has_error = 1;
        SIGNAL SQLSTATE '45002'
        SET MESSAGE_TEXT = 'Ngày thực tế nhân mà nv hoàn thành dự án phải nhỏ hơn ngày kết thúc dự án';
	END IF;
END//
DELIMITER ;    

    
INSERT INTO Projects		 ( ManagerID , ProjectName 		, ProjectStartDate	, ProjectDescription	, ProjectDetail		, ProjectCompletedOn	)
VALUE						(	2		,'Boot'				,	'2023-06-06'	, 'Làm đúng vào'		,'Làm đúng hạn'		,	'2023-08-06'		);

INSERT INTO Project_Modules (ProjectID	, EmployeeID, ProjectModulesDate, ProjectModulesCompletedOn	, ProjectModulesDescription	)
VALUE						(	7		,	1		,	'2024-06-06'	, '2023-05-23'		,	'Làm đúng hạn'			);


UPDATE  Project_Modules
SET 
ProjectModulesDate = '2023-07-09'
WHERE ProjectID = 7;


/* Exercise 2: View
		Trong database phần Assignment 3, Tạo 1 VIEW để lấy ra tất cả các thực tập sinh là
		ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số
		điểm như sau:

		 ET_IQ + ET_Gmath>=20
		 ET_IQ>=8
		 ET_Gmath>=8
		 ET_English>=18 */
use testing_system_assignment_2;

DROP VIEW IF EXISTS get_trainee;
CREATE VIEW get_trainee
AS
SELECT t.*
FROM
trainee t
WHERE t.ET_IQ >= 8 AND t.ET_Gmath >= 8 AND t.ET_English >= 18 AND t.ET_IQ + ET_Gmath >= 20;

SELECT * FROM get_trainee;


