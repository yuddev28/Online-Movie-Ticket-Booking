<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phim Sắp Chiếu - MyCinema</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<header>
		<div class="top-nav">
			<a href="home.jsp" class="logo">MyCinema</a>
			<ul class="nav-links">
				<li><a href="home.jsp">Trang Chủ</a></li>
				<%-- Trong <ul class="nav-links"> của movies.jsp --%>
				<li class="has-dropdown"><a href="#" id="movieLink">Phim</a>
					<ul class="dropdown">
						<li><a href="movieShowing.jsp">Phim Đang Chiếu</a></li>
						<li><a href="movieUpcoming.jsp">Phim Sắp Chiếu</a></li>
						<li><a href="movies.jsp">Tất Cả Phim</a></li>
					</ul></li>

				<%-- Thêm script ở cuối body của movies.jsp (tương tự home.jsp) --%>
				<script>
					// Paste script JS từ home.jsp
				</script>
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
				style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('http://www.impawards.com/2024/posters/dune_part_two.jpg');"></div>
			<div class="hero-overlay">
				<h1>Phim Sắp Chiếu</h1>
				<p>Cập nhật phim bom tấn sắp ra mắt tại MyCinema.</p>
			</div>
		</section>

		<section class="section">
			<h2>Danh Sách Phim Sắp Chiếu</h2>
			<div class="movie-grid">
				<!-- 8 cards placeholder với ngày -->
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ff0000/fff?text=Upcoming+1"
						alt="Upcoming 1">
					<div class="movie-info">
						<h3>Dune Part 2</h3>
						<div class="rating">N/A</div>
						<p class="genre">Khoa Học Viễn Tưởng - 15/11/2025</p>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ff69b4/fff?text=Upcoming+2"
						alt="Upcoming 2">
					<div class="movie-info">
						<h3>Spider-Man: No Way Home</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động, Siêu Anh Hùng - 17/12/2025</p>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/00ff00/fff?text=Upcoming+3"
						alt="Upcoming 3">
					<div class="movie-info">
						<h3>The Batman</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động, Tội Phạm - 04/03/2026</p>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/0000ff/fff?text=Upcoming+4"
						alt="Upcoming 4">
					<div class="movie-info">
						<h3>Black Widow</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động, Phiêu Lưu - 01/07/2026</p>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ff00ff/fff?text=Upcoming+5"
						alt="Upcoming 5">
					<div class="movie-info">
						<h3>Top Gun: Maverick</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động - 22/05/2026</p>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ffff00/000?text=Upcoming+6"
						alt="Upcoming 6">
					<div class="movie-info">
						<h3>Lightyear</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hoạt Hình - 17/06/2026</p>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/00ffff/000?text=Upcoming+7"
						alt="Upcoming 7">
					<div class="movie-info">
						<h3>Doctor Strange in the Multiverse of Madness</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động, Kỳ Ảo - 06/05/2026</p>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ff9900/fff?text=Upcoming+8"
						alt="Upcoming 8">
					<div class="movie-info">
						<h3>Thor: Love and Thunder</h3>
						<div class="rating">N/A</div>
						<p class="genre">Hành Động, Phiêu Lưu - 08/07/2026</p>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Copy footer từ movies.jsp -->
</body>
</html>