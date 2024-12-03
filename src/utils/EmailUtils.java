package utils;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;



public class EmailUtils {
    public static MimeMessage createMimeMessage
            (Session session, String sendMailAddress, String receiveMailAddress, String subject, String content)
            throws Exception {
        // 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // From: 发件人
        message.setFrom(new InternetAddress(sendMailAddress, "加瓦商城", "UTF-8"));

        // To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMailAddress, "顾客", "UTF-8"));

        // Subject: 邮件主题
        message.setSubject(subject, "UTF-8");

        // Content: 邮件正文（可以使用html标签）
        message.setContent(content, "text/html;charset=UTF-8");
        // 设置发件时间
        message.setSentDate(new Date());

        // 保存设置
        message.saveChanges();

        return message;
    }

    public static String myEmailAccount = "Scut202266440303@163.com";    //发件人邮箱
    public static String myEmailPassword = "YZtPD38pkLCpch2u";      //SMTP服务授权码

    // 发件人邮箱的 SMTP 服务器地址,
    public static String myEmailSMTPHost = "smtp.163.com";

    // 收件人邮箱


    public static void sendEmail(String recipient, String subject, String content) throws Exception {
        Properties props = new Properties();                    // 参数配置
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证

        String receiveMailAccount = recipient;
        // 根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getInstance(props);
        // 设置为debug模式, 可以查看详细的发送 log
        session.setDebug(true);

        // 创建一封邮件
        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount, subject, content);

        // 根据 Session 获取邮件传输对象
        Transport transport = session.getTransport();

        // 发件人邮箱以及开启SMTP服务后的授权码
        transport.connect(myEmailAccount, myEmailPassword);

        // 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的收件人, 抄送人, 密送人
        transport.sendMessage(message, message.getAllRecipients());

        // 关闭连接
        transport.close();
    }
}
