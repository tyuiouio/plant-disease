<%@ page import="mei.xin.gallery.dao.AnnouncementDao" %>
<%@ page import="mei.xin.gallery.model.Announcement" %>
<%@ page import="mei.xin.gallery.dao.CommentDao" %>
<%@ page import="java.util.List" %>
<%@ page import="mei.xin.gallery.model.Comment" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告详情页</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
    <link rel="stylesheet" href="./css/pinglun.css"/>
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


    <%
        String anidstr = request.getParameter("anid");

        if (anidstr == null) {
            request.setAttribute("commentAnnouncementTip", "参数错误！");
            request.getRequestDispatcher("commentAnnouncement.jsp?anid=0").forward(request, response);
            return;
        }

        int anid = Integer.parseInt(anidstr);

        request.setAttribute("anid", anid);
        Announcement announcement = AnnouncementDao.getAnnouncementByAnid(anid);
        request.setAttribute("announcement", announcement);
        AnnouncementDao.AnnouncementClickPlusPlus(anid);
        List<Comment> comments = CommentDao.getAllCommentsByToanid(anid);
        request.setAttribute("comments", comments);

    %>


    <%--    ${announcement.userid}=${announcement.title}=${announcement.text}=${announcement.link}=${announcement.click}=${announcement.updatetime}--%>
    <%--    <br/>--%>
    <%--    <br/>--%>
    <%--    <c:forEach items="${comments}" var="a">--%>
    <%--        ${a.userid}=${a.text}=${a.sendtime}<br/>--%>
    <%--    </c:forEach>--%>

    <%--    <form action="commentAnnouncementServlet?anid=${anid}" method="post">--%>
    <%--        内容:<textarea class="form-control" rows="3" name="content"></textarea> &lt;%&ndash; cols="30" &ndash;%&gt;--%>

    <%--        <br/> <input type="submit" value="提交">--%>
    <%--    </form>--%>
    <%--    ${commentAnnouncementTip}--%>

    <%--    <c:forEach items="${comments}" var="a">--%>
    <%--        ${a.userid}=${a.text}=${a.sendtime}<br/>--%>
    <%--    </c:forEach>--%>


    <h4 style="color: red; text-align: center">${commentAnnouncementTip}</h4>
    <div id="MBody_gonggao" style="width: 1000px;margin: 15px auto;">
        <p class="BodyTitle">公告详情页</p>
        <ul>
            <li>${announcement.title}</li>
            <p>${announcement.text}</p>
            <span>最后更新时间：${announcement.updatetime}（共${announcement.click}次点击，${fn:length(comments)}条回复</span>

            <form action="commentAnnouncementServlet?anid=${anid}" method="post" class="form-inline" style="margin-top: 20px">
                <input type="submit" value="内容发布" class="form-control" style="margin-left: 88px">
                <br/>
                <textarea class="form-control" rows="3" cols="113" name="content"
                          style="margin: 10px 88px"></textarea>

            </form>


            <div class="test" style="margin: 20px 50px">
                <div class="gitment-container gitment-comments-container">
                    <ul class="gitment-comments-list">
                        <c:forEach items="${comments}" var="c">
                            <li class="gitment-comment" style="list-style-image: none">
                                <div class="gitment-comment-main">
                                    <div class="gitment-comment-header">
                                        <a class="gitment-comment-name">
                                                <%--                                            <s:forEach items="${announcement}" var="a">--%>
                                                <%--                                                <c:if test="${a.anid==c.toanid}">${a.title}</c:if>--%>
                                                <%--                                            </s:forEach>--%>
                                        </a>
                                        <span>
                                                ${c.sendtime}
                                        </span>

                                    </div>
                                    <div class="gitment-comment-body gitment-markdown"><p>
                                            ${c.text}
                                    </p></div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

        </ul>
    </div>

</div>


</body>
</html>
