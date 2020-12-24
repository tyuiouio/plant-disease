<%@ page import="mei.xin.gallery.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="mei.xin.gallery.dao.PoolDao" %>
<%@ page import="mei.xin.gallery.model.Pool" %>
<%@ page import="mei.xin.gallery.model.Element" %>
<%@ page import="mei.xin.gallery.dao.ElementDao" %>
<%@ page import="mei.xin.gallery.dao.UserDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我上传的图片</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
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

    <h4 style="color: red; text-align: center">${mypiclisttip}</h4>

    <table border="1" cellspacing="1" cellpadding="1" name="myuploadpic" id="myuploadpic" class="table table-bordered table-hover">
        <tr>
            <th width="20%">图像</th>
            <th width="10%">所属数据库</th>
            <th width="15%">描述</th>
            <th width="10%">标签</th>
            <th width="10%">病害信息</th>
            <th width="10%">标注状态</th>
            <th width="8%">标注者</th>
            <th width="17%">操作</th>
        </tr>

        <c:forEach items="${myupelements}" var="e">
            <tr>
                <td><img src="./photodb/${e.filename}" width="150px" height="150px"/></td>
                <td>
                    <%
                        List<Pool> pool = PoolDao.getAllPool();
                        request.getSession().setAttribute("pool", pool);
                    %>
                    <s:forEach items="${pool}" var="p">
                        <c:if test="${e.did==p.did}">${p.dname}</c:if>
                    </s:forEach>
                </td>
                <td>${e.text}</td>
                <td>${e.label}</td>
                <td>${e.diseasespestsinfo}</td>
                <td>
                    <c:if test="${e.ismark==1}">已标注</c:if><c:if test="${e.ismark==0}">未标注</c:if>
                </td>
                <td>
                    <%
                        List<User> userlist = UserDao.getAllUserName();
                        request.getSession().setAttribute("userlist",userlist);
                    %>
                    <s:forEach items="${userlist}" var="u">
                        <c:if test="${e.markuserid==u.userid}">${u.username}</c:if>
                    </s:forEach>
                </td>
                <td><a href="deletepicServlet?eid=${e.eid}" class="btn btn-danger deletepic">删除图片</a></td>
            </tr>
        </c:forEach>

    </table>
</div>


</body>
</html>
