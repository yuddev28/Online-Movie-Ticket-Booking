<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}">
	
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script src="${pageContext.request.contextPath}/admin/admin.js "></script>
</head>
<body>
	<div class="d-flex">
		<!-- Sidebar -->
		<nav class="sidebar bg-dark text-white vh-100 p-3 d-flex flex-column" style="position: fixed;width: 250px;">
			<h4 class="text-center mb-2">Admin Panel</h4>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item">
					<form action="${pageContext.request.contextPath}/admin/movies" method="post">
						<input type="submit" value="Quản lý phim" class="nav-link p-3 text-white">
					</form>
				</li>
				<li class="nav-item">
					<form action="${pageContext.request.contextPath}/admin/cinemas" method="post">
						<input type="submit" value="Quản lý rạp" class="nav-link p-3 text-white">
					</form>
				</li>
				<li class="nav-item">
					<form action="${pageContext.request.contextPath}/admin/rooms" method="post">
						<input type="submit" value="Quản lý phòng chiếu" class="nav-link p-3 text-white">
					</form>
				</li>
				<li class="nav-item">
					<form action="${pageContext.request.contextPath}/admin/showtimes" method="post">
						<input type="submit" value="Quản lý suất chiếu" class="nav-link p-3 text-white">
					</form>
				</li>
				<li class="nav-item">
					<form action="${pageContext.request.contextPath}/admin/tickets" method="post">
						<input type="submit" value="Quản lý vé" class="nav-link p-3 text-white">
					</form>
				</li>
			</ul>

			<div class="d-flex justify-content-center align-items-center">
				<form action="${pageContext.request.contextPath}/admin/login" method="get" >
					<input type="submit" value="Đăng xuất" class="nav-link text-white mt-auto text-center">
				</form>
			</div>
			
		</nav>

		<!-- Main content -->
		<main class="flex-fill p-4" style="margin-left: 250px;">
			<jsp:include page="${pageView}" />
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>