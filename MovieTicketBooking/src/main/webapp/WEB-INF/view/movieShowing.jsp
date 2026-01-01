<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Hoặc uri="http://java.sun.com/jsp/jstl/core" nếu Tomcat cũ --%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phim Đang Chiếu - MyCinema</title>
<link rel="stylesheet" href="styles.css">

</head>
<body>
    <jsp:include page="header.jsp" />

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
            <h2>Tất Cả Phim Đang Chiếu</h2>
            <div class="movie-grid">
                <%-- Vòng lặp lấy dữ liệu từ MovieShowingServlet --%>
                <c:forEach items="${fullListShowing}" var="m">
                    <div class="movie-card">
                        <img src="${m.imageUrl}" alt="${m.name}" loading="lazy"
							onerror="this.onerror=null; this.src='https://via.placeholder.com/180x270?text=No+Image'">
                        <div class="movie-info">
                            <h3>${m.name}</h3>
                            <div class="rating">★ ${m.duration} phút</div>
                            <p class="genre">${m.type}</p>
                            <a href="book-ticket.jsp?id=${m.id}" class="btn">Đặt Vé</a>
                        </div>
                    </div>
                </c:forEach>
                
                <%-- Thông báo nếu không có phim nào --%>
                <c:if test="${empty fullListShowing}">
                    <p>Hiện chưa có phim nào đang chiếu.</p>
                </c:if>
            </div>
        </section>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>