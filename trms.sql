/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP USER trms CASCADE;

/*******************************************************************************
   Create database
********************************************************************************/
CREATE USER trms
IDENTIFIED BY p4ssw0rd
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA 10M ON users;

GRANT connect to trms;
GRANT resource to trms;
GRANT create session TO trms;
GRANT create table TO trms;
GRANT create view TO trms;

conn trms/p4ssw0rd;

/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE Department
(
    DepartmentId NUMBER NOT NULL,
    Name VARCHAR2(160) NOT NULL,
    Head NUMBER NOT NULL,
    CONSTRAINT PK_Department PRIMARY KEY  (DepartmentId)
);

CREATE TABLE Employee
(
    EmployeeId NUMBER NOT NULL , 
    LastName VARCHAR2(200) NOT NULL,
    FirstName VARCHAR2(200) NOT NULL,
    Supervisor NUMBER NOT NULL,
    Department NUMBER NOT NULL,
    IsBenefitCoodinator BOOLEAN DEFAULT FALSE NOT NULL, 
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

CREATE TABLE EducationRequest
(
    EducationRequestId NUMBER NOT NULL ,
    EmployeeId NUMBER NOT NULL,
    SupervisorApproval BOOLEAN,
    DepartmentHeadApproval BOOLEAN,
    BenefitCoodinatorApproval BOOLEAN,
    StartDate TIMESTAMP NOT NULL,
    EndDate TIMESTAMP NOT NULL, 
    DaysOff NUMBER,
    Location VARCHAR2(200),
    Justification VAR
    
);

CREATE TABLE EducationType
(
    EducationTypeId NUMBER NOT NULL ,
    Name VARCHAR2(200),
    PercentCovered VARCHAR2(200),

    CONSTRAINT PK_Employee PRIMARY KEY (EmployeeId)
)



/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE Department ADD CONSTRAINT FK_DepartmentHead
    FOREIGN KEY (Head) REFERENCES Employee(EmployeeId);

ALTER TABLE Employee ADD CONSTRAINT FK_EmployeeSupervisor
    FOREIGN KEY (Supervisor) REFERENCES Employee(EmployeeId);

ALTER TABLE Employee ADD CONSTRAINT FK_EmployeeDepartment
    FOREIGN KEY (Department) REFERENCES Department(DepartmentId); 
    
    







