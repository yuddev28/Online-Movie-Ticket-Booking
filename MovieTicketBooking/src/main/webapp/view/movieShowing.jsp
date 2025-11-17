<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phim Đang Chiếu - MyCinema</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<header>
		<!-- Copy header từ movies.jsp (với dropdown) -->
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
					<input type="text" placeholder="Tìm kiếm phim...">
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
				<h1>Phim Đang Chiếu</h1>
				<p>Danh sách phim hot đang chiếu tại rạp MyCinema.</p>
			</div>
		</section>

		<section class="section">
			<h2>Danh Sách Phim Đang Chiếu</h2>
			<div class="movie-grid">
				<!-- 10 cards placeholder -->
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ff0000/fff?text=Showing+1"
						alt="Showing 1">
					<div class="movie-info">
						<h3>Avengers: Endgame</h3>
						<div class="rating">8.4</div>
						<p class="genre">Hành Động, Khoa Học Viễn Tưởng</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<!-- Thêm 9 cards tương tự với tên phim khác: Parasite, Joker, Frozen 2, 1917, Knives Out, Once Upon a Time, The Irishman, Tenet, Soul -->
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ff69b4/fff?text=Showing+2"
						alt="Showing 2">
					<div class="movie-info">
						<h3>Parasite</h3>
						<div class="rating">8.5</div>
						<p class="genre">Tâm Lý, Hài</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/00ff00/fff?text=Showing+3"
						alt="Showing 3">
					<div class="movie-info">
						<h3>Joker</h3>
						<div class="rating">8.4</div>
						<p class="genre">Tội Phạm, Tâm Lý</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/0000ff/fff?text=Showing+4"
						alt="Showing 4">
					<div class="movie-info">
						<h3>Frozen 2</h3>
						<div class="rating">6.8</div>
						<p class="genre">Hoạt Hình, Gia Đình</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ff00ff/fff?text=Showing+5"
						alt="Showing 5">
					<div class="movie-info">
						<h3>1917</h3>
						<div class="rating">8.2</div>
						<p class="genre">Chiến Tranh, Hành Động</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ffff00/000?text=Showing+6"
						alt="Showing 6">
					<div class="movie-info">
						<h3>Knives Out</h3>
						<div class="rating">7.9</div>
						<p class="genre">Bí Ẩn, Hài</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/00ffff/000?text=Showing+7"
						alt="Showing 7">
					<div class="movie-info">
						<h3>Once Upon a Time in Hollywood</h3>
						<div class="rating">7.6</div>
						<p class="genre">Hài, Tội Phạm</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/ff9900/fff?text=Showing+8"
						alt="Showing 8">
					<div class="movie-info">
						<h3>The Irishman</h3>
						<div class="rating">7.8</div>
						<p class="genre">Tội Phạm, Tiểu Sử</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/9900ff/fff?text=Showing+9"
						alt="Showing 9">
					<div class="movie-info">
						<h3>Tenet</h3>
						<div class="rating">7.3</div>
						<p class="genre">Hành Động, Khoa Học Viễn Tưởng</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
				<div class="movie-card">
					<img
						src="https://via.placeholder.com/180x270/0099ff/fff?text=Showing+10"
						alt="Showing 10">
					<div class="movie-info">
						<h3>Soul</h3>
						<div class="rating">8.0</div>
						<p class="genre">Hoạt Hình, Tâm Lý</p>
						<a href="book-ticket.jsp" class="btn">Đặt Vé</a>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Copy footer từ movies.jsp -->
	<footer class="footer">
		<!-- Paste footer -->
	</footer>
</body>
</html>