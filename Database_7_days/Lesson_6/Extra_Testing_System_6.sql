DROP DATABASE IF EXISTS Extra_TestingSystem6;
CREATE DATABASE Extra_TestingSystem6;
USE Extra_TestingSystem6;
/* =====TẠO BẢNG DỮ LIỆU========*/
DROP TABLE IF EXISTS Project_Modules;
CREATE TABLE Project_Modules
(
	ModuleID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ProjectID					TINYINT UNSIGNED NOT NULL,
    EmployeeID					TINYINT UNSIGNED NOT NULL,
    ProjectModulesDate			DATETIME DEFAULT NOW(),
    ProjectModulesCompletedOn	DATETIME,
    ProjectModulesDescription	NVARCHAR(50)
);
DROP TABLE IF EXISTS Projects;
CREATE TABLE Projects(
	ProjectID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ManagerID					TINYINT	UNSIGNED NOT NULL,
    ProjectName 				NVARCHAR(50) NOT NULL,
    ProjectStartDate			DATETIME DEFAULT NOW(),
    ProjectDescription			NVARCHAR(50) NOT NULL,
    ProjectDetail				NVARCHAR(50) NOT NULL,
    ProjectCompletedOn			DATETIME
);
DROP TABLE IF EXISTS Work_Done;
CREATE TABLE Work_Done(
	WorkDoneID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeID					TINYINT UNSIGNED NOT NULL,
    ModuleID					TINYINT UNSIGNED NOT NULL,
    WorkDoneDate				DATETIME,
    WorkDoneDescription			NVARCHAR(50) NOT NULL,
    WorkDoneStatus				BIT NOT NULL -- 1: Hoàn thành, 0: Không hoàn thành
);
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(
	EmployeeID 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeLastName			NVARCHAR(30) NOT NULL,
    EmployeeFirstName			NVARCHAR(30) NOT NULL,
    EmployeeHireDate			DATETIME DEFAULT NOW(),
    EmployeeStatus				BIT NOT NULL,
    SupervisorID				TINYINT UNSIGNED NOT NULL,
    SocialSecurityNumber		CHAR(5)
);

/* == Tạo khóa phụ cho các bảng == */
ALTER TABLE 	Project_Modules
ADD CONSTRAINT 	FK_ProjectID
FOREIGN KEY 	(ProjectID)
REFERENCES		Projects(ProjectID);

ALTER TABLE 	Project_Modules
ADD CONSTRAINT 	FK_EmployeeID
FOREIGN KEY 	(EmployeeID)
REFERENCES		Employee(EmployeeID);

ALTER TABLE 	Projects
ADD CONSTRAINT 	FK_ManagerID
FOREIGN KEY 	(ManagerID)
REFERENCES		Employee(EmployeeID);

ALTER TABLE 	Employee
ADD CONSTRAINT 	FK_EmployeeID_SupervisorID
FOREIGN KEY 	(SupervisorID)
REFERENCES		Employee(EmployeeID);

ALTER TABLE 	Work_Done
ADD CONSTRAINT 	FK_WorkDone_Employee
FOREIGN KEY 	(EmployeeID)
REFERENCES		Employee(EmployeeID);

ALTER TABLE 	Work_Done
ADD CONSTRAINT 	FK_WorkDone_Project_Modules
FOREIGN KEY 	(ModuleID)
REFERENCES		Project_Modules(ModuleID);

/* ====INSERT DỮ LIỆU===== */
INSERT INTO Employee		( EmployeeLastName	, EmployeeFirstName	, EmployeeHireDate	, EmployeeStatus, SupervisorID	, SocialSecurityNumber	)
VALUE						(N'Nguyễn Hải'		,N'Đăng'			,'2019-06-06'		, 		1		,		1		,'SS001'				),
							(N'Lê Thị'			,N'Thư'				,'2019-07-06'		, 		1		,		1		,'SS002'				),
                            (N'Nguyễn Hữu'		,N'Thắng'			,'2019-08-06'		, 		1		,		2		,'SS003'				),
                            (N'Dương Văn'		,N'Hữu'				,'2019-07-06'		, 		0		,		2		,'SS004'				);

