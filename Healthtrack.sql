create database healthtrack;
use healthtrack;
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
);

CREATE TABLE Appointment (
    appt_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appt_date DATE,
    appt_time TIME,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Treatment (
    treat_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis VARCHAR(200),
    prescription VARCHAR(200),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);


CREATE TABLE Bill (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);



INSERT INTO Doctor VALUES
(1, 'Dr. Mehta', 'Cardiologist', '9876543210'),
(2, 'Dr. Sharma', 'Dermatologist', '9123456780');

INSERT INTO Patient VALUES
(101, 'Amit Kumar', 45, 'Male', '9991112222'),
(102, 'Neha Singh', 32, 'Female', '8883334444');

INSERT INTO Appointment VALUES
(1, 1, 101, '2025-09-10', '10:00:00'),
(2, 2, 102, '2025-09-11', '11:30:00');

INSERT INTO Treatment VALUES
(1, 101, 1, 'High BP', 'Medicine A'),
(2, 102, 2, 'Skin Allergy', 'Ointment B');

INSERT INTO Bill VALUES
(1, 101, 5000, 'Paid'),
(2, 102, 2500, 'Unpaid');

-- 1. List of all patients with their doctor (JOIN)
SELECT p.name AS Patient, d.name AS Doctor, a.appt_date, a.appt_time
FROM Appointment a
JOIN Patient p ON a.patient_id = p.patient_id
JOIN Doctor d ON a.doctor_id = d.doctor_id;

-- 2. Patients who have unpaid bills
SELECT p.name, b.amount
FROM Patient p
JOIN Bill b ON p.patient_id = b.patient_id
WHERE b.payment_status = 'Unpaid';

-- 3. Doctors and number of patients treated
SELECT d.name, COUNT(t.treat_id) AS total_treatments
FROM Doctor d
JOIN Treatment t ON d.doctor_id = t.doctor_id
GROUP BY d.name;


-- 1. Create Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

ALTER TABLE Doctor
ADD dept_id INT,
ADD FOREIGN KEY (dept_id) REFERENCES Department(dept_id);

-- 3. Insert Departments
INSERT INTO Department VALUES
(1, 'Cardiology'),
(2, 'Dermatology'),
(3, 'Neurology');

UPDATE Doctor SET dept_id = 1 WHERE doctor_id = 1;  -- Dr. Mehta → Cardiology
UPDATE Doctor SET dept_id = 2 WHERE doctor_id = 2;  -- Dr. Sharma → Dermatology

-- 5. Example query: Patients with Doctor and Department
SELECT p.name AS Patient, d.name AS Doctor, dept.dept_name AS Department, a.appt_date, a.appt_time
FROM Appointment a
JOIN Patient p ON a.patient_id = p.patient_id
JOIN Doctor d ON a.doctor_id = d.doctor_id
JOIN Department dept ON d.dept_id = dept.dept_id;

DESC DOCTOR;
USE HEALTHTRACK;
desc doctor;
desc patient;
DESC APPOINTMENT;
DESC TREATMENT;
DESC BILL;
DESC DEPARTMENT; 
use healthtrack;
select * from doctor;
SELECT * FROM PATIENT;
SELECT * FROM APPOINTMENT;
SELECT * FROM TREATMENT;
SELECT * FROM BILL;
SELECT * FROM DEPARTMENT;

INSERT INTO Department VALUES
(4, 'Pediatrics'),
(5, 'Orthopedics');
INSERT INTO Doctor VALUES
(3, 'Dr. Rao', 'Neurologist', '9988776655', 3),
(4, 'Dr. Kapoor', 'Pediatrician', '9876501234', 4),
(5, 'Dr. Sen', 'Orthopedic', '9123405678', 5);
INSERT INTO Patient VALUES
(103, 'Ravi Verma', 60, 'Male', '7775556666'),
(104, 'Anita Desai', 28, 'Female', '9990001111'),
(105, 'Suresh Patel', 50, 'Male', '8882223333');
INSERT INTO Appointment VALUES
(3, 3, 103, '2025-09-12', '09:45:00'),
(4, 4, 104, '2025-09-13', '14:00:00'),
(5, 5, 105, '2025-09-14', '15:30:00');
INSERT INTO Treatment VALUES
(3, 103, 3, 'Migraine', 'Painkiller C'),
(4, 104, 4, 'Fever', 'Paracetamol'),
(5, 105, 5, 'Fracture', 'Cast & Rest');
INSERT INTO Bill VALUES
(3, 103, 3000, 'Paid'),
(4, 104, 1500, 'Unpaid'),
(5, 105, 7000, 'Paid');
select * from doctor;
select * from patient;
select * from appointment;
select * from treatment;
select * from bill;
select * from department;
-- (Optional) add departments (won't error if same id exists)
INSERT IGNORE INTO Department (dept_id, dept_name) VALUES
(11, 'Endocrinology'),
(12, 'Rheumatology'),
(13, 'Pulmonology');

-- 1) Doctors (doctor_id 1001..1010)
INSERT INTO Doctor (doctor_id, name, specialization, phone, dept_id) VALUES
(6, 'Dr. Ahuja', 'Cardiologist', '9001112223', NULL),
(7, 'Dr. Bhatia', 'Dermatologist', '9002223334', NULL),
(8, 'Dr. Chatterjee', 'Neurologist', '9003334445', NULL),
(9, 'Dr. Desai', 'Pediatrician', '9004445556', NULL),
(10, 'Dr. Elango', 'Orthopedic', '9005556667', NULL),
(11, 'Dr. Farooqi', 'Oncologist', '9006667778', NULL),
(12, 'Dr. Goswami', 'Psychiatrist', '9007778889', NULL),
(13, 'Dr. Hegde', 'ENT Specialist', '9008889990', NULL),
(14, 'Dr. Iyer', 'Gastroenterologist', '9001122334', NULL),
(15, 'Dr. Yadav', 'Urologist', '9002233445', NULL);

-- 2) Patients (patient_id 2001..2010)
INSERT INTO Patient (patient_id, name, age, gender, phone) VALUES
(106, 'Vikram Singh', 50, 'Male', '7011110001'),
(107, 'Ritu Malhotra', 34, 'Female', '7011110002'),
(108, 'Sanjay Rao', 61, 'Male', '7011110003'),
(109, 'Kavita Mehra', 27, 'Female', '7011110004'),
(110, 'Mohit Sharma', 45, 'Male', '7011110005'),
(111, 'Tanya Singh', 39, 'Female', '7011110006'),
(112, 'Rajesh Kumar', 58, 'Male', '7011110007'),
(113, 'Neelam Patel', 22, 'Female', '7011110008'),
(114, 'Pankaj Verma', 36, 'Male', '7011110009'),
(115, 'Meera Joshi', 29, 'Female', '7011110010');

