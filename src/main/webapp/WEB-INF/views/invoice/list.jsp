<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách hóa đơn - VietCare365</title>
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
                    <h1>Danh sách hóa đơn</h1>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <form method="get" class="row g-3">
                            <div class="col-md-9">
                                <input type="text" name="keyword" class="form-control"
                                       placeholder="Tìm theo mã bệnh nhân hoặc mã lịch hẹn..."
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
                                    <th>Mã hóa đơn</th>
                                    <th>Bệnh nhân</th>
                                    <th>Lịch hẹn</th>
                                    <th>Tổng tiền</th>
                                    <th>Bảo hiểm</th>
                                    <th>Đã thanh toán</th>
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${invoices.content}" var="invoice">
                                    <tr>
                                        <td>${invoice.id}</td>
                                        <td>${invoice.patientId}</td>
                                        <td>${invoice.appointmentId}</td>
                                        <td>${invoice.totalAmount}</td>
                                        <td>${invoice.insuranceCoverage}</td>
                                        <td>${invoice.paidAmount}</td>
                                        <td>
                                            <span class="badge bg-${invoice.status eq 'PAID' ? 'success' : invoice.status eq 'CANCELLED' ? 'danger' : 'secondary'}">
                                                ${invoice.status}
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${invoices.content.size() == 0}">
                                    <tr>
                                        <td colspan="7" class="text-center text-muted py-4">
                                            Không tìm thấy hóa đơn nào
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>

                <c:if test="${invoices.totalPages > 0}">
                    <nav aria-label="Page navigation" class="mt-4">
                        <ul class="pagination justify-content-center">
                            <c:if test="${invoices.number > 0}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=0&keyword=${keyword}">Đầu tiên</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="?page=${invoices.number - 1}&keyword=${keyword}">Trước</a>
                                </li>
                            </c:if>

                            <c:forEach begin="0" end="${invoices.totalPages - 1}" var="i">
                                <c:choose>
                                    <c:when test="${i == invoices.number}">
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

                            <c:if test="${invoices.number < invoices.totalPages - 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${invoices.number + 1}&keyword=${keyword}">Sau</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="?page=${invoices.totalPages - 1}&keyword=${keyword}">Cuối</a>
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
