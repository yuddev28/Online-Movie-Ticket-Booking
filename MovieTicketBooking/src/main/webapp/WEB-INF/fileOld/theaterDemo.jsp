<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Rạp - MyCinema</title>
</head>
<body>
    <jsp:include page="header.jsp" />

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
                <%-- ... Code danh sách các thẻ .cinema-card giữ nguyên ... --%>
                 <div class="cinema-card">
                    <img src="https://via.placeholder.com/250x200?text=Quốc+Thanh" alt="Cinestar Quốc Thanh">
                    <div class="cinema-info">
                        <h3>Cinestar Quốc Thanh</h3>
                        <p><strong>Thành phố:</strong> Tp. Hồ Chí Minh</p>
                        <p><strong>Địa chỉ:</strong> 271 Nguyễn Trãi, P. Nguyễn Cư Trinh, Q.1</p>
                        <p class="cinema-hours">Giờ mở cửa: 8:00 - 24:00</p>
                        <a href="#" target="_blank" class="btn">Xem Bản Đồ</a>
                    </div>
                </div>
            </div>
        </section>

        <section id="map-section" class="map-section">
            <h2>Bản Đồ Hệ Thống Rạp MyCinema</h2>
            <iframe class="map-iframe" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.325!2d106.699!3d10.776!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f38f7e!2sHo+Chi+Minh+City!5e0!3m2!1sen!2s!4v1630000000000" allowfullscreen="" loading="lazy"></iframe>
        </section>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>