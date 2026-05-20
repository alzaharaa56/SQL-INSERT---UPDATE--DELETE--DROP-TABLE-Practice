CREATE DATABASE HospitalManagementDB;
GO
USE HospitalManagementDB;
GO

CREATE TABLE DEPARTMENT (
Dept_id INT PRIMARY KEY,
Dept_name VARCHAR(100) NOT NULL,
Location VARCHAR(255),
No_of_doctors INT DEFAULT 0,
Contact_number VARCHAR(20),
Manager_id INT,
Hiring_date DATE);

CREATE TABLE PATIENT (
    Patient_id INT PRIMARY KEY,
    F_name VARCHAR(50) NOT NULL,
    L_name VARCHAR(50) NOT NULL,
    DOB DATE,
    Gender VARCHAR(10),
    Blood_group VARCHAR(5),
    Email VARCHAR(100),
    Address VARCHAR(255),
    Phone_no VARCHAR(20));

CREATE TABLE DOCTOR (
    Doctor_id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Qualification VARCHAR(100),
    Years_of_experience INT,
    Phone_no VARCHAR(20),
    License_no VARCHAR(50),
    Dept_id INT,
    CONSTRAINT fk_doctor_dept FOREIGN KEY (Dept_id) REFERENCES DEPARTMENT(Dept_id));


CREATE TABLE SERVICE (
    Service_id INT PRIMARY KEY,
    Service_name VARCHAR(100) NOT NULL,
    Service_type VARCHAR(50),
    Unit_price DECIMAL(10, 2),
    Description TEXT,
    Dept_id INT,
    CONSTRAINT fk_service_dept FOREIGN KEY (Dept_id) REFERENCES DEPARTMENT(Dept_id));

CREATE TABLE APPOINTMENT (
    Appointment_id INT PRIMARY KEY,
    Doctor_id INT,
    Patient_id INT,
    App_date DATE,
    App_time TIME,
    App_type VARCHAR(50),
    Reason TEXT,
    Status VARCHAR(20) DEFAULT 'Scheduled',
    CONSTRAINT fk_app_doctor FOREIGN KEY (Doctor_id) REFERENCES DOCTOR(Doctor_id),
    CONSTRAINT fk_app_patient FOREIGN KEY (Patient_id) REFERENCES PATIENT(Patient_id));

CREATE TABLE APPOINTMENT_SERVICE (
    Appointment_id INT,
    Service_id INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (Appointment_id, Service_id),
    CONSTRAINT fk_link_app FOREIGN KEY (Appointment_id) REFERENCES APPOINTMENT(Appointment_id),
    CONSTRAINT fk_link_service FOREIGN KEY (Service_id) REFERENCES SERVICE(Service_id));


CREATE TABLE MEDICAL_RECORD (
    Record_id INT PRIMARY KEY,
    Patient_id INT,
    Doctor_id INT,
    Appointment_id INT,
    Visit_date DATE,
    Diagnosis TEXT,
    Treatment_plan TEXT,
    Prescribed_medications TEXT,
    Doctor_notes TEXT,
    CONSTRAINT fk_rec_patient FOREIGN KEY (Patient_id) REFERENCES PATIENT(Patient_id),
    CONSTRAINT fk_rec_doctor FOREIGN KEY (Doctor_id) REFERENCES DOCTOR(Doctor_id),
    CONSTRAINT fk_rec_app FOREIGN KEY (Appointment_id) REFERENCES APPOINTMENT(Appointment_id));


CREATE TABLE BILLING (
    Bill_id INT PRIMARY KEY,
    Patient_id INT,
    Appointment_id INT,
    Bill_date DATE,
    Total_amount DECIMAL(10, 2),
    Payment_status VARCHAR(20),
    Payment_method VARCHAR(50),
    Due_date DATE,
    CONSTRAINT fk_bill_patient FOREIGN KEY (Patient_id) REFERENCES PATIENT(Patient_id),
    CONSTRAINT fk_bill_app FOREIGN KEY (Appointment_id) REFERENCES APPOINTMENT(Appointment_id));

ALTER TABLE DEPARTMENT
ADD CONSTRAINT fk_dept_manager FOREIGN KEY (Manager_id) REFERENCES DOCTOR(Doctor_id);



INSERT INTO DEPARTMENT (Dept_id, Dept_name, Location, No_of_doctors, Contact_number, Hiring_date) VALUES 
(1, 'Cardiology', 'Building A-F1', 5, '24400101', '2026-01-01'),
(2, 'Pediatrics', 'Building B-F1', 4, '24400102', '2026-01-05'),
(3, 'Orthopedics', 'Building A-F2', 3, '24400103', '2026-01-10'),
(4, 'Neurology', 'Building C-F1', 2, '24400104', '2026-02-01'),
(5, 'Dermatology', 'Building B-F2', 2, '24400105', '2026-02-15'),
(6, 'Emergency', 'Ground Floor', 10, '24400106', '2026-01-01'),
(7, 'Radiology', 'Basement 1', 4, '24400107', '2026-03-01'),
(8, 'Surgery', 'Building C-F3', 6, '24400108', '2026-03-10'),
(9, 'Internal Medicine', 'Building A-F3', 5, '24400109', '2026-04-01'),
(10, 'ENT', 'Building B-F3', 3, '24400110', '2026-04-15');


