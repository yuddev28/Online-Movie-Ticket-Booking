<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <div class="top-nav">
            <a href="home.jsp" class="logo">MyCinema</a>
            <ul class="nav-links">
                <li><a href="home.jsp">Trang Chủ</a></li>
                <li class="has-dropdown">
                    <input type="checkbox" id="movieToggle" class="dropdown-toggle">
                    <label for="movieToggle" id="movieLink">Phim</label>
                    <ul class="dropdown">
                        <li><a href="movieShowing.jsp">Phim Đang Chiếu</a></li>
                        <li><a href="movieUpcoming.jsp">Phim Sắp Chiếu</a></li>
                        <li><a href="movies.jsp">Tất Cả Phim</a></li>
                    </ul>
                </li>
                <li><a href="theater.jsp">Rạp</a></li>
                <li><a href="promotions.jsp">Ưu Đãi</a></li>
                <li><a href="book-ticket.jsp">Đặt Vé</a></li>
                <li><a href="profile.jsp">Tài Khoản</a></li>
            </ul>
            <div class="user-actions">
                <a href="login.jsp" class="btn btn-secondary">Đăng Nhập</a>
                <a href="register.jsp" class="btn">Đăng Ký</a>
            </div>
        </div>
        <div class="search-bar-header">
            <div class="search-container">
                <form>
                    <input type="text" placeholder="Tìm hỗ trợ...">
                    <button type="submit">Tìm Kiếm</button>
                </form>
            </div>
        </div>
    </header>

    <main>
        <section class="hero">
            <div class="hero-banner" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://via.placeholder.com/1400x500?text=Contact');"></div>
            <div class="hero-overlay">
                <h1>Liên Hệ Với Chúng Tôi</h1>
                <p>Có câu hỏi? Chúng tôi luôn sẵn sàng hỗ trợ.</p>
            </div>
        </section>

        <div style="display: flex; gap: var(--spacing-lg); padding: var(--spacing-md);">
            <section style="flex: 1; background: var(--bg-secondary); padding: var(--spacing-lg); border-radius: var(--border-radius);">
                <h2>Gửi Câu Hỏi</h2>
                <form>
                    <div class="form-group">
                        <label for="contact-name">Họ Tên</label>
                        <input type="text" id="contact-name" placeholder="Nhập họ tên" required>
                    </div>
                    <div class="form-group">
                        <label for="contact-email">Email</label>
                        <input type="email" id="contact-email" placeholder="Nhập email" required>
                    </div>
                    <div class="form-group">
                        <label for="contact-phone">Số Điện Thoại</label>
                        <input type="tel" id="contact-phone" placeholder="Nhập số điện thoại" required>
                    </div>
                    <div class="form-group">
                        <label for="contact-subject">Chủ Đề</label>
                        <select id="contact-subject">
                            <option>Hỏi Về Vé</option>
                            <option>Phàn Nàn</option>
                            <option>Hợp Tác</option>
                            <option>Khác</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="contact-message">Tin Nhắn</label>
                        <textarea id="contact-message" rows="5" placeholder="Nhập nội dung câu hỏi..." required></textarea>
                    </div>
                    <button type="submit" class="auth-btn" style="width: 100%;">Gửi</button>
                </form>
            </section>

            <section style="flex: 1; background: var(--bg-secondary); padding: var(--spacing-lg); border-radius: var(--border-radius);">
                <h2>Thông Tin Liên Hệ</h2>
                <p><strong>Email:</strong> support@mycinema.vn</p>
                <p><strong>Hotline:</strong> 1900-1234 (8:00 - 22:00)</p>
                <p><strong>Địa Chỉ:</strong> 123 Nguyễn Huệ, Q.1, TP.HCM</p>
                <p><strong>Website:</strong> mycine.vn</p>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.325!2d106.699!3d10.776!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f38f7e!2sHo+Chi+Minh+City!5e0!3m2!1sen!2s!4v1630000000000" width="100%" height="250" style="border:0; border-radius: var(--border-radius);" allowfullscreen="" loading="lazy"></iframe>
            </section>
        </div>
    </main>

    <footer class="footer">
        <div style="max-width: var(--max-width); margin: 0 auto; padding: 0 var(--spacing-md);">
            <div class="footer-links">
                <a href="#">Giới Thiệu</a>
                <a href="#">Tin Tức</a>
                <a href="#">Tuyển Dụng</a>
                <a href="#">Liên Hệ</a>
                <a href="#">Chính Sách Bảo Mật</a>
            </div>
            <p>&copy; 2025 MyCinema. Hệ thống rạp chiếu phim hiện đại bậc nhất.</p>
        </div>
    </footer>

    <script>
        // Dropdown script (giữ nguyên)
        document.addEventListener('DOMContentLoaded', function() {
            const movieLi = document.querySelector('.has-dropdown');
            const dropdown = document.querySelector('.dropdown');
            const movieLink = document.getElementById('movieLink');

            if (movieLink) {
                movieLink.addEventListener('click', function(e) {
                    e.preventDefault();
                    movieLi.classList.toggle('active');
                });
            }

            document.addEventListener('click', function(e) {
                if (movieLi && !movieLi.contains(e.target)) {
                    movieLi.classList.remove('active');
                }
            });

            if (dropdown) {
                const dropdownLinks = dropdown.querySelectorAll('a');
                dropdownLinks.forEach(link => {
                    link.addEventListener('click', function() {
                        if (movieLi) movieLi.classList.remove('active');
                        window.location.href = this.href;
                    });
                });
            }

            // Form submit mock
            document.querySelector('form').addEventListener('submit', function(e) {
                e.preventDefault();
                alert('Câu hỏi đã gửi! Chúng tôi sẽ phản hồi trong 24h.');
            });
        });
    </script>
</body>
</html>