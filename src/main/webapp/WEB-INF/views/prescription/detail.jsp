<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết kê đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container p-4">
    <h2>Chi tiết kê đơn</h2>
    <dl class="row">
        <dt class="col-sm-3">Mã hồ sơ</dt><dd class="col-sm-9">${prescription.medicalRecordId}</dd>
        <dt class="col-sm-3">Ghi chú</dt><dd class="col-sm-9">${prescription.note}</dd>
    </dl>
    <h4>Danh sách thuốc</h4>
    <c:forEach var="item" items="${prescription.items}">
        <div>${item.medicineId} - ${item.quantity} - ${item.dosage}</div>
    </c:forEach>
    <a href="${pageContext.request.contextPath}/prescriptions" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>
