CREATE DATABASE hospital;
USE hospital;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    diagnosis VARCHAR(100)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    specialization VARCHAR(50)
);

CREATE TABLE visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    visit_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Insert Patients
INSERT INTO patients (name, age, gender, diagnosis) VALUES
('John Doe', 30, 'Male', 'Fever'),
('Jane Smith', 25, 'Female', 'Fracture'),
('Sam Johnson', 45, 'Male', 'Migraine');

-- Insert Doctors
INSERT INTO doctors (name, specialization) VALUES
('Dr. Smith', 'General Practitioner'),
('Dr. Johnson', 'Orthopedic Surgeon'),
('Dr. Lee', 'Neurologist');

-- Insert Visits
INSERT INTO visits (patient_id, doctor_id, visit_date) VALUES
(1, 1, '2023-01-01'),
(2, 2, '2023-01-02'),
(3, 3, '2023-01-03');

SELECT patients.*, visits.visit_date
FROM patients
JOIN visits ON patients.patient_id = visits.patient_id;

SELECT doctors.*, visits.visit_date
FROM doctors
JOIN visits ON doctors.doctor_id = visits.doctor_id;

SELECT patients.name AS patient_name, doctors.name AS doctor_name, visits.visit_date
FROM visits
JOIN patients ON patients.patient_id = visits.patient_id
JOIN doctors ON doctors.doctor_id = visits.doctor_id;