-- 3) Appointments (appt_id 3001..3010) — referencing the new doctors & patients
INSERT INTO Appointment (appt_id, doctor_id, patient_id, appt_date, appt_time) VALUES
(6, 6, 106, '2025-09-18', '09:00:00'),
(7, 7, 107, '2025-09-18', '10:30:00'),
(8,8, 108, '2025-09-19', '11:15:00'),
(9, 9, 109, '2025-09-19', '13:00:00'),
(10, 10, 110, '2025-09-20', '14:30:00'),
(11, 11, 111, '2025-09-20', '15:30:00'),
(12, 12, 112, '2025-09-21', '09:45:00'),
(13, 13, 113, '2025-09-21', '10:15:00'),
(14, 14, 114, '2025-09-22', '11:00:00'),
(15, 15, 115, '2025-09-22', '16:00:00');

-- 4) Treatments (treat_id 4001..4010)
INSERT INTO Treatment (treat_id, patient_id, doctor_id, diagnosis, prescription) VALUES
(6, 106, 6, 'Hypertension', 'Medicine A'),
(7,107, 7, 'Eczema', 'Ointment B'),
(8, 108, 8, 'Migraine', 'Painkiller C'),
(9, 109, 9, 'Viral Fever', 'Rest + Paracetamol'),
(10, 110, 10, 'Knee Pain', 'Physiotherapy + Painkiller'),
(11, 111, 11, 'Bronchitis', 'Antibiotics'),
(12, 112, 12, 'Depression', 'Therapy + Meds'),
(13, 113, 13, 'Ear Wax / Infection', 'Ear Drops'),
(14, 114, 14, 'Ulcer', 'PPI'),
(15, 115, 15, 'Kidney Stone', 'Surgery Advice');

