#Database name = deltahacksVII


CREATE TABLE patient_login (
	patient_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(40),
    user_password VARCHAR(20),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE
);
SELECT * FROM patient_login;
INSERT INTO patient_login (email,user_password) VALUES('deltahacksvii@mcmaster.ca','parallelogram');
CREATE TABLE physician_login (
	physician_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(20),
    user_password VARCHAR(20),
    FOREIGN KEY(physician_id) REFERENCES physician(physician_id) ON DELETE CASCADE
);

CREATE TABLE clinic (
	clinic_id INT PRIMARY KEY AUTO_INCREMENT,
    clinic_name VARCHAR(50)
);
    
CREATE TABLE physician (
	physician_id INT PRIMARY KEY AUTO_INCREMENT,
    physician_name VARCHAR(30),
    clinic_id INT,
    FOREIGN KEY(clinic_id) REFERENCES clinic(clinic_id) ON DELETE CASCADE
);    
    
CREATE TABLE patient (
	patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(30),
    physician_id INT,
    FOREIGN KEY(physician_id) REFERENCES physician(physician_id) ON DELETE CASCADE
);

CREATE TABLE prescription (
	perscription_name VARCHAR(20) PRIMARY KEY,
    date_prescribed DATE,
    notes VARCHAR(300) default 'None',
    patient_id INT,
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE
);
DROP TABLE prescription;
SELECT * FROM prescription;
    
INSERT INTO clinic VALUES(1, 'McMaster Childrens Hospital');
INSERT INTO clinic VALUES(2, 'Juravinski Hospital');  
SELECT * FROM clinic;


INSERT INTO physician VALUES(1, 'Dr. Benjamin Sun', 1);
INSERT INTO physician VALUES(2, 'Dr. Mathew Wilker', 2);
INSERT INTO physician VALUES(3, 'Dr. Akram Hannoufa', 2);
INSERT INTO physician VALUES(4, 'Dr. Sheridan Fong', 1);

INSERT INTO patient VALUES(1, 'Ben Ylin', 1);
INSERT INTO patient VALUES(2, 'Ty Lenol', 2);
INSERT INTO patient VALUES(3, 'Duck Dynasty', 4);
INSERT INTO patient VALUES(4, 'Angela Scott', 3);
INSERT INTO patient VALUES(5, 'Bruce Wayne', 4);

SELECT * FROM patient;

INSERT INTO prescription VALUES('Tylenol 3', 2);

#Sample Query
SELECT clinic.clinic_name, physician.physician_name, patient.patient_name FROM clinic, physician, patient 
WHERE patient.physician_id = physician.physician_id AND physician.clinic_id = clinic.clinic_id;

ALTER TABLE patient ADD health_num INT;


