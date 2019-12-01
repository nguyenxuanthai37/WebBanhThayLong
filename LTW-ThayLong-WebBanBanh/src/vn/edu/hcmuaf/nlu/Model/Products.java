package vn.edu.hcmuaf.nlu.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Products {
    int id;
    String name;
    int id_type;
    String description;
    double unit_price;
    double promotion_price;
    String image;
    int quantity;
    int hot;

    public Products(int id, String name, int id_type, String description, double unit_price, double promotion_price, String image, int quantity, int hot) {
        this.id = id;
        this.name = name;
        this.id_type = id_type;
        this.description = description;
        this.unit_price = unit_price;
        this.promotion_price = promotion_price;
        this.image = image;
        this.quantity = quantity;
        this.hot = hot;
    }

    public Products() {
        super();
    }

    public static Products find(int id) {
        Products products = null;
        try {
            String sql = "SELECT `id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `quantity`, " +
                    "`hot`, `created_at`, `updated_at` FROM `products` WHERE id='" + id + "'";
            Connection connection = DatabaseConnection.connect();
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            rs.last();
            if (rs.getRow() == 1) {
                rs.first();
                products = new Products();
                getProduct(products, rs);
                return products;
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return products;
    }

    public static void getProduct(Products products, ResultSet rs) throws SQLException {
        products.setId(rs.getInt("id"));
        products.setName(rs.getString("name"));
        products.setId_type(rs.getInt("id_type"));
        products.setDescription(rs.getString("description"));
        products.setUnit_price(rs.getInt("unit_price"));
        products.setPromotion_price(rs.getInt("promotion_price"));
        products.setImage(rs.getString("image"));
        products.setQuantity(rs.getInt("quantity"));
        products.setHot(rs.getInt("hot"));
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public double getPromotion_price() {
        return promotion_price;
    }

    public void setPromotion_price(double promotion_price) {
        this.promotion_price = promotion_price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void quantityUp() {
        this.quantity++;
    }

    public void quantityUp(int quantity) {
        setQuantity(this.quantity + quantity);
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        if (quantity < 1) {
            quantity = 1;
        }
        this.quantity = quantity;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    @Override
    public String toString() {
        return "Products{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", id_type=" + id_type +
                ", description='" + description + '\'' +
                ", unit_price=" + unit_price +
                ", promotion_price=" + promotion_price +
                ", image='" + image + '\'' +
                ", quantity=" + quantity +
                ", hot=" + hot +
                '}';
    }
}
