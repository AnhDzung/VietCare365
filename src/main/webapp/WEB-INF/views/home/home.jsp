<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Trang chủ - VietCare365</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">VietCare365</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <c:choose>
                    <c:when test="${isAuthenticated}">
                        <li class="nav-item"><a class="nav-link" href="#">Xin chào, ${username}</a></li>
                        <c:if test="${isAdmin}">
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Admin Dashboard</a></li>
                        </c:if>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/auth/logout">Đăng xuất</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/auth/login">Đăng nhập</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="container my-4">
    <div class="row">
        <div class="col-md-8">
            <h2>Giới thiệu bệnh viện</h2>
            <p>VietCare365 cung cấp dịch vụ y tế chuyên nghiệp với đội ngũ bác sĩ giàu kinh nghiệm, trang thiết bị hiện đại và quy trình khám chữa bệnh minh bạch.</p>

            <h4>Quy trình chữa bệnh</h4>
            <ol>
                <li>Đặt lịch khám / Đến quầy tiếp nhận</li>
                <li>Khám sàng lọc và chẩn đoán</li>
                <li>Bác sĩ kê đơn và tư vấn</li>
                <li>Thanh toán viện phí và nhận thuốc</li>
            </ol>

            <h4>Viện phí tham khảo</h4>
            <ul>
                <li>Khám chuyên khoa: 200,000 VND</li>
                <li>Khám tổng quát: 150,000 VND</li>
                <li>Siêu âm: 300,000 VND</li>
                <li>Xét nghiệm cơ bản: từ 100,000 VND</li>
            </ul>

            <h4>Top bác sĩ</h4>
            <div class="row">
                <c:forEach var="doc" items="${topDoctors}">
                    <div class="col-md-6 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">${doc.fullName}</h5>
                                <p class="card-text">Chuyên khoa: ${doc.specialization}</p>
                                        <a href="${pageContext.request.contextPath}/doctors/${doc.id}" class="btn btn-sm btn-primary">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">Dành cho người bệnh</h5>
                    <p class="card-text">Dịch vụ dành cho người bệnh sau khi đăng nhập.</p>
                    <c:if test="${isPatient}">
                                <a href="${pageContext.request.contextPath}/appointments/create" class="btn btn-success mb-2">Đặt lịch khám</a><br/>
                                <a href="${pageContext.request.contextPath}/medicines" class="btn btn-outline-primary mb-2">Tìm thuốc</a><br/>
                                <a href="${pageContext.request.contextPath}/doctors" class="btn btn-outline-secondary">Tìm bác sĩ</a>
                    </c:if>
                    <c:if test="${!isPatient}">
                                <a href="${pageContext.request.contextPath}/auth/login" class="btn btn-primary">Đăng nhập để sử dụng</a>
                    </c:if>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Dành cho bác sĩ</h5>
                    <p class="card-text">Sau khi đăng nhập, bác sĩ có thể quản lý bệnh nhân và đơn thuốc.</p>
                    <c:if test="${isDoctor}">
                        <a href="${pageContext.request.contextPath}/patients" class="btn btn-warning mb-2">Bệnh nhân phụ trách</a><br/>
                        <a href="${pageContext.request.contextPath}/prescriptions" class="btn btn-outline-dark">Đơn thuốc</a>
                    </c:if>
                </div>
            </div>

            <c:if test="${isAdmin}">
                <div class="card mt-3">
                    <div class="card-body">
                        <h5 class="card-title">Admin</h5>
                        <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-danger">Vào Dashboard Admin</a>
                    </div>
                </div>
            </c:if>

            <c:if test="${!isAuthenticated}">
                <div class="card mt-3">
                    <div class="card-body">
                        <h5 class="card-title">Để lại thông tin để được tư vấn</h5>
                        <c:if test="${not empty intakeSuccess}">
                            <div class="alert alert-success">
                                ${intakeSuccess}
                                <c:if test="${not empty generatedUsername}">
                                    <div class="mt-2">Tài khoản: <strong>${generatedUsername}</strong></div>
                                </c:if>
                                <c:if test="${not empty generatedPassword}">
                                    <div>Mật khẩu tạm: <strong>${generatedPassword}</strong></div>
                                </c:if>
                            </div>
                        </c:if>
                        <c:if test="${not empty intakeError}">
                            <div class="alert alert-danger">${intakeError}</div>
                        </c:if>
                        <form method="post" action="${pageContext.request.contextPath}/home/consultation">
                            <div class="mb-2">
                                <input type="text" class="form-control" name="fullName" placeholder="Họ và tên" value="${intake.fullName}" required>
                            </div>
                            <div class="mb-2">
                                <input type="tel" class="form-control" name="phone" placeholder="Số điện thoại" value="${intake.phone}" required>
                            </div>
                            <div class="mb-2">
                                <input type="email" class="form-control" name="email" placeholder="Email" value="${intake.email}">
                            </div>
                            <div class="mb-2">
                                <input type="text" class="form-control" name="address" placeholder="Địa chỉ" value="${intake.address}">
                            </div>
                            <div class="mb-2">
                                <textarea class="form-control" name="note" rows="3" placeholder="Nhu cầu tư vấn">${intake.note}</textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Gửi thông tin</button>
                        </form>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
