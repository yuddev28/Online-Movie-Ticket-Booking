<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- JSP Directive: Định nghĩa encoding và ngôn ngữ cho trang --%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyCinema - Trang Chủ</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<%-- Header: Bao gồm top-nav và search-bar - Sticky để luôn hiển thị khi scroll --%>
	<header>
		<div class="top-nav">
			<%-- Logo: Link về home, màu vàng nổi bật --%>
			<a href="home.jsp" class="logo">MyCinema</a>
			<%-- Nav-links: Menu chính, hover đỏ - Ẩn trên mobile --%>
			<ul class="nav-links">
				<li><a href="home.jsp">Trang Chủ</a></li>
				<li class="has-dropdown"><input type="checkbox"
					id="movieToggle" class="dropdown-toggle"> <label
					for="movieToggle" id="movieLink">Phim</label>
					<ul class="dropdown">
						<li><a href="movieShowing.jsp">Phim Đang Chiếu</a></li>
						<li><a href="movieUpcoming.jsp">Phim Sắp Chiếu</a></li>
						<li><a href="movies.jsp">Tất Cả Phim</a></li>
					</ul></li>
				<li><a href="theater.jsp">Rạp</a></li>
				<li><a href="profile.jsp">Tài Khoản</a></li>
			</ul>
			<%-- User-actions: Buttons đăng nhập/đăng ký - CTA cho user --%>
			<div class="user-actions">
				<a href="login.jsp" class="btn btn-secondary">Đăng Nhập</a> <a
					href="register.jsp" class="btn">Đăng Ký</a>
			</div>
		</div>
		<%-- Search-bar-header: Form tìm kiếm toàn trang - Placeholder cho search phim --%>
		<div class="search-bar-header">
			<div class="search-container">
				<form>
					<input type="text" placeholder="Tìm kiếm phim, diễn viên...">
					<button type="submit">Tìm Kiếm</button>
				</form>
			</div>
		</div>
	</header>

	<%-- Main: Container nội dung chính --%>
	<main>
		<%-- Hero Section: Tĩnh - Một banner duy nhất với background image và overlay text --%>
		<%-- Loại bỏ carousel: Không JS, không nút prev/next, chỉ hero-banner đơn --%>
		<section class="hero">
			<%-- Hero-banner: Background image cố định (Avengers Endgame làm ví dụ) --%>
			<div class="hero-banner"
				style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('http://www.impawards.com/2019/posters/avengers_endgame.jpg');">
			</div>

			<%-- Hero-overlay: Text cố định - Không thay đổi --%>
			<div class="hero-overlay">
				<h1>Avengers: Endgame</h1>
				<p>Bộ phim siêu anh hùng đỉnh cao, kết thúc saga Infinity.</p>
				<a href="book-ticket.jsp" class="btn">Đặt Vé Ngay</a>
			</div>
		</section>

		<%-- Cinema-select: Tabs chọn rạp/thành phố - JS để toggle active (thêm sau) --%>
		<section class="cinema-select">
			<div class="cinema-tab active">Tất Cả Rạp</div>
			<div class="cinema-tab">Hà Nội</div>
			<div class="cinema-tab">TP.HCM</div>
			<div class="cinema-tab">Đà Nẵng</div>
		</section>

		<%-- Section Phim Đang Chiếu: Title + Grid cards + Link xem thêm --%>
		<section class="section">
			<h2>Phim Đang Chiếu</h2>
			<%-- Movie-grid: 6 cards placeholder với poster, rating, genre, button đặt vé --%>
			<div class="movie-grid">
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Phim+1"
						alt="Phim 1">
					<div class="movie-info">
						<h3>Avengers: Endgame</h3>
						<div class="rating">8.4</div>
						<p class="genre">Hành Động, Khoa Học Viễn Tưởng</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Phim+2"
						alt="Phim 2">
					<div class="movie-info">
						<h3>Parasite</h3>
						<div class="rating">8.5</div>
						<p class="genre">Tâm Lý, Hài</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Phim+3"
						alt="Phim 3">
					<div class="movie-info">
						<h3>Joker</h3>
						<div class="rating">8.4</div>
						<p class="genre">Tội Phạm, Tâm Lý</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Phim+4"
						alt="Phim 4">
					<div class="movie-info">
						<h3>Frozen 2</h3>
						<div class="rating">6.8</div>
						<p class="genre">Hoạt Hình, Gia Đình</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Phim+5"
						alt="Phim 5">
					<div class="movie-info">
						<h3>1917</h3>
						<div class="rating">8.2</div>
						<p class="genre">Chiến Tranh, Hành Động</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Phim+6"
						alt="Phim 6">
					<div class="movie-info">
						<h3>Knives Out</h3>
						<div class="rating">7.9</div>
						<p class="genre">Bí Ẩn, Hài</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
			</div>
			<%-- Link xem thêm: CTA dẫn đến movies.jsp --%>
			<a href="movieShowing.jsp" class="btn"
				style="margin-top: var(--spacing-md); display: inline-block;">Xem
				Tất Cả</a>
		</section>

		<%-- Section Phim Sắp Chiếu: Tương tự, nhưng genre bao gồm ngày phát hành --%>
		<section class="section">
			<h2>Phim Sắp Chiếu</h2>
			<div class="movie-grid">
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Upcoming+1"
						alt="Upcoming 1">
					<div class="movie-info">
						<h3>Dune Part 2</h3>
						<div class="rating">N/A</div>
						<p class="genre">Khoa Học Viễn Tưởng - 15/11/2025</p>
					</div>
				</div>
				<%-- Thêm 3-4 cards placeholder tương tự ở đây để đầy đủ --%>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Upcoming+2"
						alt="Upcoming 2">
					<div class="movie-info">
						<h3>Spider-Man: No Way Home</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động, Siêu Anh Hùng - 17/12/2025</p>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Upcoming+3"
						alt="Upcoming 3">
					<div class="movie-info">
						<h3>The Batman</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động, Tội Phạm - 04/03/2026</p>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Upcoming+4"
						alt="Upcoming 4">
					<div class="movie-info">
						<h3>Black Widow</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động, Phiêu Lưu - 01/07/2026</p>
					</div>
				</div>
			</div>
			<a href="movieUpcoming.jsp" class="btn"
				style="margin-top: var(--spacing-md); display: inline-block;">Xem
				Tất Cả</a>
		</section>
	</main>

	<%-- Footer: Links và copyright - Center align --%>
	<footer class="footer">
		<div
			style="max-width: var(--max-width); margin: 0 auto; padding: 0 var(--spacing-md);">
			<div class="footer-links">
				<a href="#">Giới Thiệu</a> <a href="#">Tin Tức</a> <a href="#">Tuyển
					Dụng</a> <a href="#">Liên Hệ</a> <a href="#">Chính Sách Bảo Mật</a>
			</div>
			<p>&copy; 2025 MyCinema. Hệ thống rạp chiếu phim hiện đại bậc
				nhất.</p>
		</div>
	</footer>
</body>
</html>