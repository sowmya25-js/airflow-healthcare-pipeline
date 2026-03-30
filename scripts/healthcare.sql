CREATE TABLE IF NOT EXISTS patients(
    patient_id SERIAL PRIMARY KEY,
    name TEXT,
    age INT,
    gender TEXT,
    disease TEXT,
    admission_date DATE,
    hospital TEXT
);

INSERT INTO patients (name, age, gender, disease, admission_date, hospital)
SELECT
    'Patient_' || gs,
    (random()*60 + 20)::INT,
    CASE WHEN random() > 0.5 THEN 'Male' ELSE 'Female' END,
    CASE 
        WHEN random() < 0.25 THEN 'Diabetes'
        WHEN random() < 0.5 THEN 'Hypertension'
        WHEN random() < 0.75 THEN 'Asthma'
        ELSE 'Cardiac'
    END,
    CURRENT_DATE - (random()*30)::INT,
    CASE 
        WHEN random() < 0.33 THEN 'Apollo'
        WHEN random() < 0.66 THEN 'KIMS'
        ELSE 'Yashoda'
    END
FROM generate_series(1,100) gs;

INSERT INTO patients (name, age, gender, disease, admission_date, hospital)
VALUES 
('Patient_200', 50, 'Male', 'Diabetes', CURRENT_DATE, 'Apollo'),
('Patient_201', 28, 'Female', 'Asthma', CURRENT_DATE, 'KIMS');
