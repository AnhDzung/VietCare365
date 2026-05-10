<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết bác sĩ - VietCare365</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
    <div class="d-flex">
        <jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
        <div class="flex-grow-1">
            <jsp:include page="/WEB-INF/views/layout/header.jsp" />

            <div class="container-fluid p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1>${doctor.fullName}</h1>
                    <div>
                        <a href="/doctors/${doctor.id}/edit" class="btn btn-warning">
                            <i class="bi bi-pencil"></i> Sửa
                        </a>
                        <a href="/doctors" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> Quay lại
                        </a>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="card-header bg-primary text-white">
                                <h5 class="mb-0">Thông tin cơ bản</h5>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <label class="col-sm-4 fw-bold">Họ tên:</label>
                                    <div class="col-sm-8">${doctor.fullName}</div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-sm-4 fw-bold">Chuyên khoa:</label>
                                    <div class="col-sm-8">${doctor.specialization}</div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-sm-4 fw-bold">Số giấy phép:</label>
                                    <div class="col-sm-8">${doctor.licenseNumber}</div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-sm-4 fw-bold">ID người dùng:</label>
                                    <div class="col-sm-8">${doctor.userId}</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="card-header bg-primary text-white">
                                <h5 class="mb-0">Thông tin liên lạc</h5>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <label class="col-sm-4 fw-bold">Số điện thoại:</label>
                                    <div class="col-sm-8">${doctor.phone}</div>
                                </div>
                                <div class="row mb-3">
                                    <label class="col-sm-4 fw-bold">Email:</label>
                                    <div class="col-sm-8">${doctor.email}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-secondary text-white">
                                <h5 class="mb-0">Thông tin hệ thống</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="row mb-3">
                                            <label class="col-sm-4 fw-bold">Tạo bởi:</label>
                                            <div class="col-sm-8">${doctor.createdBy}</div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-4 fw-bold">Ngày tạo:</label>
                                            <div class="col-sm-8">${doctor.createdAt}</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row mb-3">
                                            <label class="col-sm-4 fw-bold">Cập nhật bởi:</label>
                                            <div class="col-sm-8">${doctor.updatedBy}</div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-4 fw-bold">Ngày cập nhật:</label>
                                            <div class="col-sm-8">${doctor.updatedAt}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>