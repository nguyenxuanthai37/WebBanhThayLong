package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.Model.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Type_Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Type_ProductDAO {
    static ArrayList<Type_Product> listT = new ArrayList<>();

    public ArrayList<Type_Product> getDSLoai() throws SQLException, ClassNotFoundException {
        String sql = "Select * from type_products  ";
        Connection connection;
        try {
            connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Type_Product type = new Type_Product();

                type.setId(rs.getInt("id"));
                type.setName(rs.getString("name"));
                type.setDescription(rs.getString("description"));
                type.setImage(rs.getString("image"));

                listT.add(type);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listT;
    }
}
