<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 1. Thêm thư viện JSTL để xử lý dữ liệu động --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài Khoản - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="profile-container">
        
        <%-- Kiểm tra: Nếu chưa đăng nhập thì đá về trang Login hoặc hiện thông báo --%>
        <c:if test="${empty sessionScope.user}">
            <div style="text-align: center; padding: 50px; color: white;">
                <h2>Bạn chưa đăng nhập!</h2>
                <a href="login.jsp" class="btn">Đăng Nhập Ngay</a>
            </div>
        </c:if>

        <%-- Chỉ hiện nội dung khi ĐÃ ĐĂNG NHẬP --%>
        <c:if test="${not empty sessionScope.user}">
            
            <%-- Profile Info Section --%>
            <section class="profile-section">
                <h2>Thông Tin Cá Nhân</h2>
                <div class="profile-info">
                    <div class="profile-field">
                        <label>Tên Đăng Nhập:</label>
                        <%-- Hiển thị Username từ Session --%>
                        <p>${sessionScope.user.username}</p>
                    </div>
                    <div class="profile-field">
                        <label>Email:</label>
                        <p>${sessionScope.user.email}</p>
                    </div>
                    <div class="profile-field">
                        <label>Số Điện Thoại:</label>
                        <p>${sessionScope.user.phoneNumber}</p>
                    </div>
                    <div class="profile-field">
                        <label>Vai Trò:</label>
                        <p>${sessionScope.user.role == 'ADMIN' ? 'Quản Trị Viên' : 'Thành Viên'}</p>
                    </div>
                    
                    <div class="profile-field" style="grid-column: 1 / -1;">
                        <button class="edit-profile-btn" onclick="toggleEditForm()">Chỉnh Sửa Thông Tin</button>
                    </div>
                </div>

                <%-- Edit Form: Thêm action trỏ đến Servlet xử lý cập nhật (ví dụ: update-profile) --%>
                <form id="editForm" action="update-profile" method="post" style="display: none; margin-top: var(--spacing-md);">
                    <div class="form-group">
                        <label for="newName">Tên Đăng Nhập:</label>
                        <%-- Đổ dữ liệu hiện tại vào ô input (readonly vì username thường không cho sửa) --%>
                        <input type="text" id="newName" name="username" value="${sessionScope.user.username}" readonly style="background: #333; color: #888;">
                    </div>
                    <div class="form-group">
                        <label for="newEmail">Email:</label>
                        <input type="email" id="newEmail" name="email" value="${sessionScope.user.email}" required>
                    </div>
                    <div class="form-group">
                        <label for="newPhone">Số Điện Thoại:</label>
                        <input type="tel" id="newPhone" name="phone" value="${sessionScope.user.phoneNumber}" required>
                    </div>
                    
                    <%-- Thêm input hidden để gửi ID user nếu cần --%>
                    <input type="hidden" name="id" value="${sessionScope.user.id}">

                    <button type="submit" class="btn" style="width: 100%; margin-top: var(--spacing-md);">Cập Nhật</button>
                    <button type="button" class="btn btn-secondary" onclick="toggleEditForm()" style="width: 100%; margin-top: var(--spacing-sm);">Hủy</button>
                </form>
            </section>

            <%-- Booking History Section --%>
            <section class="profile-section">
                <h2>Lịch Sử Đặt Vé</h2>
                <div class="booking-history">
                    
                    <%-- Kiểm tra nếu chưa có vé nào --%>
                    <c:if test="${empty sessionScope.user.tickets}">
                        <p style="text-align: center; color: #ccc; font-style: italic;">Bạn chưa đặt vé nào.</p>
                    </c:if>

                    <%-- Nếu có vé thì hiện bảng --%>
                    <c:if test="${not empty sessionScope.user.tickets}">
                        <table class="booking-table">
                            <thead>
                                <tr>
                                    <th>Mã Vé</th>
                                    <th>Phim</th>
                                    <th>Giá Vé</th>
                                    <th>Ngày Đặt</th>
                                    <th>Trạng Thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Vòng lặp duyệt danh sách vé (List<Ticket>) của User --%>
                                <c:forEach items="${sessionScope.user.tickets}" var="t">
                                    <tr>
                                        <td>#${t.ticketId}</td> <%-- Giả sử Ticket có getTicketId() --%>
                                        
                                        <%-- Lấy tên phim: cần ticket -> showtime -> movie (tùy cấu trúc model của bạn) --%>
                                        <%-- Nếu chưa link được sâu, tạm thời để placeholder hoặc ID --%>
                                        <td>
                                            <c:out value="${t.showtime.movie.name}" default="Phim ID: ${t.showtimeId}" />
                                        </td>

                                        <td>
                                            <fmt:formatNumber value="${t.price}" type="currency" currencySymbol="VNĐ"/>
                                        </td>
                                        
                                        <td>
                                            <%-- Format ngày giờ nếu t.createdAt là kiểu Date/LocalDateTime --%>
                                            <c:out value="${t.createdAt}" />
                                        </td>
                                        
                                        <td>
                                            <span style="color: ${t.status == 'PAID' ? '#4caf50' : '#f44336'}; font-weight: bold;">
                                                ${t.status == 'PAID' ? 'Đã Thanh Toán' : 'Chưa Thanh Toán'}
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                </div>
                <p style="text-align: center; margin-top: var(--spacing-md);">
                    <a href="movies" class="btn btn-secondary">Đặt Vé Mới</a>
                </p>
            </section>

            <%-- Action Buttons --%>
            <section class="profile-section" style="text-align: center;">
                <button class="btn" style="margin: 0 var(--spacing-md);">Đổi Mật Khẩu</button>
                <%-- Sửa link Đăng Xuất trỏ về Servlet logout --%>
                <a href="logout" class="btn btn-secondary" style="text-decoration: none;">Đăng Xuất</a>
            </section>

        </c:if> <%-- Kết thúc thẻ check login --%>

    </main>

    <jsp:include page="footer.jsp" />

    <script>
        function toggleEditForm() {
            const form = document.getElementById('editForm');
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
        }
    </script>
</body>
</html>