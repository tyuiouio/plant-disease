<%@ page import="java.util.List" %>
<%@ page import="mei.xin.gallery.dao.PoolDao" %>
<%@ page import="mei.xin.gallery.dao.ElementDao" %>
<%@ page import="mei.xin.gallery.dao.CommentDao" %>
<%@ page import="mei.xin.gallery.model.*" %>
<%@ page import="mei.xin.gallery.dao.AnnouncementDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>我的评论</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
    <link rel="stylesheet" href="./css/pinglun.css"/>
</head>
<body>


<%
    User usertemp = (User) request.getSession().getAttribute("user");
    if (usertemp == null) {
        request.setAttribute("logintip", "请先登录！");
        RequestDispatcher dispatch = request.getRequestDispatcher("/login.jsp");
        dispatch.forward(request, response);
        return;
    }

    List<Comment> mycomment = CommentDao.getCommentsByUserid(usertemp.getUserid());
    request.getSession().setAttribute("mycomment", mycomment);

    List<Announcement> announcement = AnnouncementDao.getAllAnnouncement();
    request.setAttribute("announcement", announcement);


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

    <h4 style="color: red; text-align: center">${mycommenttips}</h4>

    <div class="test">
        <div class="gitment-container gitment-comments-container">
            <ul class="gitment-comments-list">
                <c:forEach items="${mycomment}" var="mc">
                    <li class="gitment-comment">
                        <div class="gitment-comment-main">
                            <div class="gitment-comment-header">
                                <a class="gitment-comment-name">
                                    <s:forEach items="${announcement}" var="a">
                                        <c:if test="${a.anid==mc.toanid}">${a.title}</c:if>
                                    </s:forEach>
                                </a>
                                <span>
                                        ${mc.sendtime}
                                </span>

                                <div class="gitment-comment-like-btn">
                                    <a href="commentAnnouncement.jsp?anid=${mc.toanid}">查看公告详情</a> | <a
                                        href="deleteCommentServlet?coid=${mc.coid}">删除评论</a>
                                </div>
                            </div>
                            <div class="gitment-comment-body gitment-markdown"><p>
                                    ${mc.text}
                            </p></div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>


</body>
</html>
