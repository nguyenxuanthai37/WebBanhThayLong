package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.Model.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

public class UserDAO {

    public static boolean checkLogin(String email, String password) throws SQLException, ClassNotFoundException {
        String sql = "Select email, password from users";
        Connection connection = DatabaseConnection.connect();
        PreparedStatement pst = connection.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            if (email.equals(rs.getString(1)) && password.equals(rs.getString(2))) {
                return true;
            }
        }
        return false;
    }

    public void dangKy(String s, String email, String fullName, String address, String phone, String password) throws ParseException {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = DatabaseConnection.connect();
            ps = connection.prepareStatement("update user set email = ? , fullName = ? , address = ? , phone = ? password=?");

            ps.setString(1, email);
            ps.setString(2, fullName);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, address);


            ps.executeUpdate();
            connection.close();
            ps.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
    }
}