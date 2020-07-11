<%--
  Created by IntelliJ IDEA.
  User: Acer-
  Date: 2019/9/11
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆首页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<br><br>
<h2 align="center">图书管理系统</h2>
<p style="background-color: red;width:200px;margin: auto;text-align: center"></p>
<div class="panel panel-default" id="login" style="width:350px;height:350px;margin:60px auto;text-align: center;">
    <div class="panel-heading" style="background-color: rebeccapurple">
        <h3 class="panel-title">请登录</h3>
    </div>

    <div class="panel-body">
        <div class="form-group">
            <label for="id">用户名</label>
            <input type="text" class="form-control" id="id" placeholder="请输入用户名"/>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="text" class="form-control" id="password" placeholder="请输入密码"/>
        </div>
        <div class="checkbox text-left">
            <label><input type="checkbox" id="rememeber"/>记住密码</label>
        </div>
        <button id="loginButton" class="btn btn-primary btn-block">登录</button>
    </div>
</div>
<script>
    $("#id").keyup(
        function () {
            if(isNaN($("#id").val())){
               $("p").text("用户名只能为数字！");
            }else {
                $("p").text("");
            }
        }
    )
    $("#loginButton").click(
        function () {
            var username = $("#id").val();
            var password = $("#password").val();
            if(username== "" || password == "")
                $("p").text("账户或密码不能为空！");
            else{
                $.ajax({
                    type:"post",
                    url:"login/loginCheck",
                    data:{
                        id:username,
                        password:password
                    },
                    dataType:"json",
                    success:function (data) {
                        if (data.stateCode.trim() == "0") {
                            $("p").text("用户名或密码错误!");
                        } else if (data.stateCode.trim() == "1") {
                            $("p").text("管理员登陆成功，跳转中..");
                            window.location.href = "login/admin_main.html";
                        } else if (data.stateCode.trim() == "2") {
                            $("p").text("读者登陆成功，跳转中..");
                            window.location.href="login/reader_main.html";
                        }
                    }
                })
            }
        }
    )
</script>
</body>
</html>
