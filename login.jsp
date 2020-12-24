<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
    <script type="text/javascript">
        function doLogin() {
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

        function goReg() {
            window.location = "register.jsp";
        }
    </script>

    <style type="text/css">
        /** {*/
        /*    padding: 0;*/
        /*    margin: 0;*/
        /*    border: 0;*/
        /*}*/
        /*h2,*/
        /*h4 {*/
        /*    text-align: center;*/
        /*}*/

        /*h2 {*/
        /*    margin-top: 50px;*/
        /*}*/
        /*h2 {*/
        /*    margin-top: 10px;*/
        /*}*/
        /*#loginform {*/
        /*    width: 716px;*/
        /*    height: 300px;*/
        /*    margin-top: 10px;*/
        /*    margin: 0 auto;*/
        /*}*/
    </style>

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


    <%--    <h4>用户登录</h4>--%>
    <%--    <form action="loginServlet" method="post" id="loginform">--%>
    <%--        用户：<input type="text" id="username" name="username" placeholder="用户名不能为空！"/><span id="ut"--%>
    <%--                                                                                          style="color: red"></span><br/>--%>
    <%--        密码：<input type="password" id="password" name="password" placeholder="密码不能为空！"/><span id="pt"--%>
    <%--                                                                                             style="color: red"></span><br/>--%>
    <%--        <input type="button" value="登录" onclick="doLogin()"><br/>--%>
    <%--        <input type="button" value="注册" onclick="goReg()">--%>
    <%--        <input type="button" value="密码找回" onclick="goReg()"><br/>--%>
    <%--        <span style="color: red">${logintip}</span><br/>--%>
    <%--    </form>--%>


    <div style="margin-left:500px">
        ${regseccuss}
        <h2 onclick="openupdate('updateinfo')" style="margin-left: 30px">用户登录</h2><br/>
        <form action="loginServlet" method="post" id="loginform" class="form-inline" >
            <div class="form-group" style="margin: 15px auto">
                <label for="username" >用户名：</label>
                <input type="text" id="username" name="username" placeholder="用户名不能为空！" class="form-control" autofocus/><span
                    id="ut" style="color: red"></span>
            </div>
            <br/>
            <div class="form-group" style="margin: 15px auto">
                <label for="password">密码：</label>
                <input type="password" id="password" name="password" placeholder="密码不能为空！" class="form-control" style="width:188px"/><span
                    id="pt" style="color: red"></span>
            </div>
            <br/>

            <input type="button" value="登录" onclick="doLogin()" class="btn btn-default" style="width: 232px;margin-top: 15px"/><br/>
            <input type="button" value="注册" onclick="goReg()" class="btn btn-default" style="width: 105px;margin-top: 15px"/>
            <input type="button" value="密码找回" onclick="goReg()" class="btn btn-default" style="width: 105px;margin-left: 6px;margin-top: 15px"" /><br/>
            <span style="color: red">${logintip}</span><br/>

        </form>
    </div>


</div>

</body>
</html>
