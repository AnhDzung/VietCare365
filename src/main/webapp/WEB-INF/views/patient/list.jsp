<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách bệnh nhân - VietCare365</title>
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
                    <h1>Danh sách bệnh nhân</h1>
                    <a href="/patients/new" class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Thêm mới
                    </a>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <form method="get" class="row g-3">
                            <div class="col-md-9">
                                <input type="text" name="keyword" class="form-control" 
                                       placeholder="Tìm kiếm theo tên, số điện thoại..." 
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
                        <table class="table table-hover mb-0">
                            <thead class="bg-light">
                                <tr>
                                    <th>Họ tên</th>
                                    <th>Ngày sinh</th>
                                    <th>Giới tính</th>
                                    <th>Số điện thoại</th>
                                    <th>Email</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${patients.content}" var="patient">
                                    <tr>
                                        <td>${patient.fullName}</td>
                                        <td>${patient.dateOfBirth}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${patient.gender eq 'MALE'}">Nam</c:when>
                                                <c:when test="${patient.gender eq 'FEMALE'}">Nữ</c:when>
                                                <c:otherwise>Khác</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${patient.phone}</td>
                                        <td>${patient.email}</td>
                                        <td>
                                            <a href="/patients/${patient.id}" class="btn btn-sm btn-info" title="Xem">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                            <a href="/patients/${patient.id}/edit" class="btn btn-sm btn-warning" title="Sửa">
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <a href="/patients/${patient.id}/delete" class="btn btn-sm btn-danger" 
                                               onclick="return confirm('Bạn chắc chắn muốn xóa?')" title="Xóa">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${patients.content.size() == 0}">
                                    <tr>
                                        <td colspan="6" class="text-center text-muted py-4">
                                            Không tìm thấy bệnh nhân nào
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>

                <c:if test="${patients.totalPages > 0}">
                    <nav aria-label="Page navigation" class="mt-4">
                        <ul class="pagination justify-content-center">
                            <c:if test="${patients.number > 0}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=0&keyword=${keyword}">Đầu tiên</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="?page=${patients.number - 1}&keyword=${keyword}">Trước</a>
                                </li>
                            </c:if>

                            <c:forEach begin="0" end="${patients.totalPages - 1}" var="i">
                                <c:choose>
                                    <c:when test="${i == patients.number}">
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

                            <c:if test="${patients.number < patients.totalPages - 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${patients.number + 1}&keyword=${keyword}">Sau</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="?page=${patients.totalPages - 1}&keyword=${keyword}">Cuối</a>
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
</html>
