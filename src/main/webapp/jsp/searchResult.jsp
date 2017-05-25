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
    <style type="text/css">
        body, td, th {
            line-height: 1.62;
        }

        .contain {
            margin: 0 auto;
            padding: 25px 0;
            width: 1110px;
            clear: both;
            background-color: #fff;
        }

        /*左边栏 start*/
        .left {
            width: 836px;
            float: left;
        }

        .search {
            height: 100px;
            width: 836px;
            margin-top: 5%;
            margin-bottom: 5%;
        }

        .searchIcon {
            float: left;
            margin-right: 20px;
            padding-top: 5px;
        }

        .searchResult {
            width: 836px;
            font: 12px Helvetica, Arial, sans-serif;
            margin-bottom: 2%;
        }

        .subject-list {
            margin-top: 5px;
        }

        ul {
            list-style: none;
        }

        .subject-item {
            overflow: hidden;
            zoom: 1;
            border-top: 1px dashed #ddd;
            padding: 20px 0 10px;
        }

        .subject-item .pic {
            float: left;
            margin-right: 20px;
        }

        a {
            cursor: pointer;
            color: #37a;
        }

        .left a:hover {
            background-color: #37a;
            color: #ffffff;
        }

        .left a img {
            border-width: 0;
            vertical-align: middle;
        }

        .subject-item .info {
            overflow: hidden;
            zoom: 1;
            color: #666;
        }

        .subject-item .info h2 {
            font-size: 14px;
            margin-bottom: 6px;
        }

        .info span {
            float: right;
        }

        .subject-item .pub {
            margin: 6px 0 8px;
        }

        /*左边栏 end*/

        /*侧边栏样式 start*/

        .right {
            width: 240px;
            float: right;
            color: #666;
            font: 12px/1.8 "宋体", Arial, "微软雅黑";
            text-align: left;
            margin-top: 3.8%;
        }

        .mb40 {
            margin-bottom: 40px;
        }

        .rankTitle h3 {
            padding-left: 20px;
            height: 32px;
            font: 22px/1 '\5FAE\8F6F\96C5\9ED1';
            border-left: 2px solid #5C5C5C;
        }

        .rankListWrap {
            clear: both;
        }

        .rankHover {
            padding-top: 7px;
        }

        .right ol, .right ul, .right li {
            list-style: none outside none;
        }

        .rankList li {
            line-height: 30px;
            padding-left: 10px;
            border-bottom: 1px solid #DDD;
            position: relative;
            overflow: hidden;
            vertical-align: bottom;
        }

        .numList li {
            position: relative;
            overflow: hidden;
            vertical-align: bottom;
            padding-left: 20px;
        }

        .numList li em {
            float: right;
            width: 56px;
            color: #4095D5;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: clip;
        }

        i, em {
            font-style: normal;
        }

        .numList li span.num {
            background: #4095D5;
        }

        .numList li span {
            float: left;
            width: 16px;
            height: 16px;
            color: #FFF;
            text-align: center;
            margin-top: 7px;
            line-height: 16px;
            margin-right: 5px;
            background: #CACACA;
            position: absolute;
            left: 0;
        }

        .rankList li a {
            display: block;
            width: 198px;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

        .numList li .hoverHide a {
            float: left;
            width: 160px;
        }

        .right a {
            outline: none;
            color: #666;
            text-decoration: none;
        }

        .numList li .detailWrap .detailInfo h4 a:hover {
            color: #4095D5;
        }

        .detailWrap {
            display: none;
            position: relative;
            line-height: 1.8;
            height: 109px;
        }

        .numList li .detailWrap {
            left: -10px;
        }

        .numList li .detailWrap span {
            width: 16px;
            height: 16px;
            position: absolute;
            z-index: 10;
            left: -10px;
            top: 9px;
        }

        .rankHover .detailWrap a {
            width: auto;
            display: inline;
        }

        .detailWrap img {
            position: absolute;
            left: -10px;
            top: 16px;
            width: 55px;
            height: 74px;
        }

        .right a img {
            border: none;
        }

        .detailInfo {
            position: absolute;
            top: 20px;
            left: 60px;
        }

        .detailWrap h4 {
            font: 700 12px/1.8 '宋体';
        }

        .numList li .detailWrap .detailInfo h4 a {
            float: none;
            white-space: normal;
            color: #333;
        }

        .detailWrap p {
            color: #999;
        }

        .detailInfo i {
            color: #333;
        }

        /*侧边栏样式 end*/
    </style>
</head>
<body>
<div class="contain">
    <div class="left">
        <div class="search">
            <div class="searchIcon">
                <img src="/images/book.png" width="76">
            </div>
            <form class="layui-form" action="/book/searchBooks" style="float: left;margin-top: 5px;">
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
                <button type="submit" class="layui-btn layui-btn-primary"
                        style="background-color: #009688;color: #fff;">检索
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
        <div class="searchResult">
            <ul class="subject-list" id="searchResult"></ul>
        </div>
        <div id="page"></div>
    </div>
    <div class="right">
        <%--总点击排行榜--%>
        <div id="totalHits" class="right mb40">
            <div class="rankTitle">
                <h3>总点击排行榜</h3>
            </div>
            <div class="tabWrap channelList">
                <div class="rankListWrap">
                    <ul class="rankList rankHover numList">

                    </ul>
                </div>
            </div>
        </div>
        <%--新书速递--%>
        <div id="newBooks" class="right mb40">
            <div class="rankTitle">
                <h3>新书速递</h3>
            </div>
            <div class="tabWrap channelList">
                <div class="rankListWrap">
                    <ul class="rankList rankHover numList">

                    </ul>
                </div>
            </div>
        </div>
        <%--热门借阅--%>
        <div id="hotBorrow" class="right mb40">
            <div class="rankTitle">
                <h3>热门借阅</h3>
            </div>
            <div class="tabWrap channelList">
                <div class="rankListWrap">
                    <ul class="rankList rankHover numList">

                    </ul>
                </div>
            </div>
        </div>
        <%--好评榜--%>
        <%--<div id="goodScore" class="right">
            <div class="rankTitle">
                <h3>好评榜</h3>
            </div>
            <div class="tabWrap channelList">
                <div class="rankListWrap">
                    <ul class="rankList rankHover numList">

                    </ul>
                </div>
            </div>
        </div>--%>
    </div>
</div>
<script src="../js/layui/layui.js"></script>
<script src="../js/jquery-3.2.1.js"></script>
<script>
    $(function () {
        showSearchResult(1);
        totalHits();
        newBooks();
        hotBorrow();
//        goodScore();
    });
    // 总页数
    var pages;
    // 展示搜索结果
    function showSearchResult(curr) {
        var num = 8;
        $.ajax({
            url: "/book/searchResult?page=" + curr,
            type: "post",
            data: "",
            dataType: "json",
            success: function (data) {
                if (data) {
                    var books = data.books;
                    pages = books.length/num;
                    var end = curr * num;
                    var begin = end - (num - 1);
                    $("#searchResult li").remove();
                    for (var i = begin; i <= end; i++) {
                        var book = books[i - 1];
                        var li = '<li class="subject-item"> <div class="pic"> <a class="nbg"> <img src="../' + book.bookImage + '" width="90"> </a> </div> <div class="info"> <h2> <a href="#">' + book.bookName + '</a>' + book.bookNO + '<span>' + book.bookType + '</span> </h2> <div class="pub">' + book.author + ' /';
                        if (book.translator!=null)
                            li = li + book.translator + ' / ';
                        li =  li + book.press + '/ ' + book.pressYear + ' / ' + book.price + '元<span>馆藏复本：' + book.storeNumber + ' </span></div> <div class="pub">豆瓣评分：' + book.score + '分<span>可借复本：' + book.borrowNumber + '</span></div> </div> </li>';
                        $("#searchResult").append(li);
                    }
                }
            },
            error: function () {
                alert("searchResult出错！");
            }
        });
    }
    layui.use(['form', 'element', 'laypage', 'layer'], function () {
        var $ = layui.jquery;//不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var form = layui.form();
        var element = layui.element();
        var laypage = layui.laypage;
        var layer = layui.layer;

        laypage({
            cont: 'page'
            , pages: Math.ceil(pages)
            , first: 1
            , last:  Math.ceil(pages)
            , prev: '<em><</em>'
            , next: '<em>></em>'
            , skin: '#1E9FFF'
            , jump: function (obj, first) {
                if (!first) {
                    showSearchResult(obj.curr);
                }
            }
        });
    });

    // 总点击排行榜
    function totalHits() {
        $.ajax({
            url: "/book/totalHits",
            type: "post",
            data: "",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data) {
                    var books = data.books;
                    $("#totalHits ul li").remove();
                    for (var i = 0; i < 10; i++) {
                        var book = books[i];
                        if (i == 0)
                            var li = '<li><div class="hoverHide" style="display: none;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="#">' + book.bookName + '</a></div><div class="detailWrap" style="display: block;"><span class="num">' + (i + 1) + '</span><a href="#"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="#">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        else
                            var li = '<li><div class="hoverHide" style="display: block;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="#">' + book.bookName + '</a></div><div class="detailWrap" style="display: none;"><span class="num">' + (i + 1) + '</span><a href="#"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="#">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        $("#totalHits ul ").append(li);
                    }
                }
            },
            error: function () {
                alert("总点击排行榜出错！");
            }
        });
        $("#totalHits ul li").hover(function () {
            $("#totalHits .hoverHide").css("display", "block");
            $("#totalHits .detailWrap").css("display", "none");
            $(this).children('.hoverHide').css("display", "none");
            $(this).children('.detailWrap').css("display", "block");
        });
    }
    // 新书速递
    function newBooks() {
        $.ajax({
            url: "/book/newBooks",
            type: "post",
            data: "",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data) {
                    var books = data.books;
                    $("#newBooks ul li").remove();
                    for (var i = 0; i < 10; i++) {
                        var book = books[i];
                        if (i == 0)
                            var li = '<li><div class="hoverHide" style="display: none;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="#">' + book.bookName + '</a></div><div class="detailWrap" style="display: block;"><span class="num">' + (i + 1) + '</span><a href="#"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="#">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        else
                            var li = '<li><div class="hoverHide" style="display: block;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="#">' + book.bookName + '</a></div><div class="detailWrap" style="display: none;"><span class="num">' + (i + 1) + '</span><a href="#"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="#">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        $("#newBooks ul ").append(li);
                    }
                }
            },
            error: function () {
                alert("总点击排行榜出错！");
            }
        });
        $("#newBooks ul li").hover(function () {
            $("#newBooks .hoverHide").css("display", "block");
            $("#newBooks .detailWrap").css("display", "none");
            $(this).children('.hoverHide').css("display", "none");
            $(this).children('.detailWrap').css("display", "block");
        });
    }
    // 热门借阅
    function hotBorrow() {
        $.ajax({
            url: "/book/hotBorrowInResult",
            type: "post",
            data: "",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data) {
                    var books = data.books;
                    $("#hotBorrow ul li").remove();
                    for (var i = 0; i < 10; i++) {
                        var book = books[i];
                        if (i == 0)
                            var li = '<li><div class="hoverHide" style="display: none;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="#">' + book.bookName + '</a></div><div class="detailWrap" style="display: block;"><span class="num">' + (i + 1) + '</span><a href="#"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="#">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        else
                            var li = '<li><div class="hoverHide" style="display: block;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="#">' + book.bookName + '</a></div><div class="detailWrap" style="display: none;"><span class="num">' + (i + 1) + '</span><a href="#"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="#">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        $("#hotBorrow ul ").append(li);
                    }
                }
            },
            error: function () {
                alert("总点击排行榜出错！");
            }
        });
        $("#hotBorrow ul li").hover(function () {
            $("#hotBorrow .hoverHide").css("display", "block");
            $("#hotBorrow .detailWrap").css("display", "none");
            $(this).children('.hoverHide').css("display", "none");
            $(this).children('.detailWrap').css("display", "block");
        });
    }
    // 好评榜
    function goodScore() {
        $.ajax({
            url: "/book/goodScore",
            type: "post",
            data: "",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data) {
                    var books = data.books;
                    $("#goodScore ul li").remove();
                    for (var i = 0; i < 10; i++) {
                        var book = books[i];
                        if (i == 0)
                            var li = '<li><div class="hoverHide" style="display: none;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="#">' + book.bookName + '</a></div><div class="detailWrap" style="display: block;"><span class="num">' + (i + 1) + '</span><a href="#"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="#">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        else
                            var li = '<li><div class="hoverHide" style="display: block;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="#">' + book.bookName + '</a></div><div class="detailWrap" style="display: none;"><span class="num">' + (i + 1) + '</span><a href="#"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="#">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        $("#goodScore ul ").append(li);
                    }
                }
            },
            error: function () {
                alert("总点击排行榜出错！");
            }
        });
        $("#goodScore ul li").hover(function () {
            $("#goodScore .hoverHide").css("display", "block");
            $("#goodScore .detailWrap").css("display", "none");
            $(this).children('.hoverHide').css("display", "none");
            $(this).children('.detailWrap').css("display", "block");
        });
    }
</script>
</body>
</html>
