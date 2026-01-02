<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doanh Thu - Admin - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="adminstyle.css">
</head>
<body>
    <div class="admin-container">
        <nav class="admin-sidebar">
            <h3 style="color: var(--secondary-color); margin-bottom: var(--spacing-lg);">Admin Menu</h3>
            <ul class="sidebar-menu">
                <li class="sidebar-item">
                    <a href="admin-dashboard.jsp" class="sidebar-link">
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
                    <a href="admin-revenue.jsp" class="sidebar-link active">
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
            <div class="revenue-header enhanced-header">
                <div class="header-left">
                    <h1>Quản Lý Doanh Thu</h1>
                    <p>Tổng quan doanh thu hệ thống MyCinema - Cập nhật đến 21/11/2025</p>
                </div>
                <div class="filter-bar enhanced-filter">
                    <form method="GET" action="admin-revenue.jsp" class="search-form">
                        <div class="form-group">
                            <input type="date" name="fromDate" class="form-control" value="2025-11-01">
                        </div>
                        <div class="form-group">
                            <input type="date" name="toDate" class="form-control" value="2025-11-21">
                        </div>
                        <div class="form-group">
                            <select name="filter" class="form-control">
                                <option value="daily">Hàng Ngày</option>
                                <option value="monthly">Hàng Tháng</option>
                                <option value="yearly">Hàng Năm</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Lọc</button>
                        <button type="button" class="btn btn-secondary" onclick="exportData()">Xuất Excel</button>
                    </form>
                </div>
            </div>

            <!-- Redesigned Revenue Summary: Grid với icons và trends -->
            <section class="stats-grid enhanced-stats revenue-stats">
                <div class="stat-card enhanced-card">
                    <div class="stat-icon">💰</div>
                    <h3>Tổng Doanh Thu</h3>
                    <p class="stat-number">2,345,000,000 VNĐ</p>
                    <div class="trend-indicator positive">+18% YoY</div>
                </div>
                <div class="stat-card enhanced-card">
                    <div class="stat-icon">📅</div>
                    <h3>Doanh Thu Hôm Nay</h3>
                    <p class="stat-number">150,000,000 VNĐ</p>
                    <div class="trend-indicator positive">+5% vs Yesterday</div>
                </div>
                <div class="stat-card enhanced-card">
                    <div class="stat-icon">📊</div>
                    <h3>Doanh Thu Tháng 11</h3>
                    <p class="stat-number">850,000,000 VNĐ</p>
                    <div class="trend-indicator positive">+22% MoM</div>
                </div>
                <div class="stat-card enhanced-card">
                    <div class="stat-icon">🎫</div>
                    <h3>Số Vé Bán</h3>
                    <p class="stat-number">5,678</p>
                    <div class="trend-indicator negative">-2% vs Last Month</div>
                </div>
            </section>

            <!-- Redesigned Revenue Table: Thêm sortable headers -->
            <section class="revenue-table-section">
                <h2>Chi Tiết Doanh Thu</h2>
                <div class="table-wrapper">
                    <table class="admin-table sortable-table">
                        <thead>
                            <tr>
                                <th onclick="sortTable(0)">Ngày <span class="sort-icon">↕</span></th>
                                <th onclick="sortTable(1)">Doanh Thu <span class="sort-icon">↕</span></th>
                                <th onclick="sortTable(2)">Số Vé Bán <span class="sort-icon">↕</span></th>
                                <th onclick="sortTable(3)">Phim Nổi Bật <span class="sort-icon">↕</span></th>
                                <th onclick="sortTable(4)">Rạp <span class="sort-icon">↕</span></th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>21/11/2025</td>
                                <td>150,000,000 VNĐ</td>
                                <td>1,200</td>
                                <td>Quái Thú Vô Hình</td>
                                <td>Cinestar Q6</td>
                                <td><button class="btn btn-secondary action-btn-small" onclick="detailRevenue('20251121')">Chi Tiết</button></td>
                            </tr>
                            <tr>
                                <td>20/11/2025</td>
                                <td>120,000,000 VNĐ</td>
                                <td>950</td>
                                <td>Avengers: Endgame</td>
                                <td>Cinestar Hai Bà Trưng</td>
                                <td><button class="btn btn-secondary action-btn-small" onclick="detailRevenue('20251120')">Chi Tiết</button></td>
                            </tr>
                            <tr>
                                <td>19/11/2025</td>
                                <td>80,000,000 VNĐ</td>
                                <td>700</td>
                                <td>Parasite</td>
                                <td>Cinestar Quốc Thanh</td>
                                <td><button class="btn btn-secondary action-btn-small" onclick="detailRevenue('20251119')">Chi Tiết</button></td>
                            </tr>
                            <!-- Thêm các hàng khác nếu cần -->
                        </tbody>
                    </table>
                </div>
                <div class="pagination enhanced-pagination">
                    <button onclick="prevPage()" class="btn btn-secondary">« Trước</button>
                    <span>1 / 3</span>
                    <button onclick="nextPage()" class="btn btn-secondary">Sau »</button>
                </div>
            </section>
        </main>
    </div>

    <script>
        function exportData() { alert('Xuất dữ liệu Excel...'); }
        function detailRevenue(date) { alert('Chi tiết doanh thu ngày ' + date); }
        function prevPage() { alert('Chuyển trang trước'); }
        function nextPage() { alert('Chuyển trang sau'); }

        // Sortable table mock
        function sortTable(n) {
            // Implement sorting logic here
            alert('Sắp xếp cột ' + n);
        }

        // Sidebar active
        document.querySelectorAll('.sidebar-link').forEach(link => {
            link.addEventListener('click', function() {
                document.querySelectorAll('.sidebar-link').forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>