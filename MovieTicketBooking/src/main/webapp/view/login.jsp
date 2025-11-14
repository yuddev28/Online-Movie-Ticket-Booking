<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="auth-container">
        <form class="auth-form">
            <div class="auth-logo">
                <a href="home.jsp" class="logo">MyCinema</a>
            </div>
            <h2>Đăng Nhập</h2>
            <div class="form-group-auth">
                <label for="email">Email</label>
                <input type="email" id="email" placeholder="Nhập email của bạn" required>
            </div>
            <div class="form-group-auth">
                <label for="password">Mật Khẩu</label>
                <input type="password" id="password" placeholder="Nhập mật khẩu" required>
            </div>
            <a href="#" style="color: var(--text-muted); font-size: 12px; text-align: right; display: block; margin-bottom: var(--spacing-md);">Quên mật khẩu?</a>
            <button type="submit" class="auth-btn">Đăng Nhập</button>
            <div class="social-login">
                <p>Hoặc đăng nhập bằng</p>
                <a href="#" class="social-btn google-btn">Đăng nhập với Google</a>
                <a href="#" class="social-btn facebook-btn">Đăng nhập với Facebook</a>
            </div>
            <div class="auth-link">
                <p>Chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a></p>
            </div>
            <p class="error-msg" style="display: none;">Email hoặc mật khẩu không chính xác!</p>
        </form>
    </div>

    <script>
        // Mock submit
        document.querySelector('.auth-form').addEventListener('submit', function(e) {
            e.preventDefault();
            const error = document.querySelector('.error-msg');
            error.style.display = 'block';
            setTimeout(() => error.style.display = 'none', 3000);
        });
    </script>
</body>
</html>