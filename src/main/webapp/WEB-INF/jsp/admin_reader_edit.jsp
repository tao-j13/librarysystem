<%--
  Created by IntelliJ IDEA.
  User: Acer-
  Date: 2019/9/12
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>编辑读者信息</title>
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
                    <a class="dropdown-item" href="allReaders">全部读者</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="reader_add" >增加读者</a>
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


<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 10%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">编辑《 ${readerInfo.name}》</h3>
        </div>
        <div class="panel-body">
            <form action="editReader_do" method="post" id="addbook" >
                <table class="table table-hover">
                    <tr>
                        <th>读者号</th>
                        <td><input type="text" class="form-control" name="readerId" id="readerId" value="${readerInfo.readerId}" readonly/></td>
                    </tr>
                    <tr>
                        <th>姓名</th>
                        <td><input type="text" class="form-control" name="name" id="name" value="${readerInfo.name}"></td>
                    </tr>
                    <tr>
                        <th>性别</th>
                        <td><input type="text" class="form-control" name="sex" id="sex" value="${readerInfo.sex}" ></td>
                    </tr>
                    <tr>
                        <th>生日</th>
                        <td><input type="text" class="form-control" name="birth" id="birth"  value="<frm:formatDate value='${readerInfo.birth}' pattern="yyyy-MM-dd"/>" ></td>
                    </tr>
                    <tr>
                        <th>地址</th>
                        <td><input type="text" class="form-control" name="address" id="address"  value="${readerInfo.address}" ></td>
                    </tr>
                    <tr>
                        <th>电话</th>
                        <td><input type="text" class="form-control" name="telcode" id="telcode"  value="${readerInfo.telcode}" ></td>
                    </tr>
                </table>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#addbook").submit(function () {
                        if($("#readerId").val()==''||$("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#telcode").val()==''){
                            alert("请填入完整读者信息！");
                            return mySubmit(false);
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>
</body>
</html>
