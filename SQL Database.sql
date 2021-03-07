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
	physician_id INT PRIMARY KEY,
    email VARCHAR(40),
    user_password VARCHAR(20),
    FOREIGN KEY(physician_id) REFERENCES physician(physician_id) ON DELETE CASCADE
);

INSERT INTO physician_login VALUES(1, 'deltahacksvii@mcmaster.ca', 'Deltahacksvii');
INSERT INTO physician_login VALUES(2, 'sunb26@mcmaster.ca', 'SQLMaster');
INSERT INTO physician_login VALUES(3, 'wilkem1@mcmaster.ca', 'crosby87');
INSERT INTO physician_login VALUES(4, 'hannoufaa@mcmaster.ca', 'ABriskWalk');
INSERT INTO physician_login VALUES(5, 'fongs@mcmaster.ca', 'iluvtaylorswift');

SELECT * FROM physician_login;
DROP TABLE physician_login;

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

INSERT INTO physician (physician_name, clinic_id) VALUES('Dr. Frankenstein', 1);
DROP TABLE physician;

CREATE TABLE patient (
	patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(30),
    physician_id INT DEFAULT 0,
    health_num VARCHAR(20),
    entry_date VARCHAR(11),
    Family_History VARCHAR(500) DEFAULT 'None',
    injuries_and_symptoms_log VARCHAR(500) DEFAULT 'None',
    prescriptions VARCHAR(250) DEFAULT 'None',
    mental_health_log VARCHAR(500) DEFAULT 'None',
    Miscellaneous_Notes VARCHAR(500) DEFAULT 'None',
    FOREIGN KEY(physician_id) REFERENCES physician(physician_id) ON DELETE CASCADE
);
DROP TABLE patient;

INSERT INTO clinic VALUES(1, 'McMaster Childrens Hospital');
INSERT INTO clinic VALUES(2, 'Juravinski Hospital');  
SELECT * FROM clinic;


INSERT INTO physician(physician_name, clinic_id) VALUES('Dr. Benjamin Sun', 1);
INSERT INTO physician(physician_name, clinic_id) VALUES('Dr. Mathew Wilker', 2);
INSERT INTO physician(physician_name, clinic_id) VALUES('Dr. Akram Hannoufa', 2);
INSERT INTO physician(physician_name, clinic_id) VALUES('Dr. Sheridan Fong', 1);



INSERT INTO patient (patient_name, physician_id, health_num, entry_date) VALUES('Ben Ylin', 1, '1234-567-890-AX', '2017-04-23');
INSERT INTO patient (patient_name, physician_id, health_num, entry_date) VALUES('Ty Lenol', 2, '1234-567-891-AX', '2015-05-27');
INSERT INTO patient (patient_name, physician_id, health_num, entry_date) VALUES('Duck Dynasty', 4, '3234-567-892-AX', '2020-10-05');
INSERT INTO patient (patient_name, physician_id, health_num, entry_date) VALUES('Angela Scott', 3, '1234-567-893-BZ', '2019-08-21');
INSERT INTO patient (patient_name, physician_id, health_num, entry_date) VALUES('Bruce Wayne', 4, '2234-567-894-AX', '2014-09-30');
INSERT INTO patient (patient_name, physician_id, health_num, entry_date) VALUES('Peter Pan', 4, '2234-567-894-AA', '2015-09-30');

SELECT * FROM patient;
DROP TABLE patient;
UPDATE patient SET family_history = 'asfasfasfaf' WHERE health_num = '1234-567-890-AX';

SELECT patient_id FROM patient WHERE health_num = '1234-567-890-AX';

SELECT entry_date, family_history FROM patient WHERE entry_date = '2020-10-05' AND health_num = '3234-567-892-AX';

#Sample Query
SELECT clinic.clinic_name, physician.physician_name, patient.patient_name FROM clinic, physician, patient 
WHERE patient.physician_id = physician.physician_id AND physician.clinic_id = clinic.clinic_id;
