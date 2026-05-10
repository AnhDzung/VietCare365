<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kho thuốc - VietCare365</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
    <div class="d-flex">
        <jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
        <div class="flex-grow-1">
            <jsp:include page="/WEB-INF/views/layout/header.jsp" />
            
            <div class="container-fluid p-4">
                <h1 class="mb-4">Kho thuốc</h1>
                <div class="mb-3">
                    <a href="${pageContext.request.contextPath}/medicines/create" class="btn btn-primary">Thêm thuốc</a>
                </div>
                <div class="card">
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr><th>Tên</th><th>Đơn vị</th><th>Giá</th><th>Số lượng</th><th></th></tr>
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${page.content}">
                                    <tr>
                                        <td>${m.name}</td>
                                        <td>${m.unit}</td>
                                        <td>${m.price}</td>
                                        <td>${m.stockQuantity}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/medicines/edit/${m.id}" class="btn btn-sm btn-outline-primary">Sửa</a>
                                            <form method="post" action="${pageContext.request.contextPath}/medicines/delete/${m.id}" style="display:inline">
                                                <button class="btn btn-sm btn-outline-danger" onclick="return confirm('Xóa?')">Xóa</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
