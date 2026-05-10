<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách bác sĩ - VietCare365</title>
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
                    <h1>Danh sách bác sĩ</h1>
                    <a href="/doctors/new" class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Thêm mới
                    </a>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <form method="get" class="row g-3">
                            <div class="col-md-9">
                                <input type="text" name="keyword" class="form-control"
                                       placeholder="Tìm theo tên, chuyên khoa, số GPLH, số điện thoại, email..."
                                       value="${keyword}">
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-outline-primary w-100">
                                    <i class="bi bi-search"></i> Tìm kiếm
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0 align-middle">
                            <thead class="bg-light">
                                <tr>
                                    <th>Họ tên</th>
                                    <th>Chuyên khoa</th>
                                    <th>Số GPLH</th>
                                    <th>Số điện thoại</th>
                                    <th>Email</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${doctors.content}" var="doctor">
                                    <tr>
                                        <td>${doctor.fullName}</td>
                                        <td>${doctor.specialization}</td>
                                        <td>${doctor.licenseNumber}</td>
                                        <td>${doctor.phone}</td>
                                        <td>${doctor.email}</td>
                                        <td>
                                            <a href="/doctors/${doctor.id}" class="btn btn-sm btn-info" title="Xem">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                            <a href="/doctors/${doctor.id}/edit" class="btn btn-sm btn-warning" title="Sửa">
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <a href="/doctors/${doctor.id}/delete" class="btn btn-sm btn-danger"
                                               onclick="return confirm('Bạn chắc chắn muốn xóa?')" title="Xóa">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${doctors.content.size() == 0}">
                                    <tr>
                                        <td colspan="6" class="text-center text-muted py-4">
                                            Không tìm thấy bác sĩ nào
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>

                <c:if test="${doctors.totalPages > 0}">
                    <nav aria-label="Page navigation" class="mt-4">
                        <ul class="pagination justify-content-center">
                            <c:if test="${doctors.number > 0}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=0&keyword=${keyword}">Đầu tiên</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="?page=${doctors.number - 1}&keyword=${keyword}">Trước</a>
                                </li>
                            </c:if>

                            <c:forEach begin="0" end="${doctors.totalPages - 1}" var="i">
                                <c:choose>
                                    <c:when test="${i == doctors.number}">
                                        <li class="page-item active">
                                            <span class="page-link">${i + 1}</span>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="?page=${i}&keyword=${keyword}">${i + 1}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${doctors.number < doctors.totalPages - 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${doctors.number + 1}&keyword=${keyword}">Sau</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="?page=${doctors.totalPages - 1}&keyword=${keyword}">Cuối</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </c:if>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách bác sĩ - VietCare365</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
    <div class="d-flex">
        <jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
        <div class="flex-grow-1">
            <jsp:include page="/WEB-INF/views/layout/header.jsp" />
            
            <div class="container-fluid p-4">
                <h1 class="mb-4">Danh sách bác sĩ</h1>
                <div class="card">
                    <div class="card-body">
                        <p class="text-muted">Chức năng đang phát triển...</p>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
