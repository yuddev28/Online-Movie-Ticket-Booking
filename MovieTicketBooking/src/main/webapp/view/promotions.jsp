<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ưu Đãi & Khuyến Mãi - MyCinema</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<header>
		<div class="top-nav">
			<a href="home.jsp" class="logo">MyCinema</a>
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
					<input type="text" placeholder="Tìm kiếm ưu đãi...">
					<button type="submit">Tìm Kiếm</button>
				</form>
			</div>
		</div>
	</header>

	<main>
		<section class="hero">
			<div class="hero-banner"
				style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://via.placeholder.com/1400x500?text=Ưu+Đãi+MyCinema');"></div>
			<div class="hero-overlay">
				<h1>Chương Trình Khuyến Mãi</h1>
				<p>Khám phá các ưu đãi hấp dẫn dành riêng cho bạn tại MyCinema.
					Áp dụng ngay khi đặt vé!</p>
				<a href="book-ticket.jsp" class="btn">Đặt Vé Ngay</a>
			</div>
		</section>

		<section class="section">
			<h2>Các Ưu Đãi Nổi Bật</h2>
			<div class="promotion-grid">
				<%-- Ưu Đãi 1: C’STUDENT - 45K CHO HỌC SINH SINH VIÊN --%>
				<div class="promotion-card">
					<img
						src="https://via.placeholder.com/300x200/ff69b4/fff?text=C’STUDENT"
						alt="C’STUDENT">
					<div class="promotion-info">
						<h3>C’STUDENT - 45K CHO HỌC SINH SINH VIÊN</h3>
						<p class="promotion-desc">Đồng giá 45K/2D cho HSSV/GV/U22 cả
							tuần tại mọi cụm rạp MyCinema.</p>
						<div class="promotion-terms">HSSV xuất trình thẻ HSSV hoặc
							CCCD từ dưới 22 tuổi. Giảng viên xuất trình thẻ giảng viên. Mỗi
							thẻ mua một vé. Không áp dụng ngày Lễ, Tết, hoặc suất có phụ thu.</div>
						<p class="promotion-valid">Valid: Cả tuần (không áp dụng ngày
							Lễ, Tết)</p>
						<a href="book-ticket.jsp" class="btn">Áp Dụng Ngay</a>
					</div>
				</div>

				<%-- Ưu Đãi 2: C'TEN - HAPPY HOUR - 45K/ 2D MỐC 10H --%>
				<div class="promotion-card">
					<img
						src="https://via.placeholder.com/300x200/00ff00/000?text=HAPPY+HOUR"
						alt="Happy Hour">
					<div class="promotion-info">
						<h3>C'TEN - HAPPY HOUR - 45K/ 2D MỐC 10H</h3>
						<p class="promotion-desc">Áp dụng giá 45K/2D và 55K/3D cho
							khách hàng xem phim trước 10h sáng và sau 10h tối.</p>
						<div class="promotion-terms">Khách hàng là thành viên
							C’FRIEND hoặc C’VIP. Áp dụng tại App/Web hoặc mua trực tiếp.
							Không áp dụng ngày lễ/tết.</div>
						<p class="promotion-valid">Valid: Trước 10h sáng và sau 10h
							tối (không áp dụng ngày lễ/tết)</p>
						<a href="book-ticket.jsp" class="btn">Áp Dụng Ngay</a>
					</div>
				</div>

				<%-- Ưu Đãi 3: C'MONDAY - HAPPY DAY - ĐỒNG GIÁ 45K/ 2D --%>
				<div class="promotion-card">
					<img
						src="https://via.placeholder.com/300x200/0000ff/fff?text=C’MONDAY"
						alt="C'MONDAY">
					<div class="promotion-info">
						<h3>C'MONDAY - HAPPY DAY - ĐỒNG GIÁ 45K/ 2D</h3>
						<p class="promotion-desc">Đồng giá 45K/2D, 55K/3D vào thứ 2
							hàng tuần.</p>
						<div class="promotion-terms">Áp dụng cho suất chiếu thứ 2.
							Mua tại App/Web hoặc rạp. Không áp dụng ngày lễ/tết.</div>
						<p class="promotion-valid">Valid: Thứ 2 hàng tuần (không áp
							dụng ngày lễ/tết)</p>
						<a href="book-ticket.jsp" class="btn">Áp Dụng Ngay</a>
					</div>
				</div>

				<%-- Ưu Đãi 4: C'MEMBER - HAPPY MEMBER’S DAY - GIÁ CHỈ 45K/ 2D --%>
				<div class="promotion-card">
					<img
						src="https://via.placeholder.com/300x200/ff00ff/fff?text=C’MEMBER"
						alt="C'MEMBER">
					<div class="promotion-info">
						<h3>C'MEMBER - HAPPY MEMBER’S DAY - GIÁ CHỈ 45K/ 2D</h3>
						<p class="promotion-desc">Áp dụng giá 45K/2D và 55K/3D cho
							thành viên MyCinema vào thứ 4 hàng tuần.</p>
						<div class="promotion-terms">Thành viên C’FRIEND hoặc C’VIP.
							Giảm thêm 10-15% bắp nước. Không áp dụng ngày lễ/tết.</div>
						<p class="promotion-valid">Valid: Thứ 4 hàng tuần (không áp
							dụng ngày lễ/tết)</p>
						<a href="book-ticket.jsp" class="btn">Áp Dụng Ngay</a>
					</div>
				</div>

				<%-- Ưu Đãi 5: C’SCHOOL | ƯU ĐÃI GIÁ VÉ TỪ 45K DÀNH RIÊNG CHO HSSV/U22/GIÁO VIÊN --%>
				<div class="promotion-card">
					<img
						src="https://via.placeholder.com/300x200/ffff00/000?text=C’SCHOOL"
						alt="C’SCHOOL">
					<div class="promotion-info">
						<h3>C’SCHOOL | ƯU ĐÃI GIÁ VÉ TỪ 45K DÀNH RIÊNG CHO
							HSSV/U22/GIÁO VIÊN</h3>
						<p class="promotion-desc">Ưu đãi giá vé chỉ từ 45K dành cho
							Học sinh Sinh viên, U22 và Giáo viên cả tuần.</p>
						<div class="promotion-terms">Xuất trình thẻ HSSV/U22/GV. Mỗi
							thẻ 1 vé. Không áp dụng ngày Lễ, Tết. Chi tiết giá theo suất.</div>
						<p class="promotion-valid">Valid: Cả tuần (không áp dụng ngày
							Lễ, Tết)</p>
						<a href="book-ticket.jsp" class="btn">Áp Dụng Ngay</a>
					</div>
				</div>

				<%-- Ưu Đãi 6: HAPPY HOUR | TRƯỚC 10H VÀ SAU 22H – GIÁ VÉ ƯU ĐÃI CHỈ TỪ 45K --%>
				<div class="promotion-card">
					<img
						src="https://via.placeholder.com/300x200/00ffff/000?text=HAPPY+HOUR+2"
						alt="Happy Hour 2">
					<div class="promotion-info">
						<h3>HAPPY HOUR | TRƯỚC 10H VÀ SAU 22H – GIÁ VÉ ƯU ĐÃI CHỈ TỪ
							45K</h3>
						<p class="promotion-desc">Ưu đãi giá vé 45K cho suất chiếu
							trước 10h00 và 49K cho suất chiếu sau 22h00.</p>
						<div class="promotion-terms">Áp dụng tất cả khách. Mua tại
							rạp/App/Web. Không áp dụng ngày Lễ/Tết. Chi tiết giá 2D/3D/C’MÊ.</div>
						<p class="promotion-valid">Valid: Trước 10h00 và sau 22h00
							(không áp dụng ngày Lễ/Tết)</p>
						<a href="book-ticket.jsp" class="btn">Áp Dụng Ngay</a>
					</div>
				</div>

				<%-- Ưu Đãi 7: HAPPY DAY | THỨ 2 – ĐỒNG GIÁ 45K CHO MỌI SUẤT CHIẾU --%>
				<div class="promotion-card">
					<img
						src="https://via.placeholder.com/300x200/ff9900/fff?text=HAPPY+DAY+2"
						alt="Happy Day 2">
					<div class="promotion-info">
						<h3>HAPPY DAY | THỨ 2 – ĐỒNG GIÁ 45K CHO MỌI SUẤT CHIẾU</h3>
						<p class="promotion-desc">Thứ 2 hàng tuần, đồng giá vé 45K /
							vé 2D cho mọi khách hàng tại MyCinema.</p>
						<div class="promotion-terms">Áp dụng mọi suất thứ 2. Mua tại
							rạp/App/Web. Không áp dụng Lễ, Tết hoặc suất phụ thu.</div>
						<p class="promotion-valid">Valid: Thứ 2 hàng tuần (không áp
							dụng ngày Lễ, Tết)</p>
						<a href="book-ticket.jsp" class="btn">Áp Dụng Ngay</a>
					</div>
				</div>

				<%-- Ưu Đãi 8: HAPPY DAY | THỨ 4 – ĐỒNG GIÁ 45K DÀNH CHO THÀNH VIÊN CINESTAR --%>
				<div class="promotion-card">
					<img
						src="https://via.placeholder.com/300x200/9900ff/fff?text=HAPPY+DAY+4"
						alt="Happy Day 4">
					<div class="promotion-info">
						<h3>HAPPY DAY | THỨ 4 – ĐỒNG GIÁ 45K DÀNH CHO THÀNH VIÊN
							MYCINEMA</h3>
						<p class="promotion-desc">Thứ 4 hàng tuần, đồng giá 45K / vé
							2D dành riêng cho khách hàng là thành viên MyCinema.</p>
						<div class="promotion-terms">Thành viên C’FRIEND/C’VIP, xuất
							trình thẻ. Giảm thêm 10-15% bắp nước. Không áp dụng Lễ, Tết.</div>
						<p class="promotion-valid">Valid: Thứ 4 hàng tuần (không áp
							dụng ngày Lễ, Tết)</p>
						<a href="book-ticket.jsp" class="btn">Áp Dụng Ngay</a>
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