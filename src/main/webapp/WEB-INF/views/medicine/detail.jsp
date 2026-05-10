<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết thuốc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container p-4">
    <h2>Chi tiết thuốc</h2>
    <dl class="row">
        <dt class="col-sm-3">Tên</dt><dd class="col-sm-9">${medicine.name}</dd>
        <dt class="col-sm-3">Đơn vị</dt><dd class="col-sm-9">${medicine.unit}</dd>
        <dt class="col-sm-3">Giá</dt><dd class="col-sm-9">${medicine.price}</dd>
        <dt class="col-sm-3">Số lượng</dt><dd class="col-sm-9">${medicine.stockQuantity}</dd>
        <dt class="col-sm-3">Mô tả</dt><dd class="col-sm-9">${medicine.description}</dd>
    </dl>
    <a href="${pageContext.request.contextPath}/medicines" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>
