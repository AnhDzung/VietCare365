-- Insert test users
INSERT INTO users (id, username, password, email, full_name, role, active, created_at, updated_at, deleted)
VALUES 
('user-admin-001', 'admin', '$2a$10$slYQmyNdGzin7olVN3q9be4DlH.PKZbv5H8KnzzVgXXbVxzy990dm', 'admin@vietcare365.com', 'Quản trị viên', 'ADMIN', 1, NOW(), NOW(), 0),
('user-doctor-001', 'doctor', '$2a$10$slYQmyNdGzin7olVN3q9be4DlH.PKZbv5H8KnzzVgXXbVxzy990dm', 'doctor@vietcare365.com', 'Bác sĩ Nguyễn Văn A', 'DOCTOR', 1, NOW(), NOW(), 0),
('user-nurse-001', 'nurse', '$2a$10$slYQmyNdGzin7olVN3q9be4DlH.PKZbv5H8KnzzVgXXbVxzy990dm', 'nurse@vietcare365.com', 'Y tá Trần Thị B', 'NURSE', 1, NOW(), NOW(), 0),
('user-receptionist-001', 'receptionist', '$2a$10$slYQmyNdGzin7olVN3q9be4DlH.PKZbv5H8KnzzVgXXbVxzy990dm', 'receptionist@vietcare365.com', 'Lễ tân Lê Văn C', 'RECEPTIONIST', 1, NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE updated_at = VALUES(updated_at);

-- Insert test doctors
INSERT INTO doctors (id, user_id, full_name, specialization, license_number, phone, email, created_at, updated_at, deleted)
VALUES 
('doctor-001', 'user-doctor-001', 'Bác sĩ Nguyễn Văn A', 'Tim mạch', 'LIC001', '0901234567', 'doctor1@vietcare365.com', NOW(), NOW(), 0),
('doctor-002', NULL, 'Bác sĩ Phạm Thị D', 'Nhi khoa', 'LIC002', '0908765432', 'doctor2@vietcare365.com', NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE updated_at = VALUES(updated_at);

-- Insert test patients
INSERT INTO patients (id, full_name, date_of_birth, gender, phone, address, email, insurance_number, blood_type, created_at, updated_at, deleted)
VALUES 
('patient-001', 'Bệnh nhân Hoàng Văn E', '1990-05-15', 'MALE', '0912345678', '123 Đường Abc, TP HCM', 'patient1@example.com', 'BHYT001', 'O+', NOW(), NOW(), 0),
('patient-002', 'Bệnh nhân Ngô Thị F', '1995-08-20', 'FEMALE', '0923456789', '456 Đường Xyz, Hà Nội', 'patient2@example.com', 'BHYT002', 'A-', NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE updated_at = VALUES(updated_at);

-- Insert test medicines
INSERT INTO medicines (id, name, unit, price, stock_quantity, description, created_at, updated_at, deleted)
VALUES 
('med-001', 'Aspirin', 'viên', 5000, 100, 'Giảm đau, hạ sốt', NOW(), NOW(), 0),
('med-002', 'Paracetamol', 'viên', 3000, 150, 'Giảm đau, hạ sốt', NOW(), NOW(), 0),
('med-003', 'Amoxicillin', 'viên', 10000, 50, 'Kháng sinh', NOW(), NOW(), 0),
('med-004', 'Vitamin C', 'viên', 2000, 200, 'Bổ sung vitamin', NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE updated_at = VALUES(updated_at);
