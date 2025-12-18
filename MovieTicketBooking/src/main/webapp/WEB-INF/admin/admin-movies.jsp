<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
	
</head>
<body>
	<div class="container-fluid">
		<c:if test="${not empty sessionScope.movieMessage }">
			<div id="message"
		         class="bg-success text-white px-3 py-2 rounded d-inline-flex align-items-center gap-2">
		        <span>${sessionScope.movieMessage}</span>
		        <button type="button"
		                class="btn-close btn-close-white"
		                aria-label="Close"
		                onclick="hideMessage()">
		        </button>
	    	</div>
		</c:if>
		
		<h1>Quản lý phim</h1>
		
		<table class="table">
			<thread>
				<tr>
					<th>Tên</th>
					<th>Thể loại</th>
					<th>Đạo diễn</th>
					<th>Thời lượng</th>
					<th>Quốc gia</th>
					<th>Hình ảnh</th>
					<th>Trạng thái</th>
					<th>Hành động</th>
				</tr>
			</thread>
			<tbody>
				<c:forEach var="m" items="${listMovies}">
					<tr>
						<td>${m.name }</td>
						<td>${m.type }</td>
						<td>${m.directorName }</td>
						<td>${m.duration }</td>
						<td>${m.country }</td>
						<td><img src="${m.imageUrl }" style="width:60px"></td>
						<td>${m.movieStatus }</td>
						<td>
							<div class="d-flex gap-2">
	    						<form action="${pageContext.request.contextPath}/admin/movie/edit" method="get">
	    							<input type="hidden" name="id" value="${m.id }">
									<input type="submit" value="Sửa" class="btn btn-warning">
								</form>
								<form action="${pageContext.request.contextPath}/admin/movie/delete" method="get">
									<input type="hidden" name="id" value="${m.id }">
									<input type="submit" value="Xoá" class="btn btn-danger text-white">
								</form>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script >
		function hideMessage() {
			const msg = document.getElementById("message");
			if (msg) {
				msg.classList.add("d-none");
			}
		}
	</script>
</body>
</html>