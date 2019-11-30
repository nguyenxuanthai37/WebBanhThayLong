<%@ page import="java.util.Iterator" %>
<%@ page import="vn.edu.hcmuaf.nlu.Model.Cart" %>
<%@ page import="vn.edu.hcmuaf.nlu.Model.Products" %><%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping card</title>
</head>
<body>

<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<div class="inner-header">
    <div class="container">
        <div class="pull-left">
            <h6 class="inner-title">Shopping Cart</h6>
        </div>
        <div class="pull-right">
            <div class="beta-breadcrumb font-large">
                <a href="index.jsp">Home</a> / <span>Shopping Cart</span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="container">
    <div id="content">

        <div class="table-responsive">

            <!-- Shop Products Table -->
            <table class="shop_table beta-shopping-cart-table" cellspacing="0">
                <thead>
                <tr>
                    <th class="product-name">Product</th>
                    <th class="product-price">Price</th>
                    <th class="product-status">Status</th>
                    <th class="product-quantity">Qty.</th>
                    <th class="product-subtotal">Total</th>
                    <th class="product-remove">Remove</th>
                </tr>
                </thead>
                <tbody>
                <% Cart cart = new Cart();
                   for (Products p : cart.list()){
                %>
                <tr class="cart_item">
                    <td class="product-name">
                        <div class="media">
                            <img class="pull-left" src="<%=p.getImage()%>" alt="">
                            <div class="media-body">
                                <p class="font-large table-title"><%=p.getName()%>
                                </p>
                                <p class="table-option">Color: Red</p>
                                <p class="table-option">Size: M</p>
                                <a class="table-edit" href="#">Edit</a>
                            </div>
                        </div>
                    </td>

                    <td class="product-price">
                        <span class="amount"><%=p.getUnit_price()%> VNĐ</span>
                    </td>

                    <td class="product-status">
                        In Stock
                    </td>

                    <td class="product-quantity">
                        <select name="product-qty" id="product-qty">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </td>

                    <td class="product-subtotal">
                        <span class="amount"><%=p.getName()%></span>
                    </td>

                    <td class="product-remove">
                        <a href="#" class="remove" title="Remove this item"><i class="fa fa-trash-o"></i></a>
                    </td>
                </tr>
                <%}%>
                </tbody>

                <tfoot>

                <tr>
                    <td colspan="6" class="actions">
                        <div class="coupon">
                            <%--@declare id="coupon_code"--%><label for="coupon_code">Coupon</label>
                            <input type="text" name="coupon_code" value="" placeholder="Coupon code">
                            <button type="submit" class="beta-btn primary" name="apply_coupon">Apply Coupon <i
                                    class="fa fa-chevron-right"></i></button>
                        </div>
                    </td>
                </tr>
                </tfoot>
            </table>

            <!-- End of Shop Table Products -->
        </div>


        <!-- Cart Collaterals -->
        <div class="cart-collaterals">

            <div class="cart-totals pull-right">
                <div class="cart-totals-row"><h5 class="cart-total-title"></h5></div>
                <div class="cart-totals-row"><span>Cart Subtotal:</span> <span><%=cart.total()%></span></div>
                <div class="cart-totals-row"><span>Shipping:</span> <span>Free Shipping</span></div>
                <div class="cart-totals-row"><span>Order Total:</span> <span>$188.00</span></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <!-- End of Cart Collaterals -->
        <div class="clearfix"></div>


    </div> <!-- #content -->
</div> <!-- .container -->
<%--ENDCONTENT--%>
<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
