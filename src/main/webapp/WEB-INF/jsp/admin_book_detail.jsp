<%--
  Created by IntelliJ IDEA.
  User: Acer-
  Date: 2019/9/12
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>全部图书信息</title>
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
<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 10%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">《 ${detail.name}》</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="15%">书名</th>
                    <td>${detail.name}</td>
                </tr>
                <tr>
                    <th>作者</th>
                    <td>${detail.author}</td>
                </tr>
                <tr>
                    <th>出版社</th>
                    <td>${detail.publish}</td>
                </tr>
                <tr>
                    <th>ISBN</th>
                    <td>${detail.isbn}</td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td>${detail.introduction}</td>
                </tr>
                <tr>
                    <th>语言</th>
                    <td>${detail.language}</td>
                </tr>
                <tr>
                    <th>价格</th>
                    <td>${detail.price}</td>
                </tr>
                <tr>
                    <th>出版日期</th>
                    <td><frm:formatDate value="${detail.pubdate}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr>
                    <th>分类号</th>
                    <td>${detail.classId}</td>
                </tr>
                <tr>
                    <th>书架号</th>
                    <td>${detail.pressmark}</td>
                </tr>
                <tr>
                    <th>状态</th>
                    <c:if test="${detail.state==1}">
                        <td>在馆</td>
                    </c:if>
                    <c:if test="${detail.state==0}">
                        <td>借出</td>
                    </c:if>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

<body>

</body>
</html>
