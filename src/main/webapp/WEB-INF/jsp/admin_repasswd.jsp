<%--
  Created by IntelliJ IDEA.
  User: Acer-
  Date: 2019/9/15
  Time: 14:39
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
                    <a class="dropdown-item" href="..book/book_add">增加图书</a>
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
                <a class="nav-link" href="admin_repasswd">
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
<div style="position: relative;top: 15%">
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
<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 25%">
    <div class="panel panel-primary " >
        <div class="panel-heading">
            <h3 class="panel-title" align="center">密码修改</h3>
        </div>
        <div class="panel-body">
            <form   method="post" action="admin_repasswd_do" class="form-inline"  id="repasswd" >
                <div style="text-align: center;margin:auto;width:300px;hight:500px">
                    <input type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control"  class="form-control"><br>
                    <input type="password" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control"  class="form-control"><br>
                    <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码" class="form-control"  class="form-control"><br/>
                    <em id="tishi" style="color: red"></em><br/>
                    <input type="submit" value="提交" class="btn btn-default">
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function mySubmit(flag){
        return flag;
    }
    $(document).keyup(function () {
        if($("#newPasswd").val()!=$("#reNewPasswd").val()&&$("#newPasswd").val()!=""&&$("#reNewPasswd").val()!=""&&$("#newPasswd").val().length==$("#reNewPasswd").val().length){
            $("#tishi").text("两次输入的新密码不同，请检查");
        }
        else {
            $("#tishi").text("");
        }
    })
    $("#repasswd").submit(function () {
        if($("#oldPasswd").val()==''||$("#newPasswd").val()==''||$("#reNewPasswd").val()==''){
            $("#tishi").text("请填写完毕后提交");
            return mySubmit(false);
        }
        else if($("#newPasswd").val()!=$("#reNewPasswd").val()){
            $("#tishi").text("两次输入的新密码不同，请检查");
            return mySubmit(false);
        }
    })
</script>
</body>
</html>
