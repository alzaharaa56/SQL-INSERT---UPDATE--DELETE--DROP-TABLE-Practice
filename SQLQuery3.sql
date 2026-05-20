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


INSERT INTO Employee (SSN, Fname, Lname, Gn, BD, Dnum) VALUES 
('111111111', 'Mohammed', 'Al-Raisi', 'M', '1992-03-12', 1),
('222222222', 'Fatma', 'Al-Zadjali', 'F', '1995-07-22', 2),
('333333333', 'Said', 'Al-Hasni', 'M', '1988-11-05', 3),
('444444444', 'Muna', 'Al-Habsi', 'F', '1997-01-30', 4),
('555555555', 'Khalid', 'Al-Abri', 'M', '1990-09-14', 5),
('666666666', 'Amna', 'Al-Balushi', 'F', '1994-05-18', 6),
('777777777', 'Salim', 'Al-Farsi', 'M', '1985-12-01', 7),
('888888888', 'Asma', 'Al-Alawi', 'F', '1998-08-25', 8),
('999999999', 'Hamad', 'Al-Busaidi', 'M', '1991-04-09', 9),
('101010101', 'Huda', 'Al-Ghafri', 'F', '1993-10-20', 10);






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



UPDATE Work_On
SET W_H = 40
WHERE SSN = '111111111' AND Pnum = 101;


UPDATE Dept
SET Dname = 'Technical Support'
WHERE Dnumber = 2;



DELETE FROM Dependent
WHERE dname = 'Ali' AND SSN = '111111111';

--DROP TABLE Dependent;


SELECT * FROM Location;
SELECT * FROM Project;
SELECT * FROM Work_On;
SELECT * FROM Dependent;