<%@ page import="vn.edu.hcmuaf.nlu.Model.Slide" %>
<%@ page import="vn.edu.hcmuaf.nlu.DAO.SlideDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.nlu.Model.Products" %>
<%@ page import="vn.edu.hcmuaf.nlu.DAO.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.nlu.Util.Util" %><%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ </title>

</head>
<body>
<%@ include file="header.jsp" %>
<div class="rev-slider">
    <div class="fullwidthbanner-container">
        <div class="fullwidthbanner">
            <div class="bannercontainer">
                <div class="banner">
                    <ul>
                            <% ArrayList<Slide> listSlide = new SlideDAO().getSlide();%>
                        <!-- THE FIRST SLIDE -->
                            <%for (int i = 0; i < listSlide.size(); i++) {%>
                            <!-- THE FIRST SLIDE -->
                            <li data-transition="boxfade" data-slotamount="20" class="active-revslide"
                                style="width: 100%; height: 100%; overflow: hidden; z-index: 18; visibility: hidden; opacity: 0;">
                                <div class="slotholder" style="width:100%;height:100%;" data-duration="undefined"
                                     data-zoomstart="undefined" data-zoomend="undefined" data-rotationstart="undefined"
                                     data-rotationend="undefined" data-ease="undefined" data-bgpositionend="undefined"
                                     data-bgposition="undefined" data-kenburns="undefined" data-easeme="undefined"
                                     data-bgfit="undefined" data-bgfitend="undefined" data-owidth="undefined"
                                     data-oheight="undefined">
                                    <div class="tp-bgimg defaultimg" data-lazyload="undefined" data-bgfit="cover"
                                         data-bgposition="center center" data-bgrepeat="no-repeat"
                                         data-lazydone="undefined"
                                         src="images/slide/<%=listSlide.get(i).getImage()%>"
                                         data-src="images/slide/<%=listSlide.get(i).getImage()%>"
                                         style="background-color: rgba(0, 0, 0, 0); background-repeat: no-repeat; background-image: url('images/slide/<%=listSlide.get(i).getImage()%>'); background-size: cover; background-position: center center; width: 100%; height: 100%; opacity: 1; visibility: inherit;">
                                    </div>
                                </div>

                            </li>
                            <%}%>
                        </ul>
                </div>
                <div class="tp-bannertimer"></div>
            </div>
        </div>
        <!--slider-->
    </div>
</div>
<div class="container">
    <div id="content" class="space-top-none">
        <div class="main-content">
            <div class="space60">&nbsp;</div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="beta-products-list">
                        <h4>Sản phẩm mới</h4>
                        <% ProductDAO spDAO = new ProductDAO();
                            ArrayList<Products> arr = spDAO.getAll();
                            int start = 0;
                            int end = 20;
                            if (arr.size() < 20) {
                                end = arr.size();
                            }
//                                if (request.getParameter("start" != null)) {
//                                    start = Integer.parseInt(request.getParameter("start"));
//                                }
//                                if (request.getParameter("end" != null)) {
//                                    end = Integer.parseInt(request.getParameter("end"));
//                                }
                            ArrayList<Products> list = spDAO.getListSPByPage(arr, start, end);
                        %>
                        <div class="beta-products-details">
                            <p class="pull-left">Tìm thấy <%=arr.size()%> sản phẩm</p>
                            <div class="clearfix"></div>
                        </div>
                        <div class="row">
                            <% for (Products sp : list) {
                            %>
                            <div class="col-sm-3">
                                <div class="single-item">
                                    <div class="single-item-header">
                                        <a href="product.jsp"><img
                                                src="<%= sp.getImage()%>"
                                                alt=""
                                                style="width: 270px;height: 320px  "></a>
                                    </div>
                                    <div class="single-item-body">
                                        <p class="single-item-title"><%= sp.getName()%>
                                        </p>
                                        <p class="single-item-price">
                                            <span><%= sp.getUnit_price()%> VNĐ</span>
                                        </p>
                                    </div>
                                    <div class="single-item-caption">
                                        <%--                                        <a class="add-to-cart pull-left" href="shopping_cart.jsp?id=<%=sp.getId()%>">--%>
                                        <a class="add-to-cart pull-left"
                                           href="<%=Util.fullPath("Add?id= "+sp.getId())%>">
                                            <i class="fa fa-shopping-cart"></i></a>
                                        <a class="beta-btn primary" href="<%=Util.fullPath("doProduct?id="+sp.getId())%>">Details <i
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
                                int limit = arr.size() / 20;
                                if (limit * 20 < arr.size()) {
                                    limit++;
                                }
                                for (int i = 1; i <= limit; i++) {
                                    a = (i - 1) * 20;
                                    b = i * 20;
                                    if (b > arr.size()) {
                                        b = arr.size();
                                    }
                            %>
                            <li class="active"><a href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%>
                            </a></li>
                            <% }%>
                        </ul>
                    </div> <!-- .beta-products-list -->

                    <div class="space50">&nbsp;</div>

                    <div class="beta-products-list">
                        <%
                            ArrayList<Products> listProductHot = new ProductDAO().getDSHot();
                            int startHot = 0;
                            int endHot = 4;
                            if (listProductHot.size() < 4) {
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
                                <div class="col-sm-3">
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
                                <li class="active"><a href="index.jsp?start=<%=a1%>&end=<%=b1%>"><%=z%>
                                </a></li>
                                <% }%>
                            </ul>
                            <div class="space40">&nbsp;</div>
                        </div>
                    </div> <!-- .beta-products-list -->
                </div>
            </div> <!-- end section with sidebar and main content -->
        </div> <!-- .main-content -->
    </div> <!-- #content -->
</div> <!-- .container -->

<%@ include file="footer.jsp" %>

</body>

</html>
