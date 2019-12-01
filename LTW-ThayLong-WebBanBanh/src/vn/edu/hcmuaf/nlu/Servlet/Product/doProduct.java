package vn.edu.hcmuaf.nlu.Servlet.Product;

import vn.edu.hcmuaf.nlu.DAO.ProductDAO;
import vn.edu.hcmuaf.nlu.DAO.UserDAO;
import vn.edu.hcmuaf.nlu.Model.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Products;
import vn.edu.hcmuaf.nlu.Model.Users;
import vn.edu.hcmuaf.nlu.Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/doProduct")
public class doProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Lấy cái id từ trang index
        int id = Integer.parseInt(request.getParameter("id"));
        Products products = Products.find(id);
        System.out.println("đã lấy sản phẩm có id= " + "\t" + id);
        //Tạo session
        HttpSession session = request.getSession();
        session.setAttribute("AuthProduct", products);

        response.sendRedirect("product.jsp");
    }
}
