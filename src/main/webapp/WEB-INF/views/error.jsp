<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lỗi - VietCare365</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .error-container {
            background: white;
            padding: 3rem;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 500px;
        }
        .error-code {
            font-size: 5rem;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 1rem;
        }
        .error-message {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 2rem;
        }
        .error-description {
            color: #999;
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-code">${status}</div>
        <div class="error-message">${message}</div>
        <div class="error-description">
            <p>Xin lỗi, đã xảy ra lỗi. Vui lòng thử lại hoặc liên hệ với quản trị viên.</p>
        </div>
        <a href="/dashboard" class="btn btn-primary">
            <i class="bi bi-house"></i> Quay về trang chủ
        </a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
