package vn.edu.hcmuaf.nlu.DAO;

import vn.edu.hcmuaf.nlu.Model.Products;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ObjectDAO {
    //Lấy tất cả các danh sách sản phẩm
    ArrayList<Products> getAll() throws SQLException, ClassNotFoundException;
    //Lấy tất cả các danh sách sản phẩm bán chạy
    ArrayList<Products> getDSHot() throws SQLException, ClassNotFoundException;
    //Lấy tất cả các danh sách sản phẩm đang giảm giá
    ArrayList<Products> getProductSale() throws SQLException, ClassNotFoundException;
    //Lấy thông tin chi tiết sản phẩm
    public Products getChiTietSP(String id_sp);
    //Phân trang sản phẩm
    public ArrayList<Products> getListSPByPage(ArrayList<Products> arr ,int start, int end);
    //Lấy sản phẩm theo loại
    public ArrayList<Products> getListSPByType(int id_type);
}
