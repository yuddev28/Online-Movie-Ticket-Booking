<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="auth-container">
        <form class="auth-form">
            <div class="auth-logo">
                <a href="home.jsp" class="logo">MyCinema</a>
            </div>
            <h2>Đăng Ký</h2>
            <div class="form-group-auth">
                <label for="fullname">Họ Tên</label>
                <input type="text" id="fullname" placeholder="Nhập họ tên đầy đủ" required>
            </div>
            <div class="form-group-auth">
                <label for="email">Email</label>
                <input type="email" id="email" placeholder="Nhập email" required>
            </div>
            <div class="form-group-auth">
                <label for="phone">Số Điện Thoại</label>
                <input type="tel" id="phone" placeholder="Nhập số điện thoại" required>
            </div>
            <div class="form-group-auth">
                <label for="password">Mật Khẩu</label>
                <input type="password" id="password" placeholder="Nhập mật khẩu (ít nhất 6 ký tự)" required>
            </div>
            <div class="form-group-auth">
                <label for="confirm-password">Xác Nhận Mật Khẩu</label>
                <input type="password" id="confirm-password" placeholder="Nhập lại mật khẩu" required>
            </div>
            <button type="submit" class="auth-btn">Đăng Ký</button>
            <div class="social-login">
                <p>Hoặc đăng ký bằng</p>
                <a href="#" class="social-btn google-btn">Đăng ký với Google</a>
                <a href="#" class="social-btn facebook-btn">Đăng ký với Facebook</a>
            </div>
            <div class="auth-link">
                <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a></p>
            </div>
            <p class="error-msg" style="display: none;">Mật khẩu không khớp!</p>
        </form>
    </div>

    <script>
        // Mock submit
        document.querySelector('.auth-form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            const error = document.querySelector('.error-msg');
            if (password !== confirmPassword) {
                e.preventDefault();
                error.textContent = 'Mật khẩu không khớp!';
                error.style.display = 'block';
            } else {
                error.style.display = 'none';
            }
        });
    </script>
</body>
</html>