package vn.edu.hcmuaf.nlu.Servlet.Cart;

import vn.edu.hcmuaf.nlu.Model.Cart;
import vn.edu.hcmuaf.nlu.Model.Products;
import vn.edu.hcmuaf.nlu.Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Add")
public class Add extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            Products p = Products.find(id);
            Cart c = (Cart) session.getAttribute("Cart");
            if (c == null) {
                c = new Cart();
            }
            if (p != null) {
                c.put(p);
            }
            session.setAttribute("Cart", c);
        } catch (Exception e) {

        }
        response.sendRedirect(Util.fullPath("index.jsp"));
    }
}
