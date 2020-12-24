<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <script src="./js/index.js"></script>
    <link href="./css/index.css" rel="stylesheet" type="text/css">
    <link href="./css/top.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="container">
    <div id="menu">
        <ul>
            <li><a href="${path}/login.jsp?loginaction=checklogin">登录</a></li>
            <li class="menuDiv"></li>
            <li><a href="${path}/login.jsp?loginaction=checklogin">注册</a></li>
            <c:if test="${user!= null}">
                <li class="menuDiv"></li>
                <li><a href="${path}/Login.do?loginaction=logout"><c:out value="${username}"/></a></li>
            </c:if>
        </ul>
    </div>

    <div id="HBanner">
    </div>
    <div id="Header">
        <table border="0">
            <tbody>
            <tr align="center">
                <td align="center" class="CurrentPage"><a href="http://www.icgroupcas.cn/website_bchtk/index.html">网站首页</a></td>
                <td width="2"><img src="./pic/xian.gif" width="1" height="20"></td>
                <td align="center"><a href="http://www.icgroupcas.cn/website_bchtk/gonggao.html">服务公告</a></td>
                <td width="2"><img src="./pic/xian.gif" width="1" height="20"></td>
                <td align="center"><a href="http://www.icgroupcas.cn/website_bchtk/chazhao.aspx">查找数据库</a></td>
                <td width="2"><img src="./pic/xian.gif" width="1" height="20"></td>
                <td align="center"><a href="http://www.icgroupcas.cn/website_bchtk/jiansuo.aspx">数据检索</a></td>
                <td width="2"><img src="./pic/xian.gif" width="1" height="20"></td>
                <td align="center"><a href="http://www.icgroupcas.cn/website_bchtk/fuwu.html">数据服务</a></td>
                <td width="2"><img src="./pic/xian.gif" width="1" height="20"></td>
                <td align="center"><a href="http://www.icgroupcas.cn/website_bchtk/anli.html">服务案例</a></td>
                <td width="2"><img src="./pic/xian.gif" width="1" height="20"></td>
                <td align="center"><a href="http://www.icgroupcas.cn/website_bchtk/zhinan.html">使用指南</a></td>
                <td width="2"><img src="./pic/xian.gif" width="1" height="20"></td>
                <td align="center"><a href="http://www.icgroupcas.cn/website_bchtk/guanyu.html">关于本库</a></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>

