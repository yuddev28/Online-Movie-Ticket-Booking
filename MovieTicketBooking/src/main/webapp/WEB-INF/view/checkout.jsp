<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Thanh Toán - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="auth-container">
        <div class="auth-form" style="max-width: 600px;">
            <h2 style="text-align: center; color: var(--primary-color);">XÁC NHẬN ĐẶT VÉ</h2>
            
            <div style="background: #141414; padding: 20px; border-radius: 8px; margin-bottom: 20px; color: #ccc;">
    <h3 style="color: var(--secondary-color); margin-top: 0; border-bottom: 1px solid #333; padding-bottom: 10px;">
        ${showTime.movie.name}
    </h3>
    
    <div style="margin-top: 15px; line-height: 1.8;">
        <p><strong>Rạp:</strong> ${showTime.cinema.name}</p>
        <p><strong>Phòng chiếu:</strong> ${showTime.room.name}</p>
        
        <%-- Hiển thị ngày giờ đẹp hơn (Cần thư viện fmt ở đầu trang) --%>
        <p><strong>Suất chiếu:</strong> 
            <fmt:parseDate value="${showTime.startTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
            <fmt:formatDate value="${parsedDate}" pattern="HH:mm - dd/MM/yyyy" />
        </p>

        <p><strong>Ghế đã chọn:</strong> 
            <span style="color: var(--primary-color); font-weight: bold;">${selectedSeats}</span>
        </p>
        
        <p style="margin-top: 10px; font-size: 1.2em; border-top: 1px dashed #555; padding-top: 10px;">
            <strong>Tổng tiền:</strong> 
            <span style="color: #e50914; font-weight: bold;">
                <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="₫"/>
            </span>
        </p>
    </div>
</div>

            <form action="checkout" method="post">
                <input type="hidden" name="action" value="PAY">
                <input type="hidden" name="showtimeId" value="${showtimeId}">
                <input type="hidden" name="selectedSeats" value="${selectedSeats}">
                <input type="hidden" name="totalPrice" value="${totalPrice}">

                <div class="form-group-auth">
                    <label>Phương thức thanh toán</label>
                    <select name="paymentMethod" style="width: 100%; padding: 10px; border-radius: 4px;">
                        <option value="ONLINE">Ví điện tử / Thẻ (Mô phỏng)</option>
                        <option value="CASH">Thanh toán tại quầy</option>
                    </select>
                </div>

                <button type="submit" class="auth-btn">THANH TOÁN & XÁC NHẬN</button>
                <a href="javascript:history.back()" style="display:block; text-align:center; color:#aaa; margin-top:10px;">Quay lại chọn ghế</a>
            </form>
        </div>
    </main>
</body>
</html>