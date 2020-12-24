<%@ page import="mei.xin.gallery.model.Announcement" %>
<%@ page import="mei.xin.gallery.dao.AnnouncementDao" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    List<Announcement> announcementList = AnnouncementDao.getAllAnnouncement();
    request.setAttribute("announcementList", announcementList);

%>
<html>
<head>
    <title>公告表</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
    <link rel="stylesheet" href="./css/gonggao.css"/>
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


    <%--    <%--%>
    <%--        List<Announcement> announcement = AnnouncementDao.getAllAnnouncement();--%>
    <%--        request.getSession().setAttribute("announcement", announcement);--%>
    <%--    %>--%>


    <div id="MBody_gonggao">
        <p class="BodyTitle">服务公告</p>
        <span style="color: red">${deleteanntip}</span>
        <ul>
            <c:forEach items="${announcementList}" var="a">
                <li>${a.title}</li>
                <p>${a.text}</p>
                <span>最后更新时间：${a.updatetime}</span>
                <a href="commentAnnouncement.jsp?anid=${a.anid}" class="look">查看或评论（共${a.click}次点击）</a>
                <c:if test="${user.isadmin==1}">｜<a href="deleteAnnouncementServlet?anid=${a.anid}">删除公告</a></c:if>
            </c:forEach>
        </ul>
    </div>

</div>
</body>
</html>
