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
				<c:set var="movie" value="${listShowing[0]}" />
				<img src="${movie.imageUrl}" alt="${movie.name}" loading="lazy"
							onerror="this.onerror=null; this.src='https://via.placeholder.com/180x270?text=No+Image'">
				<h1>${movie.name }</h1>
				<a href="book-ticket?movieId=${movie.id }" class="btn">Đặt Vé Ngay</a>
			</div>
		</section>

		<section class="section">
			<h2>Phim Đang Chiếu</h2>
			<div class="movie-grid">
				<%-- Dùng JSTL để lặp qua danh sách listShowing từ Servlet --%>
				<c:forEach items="${listShowing}" var="m">
					<div class="movie-card">
						<%-- Lấy ảnh từ DB. Thêm onerror để nếu link ảnh lỗi thì hiện ảnh thay thế --%>
						<img src="${m.imageUrl}" alt="${m.name}" loading="lazy"
							onerror="this.onerror=null; this.src='https://via.placeholder.com/180x270?text=No+Image'">
						<div class="movie-info">
							<h3>${m.name}</h3>
							<%-- Có thể thay bằng ${m.duration} phút nếu muốn --%>
							<p class="genre">${m.type}</p>

							<%-- Truyền ID phim vào link đặt vé --%>
							<a href="book-ticket?movieId=${m.id}" class="btn">Đặt Vé</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<a href="showing" class="btn"
				style="margin-top: var(--spacing-md); display: inline-block;">Xem
				Tất Cả</a>
		</section>

		<section class="section">
			<h2>Phim Sắp Chiếu</h2>
			<div class="movie-grid">
				<c:forEach items="${listUpcoming}" var="m">
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