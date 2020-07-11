<%--
  Created by IntelliJ IDEA.
  User: Acer-
  Date: 2019/9/12
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>添加图书</title>
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
                    <a class="dropdown-item" href="book_add">增加图书</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button">
                    读者管理
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="../read/allReaders">全部读者</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="../read/addReader" >增加读者</a>
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
            <h3 class="panel-title">添加图书</h3>
        </div>
        <div class="panel-body">
            <form action="book_add_do" method="post" id="addbook" >
                <table class="table table-hover">
                    <tr>
                        <th>书名</th>
                        <td><input type="text" class="form-control" name="name" id="name" placeholder="请输入书名"></td>
                    </tr>
                    <tr>
                        <th>作者</th>
                        <td><input type="text" class="form-control" name="author" id="author" placeholder="请输入作者" ></td>
                    </tr>
                    <tr>
                        <th>出版社</th>
                        <td><input type="text" class="form-control" name="publish" id="publish"  placeholder="请输入出版社" ></td>
                    </tr>
                    <tr>
                        <th>isbn</th>
                        <td><input type="text" class="form-control" name="isbn" id="isbn"  placeholder="请输入isbn" ></td>
                    </tr>
                    <tr>
                        <th>简介</th>
                        <td><input type="text" class="form-control" name="introduction" id="introduction"  placeholder="请输入简介" ></td>
                    </tr>
                    <tr>
                        <th>语言</th>
                        <td><input type="text" class="form-control" name="language" id="language" placeholder="请输入语言" ></td>
                    </tr>
                    <tr>
                        <th>价格</th>
                        <td><input type="text" class="form-control" name="price"  id="price" placeholder="请输入价格"></td>
                    </tr>
                    <tr>
                        <th>出版日期</th>
                        <td><input type="text" class="form-control" name="pubdate" id="pubdate" placeholder="请输入出版日期"/></td>
                    </tr>
                    <tr>
                        <th>分类号</th>
                        <td><input type="text" class="form-control" name="classId" id="classId" placeholder="请输入分类号"></td>
                    </tr>
                    <tr>
                        <th>书架号</th>
                        <td><input type="text" class="form-control" name="pressmark" id="pressmark" placeholder="请输入书架号"></td>
                    </tr>
                    <tr>
                        <th>状态</th>
                        <td>
                            <div class="form-group">
                                <select class="form-control" id="state"  name="state">
                                    <option value="0">借去</option>
                                    <option value="1">在馆</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-middle">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#addbook").submit(function () {
                        if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#isbn").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''||$("#pubdate").val()==''||$("#classId").val()==''||$("#pressmark").val()==''||$("#state").val()==''){
                            alert("请填入完整图书信息！");
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
