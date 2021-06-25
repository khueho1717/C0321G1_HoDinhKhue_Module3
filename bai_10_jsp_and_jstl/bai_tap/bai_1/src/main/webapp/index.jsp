<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 6/25/2021
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table {
            border-collapse: collapse;
            width: 70%;
            border: 1px solid #ddd;
            margin: 0 auto;

        }

        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        img {
            width: 100px;
            height: 100px;
        }
    </style>
</head>
<body>


<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Hình ảnh</th>
    </tr>

    <c:forEach var="item" items="${customerList}">
      <tr>
        <td>${item.getName()}</td>
        <td>${item.getBithDay()}</td>
        <td>${item.getAddress()}</td>
        <td><img src="${item.getImages()}"></td>
      </tr>
    </c:forEach>

</table>
</body>
</html>
