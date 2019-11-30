<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.nlu.Model.Products" %>
<%@ page import="vn.edu.hcmuaf.nlu.DAO.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.nlu.DAO.Type_ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.nlu.Model.Type_Product" %><%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Loại sản phẩm</title>
</head>
<body>

<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<div class="inner-header">
    <div class="container">
        <div class="pull-left">
            <h6 class="inner-title">Sản phẩm</h6>
        </div>
        <div class="pull-right">
            <div class="beta-breadcrumb font-large">
                <a href="index.jsp">Home</a> / <span>Sản phẩm</span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="container">
    <div id="content" class="space-top-none">
        <div class="main-content">
            <div class="space60">&nbsp;</div>
            <div class="row">
                <div class="col-sm-3">
                    <ul class="aside-menu">
                        <%
                            ArrayList<Type_Product> listType = new Type_ProductDAO().getDSLoai();
                        %>
                        <% for (int i = 0; i < listType.size(); i++) { %>
                        <li>
                            <a href="#"><%=listType.get(i).getName()%>
                            </a>
                        </li>
                        <%}%>

                    </ul>
                </div>
                <% ProductDAO spDAO = new ProductDAO();%>
                <div class="col-sm-9">
                    <div class="beta-products-list">
                        <h4>Sản phẩm mới</h4>
                        <% ArrayList<Products> listProduct = new ProductDAO().getAll();
                            int start = 0;
                            int end = 21;
                            if (listProduct.size() < 21) {
                                end = listProduct.size();
                            }
//                                if (request.getParameter("start" != null)) {
//                                    start = Integer.parseInt(request.getParameter("start"));
//                                }
//                                if (request.getParameter("end" != null)) {
//                                    end = Integer.parseInt(request.getParameter("end"));
//                                }
                            ArrayList<Products> list = spDAO.getListSPByPage(listProduct, start, end);
                        %>
                        <div class="beta-products-details">
                            <p class="pull-left">Tìm thấy <%=list.size()%> sản phẩm</p>
                            <div class="clearfix"></div>
                        </div>


                        <div class="row">
                            <% for (Products listP : list) {
                            %>
                            <div class="col-sm-4">
                                <div class="single-item">
                                    <div class="single-item-header">
                                        <a href="<%= listP.getId()%>"><img
                                                src="<%= listP.getImage()%>" alt=""
                                                style="width: 270px;height: 320px ; background-image: none; background-repeat: no-repeat; background-position: center center; "></a>
                                    </div>
                                    <div class="single-item-body">
                                        <p class="single-item-title"><%= listP.getName()%>
                                        </p>
                                        <p class="single-item-price">
                                            <span><%= listP.getUnit_price()%> VNĐ</span>
                                        </p>
                                    </div>
                                    <div class="single-item-caption">
                                        <a class="add-to-cart pull-left" href="shopping_cart.jsp"><i
                                                class="fa fa-shopping-cart"></i></a>
                                        <a class="beta-btn primary" href="product.jsp">Details <i
                                                class="fa fa-chevron-right"></i></a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                        <div class="space50">&nbsp;</div>
                        <ul class="beta-pagination l-inline">
                            <% int a, b;
                                int limit = listProduct.size() / 20;
                                if (limit * 20 < listProduct.size()) {
                                    limit++;
                                }
                                for (int z = 1; z <= limit; z++) {
                                    a = (z - 1) * 20;
                                    b = z * 20;
                                    if (b > listProduct.size()) {
                                        b = listProduct.size();
                                    }
                            %>
                            <li class="active"><a href="product_type.jsp?start=<%=a%>&end=<%=b%>"><%=z%>
                            </a></li>
                            <% }%>
                        </ul>
                    </div> <!-- .beta-products-list -->

                    <div class="space50">&nbsp;</div>
                    <%
                        ArrayList<Products> listProductHot = new ProductDAO().getDSHot();
                        int startHot = 0;
                        int endHot = 6;
                        if (listProductHot.size() < 6) {
                            endHot = listProductHot.size();
                        }
//                                if (request.getParameter("start" != null)) {
//                                    start = Integer.parseInt(request.getParameter("start"));
//                                }
//                                if (request.getParameter("end" != null)) {
//                                    end = Integer.parseInt(request.getParameter("end"));
//                                }
                        ArrayList<Products> listHot = spDAO.getListSPByPage(listProductHot, startHot, endHot);
                    %>
                    <div class="beta-products-list">
                        <h4>Sản phẩm bán chạy</h4>
                        <div class="beta-products-details">
                            <p class="pull-left">Tìm thấy <%=listHot.size()%> sản phẩm
                            </p>
                            <div class="clearfix"></div>
                        </div>
                        <div class="row">
                            <% for (Products listH : listHot) {
                            %>
                            <div class="col-sm-4">
                                <div class="single-item">
                                    <div class="single-item-header">
                                        <a href="product.jsp"><img src="<%= listH.getImage()%>" alt=""
                                                                   style="width: 270px;height: 320px ; background-image: none; background-repeat: no-repeat; background-position: center center; "></a>
                                    </div>
                                    <div class="single-item-body">
                                        <p class="single-item-title"><%= listH.getName()%>
                                        </p>
                                        <p class="single-item-price">
                                            <span><%= listH.getUnit_price()%> VNĐ</span>
                                        </p>
                                    </div>
                                    <div class="single-item-caption">
                                        <a class="add-to-cart pull-left" href="shopping_cart.jsp"><i
                                                class="fa fa-shopping-cart"></i></a>
                                        <a class="beta-btn primary" href="product.jsp">Details <i
                                                class="fa fa-chevron-right"></i></a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <% }%>
                        </div>
                        <div class="space40">&nbsp;</div>
                        <ul class="beta-pagination l-inline">
                            <% int a1, b1;
                                int limit1 = listProductHot.size() / 20;
                                if (limit1 * 20 < listProductHot.size()) {
                                    limit1++;
                                }
                                for (int z = 1; z <= limit1; z++) {
                                    a1 = (z - 1) * 20;
                                    b1 = z * 20;
                                    if (b1 > listProductHot.size()) {
                                        b1 = listProductHot.size();
                                    }
                            %>
                            <li class="active"><a href="product_type.jsp?start=<%=a1%>&end=<%=b1%>"><%=z%>
                            </a></li>
                            <% }%>
                        </ul>
                        <div class="space40">&nbsp;</div>
                    </div> <!-- .beta-products-list -->
                </div>
            </div> <!-- end section with sidebar and main content -->
        </div> <!-- .main-content -->
    </div> <!-- #content -->
</div> <!-- .container -->
<%--ENDCONTENT--%>
<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
