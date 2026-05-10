<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tạo lịch hẹn - VietCare365</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
 </head>
<body>
    <div class="d-flex">
        <jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
        <div class="flex-grow-1">
            <jsp:include page="/WEB-INF/views/layout/header.jsp" />

            <div class="container-fluid p-4">
                <h1 class="mb-4">Tạo lịch hẹn</h1>
                <div class="card">
                    <div class="card-body">
                        <form action="/appointments" method="post">
                            <div class="mb-3">
                                <label class="form-label">Mã bệnh nhân</label>
                                <input name="patientId" value="${appointment.patientId}" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mã bác sĩ</label>
                                <input name="doctorId" value="${appointment.doctorId}" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Thời gian (local)</label>
                                <input name="scheduledAtStr" type="datetime-local" value="${appointment.scheduledAt}" class="form-control" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Ghi chú</label>
                                <textarea name="note" class="form-control">${appointment.note}</textarea>
                            </div>
                            <button class="btn btn-primary">Lưu</button>
                            <a href="/appointments" class="btn btn-secondary">Hủy</a>
                        </form>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 </body>
</html>
