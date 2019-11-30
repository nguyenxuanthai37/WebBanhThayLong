package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.Model.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public static boolean checkLogin(String email, String password) throws SQLException, ClassNotFoundException {
        String sql = "Select email, password from users";
        Connection connection = DatabaseConnection.connect();
        PreparedStatement pst = connection.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            if (email.equals(rs.getString(1)) && password.equals(rs.getString(2))) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }
}