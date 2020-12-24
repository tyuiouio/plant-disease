<%@ page import="mei.xin.gallery.model.User" %>
<%@ page import="mei.xin.gallery.dao.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="mei.xin.gallery.model.Pool" %>
<%@ page import="mei.xin.gallery.dao.PoolDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库检索</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
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

    <form action="searchDatabaseServlet" method="post" class="form-inline"
          style="margin-left: 50px;margin-top: 15px;margin-bottom: 15px">
        <span class="form-control">请输入要检索的关键字：</span>
        <input type="text" name="search_db_key" placeholder="检索数据库" value="${search_db_key}" class="form-control"/>
        <input type="submit" value="查找数据库中的元素" class="form-control"/>
    </form>


    <%--        <c:forEach items="${elements}" var="e">--%>
    <%--            <img src="./photodb/${e.filename}" width="125px"--%>
    <%--                     height="125px">=${e.title}=${e.text}=${e.label}=${e.diseasespestsinfo}= <c:if--%>
    <%--                    test="${e.ismark==1}">已标注</c:if> <c:if test="${e.ismark==0}">未标注</c:if>=<a--%>
    <%--                    href="./photodb/${e.filename}" download="${e.eid}" class="downpic">下载图片</a></li>--%>
    <%--        </c:forEach>--%>


    <c:if test="${fn:length(elements)!=0}">
        <table class="table table-bordered table-hover">
            <tr>
                <th width="5%">ID</th>
                <th width="10%">图片</th>
                <th width="10%">标题</th>
                <th width="20%">描述</th>
                <th width="5%">标记</th>
                <th width="5%">病害</th>
                <th width="10%">标记状态</th>
                <th width="5%">标注者</th>
                <th width="10%">数据库</th>
                <th width="20%">操作</th>
            </tr>


            <c:forEach items="${elements}" var="e">
                <tr>
                    <td>
                        <p>${e.eid}</p>
                    </td>
                    <td>
                        <p><img src="./photodb/${e.filename}" width="125px" height="125px"/></p>
                    </td>
                    <td>
                        <p>${e.title}</p>
                    </td>
                    <td>
                        <p>${e.text}</p>
                    </td>
                    <td>
                        <p>${e.label}</p>
                    </td>
                    <td>
                        <p>${e.diseasespestsinfo}</p>
                    </td>
                    <td>
                        <p><c:if test="${e.ismark==1}">已标注</c:if><c:if test="${e.ismark==0}">未标注</c:if></p>
                    </td>
                    <td>
                        <p>
                            <%
                                List<User> userlist = UserDao.getAllUserName();
                                request.getSession().setAttribute("userlist", userlist);
                            %>
                            <s:forEach items="${userlist}" var="u">
                                <c:if test="${e.markuserid==u.userid}">${u.username}</c:if>
                            </s:forEach>
                        </p>
                    </td>
                    <td>
                        <p>
                            <%
                                List<Pool> pool = PoolDao.getAllPool();
                                request.getSession().setAttribute("pool", pool);
                            %>
                            <s:forEach items="${pool}" var="p">
                                <c:if test="${e.did==p.did}">${p.dname}</c:if>
                            </s:forEach>
                        </p>
                    </td>
                    <td>
                        <p>
                            <a class="btn btn-primary" href="./photodb/${e.filename}" download="${e.eid}"
                               class="downpic">下载图片</a>
                            <a class="btn btn-success" href="pdatePhotoRequestServlet?eid=${e.eid}">修改</a>
<%--                            <a class="btn btn-danger" href="">删除</a>--%>
<%--                            <a class="btn btn-info" href="">移出条幅</a>--%>
<%--                            <a class="btn btn-primary" href="">加入热销</a>--%>
<%--                            <a class="btn btn-primary" href="">加入新品</a>--%>

                        </p>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

</div>

</body>
</html>
