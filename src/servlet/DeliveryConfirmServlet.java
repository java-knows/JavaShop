package servlet;

import model.User;
import service.OrderService;
import utils.EmailUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "delivery_confirm",urlPatterns = "/delivery_confirm")
public class DeliveryConfirmServlet extends HttpServlet {
    private OrderService oService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        User u = (User) request.getSession().getAttribute("user");
        oService.updateStatus(id, status);
        String recipientEmail = u.getEmail();
        String subject = "订单确认收货通知";
        String content = "您好，您购买的订单号：" + id + " 已确认收货。感谢您的支持！";
        try {
            EmailUtils.sendEmail(recipientEmail, subject, content);
            response.getWriter().print("ok");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("failed");

        }

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}