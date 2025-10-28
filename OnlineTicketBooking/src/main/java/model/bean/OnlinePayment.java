package model.bean;

public class OnlinePayment implements IPayment{

	@Override
	public String getPaymentContent() {
		return "Thanh toán trực tuyến.";
	}
	
}
