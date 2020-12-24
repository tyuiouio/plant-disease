<%@ page import="mei.xin.gallery.model.Element" %>
<%@ page import="java.util.List" %>
<%@ page import="mei.xin.gallery.dao.ElementDao" %>
<%@ page import="mei.xin.gallery.model.Pool" %>
<%@ page import="mei.xin.gallery.dao.PoolDao" %>
<%@ page import="mei.xin.gallery.dao.UserDao" %>
<%@ page import="mei.xin.gallery.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改图片信息</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
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

    <div style="margin-left: 450px">
        <span style="color: red">${updatephotoinfotip}</span><br/>
        <img src="./photodb/${updateelement.filename}" width="300px" height="300px"/>
        <form action="updatePhotoInfoServlet?eid=${updateelement.eid}" method="post" class="form-inline">

            <div class="form-group">
                <label for="title111">标题：</label>
                <input type="text" id="title111" name="title" autofocus placeholder="原标题为${updateelement.title}"
                       class="form-control" value="${updateelement.title}"/>
            </div>

            <br/>

            <div class="form-group">
                <label for="text">描述：</label>
                <input type="text" id="text" name="text" placeholder="原描述为${updateelement.text}" class="form-control"
                       value="${updateelement.text}"/>
            </div>

            <br/>

            <div class="form-group">
                <label for="label">标记：</label>
                <input type="text" id="label" name="label" placeholder="原标记为${updateelement.label}" class="form-control"
                       value="${updateelement.label}"/>
            </div>

            <br/>

            <div class="form-group">
                <label for="diseasespestsinfo">病害：</label>
                <input type="text" id="diseasespestsinfo" name="diseasespestsinfo"
                       placeholder="原病害为${updateelement.diseasespestsinfo}" class="form-control"
                       value="${updateelement.diseasespestsinfo}"/>
            </div>

            <br/>

            <%
                List<User> userlist = UserDao.getAllUserName();
                request.getSession().setAttribute("userlist", userlist);
            %>

            <div class="form-group">
                <label for="markuserid">标注者ID：</label>
                <input type="text" id="markuserid" name="markuserid" readonly unselectable="on" class="form-control"
                       value="<s:forEach items="${userlist}" var="u"><c:if test="${updateelement.markuserid==u.userid}">${u.username}</c:if></s:forEach>"/>
            </div>

            <br/>


            <%
                List<Pool> pool = PoolDao.getAllPool();
                request.getSession().setAttribute("pool", pool);
            %>
            <div class="form-group">
                <label for="did">数据库：</label>
                <select class="select" name="did" id="did" style="width: 150px">
                    <c:forEach items="${pool}" var="p">
                        <option value="${p.did}"
                                <c:if test="${p.did == updateelement.did}">selected="selected"</c:if>>${p.dname}</option>
                    </c:forEach>
                </select>
            </div>

            <br/>

            <input type="submit" value="修改"/>
        </form>
    </div>

</div>
</body>
</html>
