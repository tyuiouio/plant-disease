<%@ page import="mei.xin.gallery.model.Announcement" %>
<%@ page import="mei.xin.gallery.dao.AnnouncementDao" %>
<%@ page import="java.util.List" %>
<%@ page import="mei.xin.gallery.dao.PoolDao" %>
<%@ page import="mei.xin.gallery.model.Pool" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Announcement> announcementList = AnnouncementDao.getAllAnnouncement();
    request.getSession().setAttribute("announcementList", announcementList);
    List<Pool> poolList = PoolDao.getAllPool();
    request.getSession().setAttribute("poolList", poolList);
%>

<html>
<head>
    <title>PDGallery</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
    <link rel="stylesheet" href="./css/gonggao.css"/>
</head>

<body>

<div class="container-fluid">
    <nav class="navbar navbar-default" role="navigation" style="margin-bottom: 3px;">
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


    <div style="margin: 0 auto;padding: 0;border: 0;">
        <img src="./pic/toppic.png" width="1334px" height="200px"/>
    </div>


</div>

<div class="div_show" style="margin: 15px 15px;">
    <ul class="topic_show">
        <h3 style="margin-top: 0"><span style="color: #000000">通知公告</span></h3>
        <c:forEach items="${announcementList}" var="anl">
            <li>
                <span style="color: #082A7E"><a href="commentAnnouncement.jsp?anid=${anl.anid}">${anl.title}</a></span>
            </li>
        </c:forEach>
    </ul>
</div>

<div class="div_show" style="margin: 15px 15px;">
    <ul class="topic_show">
        <h3 style="margin-top: 0"><span style="color: #000000">联系我们</span></h3>
        <li>
            <span style="color: #082A7E">地址：山东省潍坊市寿光市</span>
        </li>
        <li>
            <span style="color: #082A7E">邮编：262700</span>
        </li>
        <li>
            <span style="color: #082A7E">联系电话：17863607936</span>
        </li>
        <li>
            <span style="color: #082A7E">Email：demo@wfust.com</span>
        </li>
    </ul>
</div>

<div class="databasepoollist" style="position:relative; left:280px;top:-340px;background:darkseagreen;width:1068px;">
    <span style="display: block;color: #000000;background-color: #FFEB2C"></span>
    <table border="1" cellspacing="0" cellpadding="0" style="overflow: hidden">
        <tbody>
        <tr>
            <th style="text-align: center">数据库名称</th>
            <th>简介</th>
            <th style="width: 80px;text-align: center">图库链接</th>
        </tr>
        <c:forEach items="${poolList}" var="pl">
            <c:if test="${pl.did != 0}">
                <tr>
                    <td style="text-align: center"><img src="./dblogo/${pl.logo}" width="120"><br>${pl.dname}</td>
                    <td>
                            ${pl.introduction}
                    </td>
                    <td style="color: #082A7E;text-align: center">
                        <a href="searchDatabaseServlet?did=${pl.did}">查看图库</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>


</body>
</html>
