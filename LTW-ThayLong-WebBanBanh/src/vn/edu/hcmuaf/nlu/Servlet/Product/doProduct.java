package vn.edu.hcmuaf.nlu.Servlet.Product;

import vn.edu.hcmuaf.nlu.DAO.ProductDAO;
import vn.edu.hcmuaf.nlu.DAO.UserDAO;
import vn.edu.hcmuaf.nlu.Model.Products;
import vn.edu.hcmuaf.nlu.Model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/doProduct")
public class doProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (ProductDAO.selectProduct("5")) {
                Products p = new Products();

                HttpSession session = request.getSession();
                session.setAttribute("AuthProduct", p);
                response.sendRedirect("product.jsp");

            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
}
