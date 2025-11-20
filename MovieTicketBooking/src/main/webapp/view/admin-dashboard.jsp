<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="adminstyle.css">
</head>
<body>
    <div class="admin-container">
        <nav class="admin-sidebar">
            <h3 style="color: var(--secondary-color); margin-bottom: var(--spacing-lg);">Admin Menu</h3>
            <ul class="sidebar-menu">
                <li class="sidebar-item">
                    <a href="admin-dashboard.jsp" class="sidebar-link active">
                        <span class="sidebar-icon">📊</span>
                        Dashboard
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="admin-users.jsp" class="sidebar-link">
                        <span class="sidebar-icon">👥</span>
                        Quản Lý User
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="admin-movies.jsp" class="sidebar-link">
                        <span class="sidebar-icon">🎬</span>
                        Quản Lý Phim
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="admin-theaters.jsp" class="sidebar-link">
                        <span class="sidebar-icon">🎭</span>
                        Quản Lý Rạp
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="admin-bookings.jsp" class="sidebar-link">
                        <span class="sidebar-icon">🎫</span>
                        Quản Lý Booking
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="admin-revenue.jsp" class="sidebar-link">
                        <span class="sidebar-icon">💰</span>
                        Doanh Thu
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="admin-promotions.jsp" class="sidebar-link">
                        <span class="sidebar-icon">📣</span>
                        Khuyến Mãi
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="login.jsp" class="sidebar-link">
                        <span class="sidebar-icon">🚪</span>
                        Đăng Xuất
                    </a>
                </li>
            </ul>
        </nav>

        <main class="admin-main">
            <h1>Dashboard Admin</h1>
            <p>Chào mừng bạn đến với bảng điều khiển quản lý MyCinema.</p>

            <!-- Stats Cards -->
            <section class="stats-grid">
                <div class="stat-card">
                    <h3>Total Users</h3>
                    <p class="stat-number">1,234</p>
                </div>
                <div class="stat-card">
                    <h3>Total Bookings</h3>
                    <p class="stat-number">567</p>
                </div>
                <div class="stat-card">
                    <h3>Revenue Today</h3>
                    <p class="stat-number">12,345,000 VNĐ</p>
                </div>
                <div class="stat-card">
                    <h3>Active Movies</h3>
                    <p class="stat-number">45</p>
                </div>
            </section>

            <!-- Recent Bookings Table -->
            <section class="recent-bookings">
                <h2>Đặt Vé Gần Đây</h2>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID Booking</th>
                            <th>User</th>
                            <th>Phim</th>
                            <th>Rạp</th>
                            <th>Ngày</th>
                            <th>Trạng Thái</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#001</td>
                            <td>Nguyễn Văn A</td>
                            <td>Quái Thú Vô Hình</td>
                            <td>Cinestar Q6</td>
                            <td>09/11/2025</td>
                            <td><span class="status-badge status-confirmed">Xác Nhận</span></td>
                            <td><button class="btn btn-secondary" style="font-size: 12px;">Xem</button></td>
                        </tr>
                        <tr>
                            <td>#002</td>
                            <td>Trần Thị B</td>
                            <td>Avengers: Endgame</td>
                            <td>Cinestar Hai Bà Trưng</td>
                            <td>08/11/2025</td>
                            <td><span class="status-badge status-confirmed">Xác Nhận</span></td>
                            <td><button class="btn btn-secondary" style="font-size: 12px;">Xem</button></td>
                        </tr>
                        <tr>
                            <td>#003</td>
                            <td>Lê Văn C</td>
                            <td>Parasite</td>
                            <td>Cinestar Quốc Thanh</td>
                            <td>07/11/2025</td>
                            <td><span class="status-badge status-cancelled">Hủy</span></td>
                            <td><button class="btn btn-secondary" style="font-size: 12px;">Chi Tiết</button></td>
                        </tr>
                        <tr>
                            <td>#004</td>
                            <td>Phạm Thị D</td>
                            <td>Joker</td>
                            <td>Cinestar Hai Bà Trưng</td>
                            <td>06/11/2025</td>
                            <td><span class="status-badge status-pending">Chờ</span></td>
                            <td><button class="btn btn-secondary" style="font-size: 12px;">Xác Nhận</button></td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>

    <script>
        // Sidebar active
        document.querySelectorAll('.sidebar-link').forEach(link => {
            link.addEventListener('click', function() {
                document.querySelectorAll('.sidebar-link').forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            });
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