-- 5) Bills (bill_id 5001..5010)
INSERT INTO Bill (bill_id, patient_id, amount, payment_status) VALUES
(6, 106, 5500.00, 'Paid'),
(7, 107, 3200.00, 'Unpaid'),
(8, 108, 7800.00, 'Paid'),
(9, 109, 1400.00, 'Paid'),
(10, 110, 6500.00, 'Unpaid'),
(11, 111, 2100.00, 'Paid'),
(12, 112, 4000.00, 'Unpaid'),
(13, 113, 900.00,  'Paid'),
(14, 114, 12500.00,'Paid'),
(15, 115, 15000.00,'Unpaid');
select * from doctor;
select * from patient;
select * from appointment;
select * from treatment;
select * from bill;
select * from department;
INSERT INTO Department (dept_id, dept_name) VALUES
(14, 'Endocrinology'),
(15, 'Rheumatology'),
(16, 'Pulmonology'),
(17, 'Ophthalmology'),
(188, 'Nephrology');
select * from department;

SELECT p.name, b.amount
FROM Patient p
JOIN Bill b ON p.patient_id = b.patient_id
WHERE b.amount > (
    SELECT AVG(amount) FROM Bill
);

SELECT name 
FROM Doctor 
WHERE dept_id = (
    SELECT dept_id 
    FROM Department 
    WHERE dept_name = 'Cardiology'
);


SELECT name 
FROM Patient 
WHERE patient_id IN (
    SELECT patient_id 
    FROM Bill 
    WHERE payment_status = 'Unpaid'
);

SELECT name 
FROM Patient 
WHERE patient_id IN (
    SELECT patient_id 
    FROM Bill 
    WHERE payment_status = 'Unpaid'
);

SELECT name
FROM Patient
WHERE patient_id = (
    SELECT patient_id 
    FROM Treatment 
    WHERE diagnosis = 'Fever'
);

SELECT name
FROM Patient
WHERE patient_id IN (
    SELECT patient_id
    FROM Bill
    WHERE amount = (SELECT MIN(amount) FROM Bill)
);

SELECT p.name AS Patient, d.name AS Doctor
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id
JOIN Doctor d ON a.doctor_id = d.doctor_id;

SELECT p.name AS Patient, b.amount, b.payment_status
FROM Patient p
JOIN Bill b ON p.patient_id = b.patient_id;

SELECT t.diagnosis, t.prescription, p.name AS Patient, d.name AS Doctor
FROM Treatment t
JOIN Patient p ON t.patient_id = p.patient_id
JOIN Doctor d ON t.doctor_id = d.doctor_id;

CREATE VIEW Patient_Doctor_View AS
SELECT p.name AS Patient, d.name AS Doctor
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id
JOIN Doctor d ON a.doctor_id = d.doctor_id;

SELECT * from Patient_Doctor_View;

CREATE VIEW Patient_Bill_View AS
SELECT p.name AS Patient, b.amount, b.payment_status
FROM Patient p
JOIN Bill b ON p.patient_id = b.patient_id;

SELECT * FROM Patient_Bill_View;

CREATE VIEW Doctor_Department_View AS
SELECT d.name AS Doctor, dept.dept_name AS Department
FROM Doctor d
JOIN Department dept ON d.dept_id = dept.dept_id;

SELECT * FROM Doctor_Department_View;



















