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
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        .searchPage {
            width: 740px;
            margin: 0 auto;
        }

        .searchIcon {
            text-align: center;
            position: relative;
            top: 30px;
        }

        .search {
            position: relative;
            top: 60px;
        }

        .tab {
            position: relative;
            top: 60px;
            margin-top: 40px;
        }

        .layui-tab-item a {
            text-decoration: none;
            cursor: pointer;
        }

        .layui-tab-item .flow {
            overflow: auto;
            padding-left: 30px;
            height: 300px;
        }

        .layui-tab-item .nav-item {
            display: inline-block;
            float: left;
            margin-right: 17px;
            margin-top: 15px;
            position: relative;
            background-color: #fcfcfc;
            line-height: 60px;
            width: 200px;
            text-align: center;
        }

        .layui-flow-more {
            text-align: center;
            position: relative;
            top: 20px;
            right: 23px;
        }

        .mainpic {
            float: left;
            max-width: 155px;
        }

        .info {
            float: left;
            max-width: 248px;
            padding: 10px;
        }

        .info span {
            font: 14px Arial, Helvetica, sans-serif;
            line-height: 150%;
            color: #666666;
            line-height: 150%;
        }

    </style>
</head>
<body>
<div class="searchPage">
    <div class="searchIcon">
        <img src="/images/book.png">
    </div>
    <%--搜索栏--%>
    <div class="search">
        <form class="layui-form" action="/book/searchBooks">
            <div class="layui-inline">
                <div class="layui-input-inline" style="width: 150px">
                    <select name="searchTypes">
                        <option value="1">书名</option>
                        <option value="2">作者</option>
                        <option value="3">出版社</option>
                        <option value="4">书籍编号</option>
                    </select>
                </div>
            </div>
            <div class="layui-input-inline" style="width: 516.2px;">
                <input type="text" name="searchWords" placeholder="请输入检索内容" class="layui-input">
            </div>
            <button type="submit" class="layui-btn layui-btn-primary" style="background-color: #009688;color: #fff;">检索
            </button>
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
    </div>
    <%--推荐栏--%>
    <div class="tab">
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <li class="layui-this">热门检索</li>
                <li>热门借阅</li>
                <li>热门图书</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <ul id="hotSearch" class="flow">

                    </ul>
                </div>
                <div class="layui-tab-item">
                    <ul id="hotBorrow" class="flow">

                    </ul>
                </div>
                <div class="layui-tab-item">
                    <ul id="hotBooks" class="flow">

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../js/layui/layui.js"></script>
<script src="../js/jquery-3.2.1.js"></script>
<script>
    layui.use(['form', 'element', 'flow'], function () {
        var $ = layui.jquery;//不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var form = layui.form();
        var element = layui.element();
        var flow = layui.flow;
        // 热门检索
        flow.load({
            elem: '#hotSearch' //流加载容器
            , done: function (page, next) { //执行下一页的回调
                var lis = [];
                $.ajax({
                    url: "/book/hotSearch?page=" + page,
                    type: "post",
                    data: "",
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            layui.each(data.sw, function (index, searchWords) {
                                if ((index+1)%3==0)
                                    lis.push('<li style="height: 60px;"><a  href="/book/searchBooks?searchTypes='+searchWords.searchType+'&searchWords='+searchWords.searchWord+'&book_type='+searchWords.bookType+'"><div class="nav-item"> <span class="nav-txt">' + searchWords.searchWord + '(' + searchWords.searchNum + ')</span> </div> </a> </li>')
                                else
                                    lis.push('<li><a  href="/book/searchBooks?searchTypes='+searchWords.searchType+'&searchWords='+searchWords.searchWord+'&book_type='+searchWords.bookType+'"><div class="nav-item"> <span class="nav-txt">' + searchWords.searchWord + '(' + searchWords.searchNum + ')</span> </div> </a> </li>')
                            });
                            var length = Math.ceil(data.length/6);
                            next(lis.join(''), page < length);
                        }
                    },
                    error: function () {
                        alert("ajax出错");
                    }
                });
            }
        });

        // 热门借阅
        flow.load({
            elem: '#hotBorrow' //流加载容器
            , done: function (page, next) { //执行下一页的回调
                var lis = [];
                $.ajax({
                    url: "/book/hotBorrow?page=" + page,
                    type: "post",
                    data: "",
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            layui.each(data.bl, function (index, book) {
                                if (index % 2 == 0)
                                    lis.push('<li><div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;"><a><div class="mainpic"><img src="../'+book.bookImage+'" style="width: 107px"></div><div class="info"><span>书名：</span>'+book.bookName+'<br><span>作者：</span>'+book.author+'<br><span>出版社：</span>'+book.press+'<br><span>出版年：</span>'+book.pressYear+'<br><span>页数：</span>'+book.pageNum+'<br><span>定价：</span>'+book.price+'元<br><span>豆瓣评分：</span>'+book.score+'分</div></a></div></li>');
                                else
                                    lis.push('<li style="margin-left: 340px;"><div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;"><a><div class="mainpic"><img src="../'+book.bookImage+'" style="width: 107px"></div><div class="info"><span>书名：</span>'+book.bookName+'<br><span>作者：</span>'+book.author+'<br><span>出版社：</span>'+book.press+'<br><span>出版年：</span>'+book.pressYear+'<br><span>页数：</span>'+book.pageNum+'<br><span>定价：</span>'+book.price+'元<br><span>豆瓣评分：</span>'+book.score+'分</div></a></div></li>');
                            });
                            var length = Math.ceil(data.length/4);
                            next(lis.join(''), page < length);
                        }
                    },
                    error: function () {
                        alert("ajax出错");
                    }
                });
            }
        });

        // 热门图书
        flow.load({
            elem: '#hotBooks' //流加载容器
            , done: function (page, next) { //执行下一页的回调
                var lis = [];
                $.ajax({
                    url: "/book/hotBooks?page=" + page,
                    type: "post",
                    data: "",
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            layui.each(data.bl, function (index, book) {
                                if (index % 2 == 0)
                                    lis.push('<li><div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;"><a><div class="mainpic"><img src="../'+book.bookImage+'" style="width: 107px"></div><div class="info"><span>书名：</span>'+book.bookName+'<br><span>作者：</span>'+book.author+'<br><span>出版社：</span>'+book.press+'<br><span>出版年：</span>'+book.pressYear+'<br><span>页数：</span>'+book.pageNum+'<br><span>定价：</span>'+book.price+'元<br><span>豆瓣评分：</span>'+book.score+'分</div></a></div></li>');
                                else
                                    lis.push('<li style="margin-left: 340px;"><div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;"><a><div class="mainpic"><img src="../'+book.bookImage+'" style="width: 107px"></div><div class="info"><span>书名：</span>'+book.bookName+'<br><span>作者：</span>'+book.author+'<br><span>出版社：</span>'+book.press+'<br><span>出版年：</span>'+book.pressYear+'<br><span>页数：</span>'+book.pageNum+'<br><span>定价：</span>'+book.price+'元<br><span>豆瓣评分：</span>'+book.score+'分</div></a></div></li>');
                            });
                            var length = Math.ceil(data.length/4);
                            next(lis.join(''), page < length);
                        }
                    },
                    error: function () {
                        alert("ajax出错");
                    }
                });
            }
        });
    });
</script>
</body>
</html>
