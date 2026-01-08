<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lịch Sử Đặt Vé - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="styles-bookings.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="bookings-container">
        <section class="hero">
            <div class="hero-banner" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://via.placeholder.com/1400x500?text=My+Bookings');"></div>
            <div class="hero-overlay">
                <h1>Lịch Sử Đặt Vé</h1>
                <p>Quản lý các vé đã đặt của bạn.</p>
            </div>
        </section>

        <c:if test="${not empty sessionScope.message}">
            <div class="alert success" style="color: green; text-align: center; margin: 10px;">${sessionScope.message}</div>
            <c:remove var="message" scope="session" />
        </c:if>

        <table class="bookings-table">
            <thead>
                <tr>
                    <th>Mã Vé</th> <th>Ngày Đặt</th>
                    <th>Phim</th>
                    <th>Rạp & Suất</th>
                    <th>Ghế</th>
                    <th>Giá</th>
                    <th>Trạng Thái</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${ticketList}">
                    <tr>
                        <td><strong>${ticket.uid}</strong></td>
                        
                        <td>
                             ${ticket.createdAt.toLocalDate()} <br>
                             ${ticket.createdAt.toLocalTime()}
                        </td>

                        <td>${ticket.showTime.movie.name}</td> <td>
                            ${ticket.showTime.cinema.name} <br> <span style="color: #e74c3c">
                                ${ticket.showTime.startTime.toLocalTime()}
                            </span>
                        </td>

                        <td>
                            <c:forEach var="seat" items="${ticket.seats}" varStatus="loop">
                                ${seat.seatName}${!loop.last ? ',' : ''}
                            </c:forEach>
                        </td>

                        <td>
                            <fmt:formatNumber value="${ticket.totalPrice}" type="currency" currencySymbol="VNĐ"/>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${ticket.status == 'PAID' || ticket.status == 'UNPAID'}">
                                    <span class="status-badge status-confirmed">Đã Đặt</span>
                                </c:when>
                                <c:when test="${ticket.status == 'CANCELLED'}">
                                    <span class="status-badge status-cancelled">Đã Hủy</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge status-pending">${ticket.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <c:if test="${ticket.status != 'CANCELLED'}">
                                <form action="cancel-ticket" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn hủy vé này? Ghế sẽ được trả lại trống.');">
                                    <input type="hidden" name="ticketId" value="${ticket.id}">
                                    <button type="submit" class="action-btn" style="background-color: #e74c3c; color: white;">Hủy Vé</button>
                                </form>
                            </c:if>
                            <c:if test="${ticket.status == 'CANCELLED'}">
                                <span style="color: gray; font-size: 0.9em;">Đã hoàn tác</span>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty ticketList}">
                    <tr>
                        <td colspan="8" style="text-align: center;">Bạn chưa có lịch sử đặt vé nào.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <div style="text-align: center; margin-top: var(--spacing-lg);">
            <a href="movies" class="btn">Đặt Vé Mới</a>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>