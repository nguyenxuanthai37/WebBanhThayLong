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

                Products.getProduct(products, rs);

                listPH.add(products);
            }
            connection.close();
            rs.close();
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

                Products.getProduct(products, rs);

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

}