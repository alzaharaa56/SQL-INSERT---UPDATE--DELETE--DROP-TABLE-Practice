USE CompanyDB;
GO

INSERT INTO Dept (Dname, Dnumber, hairdate) VALUES 
('IT', 2, '2026-01-10'),
('Marketing', 3, '2026-02-15'),
('Sales', 4, '2026-03-20'),
('Finance', 5, '2026-04-05'),
('Admin', 6, '2026-05-12'),
('Operations', 7, '2026-01-25'),
('Design', 8, '2026-02-28'),
('Support', 9, '2026-03-10'),
('Legal', 10, '2026-04-18'),
('Quality', 11, '2026-05-01');









SELECT * FROM Employee;
SELECT * FROM Dept;


INSERT INTO Location (Dnum, loc) VALUES 
(2, 'Seeb'),
(3, 'Sohar'),
(4, 'Nizwa'),
(5, 'Salalah'),
(6, 'Ibri'),
(7, 'Sur'),
(8, 'Barka'),
(9, 'Rustaq'),
(10, 'Buraimi'),
(11, 'Khasab');



INSERT INTO Project (Pname, Pnum, City, Location, Dnum) VALUES 
('E-Store', 101, 'Seeb', 'North Office', 2),
('Ad Campaign', 102, 'Sohar', 'Branch A', 3),
('Market Study', 103, 'Nizwa', 'Main Hall', 4),
('Budget Plan', 104, 'Salalah', 'Finance Suite', 5),
('Archive Sys', 105, 'Ibri', 'Admin Building', 6),
('Logistics', 106, 'Sur', 'Port Office', 7),
('UI Redesign', 107, 'Barka', 'Creative Lab', 8),
('Customer Portal', 108, 'Rustaq', 'Support Center', 9),
('Legal Audit', 109, 'Buraimi', 'Legal Wing', 10),
('ISO Standards', 110, 'Khasab', 'Quality Unit', 11);



INSERT INTO Work_On (SSN, Pnum, W_H) VALUES 
('111111111', 101, 30),
('222222222', 102, 25),
('333333333', 103, 40),
('444444444', 104, 35),
('555555555', 105, 20),
('666666666', 106, 45),
('777777777', 107, 15),
('888888888', 108, 50),
('999999999', 109, 10),
('101010101', 110, 30);



INSERT INTO Dependent (dname, Gen, BD, SSN) VALUES 
('Ali', 'M', '2015-05-10', '111111111'),
('Noora', 'F', '2018-02-20', '222222222'),
('Omer', 'M', '2012-11-15', '333333333'),
('Layan', 'F', '2021-08-05', '444444444'),
('Zaid', 'M', '2017-04-12', '555555555'),
('Mariam', 'F', '2019-09-30', '666666666'),
('Fahad', 'M', '2014-01-25', '777777777'),
('Hana', 'F', '2020-06-14', '888888888'),
('Sami', 'M', '2013-03-08', '999999999'),
('Reem', 'F', '2022-12-01', '101010101');




INSERT INTO Employee (SSN, Fname, Lname, Dnum, Salary) VALUES 
('111111111', 'Mohammed', 'Al-Raisi', 1, 1200),
('222222222', 'Fatma', 'Al-Zadjali', 2, 1300),
('333333333', 'Said', 'Al-Hasni', 3, 900),
('444444444', 'Muna', 'Al-Habsi', 4, 950),
('555555555', 'Khalid', 'Al-Abri', 1, 1500),
('666666666', 'Amna', 'Al-Balushi', 2, 1400),
('777777777', 'Salim', 'Al-Farsi', 3, 1100),
('888888888', 'Asma', 'Al-Alawi', 4, 1150),
('999999999', 'Hamad', 'Al-Busaidi', 1, 1000),
('101010101', 'Huda', 'Al-Ghafri', 2, 1050);

UPDATE Employee SET Salary = Salary * 1.10 WHERE Dnum = 1;
UPDATE Dept SET Dname = 'Technical Support' WHERE Dnumber = 1;
UPDATE Project SET Pname = 'E-Store' WHERE Pnum = 10;
UPDATE Employee SET Dnum = 2 WHERE SSN = '101';
UPDATE Employee SET Salary = 1250 WHERE SSN = '105';




UPDATE Employee SET Salary = 1200 WHERE SSN = '111111111';
UPDATE Employee SET Salary = 1300 WHERE SSN = '222222222';
UPDATE Employee SET Salary = 900  WHERE SSN = '333333333';
UPDATE Employee SET Salary = 950  WHERE SSN = '444444444';
UPDATE Employee SET Salary = 1500 WHERE SSN = '555555555';
UPDATE Employee SET Salary = 1400 WHERE SSN = '666666666';
UPDATE Employee SET Salary = 1100 WHERE SSN = '777777777';
UPDATE Employee SET Salary = 1150 WHERE SSN = '888888888';
UPDATE Employee SET Salary = 1000 WHERE SSN = '999999999';
UPDATE Employee SET Salary = 1050 WHERE SSN = '101010101';
UPDATE Employee SET Salary = 1100 WHERE SSN = '123456789';


UPDATE Work_On
SET W_H = 40
WHERE SSN = '111111111' AND Pnum = 101;


UPDATE Dept
SET Dname = 'Technical Support'
WHERE Dnumber = 2;



DELETE FROM Dependent
WHERE dname = 'Ali' AND SSN = '111111111';

--DROP TABLE Dependent;


SELECT Employee.Fname + ' ' + Employee.Lname AS Full_Name, Dept.Dname
FROM Employee
INNER JOIN Dept ON Employee.Dnum = Dept.Dnumber
ORDER BY Full_Name;


SELECT Employee.Fname, Dept.Dname
FROM Employee
LEFT JOIN Dept ON Employee.Dnum = Dept.Dnumber
ORDER BY Employee.Fname;


SELECT Dept.Dname, Location.loc
FROM Dept
RIGHT JOIN Location ON Dept.Dnumber = Location.Dnum
ORDER BY Location.loc;


SELECT 
    Employee.Fname + ' ' + Employee.Lname AS Employee_Name, 
    Project.Pname AS Project_Name, 
    Work_On.W_H AS Working_Hours
FROM Employee
INNER JOIN Work_On ON Employee.SSN = Work_On.SSN
INNER JOIN Project ON Work_On.Pnum = Project.Pnum
ORDER BY Employee_Name;

SELECT Project.Pname, SUM(Work_On.W_H) AS Total_Hours
FROM Project
INNER JOIN Work_On ON Project.Pnum = Work_On.Pnum
GROUP BY Project.Pname
ORDER BY Total_Hours DESC;


--DROP TABLE IF EXISTS Dependent;
--DROP TABLE IF EXISTS Work_On;
--DROP TABLE IF EXISTS Project;
--DROP TABLE IF EXISTS Location;
--DROP TABLE IF EXISTS Employee;
--DROP TABLE IF EXISTS Dept;


SELECT * FROM Location;
SELECT * FROM Project;
SELECT * FROM Work_On;
SELECT * FROM Dependent;