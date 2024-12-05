package servlet;

import model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "admin_login",urlPatterns = "/admin_login")
public class AdminLoginServlet extends HttpServlet {
    private UserService uService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ue = request.getParameter("ue");
        String password = request.getParameter("password");
        User user = uService.login(ue, password);
        if(user==null || !user.isIsadmin()) {
            request.setAttribute("failMsg", "管理员用户名、邮箱或者密码错误，请重新登录！");
            request.getRequestDispatcher("/user_login.jsp").forward(request, response);
        }
        else {
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("/user_center.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
