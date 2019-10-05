<%@ page import="java.util.List" %>
<%@ page import="com.bo.entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>首页</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
  <style type="text/css">
    h2, h3 {
      color: rgb(73, 73, 73);
    }
    #search {
      height: 80px;
      background-color:yellow;
      display: flex;
      align-items: center;
      padding-left: 6%;
      margin-bottom: 20px;
    }
    .search-input {
      flex: 0 0 40%;
      height: 35px;
      background-color: #fff;
      border: none;
      border-radius: 3px;
      margin-left: 50px;
    }
    .search-btn {
      width: 35px;
      height: 35px;
      background-color: rgb(155, 154, 143);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .search-btn img {
      width: 50%;
      height: 50%;
    }
    .card {
      height: 180px;
      margin: 20px 5px 20px 5px;
    }
    .card img {
      width: 100%;
      height: 90%;
    }
    .card p {
      font-size: 13px;
      color: #9b9b9b;
    }
    .col-4 img {
      margin: 10px 5px 20px 5px;
      width: 80%;
    }
    hr {
      width: 90%;
      color: #eee;
      margin-top: 10px;
    }


    }
  </style>
</head>
<body>
<%
  List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>
<%--使用jsp的include动作，将top.jsp页面包含进来，这个顶部导航可以给各个页面共享--%>
<div id="top">
  <jsp:include page="top.jsp"/>
</div>

<%--搜索区--%>
<div id="search">
  <h2>搜索</h2>
  <input type="text" placeholder="建国70周年阅兵" class="search-input">
  <div class="search-btn">
    <img src="images/search.png" alt="">
  </div>
</div>

<%--主体内容区--%>
<div class="container">
  <div class="row">
    <%--左侧2/3主体部分--%>
    <div class="col-6">
      <h3>战争书籍推荐</h3>
      <hr>
      <div class="row">
        <%--遍历图书数据集合，将每个图书对象放入页面对象--%>
        <%
          for (Book book : bookList) {
            pageContext.setAttribute("book", book);
        %>
        <%--引用col-2表示每行显示5本，再追加card细节样式--%>
        <div class="col-6 card">
          <%--点击每本图书封面图，地址栏跳转为/detail/id,进入图书详情Servlet--%>
          <a href="${pageContext.request.contextPath}/detail/${book.id}">
            <img src="images/${book.cover}" alt="">
          </a>
          <p style="color: rgb(51, 119, 178)">${book.name}</p>
          <p>${book.author}</p>
        </div>
        <%
          }
        %>
      </div>
    </div>
    <div class="col-4">
      <h3>快讯</h3>
      <hr>

      <a href="${pageContext.request.contextPath}"style="color: red"> >新中国70周年阅兵 </a>
      <hr>

      <a href="${pageContext.request.contextPath}"style="color: red"> >阅兵仪式配乐 </a> <hr>
      <a href="${pageContext.request.contextPath}"style="color: red"> >美特朗普意欲创立国营媒体与纽约时报对敌 </a>
      <hr>
      <a href="${pageContext.request.contextPath}"style="color: red"> >印度国父甘地骨灰被偷</a> <hr>
      <a href="${pageContext.request.contextPath}"style="color: red"> >印度击落自家直升机 </a> <hr>
      <a href="${pageContext.request.contextPath}"style="color: red"> >印度新隐身护卫舰船壳下水 </a> <hr>
      <a href="${pageContext.request.contextPath}"style="color: red"> >中国东风-41导弹引起美国注意 </a> <hr>
      <a href="${pageContext.request.contextPath}"style="color: red"> > 中俄关系</a><hr>
      <h4>辱法警告</h4>
      <img src="images/辱法.jpg" width=100% height=100% />
    </div>
  </div>

  <footer>
    <ul>
      <li>@2015-2019</li>
      <li>niit.edu.cn,</li>
      <li>all rights reserved</li>
      <li>南工院计算机学院</li>
    </ul>
    <ul>
      <li>联系我们</li>
      <li>帮助中心</li>
      <li>法律声明</li>
      <li>移动合作</li>
    </ul>
  </footer>
</div>
</body>
</html>