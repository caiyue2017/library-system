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
    <title>书籍检索</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css" media="all">
</head>
<body>
<form class="layui-form" action="/book/searchBooks">
    <div class="layui-inline">
        <div class="layui-input-inline">
            <select name="searchTypes">
                <option value="1">书名</option>
                <option value="2">作者</option>
                <option value="3">出版社</option>
                <option value="4">书籍编号</option>
            </select>
        </div>
    </div>
    <div class="layui-input-inline">
        <input type="text" name="searchWords" placeholder="请输入检索内容" class="layui-input">
    </div>
    <button type="submit" class="layui-btn layui-btn-primary">检索</button>
    <div class="layui-form-item">
        <div class="layui-input-block" style="margin-left: 0px">
            <input type="radio" name="book_type" value="all" title="所有书刊" checked="">
            <input type="radio" name="book_type" value="中文图书" title="中文图书">
            <input type="radio" name="book_type" value="西文图书" title="西文图书">
            <input type="radio" name="book_type" value="中文期刊" title="中文期刊">
            <input type="radio" name="book_type" value="西文期刊" title="西文期刊">
        </div>
    </div>
</form>
<script src="../js/layui/layui.js"></script>
<script>
    layui.use(['form'], function () {
        // form表单设置
        var form = layui.form();
    });
</script>
</body>
</html>
