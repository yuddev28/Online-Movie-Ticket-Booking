<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
	
</head>
<body>
	<div class="container-fluid">
		<c:if test="${not empty sessionScope.ticketMessage }">
			<div id="message"
		         class="bg-success text-white px-3 py-2 rounded d-inline-flex align-items-center gap-2">
		        <span>${sessionScope.ticketMessage}</span>
		        <button type="button"
		                class="btn-close btn-close-white"
		                aria-label="Close"
		                onclick="hideMessage()">
		        </button>
	    	</div>
		</c:if>
		
		<h1>Quản lý vé</h1>
		
		<table class="table">
			<thread>
				<tr>
					<th style="width:10%">UID</th>
					<th>Người mua</th>
					<th style="width:10%">Giá tiền</th>
					<th style="width:20%">Phương thức thanh toán</th>
					<th style="width:10%">Mua vào lúc</th>
					<th style="width:10%">Cập nhật vào lúc</th>
					<th style="width:10%">Trạng thái</th>
					<th style="width:10%">Hành động</th>
				</tr>
			</thread>
			<tbody>
				<c:forEach var="t" items="${listTickets}">
					<tr>
						<td>${t.uid}</td>
						<td>${t.user.username }</td>
						<td>
							<fmt:formatNumber 
							        value="${t.totalPrice}" 
							        type="currency" 
							        currencySymbol="₫" 
							        maxFractionDigits="0"/>
						</td>
						<td>${t.paymentMethod }</td>
						<td>
							<fmt:formatDate 
							        value="${t.createdAtAsDate}" 
							        pattern="dd/MM/yyyy HH:mm"/>
						</td>
						<td>
							<fmt:formatDate 
								        value="${t.updatedAtAsDate}" 
								        pattern="dd/MM/yyyy HH:mm"/>
						</td>
						<td>${t.status }</td>
						<td>
							<c:if test="${t.status != TicketStatus.PAID }">
								<div class="d-flex gap-2">
		    						<form action="${pageContext.request.contextPath}/admin/ticket/paid" method="get">
		    							<input type="hidden" name="id" value="${t.id }">
										<input type="submit" value="Xác nhận thanh toán" class="btn btn-success">
									</form>
								</div>
							</c:if>
							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- Thông báo xác nhận xoá phim -->
	<div class="modal fade" id="confirmPaidModal" tabindex="-1">
	    <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content">
	
	            <div class="modal-header">
	                <h5 class="modal-title text-danger">Xác nhận thanh toán</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	            </div>
	
	            <div class="modal-body text-center">
	                <p>Vé này đã được thanh toán chưa?</p>
	            </div>
	
	            <div class="modal-footer justify-content-center">
	                <form id="deleteForm" 
	                      action="${pageContext.request.contextPath}/admin/ticket/paid" 
	                      method="post">
	                    <input type="hidden" name="id" id="paidTicketId">
	                    <button type="submit" class="btn btn-danger">Đã thanh toán</button>
	                </form>
	
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
	                    Chưa thanh toán
	                </button>
	            </div>
	
	        </div>
	    </div>
	</div>
	
	<script >
		const deleteModal = document.getElementById('confirmPaidModal');
	
		deleteModal.addEventListener('show.bs.modal', function (event) {
		    const button = event.relatedTarget;
		    const cinemaId = button.getAttribute('data-ticket-id');
	
		    document.getElementById('paidTicketId').value = ticketId;
		});
		function hideMessage() {
			const msg = document.getElementById("message");
			if (msg) {
				msg.classList.add("d-none");
			}
		}
	</script>
</body>
</html>