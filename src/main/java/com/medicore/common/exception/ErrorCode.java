package com.medicore.common.exception;

public enum ErrorCode {
    UNAUTHORIZED(401, "Không được phép truy cập"),
    FORBIDDEN(403, "Truy cập bị từ chối"),
    NOT_FOUND(404, "Không tìm thấy"),
    VALIDATION_ERROR(400, "Lỗi xác thực dữ liệu"),
    INTERNAL_ERROR(500, "Lỗi máy chủ nội bộ"),
    
    USER_NOT_FOUND(404, "Không tìm thấy người dùng"),
    PATIENT_NOT_FOUND(404, "Không tìm thấy bệnh nhân"),
    DOCTOR_NOT_FOUND(404, "Không tìm thấy bác sĩ"),
    APPOINTMENT_NOT_FOUND(404, "Không tìm thấy lịch hẹn"),
    APPOINTMENT_CONFLICT(400, "Lịch hẹn xung đột"),
    MEDICINE_NOT_FOUND(404, "Không tìm thấy thuốc"),
    INSUFFICIENT_STOCK(400, "Hết hàng"),
    INVALID_CREDENTIALS(401, "Tên đăng nhập hoặc mật khẩu không chính xác");

    private final int httpStatus;
    private final String message;

    ErrorCode(int httpStatus, String message) {
        this.httpStatus = httpStatus;
        this.message = message;
    }

    public int getHttpStatus() {
        return httpStatus;
    }

    public String getMessage() {
        return message;
    }
}
