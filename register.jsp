<%@ page import="mei.xin.gallery.model.User" %>
<%@ page import="mei.xin.gallery.dao.UserDao" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
    <script type="text/javascript">
        function doRegister() {

            var username = document.getElementById("username");
            var password = document.getElementById("password");
            if (username.value == "") {
                document.getElementById("ut").innerText = "用户名不能为空！";
                document.getElementById("ut").focus();
                return false;
            }
            if (password.value == "") {
                document.getElementById("pt").innerText = "密码不能为空！";
                document.getElementById("pt").focus();
                return false;
            }
            document.forms[0].submit();
        }

        function goLog() {
            window.location = "login.jsp";
        }
    </script>
</head>
<body>


<div class="container-fluid">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">寿光农业病虫害研究图库</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li><a href="announcement.jsp">服务公告</a></li>
                    <li><a href="databaselist.jsp">数据库浏览</a></li>
                    <li><a href="searchdata.jsp">数据检索</a></li>
                    <li><a href="searchdatabase.jsp">查找数据库</a></li>
                    <c:if test="${user == null}">
                        <li><a href="login.jsp">登录</a></li>
                        <li><a href="register.jsp">注册</a></li>
                    </c:if>
                    <c:if test="${user != null}">
                        <li><a href="userpage.jsp"><c:out value="${user.username}"/>的个人中心</a></li>
                        <li><a href="myuploadpic.jsp">我上传的图片</a></li>
                        <li><a href="mark.jsp">数据标注</a></li>
                        <li><a href="mycomment.jsp">我的评论</a></li>
                        <li><a href="doLogoutServlet">退出登录</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>


    <form action="registerServlet" method="post" style="margin-left: 500px">

        用户：<input type="text" id="username" name="username" placeholder="用户名不能为空！"/><span id="ut"
                                                                                          style="color: red"></span><br/><br/>
        密码：<input type="password" id="password" name="password" placeholder="密码不能为空！"/><span id="pt"
                                                                                             style="color: red"></span><br/><br/>
        确认密码：<input type="password" id="password2" name="password2" placeholder="两次密码需一致！"/><span id="pt2"
                                                                                                  style="color: red"></span><br/><br/>
        Email:<input type="email" id="email" name="email" placeholder="请输入正确格式的邮箱！"/><span id="emt"
                                                                                           style="color: red"></span><br/><br/>
        Tel:<input type="tel" id="tel" name="tel" placeholder="请输入正确格式的手机号！"/><span id="telt"
                                                                                    style="color: red"></span><br/><br/>

        <input type="radio" name="sex" value="男" checked/>男
        <input type="radio" name="sex" value="女"/>女

        <br/><br/>

        <input type="checkbox" name="usertype" value="农户" checked/>农户
        <input type="checkbox" name="usertype" value="农业专家"/>农业专家
        <input type="checkbox" name="usertype" value="研究员"/>研究员
        <br/><br/>
        <input type="button" value="注册" onclick="doRegister()" style="margin-left: 20px">
        <input type="button" value="登录" onclick="goLog()" style="margin-left: 40px"><br/>
        <span style="color: red">${registertip}</span><br/>
    </form>


</div>
</body>
</html>
