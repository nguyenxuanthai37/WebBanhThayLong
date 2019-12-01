<%@ page import="vn.edu.hcmuaf.nlu.Model.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.nlu.DAO.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.nlu.Util.Util" %>
Created by IntelliJ IDEA.
User: MAD
Date: 11/18/2019
Time: 8:58 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
</head>
<body>
<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<div class="container">
    <div id="content">
        <div class="row">
            <div class="col-sm-9">
                <%
                    if (session.getAttribute("AuthProduct") != null) {
                        Products products = (Products) request.getAttribute("AuthProduct");
                %>
                <div class="row">
                    <div class="col-sm-4">
                        <img src="<%=products.getImage()%>" alt="">
                    </div>
                    <div class="col-sm-8">
                        <div class="single-item-body">
                            <p class="single-item-title"><%=products.getName()%>
                            </p>
                            <p class="single-item-price">
                                <span><%=products.getUnit_price()%></span>
                            </p>
                        </div>

                        <div class="clearfix"></div>
                        <div class="space20">&nbsp;</div>

                        <div class="single-item-desc">
                            <p><%=products.getDescription()%>
                            </p>
                        </div>
                        <div class="space20">&nbsp;</div>

                        <p>Options:</p>
                        <div class="single-item-options">
                            <select class="wc-select" name="size">
                                <option>Size</option>
                                <option value="XS">XS</option>
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                            </select>
                            <select class="wc-select" name="color">
                                <option>Color</option>
                                <option value="Red">Red</option>
                                <option value="Green">Green</option>
                                <option value="Yellow">Yellow</option>
                                <option value="Black">Black</option>
                                <option value="White">White</option>
                            </select>
                            <select class="wc-select" name="color">
                                <option>Qty</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                            <a class="add-to-cart" href="<%=Util.fullPath("Add?id=")%>"><i
                                    class="fa fa-shopping-cart"></i></a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="space40">&nbsp;</div>
                <div class="woocommerce-tabs">
                    <ul class="tabs">
                        <li><a href="#tab-description">Description</a></li>
                        <li><a href="#tab-reviews">Reviews (0)</a></li>
                    </ul>

                    <div class="panel" id="tab-description">
                        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia
                            consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam
                            est, qui dolorem ipsum quia dolor sit amet.</p>
                        <p>Consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                            dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum
                            exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi
                            consequaturuis autem vel eum iure reprehenderit qui in ea voluptate velit es quam nihil
                            molestiae consequr, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? </p>
                    </div>
                    <div class="panel" id="tab-reviews">
                        <p>No Reviews</p>
                    </div>
                </div>
                <%}%>
                <div class="space50">&nbsp;</div>
                <div class="beta-products-list">
                    <% ProductDAO spDAO = new ProductDAO();
                        ArrayList<Products> listProductHot = new ProductDAO().getDSHot();
                        int startHot = 0;
                        int endHot = 3;
                        if (listProductHot.size() < 3) {
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
                    <h4>Sản phẩm liên quan</h4>
                    <div class="beta-products-details">
                        <p class="pull-left">Tìm thấy <%=listHot.size()%> sản phẩm
                        </p>
                        <div class="clearfix"></div>
                    </div>
                    <div class="row">
                        <% for (Products listH : listHot) {%>
                        <div class="col-sm-4">
                            <div class="single-item">
                                <div class="single-item-header">
                                    <a href="#"><img src="<%=listH.getImage()%>" alt=""
                                                     style="width: 270px;height: 320px ; background-image: none; background-repeat: no-repeat; background-position: center center; "></a>
                                </div>
                                <div class="single-item-body">
                                    <p class="single-item-title"><%=listH.getName()%>
                                    </p>
                                    <p class="single-item-price">
                                        <span><%=listH.getUnit_price()%>  VNĐ</span>
                                    </p>
                                </div>
                                <div class="single-item-caption">
                                    <a class="add-to-cart pull-left" href="#"><i
                                            class="fa fa-shopping-cart"></i></a>
                                    <a class="beta-btn primary" href="#">Details <i
                                            class="fa fa-chevron-right"></i></a>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <div class="space40">&nbsp;</div>
                    <ul class="beta-pagination l-inline">
                        <% int a, b;
                            int limit = listProductHot.size() / 20;
                            if (limit * 20 < listProductHot.size()) {
                                limit++;
                            }
                            for (int i = 1; i <= limit; i++) {
                                a = (i - 1) * 20;
                                b = i * 20;
                                if (b > listProductHot.size()) {
                                    b = listProductHot.size();
                                }
                        %>
                        <li class="active"><a href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%>
                        </a></li>
                        <% }%>
                    </ul>
                </div> <!-- .beta-products-list -->
            </div>
            <div class="col-sm-3 aside">
                <div class="widget">
                    <% ProductDAO sp = new ProductDAO();
                        ArrayList<Products> listProductSale = new ProductDAO().getDSHot();
                        int startSale = 0;
                        int endSale = 5;
                        if (listProductSale.size() < 5) {
                            endSale = listProductSale.size();
                        }
                        //                                if (request.getParameter("start" != null)) {
                        //                                    start = Integer.parseInt(request.getParameter("start"));
                        //                                }
                        //                                if (request.getParameter("end" != null)) {
                        //                                    end = Integer.parseInt(request.getParameter("end"));
                        //                                }
                        ArrayList<Products> list = spDAO.getListSPByPage(listProductSale, startSale, endSale);
                    %>
                    <h3 class="widget-title">Sản phẩm bán chạy</h3>
                    <div class="widget-body">
                        <div class="beta-sales beta-lists">
                            <% for (Products listSL : list) {%>
                            <div class="media beta-sales-item">
                                <a class="pull-left" href="#"><img
                                        src="<%=listSL.getImage()%>" alt=""
                                        style="width: 55px;height: 58px  ; background-image: none; background-repeat: no-repeat; background-position: center center; "></a>
                                <div class="media-body">
                                    <%=listSL.getName()%>
                                    <span class="beta-sales-price"><%=listSL.getUnit_price()%> VNĐ</span>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div> <!-- best sellers widget -->
                <div class="widget">
                    <% ProductDAO spNew = new ProductDAO();
                        ArrayList<Products> listProductNew = new ProductDAO().getDSHot();
                        int startNew = 0;
                        int endNew = 5;
                        if (listProductNew.size() < 5) {
                            endNew = listProductNew.size();
                        }
                        //                                if (request.getParameter("start" != null)) {
                        //                                    start = Integer.parseInt(request.getParameter("start"));
                        //                                }
                        //                                if (request.getParameter("end" != null)) {
                        //                                    end = Integer.parseInt(request.getParameter("end"));
                        //                                }
                        ArrayList<Products> listNew = spNew.getListSPByPage(listProductNew, startNew, endNew);
                    %>
                    <h3 class="widget-title">Sản phẩm mới</h3>
                    <div class="widget-body">

                        <div class="beta-sales beta-lists">
                            <% for (Products listNewP : listNew) {%>
                            <div class="media beta-sales-item">
                                <a class="pull-left" href="product.html"><img
                                        src="<%=listNewP.getImage()%>" alt=""
                                        style="width: 55px;height: 58px ; background-image: none; background-repeat: no-repeat; background-position: center center; "></a>
                                <div class="media-body">
                                    <%=listNewP.getName()%>
                                    <span class="beta-sales-price"><%=listNewP.getUnit_price()%> VNĐ</span>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div> <!-- best sellers widget -->
            </div>
        </div>
    </div> <!-- #content -->
</div> <!-- .container -->
<%--ENDCONTENT--%>
<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
