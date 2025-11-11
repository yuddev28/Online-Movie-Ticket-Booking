<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tất Cả Phim - MyCinema</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<header>
		<div class="top-nav">
			<a href="home.jsp" class="logo">MyCinema</a>
			<ul class="nav-links">
				<li><a href="home.jsp">Trang Chủ</a></li>
				<li class="has-dropdown"><a href="#" id="movieLink">Phim</a>
					<ul class="dropdown">
						<li><a href="movieShowing.jsp">Phim Đang Chiếu</a></li>
						<li><a href="movieUpcoming.jsp">Phim Sắp Chiếu</a></li>
						<li><a href="movies.jsp">Tất Cả Phim</a></li>
					</ul></li>
				<li><a href="cinemas.jsp">Rạp</a></li>
				<li><a href="promotions.jsp">Ưu Đãi</a></li>
				<li><a href="book-ticket.jsp">Đặt Vé</a></li>
				<li><a href="profile.jsp">Tài Khoản</a></li>
			</ul>
			<div class="user-actions">
				<a href="login.jsp" class="btn btn-secondary">Đăng Nhập</a> <a
					href="register.jsp" class="btn">Đăng Ký</a>
			</div>
		</div>
		<div class="search-bar-header">
			<div class="search-container">
				<form>
					<input type="text" placeholder="Tìm kiếm phim, diễn viên...">
					<button type="submit">Tìm Kiếm</button>
				</form>
			</div>
		</div>
	</header>

	<main>
		<section class="hero">
			<div class="hero-banner"
				style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('http://www.impawards.com/2019/posters/avengers_endgame.jpg');"></div>
			<div class="hero-overlay">
				<h1>Tất Cả Phim Tại MyCinema</h1>
				<p>Khám phá danh sách phim đa dạng từ đang chiếu đến sắp ra mắt.</p>
				<a href="book-ticket.jsp" class="btn">Đặt Vé Ngay</a>
			</div>
		</section>

		<section class="section">
			<h2>Phim Đang Chiếu</h2>
			<div class="movie-grid">
				<!-- 8 cards placeholder, mở rộng từ home -->
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Showing+1"
						alt="Showing 1">
					<div class="movie-info">
						<h3>Avengers: Endgame</h3>
						<div class="rating">8.4</div>
						<p class="genre">Hành Động, Khoa Học Viễn Tưởng</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Showing+2"
						alt="Showing 2">
					<div class="movie-info">
						<h3>Parasite</h3>
						<div class="rating">8.5</div>
						<p class="genre">Tâm Lý, Hài</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Showing+3"
						alt="Showing 3">
					<div class="movie-info">
						<h3>Joker</h3>
						<div class="rating">8.4</div>
						<p class="genre">Tội Phạm, Tâm Lý</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Showing+4"
						alt="Showing 4">
					<div class="movie-info">
						<h3>Frozen 2</h3>
						<div class="rating">6.8</div>
						<p class="genre">Hoạt Hình, Gia Đình</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Showing+5"
						alt="Showing 5">
					<div class="movie-info">
						<h3>1917</h3>
						<div class="rating">8.2</div>
						<p class="genre">Chiến Tranh, Hành Động</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Showing+6"
						alt="Showing 6">
					<div class="movie-info">
						<h3>Knives Out</h3>
						<div class="rating">7.9</div>
						<p class="genre">Bí Ẩn, Hài</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Showing+7"
						alt="Showing 7">
					<div class="movie-info">
						<h3>Once Upon a Time in Hollywood</h3>
						<div class="rating">7.6</div>
						<p class="genre">Hài, Tội Phạm</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Showing+8"
						alt="Showing 8">
					<div class="movie-info">
						<h3>The Irishman</h3>
						<div class="rating">7.8</div>
						<p class="genre">Tội Phạm, Tiểu Sử</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
			</div>
		</section>

		<section class="section">
			<h2>Phim Sắp Chiếu</h2>
			<div class="movie-grid">
				<!-- 6 cards placeholder -->
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Upcoming+1"
						alt="Upcoming 1">
					<div class="movie-info">
						<h3>Dune Part 2</h3>
						<div class="rating">N/A</div>
						<p class="genre">Khoa Học Viễn Tưởng - 15/11/2025</p>
					</div>
				</div>
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
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Upcoming+5"
						alt="Upcoming 5">
					<div class="movie-info">
						<h3>Top Gun: Maverick</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động - 22/05/2026</p>
					</div>
				</div>
				<div class="movie-card">
					<img src="https://via.placeholder.com/180x270?text=Upcoming+6"
						alt="Upcoming 6">
					<div class="movie-info">
						<h3>Lightyear</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hoạt Hình - 17/06/2026</p>
					</div>
				</div>
			</div>
		</section>
	</main>

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