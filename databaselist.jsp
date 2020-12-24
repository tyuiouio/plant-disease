<%@ page import="mei.xin.gallery.model.Pool" %>
<%@ page import="mei.xin.gallery.dao.PoolDao" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库列表</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
</head>
<body>

<%
    List<Pool> pool = PoolDao.getAllPool();
    request.getSession().setAttribute("pool", pool);
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

    <h4 style="color: green; text-align: center">${downdbtip}</h4>

    <table border="1" cellspacing="1" cellpadding="1" name="downdatabase" id="downdatabase"
           style="text-align: center; margin: 15px">
        <tr>
            <th width="130px">作物名称</th>
            <th>简介</th>
            <th width="100px">图库链接</th>
        </tr>

        <c:forEach items="${pool}" var="dbp">
            <c:if test="${dbp.did == 0}">
                <tr style="height: 36px">
                    <td style="text-align: center">
                            ${dbp.dname}
                    </td>
                    <td>
                            ${dbp.introduction}
                    </td>
                    <td style="color: #082A7E;text-align: center">
                        <a href="searchDatabaseServlet?did=${dbp.did}">查看图库</a>
                        <br/>
                        <a href="downdatabaseServlet?did=${dbp.did}" class="downdatabase">下载数据库</a>
                    </td>
                </tr>
            </c:if>
            <c:if test="${dbp.did != 0}">
                <tr>
                    <td><img src="./dblogo/${dbp.logo}" width="125px" height="125px"/><br/>
                            ${dbp.dname}</td>
                    <td>${dbp.introduction}</td>
                    <td>
                        <a href="searchDatabaseServlet?did=${dbp.did}">查看数据库</a>
                        <br/>
                        <a href="downdatabaseServlet?did=${dbp.did}" class="downdatabase">下载数据库</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</div>
</body>
</html>
