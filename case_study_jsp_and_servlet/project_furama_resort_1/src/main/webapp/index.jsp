<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 7/6/2021
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link rel="stylesheet" href="/css/bootstrap.css" type="text/css">

    <title>Hello, world!</title>
</head>
<body>
<div class="jumbotron " style="margin-bottom:0;height: 100px">

    <img class="float-left p-1" src="data:image/jpeg;base64,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" height="60px" width="70">
    <p class="float-right">Resize this responsive page to see the effect!</p>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light pl-5 pr-5">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Employee <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Customer <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Sevice <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Contact <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="container-fluid ">
    <div class="row" style="height: 600px">
        <div class="col-2 bg-danger text-center ">
            <p>
                <a href="#">Item one</a>
            </p>
            <p>
                <a href="#">Item two</a>
            </p>
            <p>
                <a href="#">Item three</a>
            </p>


        </div>
        <div class="col-10 badge-dark">
            <p>body</p>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-12 bg-success" style="height: 50px">
            <p class="text-center p-3">resortfurama.com</p>
        </div>
    </div>
</div>
<link rel="stylesheet" href="/js/bootstrap.js">
<link rel="stylesheet" href="/js/bootstrap.bundle.js">

</body>
</html>
