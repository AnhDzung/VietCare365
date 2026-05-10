<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách lịch hẹn - VietCare365</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
    <div class="d-flex">
        <jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
        <div class="flex-grow-1">
            <jsp:include page="/WEB-INF/views/layout/header.jsp" />
            
            <div class="container-fluid p-4">
                <h1 class="mb-4">Danh sách lịch hẹn</h1>
                <div class="mb-3">
                    <a href="/appointments/create" class="btn btn-primary">Tạo lịch hẹn mới</a>
                </div>
                <div class="card">
                    <div class="card-body">
                        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Bệnh nhân</th>
                                <th>Bác sĩ</th>
                                <th>Thời gian</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="a" items="${appointments}">
                                <tr>
                                    <td>${a.id}</td>
                                    <td>${a.patientId}</td>
                                    <td>${a.doctorId}</td>
                                    <td>${a.scheduledAt}</td>
                                    <td>${a.status}</td>
                                    <td>
                                        <a class="btn btn-sm btn-danger" href="/appointments/${a.id}/delete" onclick="return confirm('Xác nhận xóa?')">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${page.totalPages > 1}">
                            <nav>
                                <ul class="pagination">
                                    <c:forEach begin="0" end="${page.totalPages - 1}" var="i">
                                        <li class="page-item ${i == page.number ? 'active' : ''}"><a class="page-link" href="?page=${i}">${i + 1}</a></li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </c:if>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
