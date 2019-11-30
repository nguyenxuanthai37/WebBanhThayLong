<%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/27/2019
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TTKH</title>
</head>
<body>
<%if (request.getAttribute("success") != null) {%>
<%=request.getAttribute("name")%>
<%}%>

</body>
</html>
