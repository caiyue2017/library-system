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
    <title>书籍</title>
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
            margin-left: 8%;
        }

        .search {
            height: 100px;
            width: 836px;
            margin-top: 1%;
            margin-bottom: 2%;
        }

        .searchIcon {
            float: left;
            margin-right: 20px;
            padding-top: 5px;
        }


        ul {
            list-style: none;
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

        /*书籍信息 start*/

        .bookInfo {
            color: #111;
            font: 12px Helvetica,Arial,sans-serif;
        }

        h1 {
            word-wrap: break-word;
            display: block;
            font-size: 25px;
            font-weight: bold;
            color: #494949;
            margin: 0;
            padding: 0 0 15px 0;
            line-height: 1.1;
        }
        .clear {
            clear: both;
            line-height: 0;
            font-size: 0;
        }
        .clearfix {
            display: block;
            zoom: 1;
        }
        .article {
            float: left;
            width: 590px;
            padding-right: 40px;
        }
        .subjectwrap {
            margin-bottom: 15px;
        }
        .subject {
            float: left;
            width: 415px;
        }
        .mainpic {
            margin: 3px 0 0 0;
            float: left;
            text-align: center;
            margin: 3px 12px 0 0;
            max-width: 155px;
            overflow: hidden;
        }
        .info {
            line-height: 1.62;
            padding-top: 0.5%;
            float: left;
            max-width: 248px;
            word-wrap: break-word;
        }
        .pl {
            font: 12px Arial, Helvetica, sans-serif;
            line-height: 150%;
            color: #666666;
        }
        /*书籍信息 end*/

        /*左边栏 end*/

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
        <div class="bookInfo">
            <h1>
                <span>明朝那些事儿（壹）</span>
                <div class="clear"></div>
            </h1>
            <div class="content">
                <div class="clearfix">
                    <div class="article">
                        <div class="indent">
                            <div class="subjectwrap clearfix">
                                <div class="subject clearfix">
                                    <div class="mainpic">
                                        <img src="/images/book/b1.jpg" width="107px">
                                    </div>
                                    <div class="info">
                                        <span class="pl">编号:</span>
                                        K248/24
                                        <br>
                                        <span class="pl">作者:</span>
                                        当年明月
                                        <br>
                                        <span class="pl">出版社:</span>
                                        中国友谊出版公司
                                        <br>
                                        <span class="pl">出版年:</span>
                                        2006
                                        <br>
                                        <span class="pl">页数:</span>
                                        298
                                        <br>
                                        <span class="pl">定价:</span>
                                        24.80
                                        <br>
                                        <span class="pl">学科主题:</span>
                                        中国历史
                                        <br>
                                        <span class="pl">豆瓣评分:</span>
                                        9.1
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer"></div>
        </div>
    </div>
    <div class="right"></div>
</div>
<script src="../js/layui/layui.js"></script>
<script src="../js/jquery-3.2.1.js"></script>
<script>
    layui.use(['form', 'element', 'flow'], function () {
        var $ = layui.jquery;//不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var form = layui.form();
        var element = layui.element();
        var flow = layui.flow;

    });
</script>
</body>
</html>
