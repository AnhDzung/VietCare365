<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biểu mẫu bệnh nhân - VietCare365</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
    <div class="d-flex">
        <jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
        <div class="flex-grow-1">
            <jsp:include page="/WEB-INF/views/layout/header.jsp" />
            
            <div class="container-fluid p-4">
                <h1 class="mb-4">
                    <c:choose>
                        <c:when test="${patient.id != null}">Sửa bệnh nhân</c:when>
                        <c:otherwise>Thêm bệnh nhân mới</c:otherwise>
                    </c:choose>
                </h1>

                <div class="card">
                    <div class="card-body">
                        <form method="post" class="needs-validation">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fullName" class="form-label">Họ tên *</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" 
                                           value="${patient.fullName}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="dateOfBirth" class="form-label">Ngày sinh</label>
                                    <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" 
                                           value="${patient.dateOfBirth}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="gender" class="form-label">Giới tính</label>
                                    <select class="form-control" id="gender" name="gender">
                                        <option value="">-- Chọn --</option>
                                        <option value="MALE" <c:if test="${patient.gender eq 'MALE'}">selected</c:if>>Nam</option>
                                        <option value="FEMALE" <c:if test="${patient.gender eq 'FEMALE'}">selected</c:if>>Nữ</option>
                                        <option value="OTHER" <c:if test="${patient.gender eq 'OTHER'}">selected</c:if>>Khác</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" 
                                           value="${patient.phone}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           value="${patient.email}">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="address" class="form-label">Địa chỉ</label>
                                    <input type="text" class="form-control" id="address" name="address" 
                                           value="${patient.address}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="insuranceNumber" class="form-label">Số BHYT</label>
                                    <input type="text" class="form-control" id="insuranceNumber" name="insuranceNumber" 
                                           value="${patient.insuranceNumber}">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="bloodType" class="form-label">Nhóm máu</label>
                                    <select class="form-control" id="bloodType" name="bloodType">
                                        <option value="">-- Chọn --</option>
                                        <option value="O+" <c:if test="${patient.bloodType eq 'O+'}">selected</c:if>>O+</option>
                                        <option value="O-" <c:if test="${patient.bloodType eq 'O-'}">selected</c:if>>O-</option>
                                        <option value="A+" <c:if test="${patient.bloodType eq 'A+'}">selected</c:if>>A+</option>
                                        <option value="A-" <c:if test="${patient.bloodType eq 'A-'}">selected</c:if>>A-</option>
                                        <option value="B+" <c:if test="${patient.bloodType eq 'B+'}">selected</c:if>>B+</option>
                                        <option value="B-" <c:if test="${patient.bloodType eq 'B-'}">selected</c:if>>B-</option>
                                        <option value="AB+" <c:if test="${patient.bloodType eq 'AB+'}">selected</c:if>>AB+</option>
                                        <option value="AB-" <c:if test="${patient.bloodType eq 'AB-'}">selected</c:if>>AB-</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mt-4">
                                <c:choose>
                                    <c:when test="${patient.id != null}">
                                        <button type="submit" class="btn btn-primary" formaction="/patients/${patient.id}/update">
                                            <i class="bi bi-check-circle"></i> Cập nhật
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" class="btn btn-primary" formaction="/patients">
                                            <i class="bi bi-check-circle"></i> Lưu
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                                <a href="/patients" class="btn btn-secondary">
                                    <i class="bi bi-x-circle"></i> Hủy
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
