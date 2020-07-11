<%--
  Created by IntelliJ IDEA.
  User: Acer-
  Date: 2019/9/12
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部读者信息</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <style>
        body{
            background-color: rgb(240,242,245);
        }
    </style>
    <script>
        $(function () {
            var admin = "${admin}";
            if(admin=="" || admin == null) {
                alert("请先登录！");
                window.location.href = "../index.jsp";
            }}
        )
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="../login/admin_main.html" style="color: mediumslateblue">图书管理系统</a>
    <div class="collapse navbar-collapse" >
        <ul class="navbar-nav mr-auto navbar-left">
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button">
                    图书管理
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="allbooks">全部图书</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="../book/book_add">增加图书</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button">
                    读者管理
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="../reader/allReaders">全部读者</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="../reader/addReader" >增加读者</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                    借还管理
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="../lend/lendlist">借还日志</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../login/admin_repasswd">
                    密码修改
                </a>
            </li>
        </ul>
        <ul class="navbar-nav navbar-right">
            <li><a class="nav-link" href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;${admin.adminId}，已登录</a></li>
            <li><a class="nav-link" href="../login/logout.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
        </ul>
    </div>
</nav>


<div style="position: relative;top: 10%">
    <c:if test="${!empty succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${error}
        </div>
    </c:if>
</div>
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            全部读者
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>读者号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>生日</th>
                <th>地址</th>
                <th>电话</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${readerlist}" var="reader">
                <tr>
                    <td><c:out value="${reader.readerId}"></c:out></td>
                    <td><c:out value="${reader.name}"></c:out></td>
                    <td><c:out value="${reader.sex}"></c:out></td>
                    <td><c:out value="${reader.birth}"></c:out></td>
                    <td><c:out value="${reader.address}"></c:out></td>
                    <td><c:out value="${reader.telcode}"></c:out></td>
                    <td><a href="editReader?readerId=<c:out value="${reader.readerId}"></c:out>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                    <td><a href="deleteReader?readerId=<c:out value="${reader.readerId}"></c:out>"><button type="button" class="btn btn-danger btn-xs">删除</button></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
