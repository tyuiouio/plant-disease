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
    <title>数据标注</title>
    <link rel="stylesheet" href="./css/bootstrap.css"/>
</head>
<body>

<%
    List<Element> elements = null;

    String ismarkstr = request.getParameter("ismark");
    String pooldid = request.getParameter("pooldid");

    if (ismarkstr == null) {
        elements = ElementDao.getAllPic();
        request.setAttribute("activetag",-1);
    } else {
        if (ismarkstr.equals("0")) {
            elements = ElementDao.getIsMark(0);
            request.setAttribute("activetag",0);
        }
        if (ismarkstr.equals("1")) {
            elements = ElementDao.getIsMark(1);
            request.setAttribute("activetag",1);
        }
        request.setAttribute("ismark", ismarkstr);
    }

    if (pooldid != null) {
        elements = ElementDao.getByDid(Integer.parseInt(pooldid));
    }
    request.setAttribute("elements", elements);
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

    <form class="form-inline" action="uploadPhotoServlet?$did=" method="POST" id="uploadpphoto"
          enctype="multipart/form-data">
        <input class="form-control" type="file" name="file" id="file" style="width: 260px"/>
        <input class="btn btn-warning" type="submit" name="submit" value="上传图片"/>
        ${uploadtip}
    </form>
</div>

<%
    List<Pool> pool = PoolDao.getAllPool();
    request.getSession().setAttribute("pool", pool);
%>
请选择作物种类：
<select class="select" name="poolselect" id="poolselect" style="width: 150px"
        onchange="window.location.href='?pooldid='+this.value">
    <c:forEach items="${pool}" var="p">
        <option value="${p.did}" <c:if test="${p.did == 0}">selected="selected"</c:if>>${p.dname}</option>
    </c:forEach>
</select>

<br>



<ul role="tablist" class="nav nav-tabs">
    <li <c:if test="${activetag == -1}">class="active"</c:if> role="presentation"><a href="mark.jsp">全部</a></li>
    <li <c:if test="${activetag == 0}">class="active"</c:if> role="presentation"><a href="mark.jsp?ismark=0">未标注</a></li>
    <li <c:if test="${activetag == 1}">class="active"</c:if> role="presentation"><a href="mark.jsp?ismark=1">已标注</a></li>
</ul>
<br>

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
                    <s:forEach items="${pool}" var="p">
                        <c:if test="${e.did==p.did}">${p.dname}</c:if>
                    </s:forEach>
                </p>
            </td>


            <td>
                <p>
<%--                    <a class="btn btn-info" href="updatePhotoInfoServlet?update=1&eid=${e.eid}&title=${e.title}">标题</a>--%>
<%--                    <a class="btn btn-primary" href="updatePhotoInfoServlet?update=2&eid=${e.eid}&text=${e.text}">描述</a>--%>
<%--                    <a class="btn btn-primary" href="updatePhotoInfoServlet?update=3&eid=${e.eid}&label=${e.label}">标记</a>--%>
<%--                    <a class="btn btn-success" href="updatePhotoInfoServlet?update=3&eid=${e.eid}&diseasespestsinfo=${e.diseasespestsinfo}">病害</a>--%>
<%--                    <a class="btn btn-danger" href="">数据库</a>--%>
                    <a class="btn btn-info" href="pdatePhotoRequestServlet?eid=${e.eid}">标题</a>
                    <a class="btn btn-primary" href="pdatePhotoRequestServlet?eid=${e.eid}">描述</a>
                    <a class="btn btn-primary" href="pdatePhotoRequestServlet?eid=${e.eid}">标记</a>
                    <a class="btn btn-success" href="pdatePhotoRequestServlet?eid=${e.eid}">病害</a>
                    <a class="btn btn-danger" href="pdatePhotoRequestServlet?eid=${e.eid}">数据库</a>
                    <a class="btn btn-primary" href="./photodb/${e.filename}" download="${e.eid}" class="downpic">下载图片</a>
                </p>
            </td>
        </tr>
    </c:forEach>
</table>

<br>
<div style='text-align:center;'>
    <a class='btn btn-info' disabled>首页</a>
    <a class='btn btn-info' disabled>上一页</a>
    <h3 style='display:inline;'>[1/1]</h3>
    <h3 style='display:inline;'>[1]</h3>
    <a class='btn btn-info' href="mark.jsp?ismark=${ismark}">下一页</a>
    <a class='btn btn-info' href="mark.jsp?ismark=${ismark}">尾页</a>
    <input type='text' class='form-control' style='display:inline;width:60px;' value=''/>
    <a class='btn btn-info' href='javascript:void(0);'
       onclick='location.href="mark.jsp?pageNumber=1"+(this.previousSibling.value)+"&ismark=${ismark}"'>GO</a>
</div>

</div>

</body>
</html>
