<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 6/28/2021
  Time: 4:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name Product: </td>
        <td>${requestScope["product"].getNameProduct()}</td>
    </tr>
    <tr>
        <td>Brand: </td>
        <td>${requestScope["product"].getBrandProduct()}</td>
    </tr>
    <tr>
        <td>Address: </td>
        <td>${requestScope["product"].getPrice()}</td>
    </tr>
</table>
</body>
</html>
