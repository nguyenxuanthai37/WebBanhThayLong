package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.Model.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Slide;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SlideDAO {
    static ArrayList<Slide> listSL = new ArrayList<>();

    public ArrayList<Slide> getSlide() throws SQLException, ClassNotFoundException {
        String sql = "Select * from slide ";
        Connection connection;
        try {
            connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            rs.last();
            if (rs.getRow()==1) {
                rs.first();
                Slide sl = new Slide();
                sl.setId(rs.getInt("id"));
                sl.setLink(rs.getString("link"));
                sl.setImage(rs.getString("image"));

                listSL.add(sl);
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSL;
    }
}
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            String inEmail = request.getParameter("email").trim();
//            String inPassword = request.getParameter("pass").trim();
//
//            if (checkLogin(inEmail, inPassword)) {
//                HttpSession session = request.getSession();
//                Users u = new Users();
//                //
//                session.setAttribute("Auth", u);
//                response.sendRedirect("index.jsp");
//            } else {
//                request.setAttribute("err", "Sai Email hoặc Password");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            }
//        } catch (SQLException | ClassNotFoundException ex) {
//            ex.printStackTrace();
//            response.getWriter().println("Đăng nhập không thành công!");
//        }
//    }