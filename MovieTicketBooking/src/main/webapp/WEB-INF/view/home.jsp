<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- QUAN TRỌNG: Thêm thư viện JSTL để dùng vòng lặp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyCinema - Trang Chủ</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<%-- Gọi Header chung --%>
	<jsp:include page="header.jsp" />

	<main>
		<%-- Hero Section: Giữ nguyên --%>
		<section class="hero">
			<div class="hero-banner"
				style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('http://www.impawards.com/2019/posters/avengers_endgame.jpg');">
			</div>
			<div class="hero-overlay">
				<h1>Avatar 3: Fire and Ash</h1>
				<p>Cuộc chiến khốc liệt nhất bắt đầu.</p>
				<a href="movie-detail?movieId=1" class="btn">Đặt Vé Ngay</a>
			</div>
		</section>

		<%-- Cinema-select: Giữ nguyên --%>
		<section class="cinema-select">
			<div class="cinema-tab active">Tất Cả Rạp</div>
			<div class="cinema-tab">Hà Nội</div>
			<div class="cinema-tab">TP.HCM</div>
			<div class="cinema-tab">Đà Nẵng</div>
		</section>

		<%-- ================================================= --%>
		<%-- PHẦN 1: PHIM ĐANG CHIẾU (Dùng vòng lặp JSTL)      --%>
		<%-- Biến hứng dữ liệu: listShowing                     --%>
		<%-- ================================================= --%>
		<section class="section">
			<h2>Phim Đang Chiếu</h2>
			<div class="movie-grid">
				<%-- Dùng JSTL để lặp qua danh sách listShowing từ Servlet --%>
				<c:forEach items="${listShowing}" var="m" begin="0" end="3">
					<div class="movie-card">
						<%-- Lấy ảnh từ DB. Thêm onerror để nếu link ảnh lỗi thì hiện ảnh thay thế --%>
						<img src="${m.imageUrl}" alt="${m.name}" loading="lazy"
							onerror="this.onerror=null; this.src='https://via.placeholder.com/180x270?text=No+Image'">
						<div class="movie-info">
							<h3>${m.name}</h3>
							<%-- Có thể thay bằng ${m.duration} phút nếu muốn --%>
							<p class="genre">${m.type}</p>

							<%-- Truyền ID phim vào link đặt vé --%>
							<a href="movie-detail?movieId=${m.id}" class="btn">Đặt Vé</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<a href="showing" class="btn"
				style="margin-top: var(--spacing-md); display: inline-block;">Xem
				Tất Cả</a>
		</section>

		<%-- ================================================= --%>
		<%-- PHẦN 2: PHIM SẮP CHIẾU (Dùng vòng lặp JSTL)       --%>
		<%-- Biến hứng dữ liệu: listUpcoming                    --%>
		<%-- ================================================= --%>
		<section class="section">
			<h2>Phim Sắp Chiếu</h2>
			<div class="movie-grid">
				<c:forEach items="${listUpcoming}" var="m" begin="0" end="3">
					<div class="movie-card">
						<img src="${m.imageUrl}" alt="${m.name}" loading="lazy"
							onerror="this.onerror=null; this.src='https://via.placeholder.com/180x270?text=No+Image'">
						<div class="movie-info">
							<h3>${m.name}</h3>
							<%-- Model chưa có ngày chiếu, chỉ hiện Type --%>
							<p class="genre">${m.type}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<a href="upcoming" class="btn"
				style="margin-top: var(--spacing-md); display: inline-block;">Xem
				Tất Cả</a>
		</section>
	</main>

	<%-- Gọi Footer chung --%>
	<jsp:include page="footer.jsp" />
</body>
</html>