INSERT INTO DOCTOR (Doctor_id, Name, Specialization, Qualification, Years_of_experience, Phone_no, Dept_id) VALUES 
(501, 'Dr. Ahmed Al-Raisi', 'Cardiologist', 'MD', 15, '91001001', 1),
(502, 'Dr. Sara Al-Balushi', 'Pediatrician', 'PhD', 8, '91001002', 2),
(503, 'Dr. Salim Al-Abri', 'Surgeon', 'MD', 20, '91001003', 8),
(504, 'Dr. Muna Al-Habsi', 'Neurologist', 'MD', 10, '91001004', 4),
(505, 'Dr. Khalid Al-Farsi', 'Dermatologist', 'MSc', 5, '91001005', 5),
(506, 'Dr. Fatma Al-Zadjali', 'ENT Specialist', 'MD', 12, '91001006', 10),
(507, 'Dr. Hamad Al-Busaidi', 'GP', 'MD', 7, '91001007', 9),
(508, 'Dr. Huda Al-Ghafri', 'Radiologist', 'MD', 11, '91001008', 7),
(509, 'Dr. Said Al-Hasni', 'Orthopedist', 'MD', 14, '91001009', 3),
(510, 'Dr. Amna Al-Amiri', 'ER Doctor', 'MD', 6, '91001010', 6);


INSERT INTO PATIENT (Patient_id, F_name, L_name, DOB, Gender, Blood_group, Phone_no, Address) VALUES 
(101, 'Ali', 'Al-Khanjari', '1985-04-12', 'Male', 'A+', '99001122', 'Muscat'),
(102, 'Laila', 'Al-Mahrouqi', '1992-08-25', 'Female', 'O-', '99001133', 'Nizwa'),
(103, 'Youssef', 'Al-Hadi', '1978-11-30', 'Male', 'B+', '99001144', 'Sohar'),
(104, 'Maryam', 'Al-Riyami', '2000-01-15', 'Female', 'A-', '99001155', 'Ibri'),
(105, 'Fahad', 'Al-Shuaili', '1988-05-20', 'Male', 'O+', '99001166', 'Sur'),
(106, 'Nadia', 'Al-Farsi', '1995-09-10', 'Female', 'AB+', '99001177', 'Salalah'),
(107, 'Oman', 'Al-Kalbani', '1982-12-05', 'Male', 'B-', '99001188', 'Buraimi'),
(108, 'Basma', 'Al-Kindi', '1998-03-22', 'Female', 'O+', '99001199', 'Barka'),
(109, 'Zaid', 'Al-Hasni', '2010-07-08', 'Male', 'A+', '99001200', 'Rustaq'),
(110, 'Asma', 'Al-Alawi', '1991-02-14', 'Female', 'O-', '99001211', 'Seeb');

INSERT INTO SERVICE (Service_id, Service_name, Service_type, Unit_price, Dept_id) VALUES 
(1, 'Blood Test', 'Lab', 15.00, 9),
(2, 'X-Ray', 'Radiology', 25.00, 7),
(3, 'Consultation', 'Visit', 20.00, 9),
(4, 'MRI Scan', 'Radiology', 120.00, 7),
(5, 'Vaccination', 'Prevention', 10.00, 2),
(6, 'ECG', 'Cardiology', 35.00, 1),
(7, 'Suture', 'Surgery', 45.00, 6),
(8, 'Hearing Test', 'ENT', 15.00, 10),
(9, 'Skin Biopsy', 'Dermatology', 60.00, 5),
(10, 'Ultrasound', 'Radiology', 40.00, 7);

INSERT INTO APPOINTMENT (Appointment_id, Doctor_id, Patient_id, App_date, App_time, App_type, Status) VALUES 
(2001, 501, 101, '2026-05-21', '09:00:00', 'Checkup', 'Scheduled'),
(2002, 502, 109, '2026-05-21', '10:00:00', 'Emergency', 'Scheduled'),
(2003, 503, 103, '2026-05-22', '11:30:00', 'Follow-up', 'Scheduled'),
(2004, 504, 104, '2026-05-22', '08:45:00', 'Consultation', 'Scheduled'),
(2005, 505, 106, '2026-05-23', '12:00:00', 'Checkup', 'Scheduled'),
(2006, 506, 102, '2026-05-23', '09:15:00', 'Surgery', 'Scheduled'),
(2007, 507, 105, '2026-05-24', '10:30:00', 'Checkup', 'Scheduled'),
(2008, 508, 110, '2026-05-24', '13:00:00', 'Radiology', 'Scheduled'),
(2009, 509, 107, '2026-05-25', '08:00:00', 'Follow-up', 'Scheduled'),
(2010, 510, 108, '2026-05-25', '14:00:00', 'Emergency', 'Scheduled');



