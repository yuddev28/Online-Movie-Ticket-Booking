<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<%-- Cấu hình hiển thị tiền tệ Việt Nam --%>
<fmt:setLocale value="vi_VN" />

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
		<%-- Phần Hero Banner: Tái sử dụng class .hero từ styles.css --%>
		<%-- Nếu showTime có ảnh phim, ta dùng làm nền, nếu không dùng ảnh mặc định --%>
		<section class="hero">
			<div class="hero-banner active"
				style="background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('${not empty showTime.movie.imageUrl ? showTime.movie.imageUrl : 'https://via.placeholder.com/1400x500?text=Cinema'}');">
			</div>
			<div class="hero-overlay">
				<h1>Thanh Toán Thành Công!</h1>

				<p>Cảm ơn bạn đã lựa chọn dịch vụ của chúng tôi.</p>
			</div>
		</section>

		<%-- Phần nội dung chính: Tái sử dụng .success-hero và .success-summary --%>
		<div class="success-hero">
			<div class="success-icon">✓</div>
			<h2 class="success-title">Vé Của Bạn Đã Được Xác Nhận</h2>
			<p
				style="color: var(--text-muted); margin-bottom: var(--spacing-lg);">
				Mã đơn hàng: <strong style="color: var(--text-color);">#BOOKING-${System.currentTimeMillis()}</strong>
			</p>

			<section class="success-summary">
				<%-- Tên Phim --%>
				<div class="summary-item">
					<span style="color: var(--text-muted);">Phim</span> <span
						style="font-weight: bold; text-transform: uppercase;">${showTime.movie.name}</span>
				</div>

				<%-- Thời gian chiếu --%>
				<div class="summary-item">
					<span style="color: var(--text-muted);">Suất chiếu</span> <span>
						<%-- BƯỚC 1: Chuyển đổi (Parse) LocalDateTime dạng chuỗi sang java.util.Date --%>
						<fmt:parseDate value="${showTime.startTime}"
							pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" /> <%-- BƯỚC 2: Hiển thị Date đã chuyển đổi --%>
						<fmt:formatDate value="${parsedDate}" pattern="HH:mm" /> - <fmt:formatDate
							value="${parsedDate}" pattern="dd/MM/yyyy" />
					</span>
				</div>

				<%-- Rạp và Phòng --%>
				<div class="summary-item">
					<span style="color: var(--text-muted);">Rạp / Phòng</span> 
					<span>${showTime.cinema.name} - ${showTime.room.name}</span> - ${showTime.room.name}</span>
				</div>

				<%-- Ghế ngồi --%>
				<div class="summary-item">
					<span style="color: var(--text-muted);">Ghế đã chọn</span> <span
						style="color: var(--primary-color); font-weight: bold;">${seats}</span>
				</div>

				<%-- Tổng tiền --%>
				<div class="summary-item" style="border-bottom: none;">
					<span style="color: var(--text-muted);">Tổng thanh toán</span> <span
						style="color: var(--secondary-color); font-size: 18px; font-weight: 700;">
						<fmt:formatNumber value="${totalPrice}" type="currency" />
					</span>
				</div>

				<%-- Mã vé giả lập (hoặc lấy từ DB nếu có) --%>
				<div class="success-code"
					style="margin-top: 20px; border-top: 1px dashed #333; padding-top: 20px;">
					Mã Vé: V-${showTime.id}-${seats.replace(',','')}</div>

				<p
					style="color: var(--text-muted); font-size: 13px; margin-top: 10px;">
					* Vui lòng chụp màn hình hoặc kiểm tra email để lấy mã vé khi đến
					rạp.</p>
			</section>

			<%-- Nút điều hướng: Tái sử dụng .btn và .btn-secondary --%>
			<div
				style="margin-top: var(--spacing-lg); display: flex; gap: 10px; justify-content: center;">
				<a href="home" class="btn">Về Trang Chủ</a> 
				<a href="${pageContext.request.contextPath}/my-bookings" class="btn">Lịch Sử Đặt Vé</a>
			</div>
		</div>
	</main>

	<jsp:include page="footer.jsp" />
</body>
</html>