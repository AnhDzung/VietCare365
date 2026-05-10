ALTER TABLE users
    MODIFY COLUMN role ENUM('ADMIN','DOCTOR','NURSE','RECEPTIONIST','PATIENT') NOT NULL DEFAULT 'RECEPTIONIST';

ALTER TABLE patients
    ADD COLUMN user_id VARCHAR(36) NULL AFTER email;

CREATE INDEX idx_patients_user_id ON patients(user_id);

ALTER TABLE patients
    ADD CONSTRAINT fk_patients_user_id
    FOREIGN KEY (user_id) REFERENCES users(id);