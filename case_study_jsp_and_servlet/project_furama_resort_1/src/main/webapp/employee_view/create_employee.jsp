<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 7/7/2021
  Time: 8:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
</head>
<body>
<div class="container-fluid">
    <div class="col-8 m-auto">
        <form method="post" action="/employees_view?action=create_employee">
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="validationDefault01" >Name</label>
                    <input type="text" class="form-control" id="validationDefault01" name="name"  required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="validationDefault02">Brithday</label>
                    <input type="text" class="form-control" id="validationDefault02"  name="brithday" required>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="validationDefault01">Address</label>
                    <input type="text" class="form-control" id="validationDefault07" name="address"  required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="validationDefault02">Email</label>
                    <input type="text" class="form-control" id="validationDefault08" name="email" required>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-3 mb-3">
                    <label for="validationDefault04">Position</label>
                    <select class="custom-select" id="validationDefault09" name="position" required>
                        <option selected disabled value="1">Lễ tân</option>
                        <option value="2">Phục vụ</option>
                        <option value="3">Chuyên viên</option>
                        <option value="4">Giám sát</option>
                        <option value="5">Quản lí</option>
                        <option value="6">Giám đốc</option>
                    </select>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationDefault04">Degree</label>
                    <select class="custom-select" id="validationDefault10"  name="degree" required>
                        <option selected disabled value="1">Trung cấp</option>
                        <option value="2">Cao Đẳng</option>
                        <option value="3">Đại Học</option>
                        <option value="4">Sau đại học</option>
                    </select>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationDefault04">Division</label>
                    <select class="custom-select" id="validationDefault04" name="division" required>
                        <option selected disabled value="1">Sale – Marketing</option>
                        <option value="2">Hành Chính</option>
                        <option value="3">Phục vụ</option>
                        <option value="4">Quản lý</option>
                    </select>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationDefault05">Phone</label>
                    <input type="text" class="form-control" id="validationDefault05" name="phone" required>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="validationDefault01">User Name</label>
                    <input type="text" class="form-control" id="validationDefault11" name="user_name"  required>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationDefault05">Salary</label>
                    <input type="text" class="form-control" id="validationDefault13" name="salary" required>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationDefault05">ID card</label>
                    <input type="text" class="form-control" id="validationDefault14" name="id_card" required>
<%--                    <input type="text" name="action" value="create_employee " hidden>--%>
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Submit form</button>
        </form>
    </div>
</div>
</body>
<link rel="stylesheet" href="/js/bootstrap.js">
<link rel="stylesheet" href="/js/bootstrap.bundle.js">
</html>
