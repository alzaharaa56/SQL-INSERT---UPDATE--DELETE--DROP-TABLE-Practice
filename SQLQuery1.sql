

USE CompanyDB;
GO


CREATE TABLE Employee (
    SSN CHAR(9) PRIMARY KEY,
    Fname VARCHAR(15),
    Lname VARCHAR(15),
    Gn CHAR(1),
    BD DATE,
    Dnum INT,
    super_id CHAR(9),
    CONSTRAINT FK_Super FOREIGN KEY (super_id) REFERENCES Employee(SSN));



CREATE TABLE Dept (
    Dname VARCHAR(25) UNIQUE,
    Dnumber INT PRIMARY KEY,
    Mgr_id CHAR(9),
    hairdate DATE,
    CONSTRAINT FK_Manager FOREIGN KEY (Mgr_id) REFERENCES Employee(SSN) );

CREATE TABLE Location (

Dnum INT,
loc VARCHAR(20),
    PRIMARY KEY (Dnum, loc),
    CONSTRAINT FK_DeptLoc FOREIGN KEY (Dnum) REFERENCES Dept(Dnumber)
);

CREATE TABLE Project (
Pname VARCHAR(25) UNIQUE,
    Pnum INT PRIMARY KEY,
    City VARCHAR(20),
    Location VARCHAR(20),
    Dnum INT,
    CONSTRAINT FK_DeptProj FOREIGN KEY (Dnum) REFERENCES Dept(Dnumber)
);

CREATE TABLE Work_On (
SSN CHAR(9),
Pnum INT,
W_H INT,
PRIMARY KEY (SSN, Pnum),
    CONSTRAINT FK_EmpWork FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    CONSTRAINT FK_ProjWork FOREIGN KEY (Pnum) REFERENCES Project(Pnum)
);

CREATE TABLE Dependent(

dname VARCHAR(15),
    Gen CHAR(1),
    BD DATE,
    SSN CHAR(9),
    PRIMARY KEY (SSN, dname),
    CONSTRAINT FK_EmpDep FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);





SELECT * FROM Employee;
SELECT Fname, Lname FROM Employee WHERE Dnum = 1;
SELECT Pname FROM Project WHERE City = 'Muscat';





