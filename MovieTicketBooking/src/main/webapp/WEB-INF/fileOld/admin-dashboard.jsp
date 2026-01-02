<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="adminstyle.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            <div class="dashboard-header">
                <h1>Dashboard Admin</h1>
                <p>Chào mừng bạn đến với bảng điều khiển quản lý MyCinema. Tổng quan hiệu suất hệ thống ngày 21/11/2025.</p>
            </div>

            <!-- Redesigned Stats Grid: Thêm icon, animation, và progress bars -->
            <section class="stats-grid enhanced-stats">
                <div class="stat-card enhanced-card">
                    <div class="stat-icon">👥</div>
                    <h3>Total Users</h3>
                    <p class="stat-number">1,234</p>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 75%;"></div>
                    </div>
                    <small>+12% so với tháng trước</small>
                </div>
                <div class="stat-card enhanced-card">
                    <div class="stat-icon">🎫</div>
                    <h3>Total Bookings</h3>
                    <p class="stat-number">567</p>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 60%;"></div>
                    </div>
                    <small>+8% so với tháng trước</small>
                </div>
                <div class="stat-card enhanced-card">
                    <div class="stat-icon">💰</div>
                    <h3>Revenue Today</h3>
                    <p class="stat-number">12,345,000 VNĐ</p>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 85%;"></div>
                    </div>
                    <small>+15% so với hôm qua</small>
                </div>
                <div class="stat-card enhanced-card">
                    <div class="stat-icon">🎬</div>
                    <h3>Active Movies</h3>
                    <p class="stat-number">45</p>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 90%;"></div>
                    </div>
                    <small>+3 phim mới</small>
                </div>
            </section>

            <!-- Redesigned Overview Charts: Thêm mini charts -->
            <section class="overview-charts">
                <div class="chart-card">
                    <h3>Bookings Trend</h3>
                    <canvas id="bookingsChart" width="400" height="200"></canvas>
                </div>
                <div class="chart-card">
                    <h3>Revenue Overview</h3>
                    <canvas id="revenueOverviewChart" width="400" height="200"></canvas>
                </div>
            </section>

            <!-- Redesigned Recent Bookings: Thêm search và better responsive -->
            <section class="recent-bookings enhanced-section">
                <div class="section-header">
                    <h2>Đặt Vé Gần Đây</h2>
                    <input type="text" placeholder="Tìm kiếm booking..." class="quick-search">
                </div>
                <div class="table-wrapper">
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
                                <td><button class="btn btn-secondary action-btn-small">Xem</button></td>
                            </tr>
                            <tr>
                                <td>#002</td>
                                <td>Trần Thị B</td>
                                <td>Avengers: Endgame</td>
                                <td>Cinestar Hai Bà Trưng</td>
                                <td>08/11/2025</td>
                                <td><span class="status-badge status-confirmed">Xác Nhận</span></td>
                                <td><button class="btn btn-secondary action-btn-small">Xem</button></td>
                            </tr>
                            <tr>
                                <td>#003</td>
                                <td>Lê Văn C</td>
                                <td>Parasite</td>
                                <td>Cinestar Quốc Thanh</td>
                                <td>07/11/2025</td>
                                <td><span class="status-badge status-cancelled">Hủy</span></td>
                                <td><button class="btn btn-secondary action-btn-small">Chi Tiết</button></td>
                            </tr>
                            <tr>
                                <td>#004</td>
                                <td>Phạm Thị D</td>
                                <td>Joker</td>
                                <td>Cinestar Hai Bà Trưng</td>
                                <td>06/11/2025</td>
                                <td><span class="status-badge status-pending">Chờ</span></td>
                                <td><button class="btn btn-secondary action-btn-small">Xác Nhận</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
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

        // Mini Charts for Dashboard
        const bookingsCtx = document.getElementById('bookingsChart').getContext('2d');
        new Chart(bookingsCtx, {
            type: 'line',
            data: {
                labels: ['17/11', '18/11', '19/11', '20/11', '21/11'],
                datasets: [{
                    label: 'Bookings',
                    data: [120, 150, 130, 180, 200],
                    borderColor: 'rgb(75, 192, 192)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: false } },
                scales: { y: { display: false }, x: { display: true } }
            }
        });

        const revenueCtx = document.getElementById('revenueOverviewChart').getContext('2d');
        new Chart(revenueCtx, {
            type: 'bar',
            data: {
                labels: ['17/11', '18/11', '19/11', '20/11', '21/11'],
                datasets: [{
                    label: 'Revenue (M VNĐ)',
                    data: [8, 10, 9, 12, 15],
                    backgroundColor: 'rgba(255, 99, 132, 0.6)'
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: false } },
                scales: { y: { display: false }, x: { display: true } }
            }
        });

        // Quick search functionality (mock)
        document.querySelector('.quick-search').addEventListener('input', function(e) {
            // Implement search logic here
            console.log('Searching for:', e.target.value);
        });
    </script>
</body>
</html>