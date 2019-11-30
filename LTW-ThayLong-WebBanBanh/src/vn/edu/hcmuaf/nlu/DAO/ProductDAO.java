package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.Model.DatabaseConnection;
import vn.edu.hcmuaf.nlu.Model.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO implements ObjectDAO {
    static ArrayList<Products> listP = new ArrayList<>();
    static ArrayList<Products> listPH = new ArrayList<>();

    public ProductDAO() {

    }

    @Override
    public ArrayList getAll() {
        String sql = "Select * from products";
        return getArrayList(sql);
    }

    @Override
    public Products getChiTietSP(String id_sp) {
        return null;
    }

    @Override
    public ArrayList<Products> getListSPByPage(ArrayList<Products> arr, int start, int end) {
        ArrayList<Products> listSP = new ArrayList<>();
        for (int i = start; i < end; i++) {
            listSP.add(arr.get(i));
        }
        return listSP;
    }

    @Override
    public ArrayList<Products> getListSPByType(int id_type) {
        String sql = "Select * from products where id_type='" + id_type + "'";
        return getArrayList(sql);
    }

    @Override
    public ArrayList<Products> getDSHot() {
        String sql = "Select * from products where hot = 1 ";
        return getArrayListHot(sql);
    }

    private ArrayList<Products> getArrayListHot(String sql) {
        Connection connection;
        try {
            connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Products products = new Products();

                products.setId(rs.getInt("id"));
                products.setName(rs.getString("name"));
                products.setId_type(rs.getInt("id_type"));
                products.setDescription(rs.getString("description"));
                products.setUnit_price(rs.getInt("unit_price"));
                products.setPromotion_price(rs.getInt("promotion_price"));
                products.setImage(rs.getString("image"));
                products.setQuantity(rs.getInt("quantity"));
                products.setHot(rs.getInt("hot"));

                listPH.add(products);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return listPH;
    }

    @Override
    public ArrayList<Products> getProductSale() throws SQLException {
        String sql = "Select * from products where promotion_price is not null ";
        return getArrayProductSale(sql);
    }

    private ArrayList<Products> getArrayProductSale(String sql) {
        return getProducts(sql, listPH);
    }

    private ArrayList<Products> getProducts(String sql, ArrayList<Products> listPH) {
        Connection connection;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            connection = DatabaseConnection.connect();
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                Products products = new Products();

                products.setId(rs.getInt("id"));
                products.setName(rs.getString("name"));
                products.setId_type(rs.getInt("id_type"));
                products.setDescription(rs.getString("description"));
                products.setUnit_price(rs.getInt("unit_price"));
                products.setPromotion_price(rs.getInt("promotion_price"));
                products.setImage(rs.getString("image"));
                products.setQuantity(rs.getInt("quantity"));
                products.setHot(rs.getInt("hot"));

                listPH.add(products);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return listPH;
    }

    private ArrayList getArrayList(String sql) {
        return getProducts(sql, listP);
    }

    public static boolean selectProduct(String id_product) throws SQLException, ClassNotFoundException {
        String sql = "Select id from products";
        Connection connection = DatabaseConnection.connect();
        PreparedStatement pst = connection.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            if (id_product.equals(rs.getString(1))) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }
}