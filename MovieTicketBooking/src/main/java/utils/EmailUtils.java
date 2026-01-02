package utils;

import java.util.Properties;
import java.util.Random;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailUtils {
    
    // Tạo mã OTP ngẫu nhiên 6 số
    public static String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    public static void sendEmail(String toEmail, String subject, String body) {
        // Cấu hình SMTP (Ví dụ dùng Gmail)
        final String fromEmail = "golike000004@gmail.com"; // Điền email của bạn
        final String password = "liqlpipzysyezqpw"; // Điền App Password

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "587"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.starttls.enable", "true"); 

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromEmail));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject(subject, "UTF-8");
            msg.setText(body, "UTF-8");

            Transport.send(msg);
        } catch (Exception e) {
        	System.out.println("GỬI MAIL THẤT BẠI VÌ: " + e.getMessage());
            e.printStackTrace();
        }
    }
// // ==========================================
//    // HÀM MAIN ĐỂ TEST GỬI EMAIL (CHẠY THỬ)
//    // ==========================================
//    public static void main(String[] args) {
//        // 1. Điền địa chỉ email NGƯỜI NHẬN (là email cá nhân khác của bạn để kiểm tra)
//        String nguoiNhan = "golike0000020@gmail.com"; 
//
//        System.out.println("=== ĐANG BẮT ĐẦU GỬI EMAIL... ===");
//        System.out.println("Người gửi: (Cấu hình trong hàm sendEmail)");
//        System.out.println("Người nhận: " + nguoiNhan);
//
//        try {
//            // Gọi hàm gửi mail
//            sendEmail(nguoiNhan, "TEST KẾT NỐI EMAIL JAVA", "Xin chào! Nếu bạn đọc được dòng này nghĩa là chức năng gửi email đã HOẠT ĐỘNG TỐT!");
//            
//            // Nếu chạy đến dòng này mà không lỗi thì là thành công
//            System.out.println("✅ GỬI THÀNH CÔNG! Hãy kiểm tra hộp thư đến (và cả mục Spam).");
//        } catch (Exception e) {
//            System.out.println("❌ GỬI THẤT BẠI! Xem chi tiết lỗi bên dưới:");
//            e.printStackTrace();
//        }
//    }
}