<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据检索</title>
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


    <form action="searchDataServlet" method="post" class="form-inline"
          style="margin-left: 50px;margin-top: 15px;margin-bottom: 15px">
        <span class="form-control">请输入关键字：</span>
        <input type="text" name="search_key" placeholder="查找资讯" value="${search_key}" class="form-control"/>
        <input type="submit" value="搜索" class="form-control"/>
    </form>


    <%--    <%--%>
    <%--        System.out.println(request.getSession().getAttribute("announcement")+"=s");--%>
    <%--        System.out.println(request.getAttribute("announcement")+"=rq");--%>
    <%--    %>--%>

    <%--    <c:if test="${fn:length(announcement)<1 || announcement == null}">无符合条件的结果！</c:if>--%>
    <c:if test="${announcement != null}">
        <c:if test="${fn:length(announcement)>0}">
            <div id="MBody_gonggao">
                <p class="BodyTitle" style="background-color: #3FA33F">搜索结果</p>
                <ul>
                    <c:forEach items="${announcement}" var="a">
                        <li>${a.title}</li>
                        <p>${a.text}</p>
                        <span>最后更新时间：${a.updatetime}</span>
                        <a href="commentAnnouncement.jsp?anid=${a.anid}" class="look">查看或评论（共${a.click}次点击）</a>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </c:if>
</div>

</body>
</html>
