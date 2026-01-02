<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Bookings - Admin - MyCinema</title>
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
                    <a href="admin-bookings.jsp" class="sidebar-link active">
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
            <div class="bookings-header">
                <h1>Quản Lý Bookings</h1>
                <div class="filter-bar">
                    <form method="GET" action="admin-bookings.jsp" class="search-form">
                        <div class="form-group">
                            <input type="text" name="search" placeholder="Tìm user/phim..." class="form-control" style="width: 200px;">
                        </div>
                        <div class="form-group">
                            <select name="status" class="form-control" style="width: 150px;">
                                <option value="">Trạng Thái</option>
                                <option value="confirmed">Xác Nhận</option>
                                <option value="pending">Chờ</option>
                                <option value="cancelled">Hủy</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="date" name="fromDate" class="form-control" style="width: 150px;">
                        </div>
                        <div class="form-group">
                            <input type="date" name="toDate" class="form-control" style="width: 150px;">
                        </div>
                        <button type="submit" class="btn btn-primary" style="margin-left: 10px;">Tìm</button>
                    </form>
                </div>
            </div>

            <div class="table-wrapper">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th><span>ID</span></th>
                            <th><span>User</span></th>
                            <th><span>Phim</span></th>
                            <th><span>Show Time</span></th>
                            <th><span>Ghế</span></th>
                            <th><span>Status</span></th>
                            <th><span>Amount</span></th>
                            <th><span>Ngày Book</span></th>
                            <th><span>Action</span></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>user1@email.com</td>
                            <td>Avengers Endgame</td>
                            <td>20/11/2025 18:00</td>
                            <td>A1-A2</td>
                            <td><span class="status-badge status-confirmed">Xác Nhận</span></td>
                            <td>200.000 VND</td>
                            <td>20/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(1)">Chi Tiết</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>user2@email.com</td>
                            <td>Spider-Man</td>
                            <td>21/11/2025 20:00</td>
                            <td>B5</td>
                            <td><span class="status-badge status-pending">Chờ</span></td>
                            <td>100.000 VND</td>
                            <td>20/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(2)">Chi Tiết</button>
                                <button class="btn btn-secondary action-btn-small" onclick="cancel(2)">Hủy</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>user3@email.com</td>
                            <td>Black Panther</td>
                            <td>22/11/2025 19:00</td>
                            <td>C3-C4</td>
                            <td><span class="status-badge status-cancelled">Hủy</span></td>
                            <td>300.000 VND</td>
                            <td>19/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(3)">Chi Tiết</button>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>user4@email.com</td>
                            <td>Dune</td>
                            <td>23/11/2025 17:00</td>
                            <td>D1</td>
                            <td><span class="status-badge status-confirmed">Xác Nhận</span></td>
                            <td>150.000 VND</td>
                            <td>20/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(4)">Chi Tiết</button>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>user5@email.com</td>
                            <td>The Matrix</td>
                            <td>24/11/2025 21:00</td>
                            <td>E2-E3</td>
                            <td><span class="status-badge status-pending">Chờ</span></td>
                            <td>250.000 VND</td>
                            <td>20/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(5)">Chi Tiết</button>
                                <button class="btn btn-secondary action-btn-small" onclick="cancel(5)">Hủy</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination" style="text-align: center; margin-top: var(--spacing-lg);">
                <a href="#" onclick="prevPage()" class="btn btn-secondary" style="margin-right: 10px;">« Trước</a>
                <span style="margin: 0 20px; color: var(--text-muted);">1 / 3</span>
                <a href="#" onclick="nextPage()" class="btn btn-secondary">Sau »</a>
            </div>
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

        // Action functions
        function detail(id) {
            alert('Chi tiết booking ' + id);
            // Có thể mở modal chi tiết ở đây
        }

        function cancel(id) {
            if (confirm('Hủy booking ' + id + '?')) {
                alert('Đã hủy booking ' + id + '!');
                // Reload table or update status
            }
        }

        function prevPage() {
            alert('Chuyển trang trước');
        }

        function nextPage() {
            alert('Chuyển trang sau');
        }

        // Dropdown script (giữ nguyên nếu cần)
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