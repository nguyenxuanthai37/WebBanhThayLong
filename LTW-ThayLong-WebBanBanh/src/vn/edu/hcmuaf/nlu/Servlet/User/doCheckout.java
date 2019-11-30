package vn.edu.hcmuaf.nlu.Servlet.User;

import vn.edu.hcmuaf.nlu.Model.DatabaseConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/doCheckout")
public class doCheckout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String name = request.getParameter("hoten");
            // String sex = request.getParameter("sex");
            String email = request.getParameter("email");
            String address = request.getParameter("address  ");
            String phoneNumber = request.getParameter("phoneNumber");
            String note = request.getParameter("note");
            try {
                String sql = "INSERT INTO customer (id, name, gender,email,address,phone_number,note) VALUES (?, ?, ?,?,?,?,?)";
                Connection connection = DatabaseConnection.connect();
                PreparedStatement pst = connection.prepareStatement(sql);
                pst.setString(2, name);
                pst.setString(4, email);
                pst.setString(5, address);
                pst.setString(6, phoneNumber);
                pst.setString(7, note);
                pst.executeUpdate();

                request.setAttribute("ok", "Đặt hàng thành công!");

                RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
                dis.forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Lỗi kết nối tới CSDL");
            }
        } finally {
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
