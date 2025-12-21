<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="auth-container">
        <form class="forgot-form" id="forgotForm">
            <div class="auth-logo">
                <a href="home.jsp" class="logo">MyCinema</a>
            </div>
            <h2>Quên Mật Khẩu</h2>
            <div class="form-group-auth">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Nhập email của bạn" required>
            </div>
            <button type="submit" class="forgot-btn">Gửi Mã Xác Nhận</button>
            <div class="auth-link" style="margin-top: var(--spacing-md);">
                <p><a href="login.jsp">Quay lại đăng nhập</a></p>
            </div>
            <div id="successMsg" class="forgot-success" style="display: none;">
                Mã xác nhận đã được gửi đến email của bạn. Kiểm tra hộp thư đến hoặc thư rác.
            </div>
        </form>
    </div>

    <script>
        // Mock send OTP
        document.getElementById('forgotForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const email = document.getElementById('email').value;
            if (email) {
                document.getElementById('successMsg').style.display = 'block';
                // Redirect to OTP page after 3s
                setTimeout(() => {
                    window.location.href = 'otp.jsp'; // Giả định trang OTP
                }, 3000);
            }
        });
    </script>
</body>
</html>