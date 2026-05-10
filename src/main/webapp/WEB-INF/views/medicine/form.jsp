<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm / Sửa thuốc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container p-4">
    <h2>Thuốc</h2>
    <form action="${pageContext.request.contextPath}/medicines/save" method="post">
        <input type="hidden" name="id" value="${medicine.id}" />
        <div class="mb-3">
            <label class="form-label">Tên</label>
            <input name="name" class="form-control" value="${medicine.name}" />
        </div>
        <div class="mb-3">
            <label class="form-label">Đơn vị</label>
            <input name="unit" class="form-control" value="${medicine.unit}" />
        </div>
        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input name="price" class="form-control" value="${medicine.price}" />
        </div>
        <div class="mb-3">
            <label class="form-label">Số lượng</label>
            <input name="stockQuantity" class="form-control" value="${medicine.stockQuantity}" />
        </div>
        <div class="mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control">${medicine.description}</textarea>
        </div>
        <button class="btn btn-primary">Lưu</button>
        <a href="${pageContext.request.contextPath}/medicines" class="btn btn-secondary">Hủy</a>
    </form>
</div>
</body>
</html>
