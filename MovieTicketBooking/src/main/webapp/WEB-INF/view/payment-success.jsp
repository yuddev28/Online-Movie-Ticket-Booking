<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thành Công - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="success-container">
        <section class="hero">
            <div class="hero-banner" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://via.placeholder.com/1400x500?text=Payment+Success');"></div>
            <div class="hero-overlay">
                <h1>Thanh Toán Thành Công!</h1>
                <p>Cảm ơn bạn đã đặt vé tại MyCinema. Vé đã được gửi qua email.</p>
            </div>
        </section>

        <div class="success-hero">
            <div style="font-size: 64px; color: #28a745; margin-bottom: var(--spacing-sm);">✓</div>
            <h2 class="success-title">Đơn Vé Của Bạn Đã Được Xác Nhận</h2>
            <p style="color: var(--text-muted); margin-bottom: var(--spacing-lg);">Mã đơn: <strong>MCN-20251109-001</strong></p>

            <section class="success-summary">
                <div class="summary-item">
                    <span>Phim: Quái Thú Vô Hình: Vùng Đất Chết Chóc</span>
                    <span>TPHCM - 16:30, 09/11/2025</span>
                </div>
                <div class="summary-item">
                    <span>Ghế: B3, B10 (Standard)</span>
                    <span>2 vé</span>
                </div>
                <div class="summary-item">
                    <span>Tổng Tiền</span>
                    <span>80,000 VNĐ</span>
                </div>
                <div class="success-code">Mã Vé: MCN-V-20251109-001</div>
                <p style="color: var(--text-muted); font-size: 14px;">Vé sẽ được gửi qua email trong 5 phút. Kiểm tra thư rác nếu không nhận được.</p>
            </section>

            <div style="margin-top: var(--spacing-lg);">
                <a href="home.jsp" class="btn" style="margin-right: var(--spacing-md);">Về Trang Chủ</a>
                <a href="profile.jsp" class="btn btn-secondary">Xem Hồ Sơ</a>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>