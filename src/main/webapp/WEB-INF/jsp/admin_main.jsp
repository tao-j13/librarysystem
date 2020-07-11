<%--
  Created by IntelliJ IDEA.
  User: Acer-
  Date: 2019/9/12
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理主页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <style>
        body{
            margin: 0;
            padding: 0;
            overflow: visible;
        }
        #newsa{
            width:500px;
            height: 200px;
            position: fixed;
            left: 35%;
            top:30%;
        }
    </style>
    <script>
        $(function () {
            var admin = "${admin}";
            if(admin=="" || admin == null) {
                alert("请先登录！");
                window.location.href = "../index.jsp";
            }else {
                $("#myModal").modal({
                    show: true
                })
            }
        })
    </script>
</head>
<body background="${pageContext.request.contextPath}/img/281289-106.jpg">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="../login/admin_main.html" style="color: mediumslateblue">图书管理系统</a>
        <div class="collapse navbar-collapse" >
            <ul class="navbar-nav mr-auto navbar-left">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button">
                        图书管理
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../book/allbooks">全部图书</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../book/book_add">增加图书</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button">
                        读者管理
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../reader/allReader">全部读者</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="reader_add.html" >增加读者</a>
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
                    <a class="nav-link" href="admin_repasswd">
                        密码修改
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav navbar-right">
                <li><a class="nav-link" href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;${admin.adminId}，已登录</a></li>
                <li><a class="nav-link" href="logout.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
            </ul>
        </div>
</nav>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    温馨提示
                </h4>
            </div>
            <div class="modal-body">
                使用结束后请安全退出。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">知道了
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
