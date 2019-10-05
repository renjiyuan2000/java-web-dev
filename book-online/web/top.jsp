<%@ page import="com.bo.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    pageContext.setAttribute("user", user);
%>
<ul>
    <li>
        <a href="${pageContext.request.contextPath}/index">首页</a>
    </li>
    <li>
        <a href="#">建国70周年</a>
    </li>
    <li>
        <a href="#">实时新闻</a>
    </li>
    <li>
        <a href="#">武器介绍</a>
    </li>
    <li>
        <a href="#">高清美图</a>
    </li>
    <li>
        <a href="#">战争电影</a>
    </li>
    <li>
        <a href="#">军迷论坛</a>
    </li>
    <li>
        <a href="#">更多</a>
    </li>
</ul>

<ul>
    <%--根据user是否为空，显示不同的内容--%>
    <%
        if (user != null) {
    %>
    <li>
        <a href="${pageContext.request.contextPath}/user">
            <img src="${pageContext.request.contextPath}/images/${user.avatar}" alt="" class="avatar">
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/logout">退出</a>
    </li>
    <%
    } else {
    %>
    <a href="${pageContext.request.contextPath}/login">登录</a>
    <%
        }
    %>
</ul>