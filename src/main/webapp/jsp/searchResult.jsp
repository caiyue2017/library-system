<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 越
  Date: 2017/5/18
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检索结果</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css" media="all">
</head>
<body>
<c:forEach items="${requestScope.books}" var="book">
    ${book}
</c:forEach>
<script src="../js/layui/layui.js"></script>
<script>

</script>
</body>
</html>
