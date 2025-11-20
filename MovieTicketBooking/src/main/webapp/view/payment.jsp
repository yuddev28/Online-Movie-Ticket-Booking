<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán - MyCinema</title>
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
                    <input type="text" placeholder="Tìm thanh toán...">
                    <button type="submit">Tìm Kiếm</button>
                </form>
            </div>
        </div>
    </header>

    <main class="payment-container">
        <section class="hero">
            <div class="hero-banner" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://via.placeholder.com/1400x500?text=Payment');"></div>
            <div class="hero-overlay">
                <h1>Thanh Toán</h1>
                <p>Xác nhận và thanh toán đơn vé của bạn.</p>
            </div>
        </section>

        <div class="payment-hero">
            <%-- Summary Vé --%>
            <section class="payment-summary">
                <h2>Tóm Tắt Đơn Hàng</h2>
                <div class="summary-item">
                    <span>Phim: Quái Thú Vô Hình</span>
                    <span>TPHCM - 16:30</span>
                </div>
                <div class="summary-item">
                    <span>Ghế: B3, B10</span>
                    <span>2 vé Standard</span>
                </div>
                <div class="summary-item">
                    <span>Giá Vé</span>
                    <span>90,000 VNĐ</span>
                </div>
                <div class="summary-item">
                    <span>Phí Phục Vụ</span>
                    <span>10,000 VNĐ</span>
                </div>
                <div class="summary-item">
                    <span>Mã Ưu Đãi</span>
                    <span>-20,000 VNĐ</span>
                </div>
                <div class="summary-total">
                    <span>Tổng Tiền</span>
                    <span>80,000 VNĐ</span>
                </div>
            </section>

            <%-- Phương Thức Thanh Toán --%>
            <section class="payment-methods">
                <h2>Phương Thức Thanh Toán</h2>
                <div class="method-option active">
                    <span class="method-icon">VNP</span>
                    <span>Ví Điện Tử (Momo/ZaloPay)</span>
                </div>
                <div class="method-option">
                    <span class="method-icon">CC</span>
                    <span>Thẻ Tín Dụng/Thẻ Ghi Nợ</span>
                </div>
                <div class="method-option">
                    <span class="method-icon">COD</span>
                    <span>Thanh Toán Khi Nhận Vé Tại Rạp</span>
                </div>
                <div class="method-option">
                    <span class="method-icon">BANK</span>
                    <span>Chuyển Khoản Ngân Hàng</span>
                </div>

                <div class="promo-code">
                    <input type="text" placeholder="Nhập mã ưu đãi">
                    <button type="button">Áp Dụng</button>
                </div>

                <button class="pay-btn">Thanh Toán 80,000 VNĐ</button>
                <p style="color: var(--text-muted); font-size: 12px; text-align: center; margin-top: var(--spacing-md);">* Vé không hoàn tiền. Áp dụng ưu đãi nếu hợp lệ.</p>
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
        // Payment method selection
        document.querySelectorAll('.method-option').forEach(option => {
            option.addEventListener('click', function() {
                document.querySelectorAll('.method-option').forEach(o => o.classList.remove('active'));
                this.classList.add('active');
            });
        });

        // Promo code
        document.querySelector('.promo-code button').addEventListener('click', function() {
            const code = document.querySelector('.promo-code input').value;
            if (code) {
                alert('Mã ưu đãi ' + code + ' đã áp dụng! Giảm 20,000 VNĐ.');
            }
        });

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
        });
    </script>
</body>
</html>