<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý User - Admin - MyCinema</title>
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
                    <a href="admin-users.jsp" class="sidebar-link active">
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
            <div class="users-header">
                <h1>Quản Lý User</h1>
                <button class="btn" onclick="openModal('addModal')">Thêm User Mới</button>
            </div>

            <div class="filter-bar">
                <form method="GET" action="admin-users.jsp" class="search-form">
                    <div class="form-group">
                        <input type="text" name="search" placeholder="Tìm email/tên..." class="form-control" style="width: 200px;">
                    </div>
                    <div class="form-group">
                        <select name="role" class="form-control" style="width: 150px;">
                            <option value="">Vai Trò</option>
                            <option value="user">User</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select name="status" class="form-control" style="width: 150px;">
                            <option value="">Trạng Thái</option>
                            <option value="active">Hoạt Động</option>
                            <option value="inactive">Không Hoạt Động</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary" style="margin-left: 10px;">Tìm</button>
                </form>
            </div>

            <div class="table-wrapper">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Tên</th>
                            <th>Vai Trò</th>
                            <th>Ngày Đăng Ký</th>
                            <th>Trạng Thái</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#001</td>
                            <td>user1@email.com</td>
                            <td>Nguyễn Văn A</td>
                            <td><span class="role-badge role-user">User</span></td>
                            <td>01/11/2025</td>
                            <td><span class="status-tag status-active">Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editUser('1')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteUser('1')">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#002</td>
                            <td>user2@email.com</td>
                            <td>Trần Thị B</td>
                            <td><span class="role-badge role-admin">Admin</span></td>
                            <td>05/11/2025</td>
                            <td><span class="status-tag status-active">Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editUser('2')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteUser('2')">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#003</td>
                            <td>user3@email.com</td>
                            <td>Lê Văn C</td>
                            <td><span class="role-badge role-user">User</span></td>
                            <td>10/11/2025</td>
                            <td><span class="status-tag status-inactive">Không Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editUser('3')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteUser('3')">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#004</td>
                            <td>user4@email.com</td>
                            <td>Phạm Thị D</td>
                            <td><span class="role-badge role-user">User</span></td>
                            <td>15/11/2025</td>
                            <td><span class="status-tag status-active">Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editUser('4')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteUser('4')">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#005</td>
                            <td>user5@email.com</td>
                            <td>Hoàng Văn E</td>
                            <td><span class="role-badge role-admin">Admin</span></td>
                            <td>20/11/2025</td>
                            <td><span class="status-tag status-active">Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editUser('5')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteUser('5')">Xóa</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination" style="text-align: center; margin-top: var(--spacing-lg);">
                <a href="#" onclick="prevPage()" class="btn btn-secondary" style="margin-right: 10px;">« Trước</a>
                <span style="margin: 0 20px; color: var(--text-muted);">1 / 5</span>
                <a href="#" onclick="nextPage()" class="btn btn-secondary">Sau »</a>
            </div>

            <!-- Modal Thêm/Sửa User -->
            <div id="addModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Thêm User Mới</h3>
                        <span class="close-modal" onclick="closeModal('addModal')">&times;</span>
                    </div>
                    <form class="modal-form">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" placeholder="Nhập email" required>
                        </div>
                        <div class="form-group">
                            <label for="name">Tên</label>
                            <input type="text" id="name" placeholder="Nhập tên" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Mật Khẩu</label>
                            <input type="password" id="password" placeholder="Nhập mật khẩu" required>
                        </div>
                        <div class="form-group">
                            <label for="role">Vai Trò</label>
                            <select id="role" required>
                                <option value="user">User</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="status">Trạng Thái</label>
                            <select id="status" required>
                                <option value="active">Hoạt Động</option>
                                <option value="inactive">Không Hoạt Động</option>
                            </select>
                        </div>
                        <div class="modal-btns">
                            <button type="submit" class="auth-btn">Lưu</button>
                            <button type="button" class="btn btn-secondary" onclick="closeModal('addModal')">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script>
        // Modal functions
        function openModal(id) {
            document.getElementById(id).style.display = 'flex';
        }

        function closeModal(id) {
            document.getElementById(id).style.display = 'none';
        }

        // Modal submit mock
        document.querySelector('.modal-form').addEventListener('submit', function(e) {
            e.preventDefault();
            alert('User đã được thêm thành công!');
            closeModal('addModal');
            // Reload table or add row
        });

        // Edit/Delete mock
        function editUser(id) {
            alert('Chỉnh sửa user ' + id + ' (tính năng này sẽ được triển khai sau)!');
        }

        function deleteUser(id) {
            if (confirm('Bạn có chắc muốn xóa user ' + id + '?')) {
                alert('User ' + id + ' đã xóa!');
                // Reload table
            }
        }

        function prevPage() {
            alert('Trang trước');
        }

        function nextPage() {
            alert('Trang sau');
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