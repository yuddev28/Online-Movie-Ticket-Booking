<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thất Bại - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="failure-container">
        <section class="hero">
            <div class="hero-banner" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://via.placeholder.com/1400x500?text=Payment+Failure');"></div>
            <div class="hero-overlay">
                <h1>Thanh Toán Thất Bại</h1>
                <p>Chúng tôi xin lỗi vì sự bất tiện này. Vui lòng thử lại.</p>
            </div>
        </section>

        <div class="failure-hero">
            <div class="failure-icon">✕</div>
            <h2 class="failure-title">Giao Dịch Không Thành Công</h2>
            <p class="failure-message">Lý do: Thẻ không hợp lệ hoặc hết hạn. Vui lòng kiểm tra thông tin và thử lại.</p>

            <section class="failure-summary">
                <h3>Thông Tin Đơn Hàng</h3>
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
                <div class="success-code">Mã Đơn: MCN-20251109-001 (Chưa Xác Nhận)</div>
                <p style="color: var(--text-muted); font-size: 14px;">Không có khoản phí nào bị trừ. Bạn có thể thử thanh toán lại ngay.</p>
            </section>

            <div style="margin-top: var(--spacing-lg);">
                <a href="payment.jsp" class="retry-btn">Thử Thanh Toán Lại</a>
                <a href="book-ticket.jsp" class="back-btn">Quay Lại Đặt Vé</a>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>