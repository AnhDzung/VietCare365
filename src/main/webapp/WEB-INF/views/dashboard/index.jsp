<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển - VietCare365</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .stat-card {
            background: white;
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 1.5rem;
        }
        .stat-card .card-value {
            font-size: 2rem;
            font-weight: bold;
            color: #667eea;
            margin: 0.5rem 0;
        }
        .stat-card .card-label {
            color: #999;
            font-size: 0.95rem;
        }
        .stat-card .card-icon {
            font-size: 2.5rem;
            opacity: 0.2;
            float: right;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
        <div class="flex-grow-1">
            <jsp:include page="/WEB-INF/views/layout/header.jsp" />
            
            <div class="container-fluid p-4">
                <h1 class="mb-4">Bảng điều khiển</h1>

                <div class="row">
                    <div class="col-md-6 col-lg-3">
                        <div class="stat-card">
                            <div class="card-icon"><i class="bi bi-person-heart"></i></div>
                            <div class="card-label">Tổng bệnh nhân</div>
                            <div class="card-value" id="totalPatients">0</div>
                            <small class="text-muted">Đang theo dõi</small>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="stat-card">
                            <div class="card-icon"><i class="bi bi-calendar-event"></i></div>
                            <div class="card-label">Lịch hẹn hôm nay</div>
                            <div class="card-value" id="todayAppointments">0</div>
                            <small class="text-muted">Cần xác nhận</small>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="stat-card">
                            <div class="card-icon"><i class="bi bi-person-badge"></i></div>
                            <div class="card-label">Bác sĩ đang làm việc</div>
                            <div class="card-value" id="activeDoctors">0</div>
                            <small class="text-muted">Có sẵn</small>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="stat-card">
                            <div class="card-icon"><i class="bi bi-currency-dollar"></i></div>
                            <div class="card-label">Doanh thu tháng</div>
                            <div class="card-value" id="monthlyRevenue">0</div>
                            <small class="text-muted">VND</small>
                        </div>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-lg-6">
                        <div class="stat-card">
                            <h5>Hoạt động gần đây</h5>
                            <div class="table-responsive">
                                <table class="table table-sm table-hover">
                                    <thead>
                                        <tr>
                                            <th>Thời gian</th>
                                            <th>Hành động</th>
                                            <th>Người dùng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>10 phút trước</td>
                                            <td>Thêm lịch hẹn mới</td>
                                            <td>Admin</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="stat-card">
                            <h5>Thông báo</h5>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <small class="text-muted">Bác sĩ Nguyễn A vừa hoàn thành khám bệnh cho bệnh nhân Trần B</small>
                                </li>
                                <li class="list-group-item">
                                    <small class="text-muted">Hóa đơn #001 chưa thanh toán</small>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('totalPatients').textContent = Math.floor(Math.random() * 100) + 50;
            document.getElementById('todayAppointments').textContent = Math.floor(Math.random() * 20) + 5;
            document.getElementById('activeDoctors').textContent = Math.floor(Math.random() * 30) + 10;
            document.getElementById('monthlyRevenue').textContent = (Math.random() * 100000000 + 10000000).toLocaleString('vi-VN');
        });
    </script>
</body>
</html>
