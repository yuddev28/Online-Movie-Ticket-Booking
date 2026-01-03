<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Chọn Ghế - ${showTime.movie.name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <style>
        .booking-page-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: var(--spacing-lg) var(--spacing-md);
        }
        
        /* Grid linh động theo DB */
        .seat-grid {
            display: grid;
            /* Cột A,B,C rộng 40px, còn lại chia đều */
            grid-template-columns: 40px repeat(${showTime.room.numberOfColumns}, 1fr) !important;
            max-width: fit-content !important; 
            margin: 0 auto;
            background: #222;
            padding: 20px;
            border-radius: 10px;
            gap: 5px; /* Khoảng cách giữa các ô */
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="booking-page-container">
        
        <div style="text-align: center; margin-bottom: 30px;">
            <h2 style="color: var(--primary-color); text-transform: uppercase; margin-bottom: 5px;">
                ${showTime.movie.name}
            </h2>
            <p style="color: var(--text-muted); font-size: 16px;">
                ${showTime.cinema.name} - ${showTime.room.name}
                <span style="margin: 0 10px;">|</span>
                <span style="color: var(--text-color); font-weight: 700;">
                    <fmt:parseDate value="${showTime.startTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
                    <fmt:formatDate value="${parsedDate}" pattern="HH:mm - dd/MM/yyyy" />
                </span>
            </p>
        </div>

        <section class="seat-map active" style="display: block;">
            <div class="seat-map-header">
                <h3>Sơ Đồ Ghế</h3>
                <p>Giá tiêu chuẩn: <strong style="color: var(--secondary-color);"><fmt:formatNumber value="${showTime.pricePerTicket}" type="currency" currencySymbol="VNĐ"/></strong></p>
            </div>

            <div class="seat-legend">
                <div class="legend-item"><div class="legend-color available"></div><span>Ghế thường</span></div>
                <div class="legend-item"><div class="legend-color couple"></div><span>Ghế đôi (2 người)</span></div>
                <div class="legend-item"><div class="legend-color selected"></div><span>Đang chọn</span></div>
                <div class="legend-item"><div class="legend-color taken"></div><span>Đã đặt</span></div>
            </div>

            <div class="screen">MÀN HÌNH</div>

            <div class="seat-grid">
                <%-- Vòng lặp Hàng (Row) --%>
                <c:forEach var="row" begin="1" end="${showTime.room.numberOfRows}">
                    <c:set var="rowChar" value="<%= (char)('A' + (int)pageContext.getAttribute(\"row\") - 1) %>" />
                    
                    <div class="row-label">${rowChar}</div>
                    
                    <%-- Kiểm tra xem có phải hàng cuối không --%>
                    <c:set var="isLastRow" value="${row == showTime.room.numberOfRows}" />

                    <%-- Vòng lặp Cột (Column) --%>
                    <c:forEach var="col" begin="1" end="${showTime.room.numberOfColumns}">
                        <c:set var="seatName" value="${rowChar}${col}" />
                        
                        <c:set var="statusClass" value="available" />
                        <c:forEach var="booked" items="${bookedSeats}">
                            <c:if test="${booked == seatName}"> 
                                <c:set var="statusClass" value="taken" /> 
                            </c:if>
                        </c:forEach>

                        <%-- LOGIC HIỂN THỊ --%>
                        <c:choose>
                            <%-- TRƯỜNG HỢP 1: Hàng thường (Không phải hàng cuối) --%>
                            <c:when test="${not isLastRow}">
                                <div class="seat-cell ${statusClass}" 
                                     onclick="toggleSeat(this, '${seatName}', ${showTime.pricePerTicket})"
                                     data-seat="${seatName}">
                                    ${seatName}
                                </div>
                            </c:when>

                            <%-- TRƯỜNG HỢP 2: Hàng cuối (Ghế đôi) --%>
                            <c:otherwise>
                                <%-- Logic xếp ghế đôi: [Ghế Đôi] [Bỏ qua] [Khoảng trống] --%>
                                <%-- Dùng phép chia dư cho 3: 1, 2, 3 -> Nhóm 1; 4, 5, 6 -> Nhóm 2... --%>
                                
                                <%-- Vị trí 1, 4, 7... -> Vẽ ghế đôi (Chiếm 2 ô) --%>
                                <c:if test="${(col - 1) % 3 == 0}">
                                    <div class="seat-cell couple ${statusClass}" 
                                         onclick="toggleSeat(this, '${seatName}', ${showTime.pricePerTicket * 2})"
                                         data-seat="${seatName}">
                                        ${seatName}
                                    </div>
                                </c:if>

                                <%-- Vị trí 2, 5, 8... -> Bị ghế trước che (Skip) -> Không render gì cả --%>

                                <%-- Vị trí 3, 6, 9... -> Vẽ khoảng trống (Spacer) --%>
                                <c:if test="${(col - 1) % 3 == 2}">
                                    <div class="seat-cell spacer"></div>
                                </c:if>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </c:forEach>
            </div>
        </section>

        <div class="booking-summary" style="margin-top: 30px;">
            <h2>Tổng Kết Đặt Vé</h2>
            <div style="margin: 20px 0; font-size: 16px;">
                <p>Ghế đang chọn: <span id="display-seats" style="color: #fff; font-weight: bold;">Chưa chọn</span></p>
            </div>
            <div class="total-price" id="display-price-text">Tổng Tiền: 0 VNĐ</div>
            
            <form action="checkout" method="post" id="bookingForm">
                <input type="hidden" name="showtimeId" value="${showTime.id}">
                <input type="hidden" name="selectedSeats" id="input-seats">
                <input type="hidden" name="totalPrice" id="input-price">
                <button type="button" class="book-btn" onclick="submitBooking()">Xác Nhận & Thanh Toán</button>
            </form>
            <p style="color: var(--text-muted); font-size: 12px; text-align: center; margin-top: 20px;">* Vé đã mua không thể hoàn tiền.</p>
        </div>
    </main>

    <jsp:include page="footer.jsp" />

    <script>
        let selectedSeats = [];
        let selectedPrices = {}; 

        function toggleSeat(element, seatName, price) {
            if (element.classList.contains('taken')) return;

            if (element.classList.contains('selected')) {
                element.classList.remove('selected');
                selectedSeats = selectedSeats.filter(s => s !== seatName);
                delete selectedPrices[seatName];
            } else {
                element.classList.add('selected');
                selectedSeats.push(seatName);
                selectedPrices[seatName] = price;
            }
            updateSummary();
        }

        function updateSummary() {
            const seatText = selectedSeats.length > 0 ? selectedSeats.join(', ') : 'Chưa chọn';
            document.getElementById('display-seats').innerText = seatText;
            document.getElementById('input-seats').value = selectedSeats.join(',');

            let total = 0;
            for (let key in selectedPrices) {
                total += selectedPrices[key];
            }

            const formattedTotal = total.toLocaleString('vi-VN');
            document.getElementById('display-price-text').innerText = 'Tổng Tiền: ' + formattedTotal + ' VNĐ';
            document.getElementById('input-price').value = total;
        }

        function submitBooking() {
            if (selectedSeats.length === 0) {
                alert("Vui lòng chọn ít nhất 1 ghế để tiếp tục!");
                return;
            }
            document.getElementById('bookingForm').submit();
        }
    </script>
</body>
</html>