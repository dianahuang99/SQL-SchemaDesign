-- Design the schema for a medical center.
-- A medical center employs several doctors
-- A doctors can see many patients
-- A patient can be seen by many doctors
-- During a visit, a patient may be diagnosed to have one or more diseases.
-- 1 center with many doctors
-- many patients many doctors
-- 1 patient many diseases
CREATE DATABASE medical_center;

\ c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    tenure INT NOT NULL default 0
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    patient_name TEXT NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors ON DELETE CASCADE,
    patient_id INT REFERENCES patients ON DELETE CASCADE,
    date_visited DATE
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES visits ON DELETE CASCADE,
    disease_id INT REFERENCES diseases ON DELETE CASCADE
);