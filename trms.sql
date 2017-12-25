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


INSERT INTO EducationType(EducationTypeId, Name, PercentCovered) VALUES (5, 'Technical Training', .9 );
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
    
    

/*******************************************************************************
   Populate Tables
********************************************************************************/

INSERT INTO DEPARTMENT (DepartmentId, Name) VALUES(1,'Software');
INSERT INTO DEPARTMENT (DepartmentId, Name) VALUES(2,'Human Resources');
INSERT INTO DEPARTMENT (DepartmentId, Name) VALUES(3,'Marketing');
INSERT INTO DEPARTMENT (DepartmentId, Name) VALUES(4,'Production');

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



