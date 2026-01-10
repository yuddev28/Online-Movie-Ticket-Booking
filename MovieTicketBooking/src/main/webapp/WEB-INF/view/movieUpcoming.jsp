<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phim Sắp Chiếu - MyCinema</title>
<link rel="stylesheet" href="styles.css">
<style>
    .movie-card img {
        width: 100%; height: 270px; object-fit: cover; background-color: #222; display: block;
    }
</style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <main>
        <section class="hero" style="height: 200px;">
            <div class="hero-banner"
                style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('http://www.impawards.com/2024/posters/dune_part_two.jpg');"></div>
            <div class="hero-overlay">
                <h1>Phim Sắp Chiếu</h1>
                <p>Cập nhật phim bom tấn sắp ra mắt tại MyCinema.</p>
            </div>
        </section>

        <section class="section">
            <h2>Tất Cả Phim Sắp Chiếu</h2>
            <div class="movie-grid">
                <%-- Vòng lặp lấy dữ liệu từ MovieUpcomingServlet --%>
                <c:forEach items="${fullListUpcoming}" var="m">
                    <div class="movie-card">
                        <img src="${m.imageUrl}" alt="${m.name}" loading="lazy"
							onerror="this.onerror=null; this.src='https://via.placeholder.com/180x270?text=No+Image'">
                        <div class="movie-info">
                            <h3>${m.name}</h3>
                            <div class="rating">Sắp chiếu</div>
                            <p class="genre">${m.type}</p>
                            
                            <%-- SỬA LINK: Đổi id thành movieId --%>
                            <%-- Lưu ý: Vẫn trỏ về movie-detail.jsp vì chưa có Servlet cho chi tiết phim --%>
                            <a href="movie-detail.jsp?movieId=${m.id}" class="btn" style="background: #555;">Chi Tiết</a>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty fullListUpcoming}">
                    <p>Hiện chưa có phim sắp chiếu.</p>
                </c:if>
            </div>
        </section>
    </main>
    
    <jsp:include page="footer.jsp" />
</body>
</html>