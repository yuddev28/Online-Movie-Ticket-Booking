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

</head>
<body>
	<!-- Sidebar -->
	<div class="d-flex">
		<nav class="sidebar bg-dark text-white vh-100 p-3">
			<h4 class="text-center mb-4">Admin Panel</h4>

			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item">
					<a
					href="${pageContext.request.contextPath}/admin/movies"
					class="nav-link p-3 text-white">
						Quản lý phim
					</a>
				</li>
				<li class="nav-item">
					<a href="admin-theaters.jsp"
					class="nav-link p-3 text-white">
						Quản lý rạp phim
					</a>
				</li>
				<li class="nav-item">
					<a href="admin-bookings.jsp"
					class="nav-link p-3 text-white">
						Quản lý xuất chiếu
					</a>
				</li>
				
			</ul>

			<hr>

			<a href="#" class="nav-link text-white mt-auto"> 🚪 Logout </a>
		</nav>

		<!-- Main content -->
		<main class="flex-fill p-4">
			<jsp:include page="${pageView}" />
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>