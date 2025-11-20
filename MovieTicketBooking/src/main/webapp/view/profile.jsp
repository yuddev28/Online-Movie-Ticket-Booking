<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài Khoản - MyCinema</title>
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
                    <input type="text" placeholder="Tìm kiếm...">
                    <button type="submit">Tìm Kiếm</button>
                </form>
            </div>
        </div>
    </header>

    <main class="profile-container">
        <%-- Profile Info Section --%>
        <section class="profile-section">
            <h2>Thông Tin Cá Nhân</h2>
            <div class="profile-info">
                <div class="profile-field">
                    <label>Họ Và Tên:</label>
                    <p>Nguyễn Văn A</p>
                </div>
                <div class="profile-field">
                    <label>Email:</label>
                    <p>nguyenvana@email.com</p>
                </div>
                <div class="profile-field">
                    <label>Số Điện Thoại:</label>
                    <p>0123456789</p>
                </div>
                <div class="profile-field">
                    <label>Ngày Sinh:</label>
                    <p>01/01/1990</p>
                </div>
                <div class="profile-field" style="grid-column: 1 / -1;">
                    <button class="edit-profile-btn" onclick="toggleEditForm()">Chỉnh Sửa Thông Tin</button>
                </div>
            </div>
            <%-- Edit Form (ẩn mặc định) --%>
            <form id="editForm" style="display: none; margin-top: var(--spacing-md);">
                <div class="form-group">
                    <label for="newName">Họ Và Tên:</label>
                    <input type="text" id="newName" value="Nguyễn Văn A">
                </div>
                <div class="form-group">
                    <label for="newEmail">Email:</label>
                    <input type="email" id="newEmail" value="nguyenvana@email.com">
                </div>
                <div class="form-group">
                    <label for="newPhone">Số Điện Thoại:</label>
                    <input type="tel" id="newPhone" value="0123456789">
                </div>
                <div class="form-group">
                    <label for="newBirthDate">Ngày Sinh:</label>
                    <input type="date" id="newBirthDate" value="1990-01-01">
                </div>
                <button type="submit" class="btn" style="width: 100%; margin-top: var(--spacing-md);">Cập Nhật</button>
                <button type="button" class="btn btn-secondary" onclick="toggleEditForm()" style="width: 100%; margin-top: var(--spacing-sm);">Hủy</button>
            </form>
        </section>

        <%-- Booking History Section --%>
        <section class="profile-section">
            <h2>Lịch Sử Đặt Vé</h2>
            <div class="booking-history">
                <table class="booking-table">
                    <thead>
                        <tr>
                            <th>Ngày Đặt</th>
                            <th>Phim</th>
                            <th>Rạp</th>
                            <th>Số Ghế</th>
                            <th>Tổng Tiền</th>
                            <th>Trạng Thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>08/11/2025</td>
                            <td>Quái Thú Vô Hình</td>
                            <td>Cinestar Q6</td>
                            <td>A2, B3</td>
                            <td>110,000 VNĐ</td>
                            <td>Đã Xác Nhận</td>
                        </tr>
                        <tr>
                            <td>05/11/2025</td>
                            <td>Avengers: Endgame</td>
                            <td>Cinestar Hai Bà Trưng</td>
                            <td>C4, D5</td>
                            <td>100,000 VNĐ</td>
                            <td>Hoàn Tiền</td>
                        </tr>
                        <tr>
                            <td>03/11/2025</td>
                            <td>Joker</td>
                            <td>Cinestar Quận Thanh</td>
                            <td>E6</td>
                            <td>55,000 VNĐ</td>
                            <td>Đã Sử Dụng</td>
                        </tr>
                        <tr>
                            <td>01/11/2025</td>
                            <td>Frozen 2</td>
                            <td>Cinestar Q6</td>
                            <td>F7, G8</td>
                            <td>90,000 VNĐ</td>
                            <td>Đã Xác Nhận</td>
                        </tr>
                        <tr>
                            <td>30/10/2025</td>
                            <td>Parasite</td>
                            <td>Cinestar Hai Bà Trưng</td>
                            <td>H9</td>
                            <td>45,000 VNĐ</td>
                            <td>Đã Sử Dụng</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <p style="text-align: center; margin-top: var(--spacing-md);">
                <a href="my-bookings.jsp" class="btn btn-secondary">Xem Tất Cả Lịch Sử</a>
            </p>
        </section>

        <%-- Promotions Section --%>
        <section class="profile-section">
            <h2>Ưu Đãi Cá Nhân Hóa</h2>
            <div class="promotions-list">
                <div class="promotion-summary">
                    <h4>C’STUDENT - 45K HSSV</h4>
                    <p>Áp dụng cho vé 2D cả tuần.</p>
                    <button class="btn btn-secondary" style="margin-top: var(--spacing-sm);">Áp Dụng</button>
                </div>
                <div class="promotion-summary">
                    <h4>C'MONDAY - 45K Thứ 2</h4>
                    <p>Đồng giá vé thứ 2 hàng tuần.</p>
                    <button class="btn btn-secondary" style="margin-top: var(--spacing-sm);">Áp Dụng</button>
                </div>
                <div class="promotion-summary">
                    <h4>C'MEMBER - Giảm 10% Bắp Nước</h4>
                    <p>Giảm thêm cho thành viên VIP.</p>
                    <button class="btn btn-secondary" style="margin-top: var(--spacing-sm);">Áp Dụng</button>
                </div>
            </div>
        </section>

        <%-- Action Buttons --%>
        <section class="profile-section" style="text-align: center;">
            <button class="btn" style="margin: 0 var(--spacing-md);">Đổi Mật Khẩu</button>
            <a href="login.jsp" class="btn btn-secondary" style="text-decoration: none;">Đăng Xuất</a>
        </section>
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
        function toggleEditForm() {
            const form = document.getElementById('editForm');
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
        }

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