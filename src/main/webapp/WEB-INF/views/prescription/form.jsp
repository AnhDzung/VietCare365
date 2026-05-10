<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tạo / Sửa kê đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container p-4">
    <h2>Kê đơn</h2>
    <form action="${pageContext.request.contextPath}/prescriptions/save" method="post">
        <input type="hidden" name="id" value="${prescription.id}" />
        <div class="mb-3">
            <label class="form-label">Mã hồ sơ y tế</label>
            <input name="medicalRecordId" class="form-control" value="${prescription.medicalRecordId}" />
        </div>
        <div class="mb-3">
            <label class="form-label">Ghi chú</label>
            <textarea name="note" class="form-control">${prescription.note}</textarea>
        </div>
        <button class="btn btn-primary">Lưu</button>
        <a href="${pageContext.request.contextPath}/prescriptions" class="btn btn-secondary">Hủy</a>
    </form>
</div>
</body>
</html>
