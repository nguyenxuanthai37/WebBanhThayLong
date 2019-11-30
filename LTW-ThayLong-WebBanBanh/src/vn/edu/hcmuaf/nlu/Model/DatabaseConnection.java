package vn.edu.hcmuaf.nlu.Model;

import java.sql.*;

public class DatabaseConnection {
    static Connection con;

    public static Connection connect()
            throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_banbanh?serverTimezone=UTC", "root", "");
        return con;
    }
}


