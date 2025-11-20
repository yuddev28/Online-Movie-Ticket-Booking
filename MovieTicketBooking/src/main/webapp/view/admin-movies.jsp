<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Phim - Admin - MyCinema</title>
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
                    <a href="admin-movies.jsp" class="sidebar-link active">
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
            <div class="movies-header">
                <h1>Quản Lý Phim</h1>
                <button class="btn" onclick="openModal('addModal')">Thêm Phim Mới</button>
            </div>

            <table class="movies-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu Đề</th>
                        <th>Thể Loại</th>
                        <th>Thời Lượng</th>
                        <th>Trạng Thái</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#001</td>
                        <td>Quái Thú Vô Hình</td>
                        <td>Kinh Dị</td>
                        <td>99 phút</td>
                        <td><span class="status-tag status-active">Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('1')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('1')">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#002</td>
                        <td>Avengers: Endgame</td>
                        <td>Hành Động, Siêu Anh Hùng</td>
                        <td>181 phút</td>
                        <td><span class="status-tag status-active">Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('2')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('2')">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#003</td>
                        <td>Parasite</td>
                        <td>Tâm Lý, Hài</td>
                        <td>132 phút</td>
                        <td><span class="status-tag status-inactive">Không Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('3')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('3')">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#004</td>
                        <td>Joker</td>
                        <td>Tội Phạm, Tâm Lý</td>
                        <td>122 phút</td>
                        <td><span class="status-tag status-active">Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('4')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('4')">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#005</td>
                        <td>Frozen 2</td>
                        <td>Hoạt Hình, Gia Đình</td>
                        <td>103 phút</td>
                        <td><span class="status-tag status-active">Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('5')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('5')">Xóa</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- Modal Thêm/Sửa Phim -->
            <div id="addModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Thêm Phim Mới</h3>
                        <span class="close-modal" onclick="closeModal('addModal')">&times;</span>
                    </div>
                    <form class="modal-form">
                        <div class="form-group">
                            <label for="title">Tiêu Đề</label>
                            <input type="text" id="title" placeholder="Nhập tiêu đề phim" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Mô Tả</label>
                            <textarea id="description" rows="3" placeholder="Nhập mô tả phim" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="genre">Thể Loại</label>
                            <select id="genre" required>
                                <option value="">Chọn thể loại</option>
                                <option value="hành động">Hành Động</option>
                                <option value="kinh dị">Kinh Dị</option>
                                <option value="hài">Hài</option>
                                <option value="tâm lý">Tâm Lý</option>
                                <option value="hoạt hình">Hoạt Hình</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="duration">Thời Lượng (phút)</label>
                            <input type="number" id="duration" placeholder="Nhập thời lượng" required>
                        </div>
                        <div class="form-group">
                            <label for="status">Trạng Thái</label>
                            <select id="status" required>
                                <option value="active">Hoạt Động</option>
                                <option value="inactive">Không Hoạt Động</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="poster">Poster (Upload)</label>
                            <input type="file" id="poster" accept="image/*">
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
            alert('Phim đã được thêm thành công!');
            closeModal('addModal');
            // Reload table or add row
        });

        // Edit/Delete mock
        function editMovie(id) {
            alert('Chỉnh sửa phim ' + id + ' (tính năng này sẽ được triển khai sau)!');
        }

        function deleteMovie(id) {
            if (confirm('Bạn có chắc muốn xóa phim ' + id + '?')) {
                alert('Phim ' + id + ' đã xóa!');
                // Reload table
            }
        }

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