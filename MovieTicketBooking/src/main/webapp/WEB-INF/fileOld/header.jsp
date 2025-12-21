<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%-- Nhúng CSS và Font --%>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="styles.css">

<header>
	<div class="top-nav">
		<%-- Logo --%>
		<a href="home.jsp" class="logo">MyCinema</a>

		<ul class="nav-links">
			<li><a href="home.jsp">Trang Chủ</a></li>

			<%-- Dropdown Phim --%>
			<li class="has-dropdown"><input type="checkbox" id="movieToggle"
				class="dropdown-toggle"> <label for="movieToggle"
				id="movieLink">Phim</label>
				<ul class="dropdown">
					<li><a href="movieShowing.jsp">Phim Đang Chiếu</a></li>
					<li><a href="movieUpcoming.jsp">Phim Sắp Chiếu</a></li>
					<li><a href="movies.jsp">Tất Cả Phim</a></li>
				</ul></li>

			<li><a href="theater.jsp">Rạp</a></li>
			<li><a href="profile.jsp">Tài Khoản</a></li>
		</ul>

		<div class="user-actions">
			<a href="login.jsp" class="btn btn-secondary">Đăng Nhập</a> <a
				href="register.jsp" class="btn">Đăng Ký</a>
		</div>
	</div>

	<div class="search-bar-header">
		<div class="search-container">
			<form action="search" method="get">
				<input type="text" name="keyword"
					placeholder="Tìm kiếm phim, diễn viên...">
				<button type="submit">Tìm Kiếm</button>
			</form>
		</div>
	</div>
</header>