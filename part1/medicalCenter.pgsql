DROP DATABASE IF EXISTS medicalCenter;

CREATE DATABASE medicalCenter;

DROP TABLE IF EXISTS doctors CASCADE;
DROP TABLE IF EXISTS patients CASCADE;
DROP TABLE IF EXISTS diseases CASCADE;
DROP TABLE IF EXISTS visits CASCADE;
DROP TABLE IF EXISTS diagnoses CASCADE;


CREATE TABLE doctors(id SERIAL PRIMARY KEY,
    name text NOT NULL,
    specialty text);

    CREATE TABLE patients(id SERIAL PRIMARY KEY,
    name text NOT NULL,
    insurance text,
    birthday DATE);


CREATE TABLE diseases(id SERIAL PRIMARY KEY,
     name text NOT NULL,
     description text);

CREATE TABLE visits (id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES doctors(id) ON DELETE SET NULL,
    patient_id INTEGER NOT NULL REFERENCES patients(id) ON DELETE SET NULL,
    visit_date DATE NOT NULL);


CREATE TABLE diagnoses(id SERIAL PRIMARY KEY,
    visit_id INTEGER NOT NULL REFERENCES visits(id) ON DELETE SET NULL,
    disease_id INTEGER NOT NULL REFERENCES diseases(id) ON DELETE SET NULL);

INSERT INTO doctors (name, specialty)
    VALUES ('Dr. Lawrence','Brain Surgeon'),
    ('Dr. Jesus','Heart Surgeon'),
    ('Dr. Leslie','Leg Surgeon');

INSERT INTO patients (name, insurance, birthday)
    VALUES ('Maria','Kaiser','1990-05-15'),
 ('Vanessa','Blue Shield','1991-05-15'), 
 ('Minerva','Kaiser','1992-05-15');

 INSERT INTO diseases (name, description)
    VALUES ('COVID','Long term'),
 ('Flu','Short term'), 
  ('Chicken Pox','Short term');

INSERT INTO visits (doctor_id,patient_id,visit_date)
VALUES (1,3,'2023-05-15'),
(3,2,'2023-03-15'),
(2,3,'2023-08-15');

INSERT INTO diagnoses (visit_id,disease_id)
VALUES (1,3),
(2,1),
(3,1);