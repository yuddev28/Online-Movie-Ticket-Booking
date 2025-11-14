<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Rạp - MyCinema</title>
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
                    <input type="text" placeholder="Tìm kiếm rạp chiếu...">
                    <button type="submit">Tìm Kiếm</button>
                </form>
            </div>
        </div>
    </header>

    <main>
        <section class="hero">
            <div class="hero-banner" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://via.placeholder.com/1400x500?text=Map+Rạp+MyCinema');"></div>
            <div class="hero-overlay">
                <h1>Danh Sách Rạp MyCinema</h1>
                <p>Khám phá hệ thống rạp hiện đại tại các thành phố lớn trên toàn quốc.</p>
                <a href="#map-section" class="btn">Xem Bản Đồ</a>
            </div>
        </section>

        <section class="section">
            <h2>Danh Sách Rạp Chiếu</h2>
            <div class="cinema-grid">
                <%-- Rạp 1: Cinestar Quốc Thanh --%>
                <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Quốc+Thanh" alt="Cinestar Quốc Thanh">
                    <div class="cinema-info">
                        <h3>Cinestar Quốc Thanh</h3>
                        <p><strong>Thành phố:</strong> Tp. Hồ Chí Minh</p>
                        <p><strong>Địa chỉ:</strong> 271 Nguyễn Trãi, P. Nguyễn Cư Trinh, Q.1</p>
                        <p class="cinema-hours">Giờ mở cửa: 8:00 - 24:00</p>
                        <a href="https://www.google.com/maps/search/?api=1&query=271+Nguyễn+Trãi,+P.+Nguyễn+Cư+Trinh,+Q.1,+Tp.+Hồ+Chí+Minh" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>

                <%-- Rạp 2: Cinestar Hai Bà Trưng --%>
                <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Hai+Bà+Trưng" alt="Cinestar Hai Bà Trưng">
                    <div class="cinema-info">
                        <h3>Cinestar Hai Bà Trưng</h3>
                        <p><strong>Thành phố:</strong> Tp. Hồ Chí Minh</p>
                        <p><strong>Địa chỉ:</strong> 135 Hai Bà Trưng, P. Bến Nghé, Q.1</p>
                        <p class="cinema-hours">Giờ mở cửa: 8:00 - 24:00</p>
                        <a href="https://www.google.com/maps/search/?api=1&query=135+Hai+Bà+Trưng,+P.+Bến+Nghé,+Q.1,+Tp.+Hồ+Chí+Minh" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>

                <%-- Rạp 3: Cinestar Satra Quận 6 --%>
                <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Satra+Q6" alt="Cinestar Satra Quận 6">
                    <div class="cinema-info">
                        <h3>Cinestar Satra Quận 6</h3>
                        <p><strong>Thành phố:</strong> Tp. Hồ Chí Minh</p>
                        <p><strong>Địa chỉ:</strong> 1466 Đ. Võ Văn Kiệt, Phường 1, Quận 6</p>
                        <p class="cinema-hours">Giờ mở cửa: 8:00 - 24:00</p>
                        <a href="https://www.google.com/maps/search/?api=1&query=1466+Đ.+Võ+Văn+Kiệt,+Phường+1,+Quận+6,+Tp.+Hồ+Chí+Minh" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>

                <%-- Rạp 4: Cinestar Đà Lạt --%>
                <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Đà+Lạt" alt="Cinestar Đà Lạt">
                    <div class="cinema-info">
                        <h3>Cinestar Đà Lạt</h3>
                        <p><strong>Thành phố:</strong> Tp. Đà Lạt</p>
                        <p><strong>Địa chỉ:</strong> Quảng trường Lâm Viên, P.10</p>
                        <p class="cinema-hours">Giờ mở cửa: 8:00 - 23:00</p>
                        <a href="https://www.google.com/maps/search/?api=1&query=Quảng+trường+Lâm+Viên,+P.10,+Tp.+Đà+Lạt" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>

                <%-- Rạp 5: Cinestar Lâm Đồng --%>
                <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Lâm+Đồng" alt="Cinestar Lâm Đồng">
                    <div class="cinema-info">
                        <h3>Cinestar Lâm Đồng</h3>
                        <p><strong>Thành phố:</strong> Lâm Đồng</p>
                        <p><strong>Địa chỉ:</strong> 713 QL20, Liên Nghĩa, Đức Trọng</p>
                        <p class="cinema-hours">Giờ mở cửa: 8:00 - 23:00</p>
                        <a href="https://www.google.com/maps/search/?api=1&query=713+QL20,+Liên+Nghĩa,+Đức+Trọng,+Lâm+Đồng" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>

                <%-- Rạp 6: Cinestar Huế --%>
                <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Huế" alt="Cinestar Huế">
                    <div class="cinema-info">
                        <h3>Cinestar Huế</h3>
                        <p><strong>Thành phố:</strong> Tp. Huế</p>
                        <p><strong>Địa chỉ:</strong> 25 Hai Bà Trưng, P. Vĩnh Ninh</p>
                        <p class="cinema-hours">Giờ mở cửa: 8:00 - 23:00</p>
                        <a href="https://www.google.com/maps/search/?api=1&query=25+Hai+Bà+Trưng,+P.+Vĩnh+Ninh,+Tp.+Huế" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>

                <%-- Rạp 7: Cinestar Mỹ Tho --%>
                <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Mỹ+Tho" alt="Cinestar Mỹ Tho">
                    <div class="cinema-info">
                        <h3>Cinestar Mỹ Tho</h3>
                        <p><strong>Thành phố:</strong> TP. Mỹ Tho, Tiền Giang</p>
                        <p><strong>Địa chỉ:</strong> 52 Đinh Bộ Lĩnh, Phường 3</p>
                        <p class="cinema-hours">Giờ mở cửa: 8:00 - 23:00</p>
                        <a href="https://www.google.com/maps/search/?api=1&query=52+Đinh+Bộ+Lĩnh,+Phường+3,+TP.+Mỹ+Tho,+Tiền+Giang" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>

                <%-- Rạp 8: Cinestar Sinh Viên --%>
                <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Sinh+Viên" alt="Cinestar Sinh Viên">
                    <div class="cinema-info">
                        <h3>Cinestar Sinh Viên</h3>
                        <p><strong>Thành phố:</strong> Tx. Dĩ An, Bình Dương</p>
                        <p><strong>Địa chỉ:</strong> Nhà Văn hóa Sinh viên Đại học Quốc gia TP.HCM, P. Đông Hòa</p>
                        <p class="cinema-hours">Giờ mở cửa: 9:00 - 22:00</p>
                        <a href="https://www.google.com/maps/search/?api=1&query=Nhà+Văn+hóa+Sinh+viên+Đại+học+Quốc+gia+TP.HCM,+P.+Đông+Hòa,+Tx.+Dĩ+An,+Bình+Dương" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>

                <%-- Rạp 9: Cinestar Kiên Giang --%>
                <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Kiên+Giang" alt="Cinestar Kiên Giang">
                    <div class="cinema-info">
                        <h3>Cinestar Kiên Giang</h3>
                        <p><strong>Thành phố:</strong> Tp. Rạch Giá, Kiên Giang</p>
                        <p><strong>Địa chỉ:</strong> Trung tâm Thương mại, Lô A2 - Khu 2, Nguyễn Chí Thanh, Rạch Sỏi</p>
                        <p class="cinema-hours">Giờ mở cửa: 8:00 - 23:00</p>
                        <a href="https://www.google.com/maps/search/?api=1&query=Trung+tâm+Thương+mại,+Lô+A2+-+Khu+2,+Nguyễn+Chí+Thanh,+Rạch+Sỏi,+Tp.+Rạch+Giá,+Kiên+Giang" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>
            </div>
        </section>

        <%-- Map Section: Bản đồ nhỏ embed Google Maps (tổng quan TP.HCM, zoom out) --%>
        <section id="map-section" class="map-section">
            <h2>Bản Đồ Hệ Thống Rạp MyCinema</h2>
            <p>Nhấp vào nút "Xem Bản Đồ" trên mỗi rạp để xem hướng dẫn chi tiết. Dưới đây là bản đồ tổng quan các rạp chính tại TP. Hồ Chí Minh.</p>
            <iframe class="map-iframe" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.325!2d106.699!3d10.776!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f38f7e!2sHo+Chi+Minh+City!5e0!3m2!1sen!2s!4v1630000000000" allowfullscreen="" loading="lazy"></iframe>
            <p style="margin-top: var(--spacing-md); color: var(--text-muted);">* Bản đồ được nhúng từ Google Maps. Để xem đầy đủ, mở trong trình duyệt.</p>
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

   
</body>
</html>