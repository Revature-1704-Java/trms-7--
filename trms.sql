/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE Department
(
    DepartmentId NUMBER NOT NULL,
    Name VARCHAR2(160) NOT NULL,
    Head NUMBER,
    
    CONSTRAINT PK_Department PRIMARY KEY  (DepartmentId)
);


CREATE TABLE Employee
(
    EmployeeId NUMBER NOT NULL , 
    LastName VARCHAR2(200) NOT NULL,
    FirstName VARCHAR2(200) NOT NULL,
    Supervisor NUMBER,
    Department NUMBER NOT NULL,
    IsBenefitCoodinator CHAR(1) DEFAULT 0 NOT NULL, 
    Email VARCHAR2(200) NOT NULL,
    Title VARCHAR2(200),
    BirthDate DATE,
    HireDate DATE,
    Address VARCHAR2(200),
    City VARCHAR2(200),
    State VARCHAR2(40),
    Country VARCHAR2(200),
    PostalCode VARCHAR2(50),
    Phone VARCHAR2(200),
    
    CONSTRAINT PK_Employee PRIMARY KEY  (EmployeeId),
    CONSTRAINT EmployeeEmail_unique UNIQUE (Email)
);
INSERT INTO EducationRequest(EmployeeId, startDate, endDate, daysOff, location, justification, cost, type)
VALUES (1, '2018-01-01 19:00:00.0','2018-01-05 19:00:00.0', 4, 'somwhere', 'somplace',6,2);

CREATE SEQUENCE EducationRequest_seq START WITH 1;
/
CREATE OR REPLACE TRIGGER EducationRequest_bir 
BEFORE INSERT ON EducationRequest 
FOR EACH ROW

BEGIN
  SELECT EducationRequest_seq.NEXTVAL
  INTO   :new.EducationRequestId
  FROM   dual;
END;
/
CREATE TABLE EducationRequest
(
    EducationRequestId NUMBER NOT NULL,
    EmployeeId NUMBER NOT NULL,
    SupervisorApproval CHAR(1) DEFAULT 0,
    DepartmentHeadApproval CHAR(1) DEFAULT 0,
    BenefitCoodinatorApproval CHAR(1) DEFAULT 0,
    StartDate TIMESTAMP NOT NULL,
    EndDate TIMESTAMP NOT NULL, 
    DaysOff NUMBER,
    Location VARCHAR2(200),
    Justification VARCHAR(2000),
    Cost NUMBER, 
    PresetationDocumentPath VARCHAR2(4000),
    ReimbursmentPaid CHAR(1) DEFAULT 0, 
    Type NUMBER, 
    
    CONSTRAINT PK_EducationRequest PRIMARY KEY (EducationRequestId)
);

CREATE TABLE EducationType
(
    EducationTypeId NUMBER NOT NULL,
    Name VARCHAR2(200),
    PercentCovered VARCHAR2(200),

    CONSTRAINT PK_EducationType PRIMARY KEY (EducationTypeId)
);


/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE Department ADD CONSTRAINT FK_DepartmentHead
    FOREIGN KEY (Head) REFERENCES Employee(EmployeeId);

ALTER TABLE Employee ADD CONSTRAINT FK_EmployeeSupervisor
    FOREIGN KEY (Supervisor) REFERENCES Employee(EmployeeId);

ALTER TABLE Employee ADD CONSTRAINT FK_EmployeeDepartment
    FOREIGN KEY (Department) REFERENCES Department(DepartmentId); 
    
ALTER TABLE EducationRequest ADD CONSTRAINT FK_EducationRequestType
    FOREIGN KEY (EducationType) REFERENCES Department(EducationTypeId); 
        

/*******************************************************************************
   Populate Tables
********************************************************************************/

INSERT INTO Department (DepartmentId, Name) VALUES(1,'Software');
INSERT INTO Department (DepartmentId, Name) VALUES(2,'Human Resources');
INSERT INTO Department (DepartmentId, Name) VALUES(3,'Marketing');
INSERT INTO Department (DepartmentId, Name) VALUES(4,'Production');

INSERT INTO Employee (EmployeeId, LastName, FirstName, Department, Email) VALUES (1, 'Rego', 'Philip', 1, 'regop412@gmail.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Department, Email) VALUES (2, 'Adams', 'Sneezy', 1, 'sneezya@gmail.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Department, Email) VALUES (3, 'Baker', 'Sleepy', 2, 'sleepyb@gmail.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Department, Email) VALUES (4, 'Clark', 'Dopey', 3, 'regopdopeyc@gmail.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Department, Email) VALUES (5, 'Patel', 'Grumpy', 4, 'grumpyp@gmail.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Department, Email) VALUES (6, 'Xiang', 'Bashful', 4, 'bashfulx@gmail.com');

INSERT INTO EducationType(EducationTypeId, Name, PercentCovered) VALUES (1, 'University Courses', .8 );
INSERT INTO EducationType(EducationTypeId, Name, PercentCovered) VALUES (2, 'Seminars', .6 );
INSERT INTO EducationType(EducationTypeId, Name, PercentCovered) VALUES (3, 'Certification Preparation Classes', .75 );
INSERT INTO EducationType(EducationTypeId, Name, PercentCovered) VALUES (4, 'Certification', 1 );
INSERT INTO EducationType(EducationTypeId, Name, PercentCovered) VALUES (5, 'Technical Training', .9 );
INSERT INTO EducationType(EducationTypeId, Name, PercentCovered) VALUES (6, 'Other', .3 );


/*******************************************************************************
   Assign department heads  
********************************************************************************/
UPDATE Department SET head = 1 WHERE name = 'Software';
UPDATE Department SET head = 2 WHERE name = 'Human Resources';
UPDATE Department SET head = 3 WHERE name = 'Marketing';
UPDATE Department SET head = 4 WHERE name = 'Production';

/*******************************************************************************
   Assign supervisors  
********************************************************************************/
UPDATE Employee SET supervisor = 1 WHERE firstName = 'Sneezy';
UPDATE Employee SET supervisor = 1 WHERE firstName = 'Sleepy';
UPDATE Employee SET supervisor = 1 WHERE firstName = 'Dopey';
UPDATE Employee SET supervisor = 1 WHERE firstName = 'Grumpy';
UPDATE Employee SET supervisor = 1 WHERE firstName = 'Bashful';

/*******************************************************************************
   Selects
********************************************************************************/

SELECT * FROM Employee where EMAIL  ='sneezya@gmail.com';
SELECT * FROM Employee where employeeid = 1;
SELECT * FROM Department where departmentid = 1;


SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM EducationRequest;
SELECT * FROM EducationType;

SELECT * FROM EducationRequest where employeeid = 5;

Update EducationRequest
set SUPERVISORAPPROVAL = 1
where EDUCATIONREQUESTID=?



UPDATE EducationRequest
SET employeeid = 5;

UPDATE Department
SET head = 2
WHERE departmentid = 1;

UPDATE employee
SET isBenefitCoodinator = 1
WHERE employeeid = 1;

UPDATE employee
SET supervisor = 3
WHERE employeeid > 4;

--given employeeid which reqs can they supervisor approve
SELECT *
FROM EducationRequest
JOIN EMPLOYEE
ON EducationRequest.employeeid = EMPLOYEE.employeeid
WHERE supervisor = 1;

SELECT isBenefitCoodinator FROM EMPLOYEE WHERE employeeId = 1;
--if isben 1 then
SELECT * FROM EducationRequest;
