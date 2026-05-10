<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="sidebar bg-light p-3" style="min-height: 100vh; position: sticky; top: 0;">
    <ul class="nav flex-column">
        <li class="nav-item mb-2">
            <a class="nav-link active" aria-current="page" href="/dashboard">
                <i class="bi bi-speedometer2"></i> Bảng điều khiển
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link" href="/patients">
                <i class="bi bi-person-heart"></i> Bệnh nhân
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link" href="/doctors">
                <i class="bi bi-person-badge"></i> Bác sĩ
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link" href="/appointments">
                <i class="bi bi-calendar-event"></i> Lịch hẹn
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link" href="/prescriptions">
                <i class="bi bi-prescription2"></i> Kê đơn
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link" href="/medicines">
                <i class="bi bi-capsule"></i> Kho thuốc
            </a>
        </li>
        <li class="nav-item mb-2">
            <a class="nav-link" href="/invoices">
                <i class="bi bi-receipt"></i> Hóa đơn
            </a>
        </li>
    </ul>
</nav>
