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
CREATE SEQUENCE DepartmentId MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 20;


CREATE TABLE Employee
(
    EmployeeId NUMBER NOT NULL , 
    LastName VARCHAR2(200) NOT NULL,
    FirstName VARCHAR2(200) NOT NULL,
    Supervisor NUMBER NOT NULL,
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
CREATE SEQUENCE EmployeeId MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 20;
INSERT INTO EMPLOYEE (LastName, FirstName, Supervisor, Department, Email) VALUES ('Rego', 'Philip', 1, 1,);



CREATE TABLE EducationRequest
(
    EducationRequestId NUMBER NOT NULL,
    EmployeeId NUMBER NOT NULL,
    SupervisorApproval BOOLEAN,
    DepartmentHeadApproval BOOLEAN,
    BenefitCoodinatorApproval BOOLEAN,
    StartDate TIMESTAMP NOT NULL,
    EndDate TIMESTAMP NOT NULL, 
    DaysOff NUMBER,
    Location VARCHAR2(200),
    Justification VARCHAR(2000),
    Cost NUMBER, 
    PresetationDocumentPath VARCHAR2(4096),
    ReimbursmentPaid BOOLEAN, 
    Type NUMBER, 
    
    CONSTRAINT PK_Department PRIMARY KEY (DepartmentId)
);

CREATE TABLE EducationType
(
    EducationTypeId NUMBER NOT NULL,
    Name VARCHAR2(200),
    PercentCovered VARCHAR2(200),

    CONSTRAINT PK_Employee PRIMARY KEY (EmployeeId)
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
    
    







