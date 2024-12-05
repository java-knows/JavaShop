package servlet;

import model.Order;
import model.User;
import service.OrderService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "admin_user_order", urlPatterns = "/admin/user_order")
public class AdminUserOrderServlet extends HttpServlet {
    private OrderService oService = new OrderService();
    private UserService uService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        User u = uService.selectById(id);
        String username = u.getUsername();
        List<Order> list = oService.selectAll(id);
        request.setAttribute("orderList", list);
        request.setAttribute("id", id);
        request.setAttribute("username", username);
        request.getRequestDispatcher("/admin/user_order.jsp").forward(request, response);
    }
}
