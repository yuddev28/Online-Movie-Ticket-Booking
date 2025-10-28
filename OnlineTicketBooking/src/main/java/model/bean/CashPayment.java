package model.bean;

public class CashPayment implements IPayment{

	@Override
	public String getPaymentContent() {
		return "Thanh toán tiền mặt";
	}

}
