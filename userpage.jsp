<%@ page import="mei.xin.gallery.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="mei.xin.gallery.dao.PoolDao" %>
<%@ page import="mei.xin.gallery.model.Pool" %>
<%@ page import="mei.xin.gallery.model.Element" %>
<%@ page import="mei.xin.gallery.dao.ElementDao" %>
<%@ page import="mei.xin.gallery.model.Comment" %>
<%@ page import="mei.xin.gallery.dao.CommentDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>个人中心</title>
    <script type="text/javascript">
        function openupdate(obj) {
            var c = document.getElementById(obj.toString());
            if (c.display == 'none') {
                c.display = 'block';
            } else {
                c.display = 'none';
            }
        }
    </script>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
    <style type="text/css">
        #updateinfo {
            display: block;
        }
    </style>
</head>
<body>

<%
    User usertemp = (User) request.getSession().getAttribute("user");
    if (usertemp == null) {
        request.setAttribute("logintip", "请先登录！");
        RequestDispatcher dispatch = request.getRequestDispatcher("/login.jsp");
        dispatch.forward(request, response);
    } else {
        request.setAttribute("sexcheck", usertemp.getSex());
    }

    List<Element> myupelements = ElementDao.GetMyUploadPic(usertemp.getUserid());
    request.getSession().setAttribute("myupelements", myupelements);

    List<Comment> mycomment = CommentDao.getCommentsByUserid(usertemp.getUserid());
    request.getSession().setAttribute("mycomment", mycomment);


%>


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

    <div style="margin-left:500px">
        <h2 onclick="openupdate('updateinfo')">修改个人信息</h2><br/>
        <form action="updateUserInfoServlet" method="post" id="updateinfo" class="form-inline">
            <div class="form-group">
                <label for="username">用户名：</label>
                <input type="text" id="username" name="username" placeholder="${user.username}" class="form-control"/>
            </div>
            <br/>
            <div class="form-group">
                <label for="password">请输入原密码：</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password"/><br/>
            </div>
            <br/>
            <div class="form-group">
                <label for="password2">请输入新密码：</label>
                <input type="password" id="password2" name="password2" class="form-control" placeholder="请输入新密码">
            </div>
            <br/>
            <div class="form-group">
                <label for="email">Email：</label>
                <input type="email" id="email" name="email" placeholder="${user.email}" class="form-control"/><br/>
            </div>
            <br/>
            <div class="form-group">
                <label for="tel">Tel：</label>
                <input type="tel" id="tel" name="tel" placeholder="${user.tel}" class="form-control"/><br/>
            </div>
            <br/>
            <div class="radio">
                <label>
                    <input type="radio" name="sex" value="男"
                           <c:if test="${sexcheck == \"男\"}">checked</c:if> />男
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="sex" value="女"
                           <c:if test="${sexcheck == \"女\"}">checked</c:if> />女
                </label>
            </div>
            <br/>
            <input type="submit" value="修改" class="btn btn-default"/>
            <span id="pt" style="color: red">${updateinfotip}</span>
        </form>
    </div>
</div>
<%--    <form action="updateUserInfoServlet" method="post" id="updateinfobbbbbb">--%>
<%--        用户名：<input type="text" id="usernamebbbbbb" name="username" placeholder="${user.username}"/><br/>--%>
<%--        请输入原密码：<input type="password" id="password" name="password"/><br/>--%>
<%--        请输入新密码：<input type="password" id="password2" name="password2"/><br/>--%>
<%--        Email:<input type="email" id="email" name="email" placeholder="${user.email}"/><br/>--%>
<%--        Tel:<input type="tel" id="tel" name="tel" placeholder="${user.tel}"/><br/>--%>
<%--        <input type="radio" name="sex" value="男"--%>
<%--               <c:if test="${sexcheck == \"男\"}">checked</c:if> />男--%>
<%--        <input type="radio" name="sex" value="女"--%>
<%--               <c:if test="${sexcheck == \"女\"}">checked</c:if> />女<br/>--%>
<%--        <input type="submit" value="修改"/>--%>
<%--        <span id="pt" style="color: red">${updateinfotip}</span>--%>
<%--    </form>--%>


<%--<table border="1" cellspacing="1" cellpadding="1" name="myuploadpic" id="myuploadpic">--%>
<%--    <tr>--%>
<%--        <th>图像</th>--%>
<%--        <th>所属数据库ID</th>--%>
<%--        <th>描述</th>--%>
<%--        <th>标签</th>--%>
<%--        <th>病害信息</th>--%>
<%--        <th>已标记处理</th>--%>
<%--        <th>处理者ID</th>--%>
<%--        <th>删除</th>--%>
<%--    </tr>--%>

<%--    <c:forEach items="${myupelements}" var="mue">--%>
<%--        <tr>--%>
<%--            <td><img src="./photodb/${mue.filename}" width="50px" height="50px"/></td>--%>
<%--            <td>${mue.did}</td>--%>
<%--            <td>${mue.text}</td>--%>
<%--            <td>${mue.label}</td>--%>
<%--            <td>${mue.diseasespestsinfo}</td>--%>
<%--            <td>${mue.ismark}</td>--%>
<%--            <td>${mue.markuserid}</td>--%>
<%--            <td><a href="deletepicServlet?eid=${mue.eid}" class="deletepic">删除图片</a></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>

<%--</table>--%>
<%--${mypiclisttip}--%>

<%--<hr/>--%>
<%--我的评论--%>
<%--<ul>--%>
<%--    <c:forEach items="${mycomment}" var="mc">--%>
<%--        <li>${mc.toanid}=${mc.text}=${mc.sendtime}--%>
<%--            <a href="commentAnnouncement.jsp?anid=${mc.toanid}">查看</a>--%>
<%--            <a href="deleteCommentServlet?coid=${mc.coid}">删除</a>--%>
<%--        </li>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>
<%--${mycommenttips}--%>
<%--<hr/>--%>

</body>
</html>
