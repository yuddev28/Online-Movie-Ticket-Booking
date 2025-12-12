<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch Sử Đặt Vé - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="styles-bookings.css">
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
                    <input type="text" placeholder="Tìm booking...">
                    <button type="submit">Tìm Kiếm</button>
                </form>
            </div>
        </div>
    </header>

    <main class="bookings-container">
        <section class="hero">
            <div class="hero-banner" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://via.placeholder.com/1400x500?text=My+Bookings');"></div>
            <div class="hero-overlay">
                <h1>Lịch Sử Đặt Vé</h1>
                <p>Quản lý các vé đã đặt của bạn.</p>
            </div>
        </section>

        <div class="filter-bar">
            <select class="filter-select">
                <option>Tất Cả</option>
                <option>Đã Xác Nhận</option>
                <option>Đã Hủy</option>
                <option>Đang Chờ</option>
            </select>
            <select class="filter-select">
                <option>Tháng Này</option>
                <option>Tuần Này</option>
                <option>Tất Cả</option>
            </select>
            <button class="filter-btn">Lọc</button>
        </div>

        <table class="bookings-table">
            <thead>
                <tr>
                    <th>Ngày Đặt</th>
                    <th>Phim</th>
                    <th>Rạp & Suất</th>
                    <th>Ghế</th>
                    <th>Giá</th>
                    <th>Trạng Thái</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>09/11/2025</td>
                    <td>Quái Thú Vô Hình</td>
                    <td>Cinestar Q6 - 16:30</td>
                    <td>B3, B10</td>
                    <td>110,000 VNĐ</td>
                    <td><span class="status-badge status-confirmed">Đã Xác Nhận</span></td>
                    <td>
                        <a href="#" class="action-btn">Xem Vé</a>
                        <button class="action-btn">Hủy</button>
                    </td>
                </tr>
                <tr>
                    <td>05/11/2025</td>
                    <td>Avengers: Endgame</td>
                    <td>Cinestar Hai Bà Trưng - 19:00</td>
                    <td>A5, B2</td>
                    <td>90,000 VNĐ</td>
                    <td><span class="status-badge status-confirmed">Đã Xác Nhận</span></td>
                    <td>
                        <a href="#" class="action-btn">Xem Vé</a>
                        <button class="action-btn">Hủy</button>
                    </td>
                </tr>
                <tr>
                    <td>01/11/2025</td>
                    <td>Parasite</td>
                    <td>Cinestar Quốc Thanh - 14:30</td>
                    <td>C4</td>
                    <td>45,000 VNĐ</td>
                    <td><span class="status-badge status-cancelled">Đã Hủy</span></td>
                    <td>
                        <a href="#" class="action-btn">Chi Tiết</a>
                    </td>
                </tr>
                <tr>
                    <td>28/10/2025</td>
                    <td>Joker</td>
                    <td>Cinestar Hai Bà Trưng - 20:00</td>
                    <td>D2, D3</td>
                    <td>90,000 VNĐ</td>
                    <td><span class="status-badge status-confirmed">Đã Xác Nhận</span></td>
                    <td>
                        <a href="#" class="action-btn">Xem Vé</a>
                        <button class="action-btn">Hủy</button>
                    </td>
                </tr>
                <tr>
                    <td>25/10/2025</td>
                    <td>Frozen 2</td>
                    <td>Cinestar Q6 - 14:00</td>
                    <td>E6</td>
                    <td>45,000 VNĐ</td>
                    <td><span class="status-badge status-pending">Đang Chờ</span></td>
                    <td>
                        <button class="action-btn">Xác Nhận</button>
                    </td>
                </tr>
            </tbody>
        </table>

        <div style="text-align: center; margin-top: var(--spacing-lg);">
            <a href="#" class="btn" style="width: 200px;">Tải Vé PDF</a>
            <button class="btn btn-secondary" style="width: 200px; margin-left: var(--spacing-md);">Xóa Lịch Sử</button>
        </div>

        <%-- Nếu không có booking (comment để dùng khi cần) --%>
        <%-- <div class="no-bookings">
            <p>Chưa có đặt vé nào.</p>
            <a href="book-ticket.jsp" class="btn">Đặt Vé Ngay</a>
        </div> --%>
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

            // Mock filter
            const filterSelects = document.querySelectorAll('.filter-select');
            filterSelects.forEach(select => {
                select.addEventListener('change', function() {
                    // Mock filter logic: reload table
                    console.log('Filtering by:', this.value);
                });
            });

            // Mock action buttons
            document.querySelectorAll('.action-btn').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.preventDefault();
                    alert('Tính năng này sẽ được triển khai sau!');
                });
            });
        });
    </script>
</body>
</html>