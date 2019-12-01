package vn.edu.hcmuaf.nlu.Servlet.User;

import vn.edu.hcmuaf.nlu.DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;

@WebServlet(name = "doRegister")
public class doRegister extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            Integer userId = (Integer) request.getSession().getAttribute("id");
            String email = (String) request.getParameter("firstname");
            String fullName = (String) request.getParameter("lastname");
            String address = (String) request.getParameter("birthday");
            String phone = (String) request.getParameter("gender");
            String password = (String) request.getParameter("gender");

            UserDAO u = new UserDAO();
            u.dangKy(userId.toString(), email.toString(), fullName.toString(), address.toString(), phone.toString(), password.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }

//		request.getRequestDispatcher("proFileUser.jsp").forward(request, response);
//        response.sendRedirect("http://localhost:8080/PrinceUpdate/User");
    }

}