INSERT INTO Projects		 ( ManagerID , ProjectName 		, ProjectStartDate	, ProjectDescription	, ProjectDetail		, ProjectCompletedOn	)
VALUE						(	1		,'Java'				,	'2019-06-06'	, 'Làm đúng vào'		,'Làm đúng hạn'		,	'2019-08-06'		),
							(	2		,'C#'				,	'2019-07-06'	, 'Làm nhanh lên'		,'Làm trước hạn'	,	'2019-09-06'		),
                            (	3		,'Android'			,	'2019-08-06'	, 'Nộp trước ngày 17/3'	,'Làm quá hạn'		,	'2019-10-06'		),
                            (	1		,'C++'				,	'2019-07-06'	, 'Không biết đừng làm'	,'Làm trước hạn'	,	'2019-11-06'		);
                            
INSERT INTO Project_Modules (ProjectID	, EmployeeID, ProjectModulesDate, ProjectModulesCompletedOn	, ProjectModulesDescription	)
VALUE						(	1		,	1		,	'2019-06-06'	, '2019-06-06'		,	'Làm đúng hạn'			),
							(	2		,	2		,	'2019-07-06'	, '2019-06-06'		,	'Làm trước hạn'			),
                            (	3		,	3		,	'2019-08-06'	, '2019-09-06'		,	'Làm quá hạn'			),
                            (	4		,	1		,	'2019-07-06'	, '2019-06-06'		,	'Làm trước hạn'			);

INSERT INTO Work_Done		( EmployeeID, ModuleID	, WorkDoneDate	, WorkDoneDescription	, WorkDoneStatus	)
VALUE						(	1		,	1		,'2019-06-06'	, 'Làm được phết'		,		1			),
							(	2		,	2		,'2019-07-06'	, 'Làm ổn phết'			,		1			),
                            (	3		,	3		,'2019-08-06'	, 'Không biết làm'		,		0			),
                            (	1		,	4		,'2019-07-06'	, 'Không biết ko làm'	,		0			);
                            
                            
/*--a) Tạo table với các ràng buộc và kiểu dữ liệu và thêm ít nhất 3 bản ghi vào
mỗi table trên */

/*--b) Viết stored procedure (không có parameter) để Remove tất cả thông tin
project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã
remove từ các table liên quan trong khi removing (dùng lệnh print) */

Drop procedure if exists RemoveProject;
Delimiter //
Create procedure RemoveProject() 
Begin 
	declare currentDate date; -- biến lưu trữ ngày hiện tại
    declare completedDate date; -- biến lưu trữ thời gian hoàn thành dự án
    declare countProject int; -- biến đếm số lượng project
    
    -- Lấy ngày hiện tại
    set currentDate = current_date();
    -- Tính thời gian hoàn thành sau 3 tháng kể từ ngày hiện tại
    set completedDate = date_add(currentDate, Interval - 3 Month);
    
    -- Bắt đầu xóa thông tin project
    start transaction; -- Bắt đầu giao dịch
    Begin
		-- Xóa project 
        Delete
        from projects
        where ProjectDetail = 'Làm đúng hạn' and projectcompletedon <= completedDate;
        
        -- Lấy số lượng record đã xóa
        set countProject = row_count();
	commit;
    end;
    -- In ra số lượng project đã xóa
	 SELECT CONCAT('Removed ', countProject, ' completed projects.') AS Message;
    End//
    Delimiter ;
    
    call RemoveProject();
    
    /* -- c) Viết stored procedure (có parameter) để in ra các module đang được thực
		hiện) */
	
    drop procedure if exists get_module_process;
    Delimiter //
    create procedure get_module_process(IN project_id tinyint unsigned)
    begin
		select projectID, ModuleID
        from
        project_modules
        where projectID = project_id and projectmodulescompletedon is null;
	end//
    delimiter ;
    
    call get_module_process(6);
    
    /* -- Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia làm mặc
		dù không ai giao việc cho nhân viên đó (trong bảng Works) */

Drop procedure if exists get_employee_joined;
Delimiter //
create procedure get_employee_joined(IN employee_id tinyint unsigned)
begin
	select EmployeeID, CONCAT(EmployeeLastName, ' ', EmployeeFirstName)
    from Employee
    where employeeID = employee_id and employeeID not in(select employeeID from work_done);
end//
delimiter ;

call get_employee_joined(1);
    