SELECT * FROM DEPARTMENT;
SELECT * FROM DOCTOR;
SELECT * FROM PATIENT;
SELECT * FROM SERVICE;
SELECT * FROM APPOINTMENT;
SELECT * FROM MEDICAL_RECORD;
SELECT * FROM BILLING;
SELECT * FROM APPOINTMENT_SERVICE;

UPDATE DEPARTMENT
SET Manager_id = 501
WHERE Dept_id = 1;

UPDATE DEPARTMENT
SET Manager_id = 502
WHERE Dept_id = 2;

UPDATE DOCTOR
SET License_no = 'OM-77889'
WHERE Doctor_id = 502;

UPDATE DOCTOR
SET License_no = 'OM-55443'
WHERE Doctor_id = 503;


UPDATE DEPARTMENT SET Manager_id = 503 WHERE Dept_id = 3; -- Orthopedics
UPDATE DEPARTMENT SET Manager_id = 504 WHERE Dept_id = 4; -- Neurology
UPDATE DEPARTMENT SET Manager_id = 505 WHERE Dept_id = 5; -- Dermatology
UPDATE DEPARTMENT SET Manager_id = 510 WHERE Dept_id = 6; -- Emergency
UPDATE DEPARTMENT SET Manager_id = 508 WHERE Dept_id = 7; -- Radiology
UPDATE DEPARTMENT SET Manager_id = 503 WHERE Dept_id = 8; -- Surgery
UPDATE DEPARTMENT SET Manager_id = 507 WHERE Dept_id = 9; -- Internal Medicine
UPDATE DEPARTMENT SET Manager_id = 506 WHERE Dept_id = 10; -- ENT

UPDATE DOCTOR SET License_no = 'OM-22334' WHERE Doctor_id = 501;
UPDATE DOCTOR SET License_no = 'OM-99887' WHERE Doctor_id = 504;
UPDATE DOCTOR SET License_no = 'OM-11223' WHERE Doctor_id = 505;
UPDATE DOCTOR SET License_no = 'OM-44556' WHERE Doctor_id = 506;
UPDATE DOCTOR SET License_no = 'OM-66778' WHERE Doctor_id = 507;
UPDATE DOCTOR SET License_no = 'OM-88990' WHERE Doctor_id = 508;
UPDATE DOCTOR SET License_no = 'OM-33445' WHERE Doctor_id = 509;
UPDATE DOCTOR SET License_no = 'OM-55667' WHERE Doctor_id = 510;

UPDATE PATIENT SET Email = 'youssef@email.com' WHERE Patient_id = 103;
UPDATE PATIENT SET Email = 'maryam@email.com' WHERE Patient_id = 104;
UPDATE PATIENT SET Email = 'fahad@email.com' WHERE Patient_id = 105;
UPDATE PATIENT SET Email = 'nadia@email.com' WHERE Patient_id = 106;
UPDATE PATIENT SET Email = 'oman@email.com' WHERE Patient_id = 107;
UPDATE PATIENT SET Email = 'basma@email.com' WHERE Patient_id = 108;
UPDATE PATIENT SET Email = 'zaid@email.com' WHERE Patient_id = 109;
UPDATE PATIENT SET Email = 'asma@email.com' WHERE Patient_id = 110;


UPDATE SERVICE SET Description = 'Routine blood analysis' WHERE Service_id = 1;
UPDATE SERVICE SET Description = 'Standard chest X-ray' WHERE Service_id = 2;
UPDATE SERVICE SET Description = 'General health consultation' WHERE Service_id = 3;
UPDATE SERVICE SET Description = 'High resolution brain MRI' WHERE Service_id = 4;
UPDATE SERVICE SET Description = 'Seasonal flu vaccine' WHERE Service_id = 5;
UPDATE SERVICE SET Description = 'Heart rhythm monitoring' WHERE Service_id = 6;
UPDATE SERVICE SET Description = 'Minor surgical procedure' WHERE Service_id = 7;

UPDATE APPOINTMENT SET Reason = 'General Checkup' WHERE App_type = 'Checkup' AND Reason IS NULL;
UPDATE APPOINTMENT SET Reason = 'Emergency Case' WHERE App_type = 'Emergency' AND Reason IS NULL;
UPDATE APPOINTMENT SET Reason = 'Routine Follow-up' WHERE App_type = 'Follow-up' AND Reason IS NULL;
UPDATE APPOINTMENT SET Reason = 'Specialist Consultation' WHERE App_type = 'Consultation' AND Reason IS NULL;
UPDATE APPOINTMENT SET Reason = 'Pre-surgery consultation' WHERE App_type = 'Surgery' AND Reason IS NULL;
UPDATE APPOINTMENT SET Reason = 'Diagnostic Imaging' WHERE App_type = 'Radiology' AND Reason IS NULL;


DELETE FROM APPOINTMENT 
WHERE Appointment_id = 2001;

DELETE FROM BILLING 
WHERE Payment_status = 'Paid';


--DROP TABLE MEDICAL_RECORD;