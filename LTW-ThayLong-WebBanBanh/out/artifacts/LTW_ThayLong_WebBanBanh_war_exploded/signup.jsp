<%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng ký</title>
</head>
<body>
<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<div class="inner-header">
    <div class="container">
        <div class="pull-left">
            <h6 class="inner-title">Đăng kí</h6>
        </div>
        <div class="pull-right">
            <div class="beta-breadcrumb">
                <a href="index.jsp">Home</a> / <span>Đăng kí</span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="container">
    <div id="content">

        <form action="#" method="post" class="beta-form-checkout">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <h4>Đăng kí</h4>
                    <div class="space20">&nbsp;</div>


                    <div class="form-block">
                        <label for="email">Email address*</label>
                        <input type="email" id="email" name="email" required>
                    </div>

                    <div class="form-block">
                        <label for="your_last_name">Fullname*</label>
                        <input type="text" id="your_last_name" name="fullName" required>
                    </div>

                    <div class="form-block">
                        <label for="address">Address*</label>
                        <input type="text" id="address" value="Street Address" name="address" required>
                    </div>


                    <div class="form-block">
                        <label for="phone">Phone*</label>
                        <input type="text" id="phone" name="phone" required>
                    </div>
                    <div class="form-block">
                        <label for="pass">Password*</label>
                        <input type="text" id="pass" name="password" required>
                    </div>
                    <div class="form-block">
                        <label for="re-pass">Re password*</label>
                        <input type="text" id="re-pass" required>
                    </div>
                    <div class="form-block">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </form>
    </div> <!-- #content -->
</div> <!-- .container -->

<%--ENDCONTENT--%>
<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
