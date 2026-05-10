<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biểu mẫu bác sĩ - VietCare365</title>
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
                        <c:when test="${doctorId != null}">Sửa bác sĩ</c:when>
                        <c:otherwise>Thêm bác sĩ mới</c:otherwise>
                    </c:choose>
                </h1>

                <div class="card">
                    <div class="card-body">
                        <form method="post" class="needs-validation">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="userId" class="form-label">ID người dùng</label>
                                    <input type="text" class="form-control" id="userId" name="userId"
                                           value="${doctor.userId}">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="licenseNumber" class="form-label">Số giấy phép</label>
                                    <input type="text" class="form-control" id="licenseNumber" name="licenseNumber"
                                           value="${doctor.licenseNumber}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fullName" class="form-label">Họ tên *</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName"
                                           value="${doctor.fullName}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="specialization" class="form-label">Chuyên khoa</label>
                                    <input type="text" class="form-control" id="specialization" name="specialization"
                                           value="${doctor.specialization}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="tel" class="form-control" id="phone" name="phone"
                                           value="${doctor.phone}">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                           value="${doctor.email}">
                                </div>
                            </div>

                            <div class="mt-4">
                                <c:choose>
                                    <c:when test="${doctorId != null}">
                                        <button type="submit" class="btn btn-primary" formaction="/doctors/${doctorId}/update">
                                            <i class="bi bi-check-circle"></i> Cập nhật
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" class="btn btn-primary" formaction="/doctors">
                                            <i class="bi bi-check-circle"></i> Lưu
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                                <a href="/doctors" class="btn btn-secondary">
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