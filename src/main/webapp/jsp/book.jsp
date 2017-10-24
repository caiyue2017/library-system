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
    <title>书籍</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css" media="all">
    <style type="text/css">
        body, td, th {
            line-height: 1.62;
        }

        .header {
            height: 40px;
            background-color: #338fe4;
        }

        .header .layout {
            max-width: 1280px;
            margin: 0 auto;
        }

        .header .left {
            float: left;
        }

        .header .right {
            float: right;
        }

        .header .login {
            /*padding-top: 21px;*/
        }

        .header .login ul {
            display: none;
            position: absolute;
            overflow: hidden;
            right: 220px;
            min-width: 90px;
            height: auto;
            background-color: #fff;
            border: 1px solid #ececec;
            list-style: none;

        }

        .header .login ul li {
            display: block;
        }

        .header .login ul li a {
            color: #434343;
        }

        .header .login ul li a:hover {
            color: #F7B824;
        }

        .header .login ul a {
            display: block;
            height: 32px;
            line-height: 32px;
            text-align: center;
        }

        .header .login a.userImage {
            display: inline-block;
            vertical-align: top;
            width: 40px;
            height: 40px;
            position: relative;
            z-index: 9;
            border-radius: 20px;
            border-radius: 50%;
            line-height: 40px;
            text-align: center;
            background-color: #ecf7ff;
            color: #338fe4;
            text-decoration: none;
            font-size: 12px;
        }

        .header .login a.bt {
            display: inline-block;
            width: 40px;
            border-radius: 50%;
            line-height: 40px;
            text-align: center;
            background-color: #ecf7ff;
            color: #338fe4;
            text-decoration: none;
            font-size: 12px;
        }

        .header .login span {
            color: #81b9ed;
            margin-top: 8px;
        }

        .header .left .links {
            display: inline-block;
            padding-top: 10px;
            line-height: 20px;
        }

        .header .left .links a {
            font-size: 18px;
            color: #d8efff;
            text-decoration: none;
            /*font-style: italic;*/
        }

        .header .left .links a .logo {
            float: left;
            width: 50px;
            margin-right: 10px;
            font-size: 0;
            margin-top: -15px;
        }

        .header .left .links a .logo img {
            width: 100%;
            border-radius: 50%;
            border: 1px solid #338fe4;
        }

        .header .login a img {
            display: block;
            width: 32px;
            height: 32px;
            border-radius: 50%;
        }

        .header .login .text {
            display: inline-block;
            line-height: 40px;
            font-size: 14px;
            margin-left: 10px;
        }

        .header .login a {
            color: #d8efff;
            text-decoration: none;
            margin-left: 10px;
        }

        .header .login a:hover {
            color: #fda136;
        }

        .header .login a .iconImg {
            display: inline;
            width: 28px;
            height: 28px;
            margin-left: 10px;
            padding-right: 5px;
            margin-top: -6px;
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
            width: 950px;
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
            font: 12px Helvetica, Arial, sans-serif;
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

        /*评分栏 start*/
        #interest_sectl {
            float: left;
            width: 155px;
            margin: 2px 0 0 0;
            padding: 0 0 0 15px;
            border-left: 1px solid #eaeaea;
            color: #9b9b9b;
            font: 12px Helvetica, Arial, sans-serif;
        }

        #interest_sectl .rating_wrap {
            padding-bottom: 15px;
            font-size: 12px;
            line-height: 14px;
        }

        .clearbox {
            clear: both;
            width: 100%;
        }

        #interest_sectl .rating_wrap .rating_logo {
            line-height: 1;
        }

        #interest_sectl .rating_self {
            padding: 0;
            line-height: 2;
        }

        #interest_sectl .rating_num {
            color: #494949;
            padding: 0;
            min-width: 30%;
            font-size: 28px;
        }

        .ll {
            float: left;
        }

        #interest_sectl .rating_right {
            /*float: left;
            padding: 10px 0 10px 6px;*/
        }

        .bigstar50, .bigstar45, .bigstar40, .bigstar35, .bigstar30, .bigstar25, .bigstar20, .bigstar15, .bigstar10, .bigstar05, .bigstar00 {
            display: inline-block;
            zoom: 1;
            background: url(/f/shire/680a4bc4c384199245b080c7104da5be8ed717d3/pics/rating_icons/ic_rating_m.png) no-repeat;
            background: -webkit-image-set(url(https://img3.doubanio.com/f/shire/680a4bc4c384199245b080c7104da5be8ed717d3/pics/rating_icons/ic_rating_m.png) 1x, url(https://img3.doubanio.com/f/shire/ee7f53d76c3f8ed4991bdbafdb9b2c90c0aedfef/pics/rating_icons/ic_rating_m@2x.png) 2x) no-repeat;
            background: -moz-image-set(url(https://img3.doubanio.com/f/shire/680a4bc4c384199245b080c7104da5be8ed717d3/pics/rating_icons/ic_rating_m.png) 1x, url(https://img3.doubanio.com/f/shire/ee7f53d76c3f8ed4991bdbafdb9b2c90c0aedfef/pics/rating_icons/ic_rating_m@2x.png) 2x) no-repeat;
            background: -o-image-set(url(https://img3.doubanio.com/f/shire/680a4bc4c384199245b080c7104da5be8ed717d3/pics/rating_icons/ic_rating_m.png) 1x, url(https://img3.doubanio.com/f/shire/ee7f53d76c3f8ed4991bdbafdb9b2c90c0aedfef/pics/rating_icons/ic_rating_m@2x.png) 2x) no-repeat;
            background: -ms-image-set(url(https://img3.doubanio.com/f/shire/680a4bc4c384199245b080c7104da5be8ed717d3/pics/rating_icons/ic_rating_m.png) 1x, url(https://img3.doubanio.com/f/shire/ee7f53d76c3f8ed4991bdbafdb9b2c90c0aedfef/pics/rating_icons/ic_rating_m@2x.png) 2x) no-repeat;
            width: 75px;
            height: 15px;
            margin: 1px 0 0 0;
            overflow: hidden;
        }

        .bigstar45 {
            background-position: 0 -15px;
        }

        .bigstar40 {
            background-position: 0 -30px;
        }

        .bigstar35 {
            background-position: 0 -45px;
        }

        #interest_sectl .rating_self .rating_sum {
            clear: both;
        }

        /*评分栏 end*/
        .related_info h2 {
            margin-top: 2%;
            /*margin-bottom: 3px;*/
            /*padding-top: 25px;*/
        }

        h2 {
            font: 15px Arial, Helvetica, sans-serif;
            color: #072;
            margin: 0 0 12px 0;
            line-height: 150%;
        }

        h2 {
            color: #007722;
        }

        .indent {
            word-break: break-all;
        }

        .intro p {
            text-indent: 2em;
            word-break: normal;
            line-height: 160%;
        }

        #link-report .report a {
            color: #BBB;
        }

        /*评价*/
        #interest_sect_level {
            clear: both;
            padding: 20px 0 3px;
            font: 14px Arial, Helvetica, sans-serif;
        }

        #interest_sect_level .ll {
            float: left;
        }

        #stars {
            font-size: 0;
            vertical-align: text-bottom;
            cursor: pointer;
        }

        #stars a img {
            vertical-align: text-bottom;
        }

        /*书籍信息 end*/

        /*相关借阅 start*/
        .subject_show .content dl {
            margin: 15px 0 15px 0;
            float: left;
            overflow: hidden;
            text-align: center;
            width: 102px;
            height: 169px;
            /*width: 85px;*/
        }

        .subject_show .content .dl_left {
            margin-left: 19px;
        }

        .subject_show .content dl dt {
            overflow: hidden;
            /*height: 99px;*/
        }

        .subject_show .content dl dd {
            margin: 0;
            padding-top: 3px;
            overflow: hidden;
        }

        .subject_show .content dl dt a {
            width: 85px;
            text-align: center;
        }

        .subject_show .content dl.clear {
            margin: 0;
            padding: 0;
            clear: both;
            float: none;
            width: 0;
            height: 0;
        }

        /*相关借阅 end*/

        #guessYouLikeByThis img {
            width: 102px;
            height: 150px;
        }

        /*左边栏 end*/

        /*侧边栏样式 start*/

        .contain .right {
            width: 300px;
            float: right;
            color: #666;
            font: 12px/1.8 "宋体", Arial, "微软雅黑";
            text-align: left;
            margin-top: 1%;
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
            background-color: #FFFFFF;
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
<div class="header">
    <div class="layout">
        <div class="left">
            <div class="links">
                <a href="/">
                    <%--<div class="logo">--%>
                    <%--<img src="../images/book.png">--%>
                    <%--</div>--%>
                    校园图书馆系统
                </a>
            </div>
        </div>
        <div class="right">
            <div class="login">
                <%--读者头像--%>
                <c:if test="${sessionScope.user != null}">
                    <shiro:user>
                        <%--跳到读者主页--%>
                        <a href="#" class="userImage" id="userImage" style="margin-top:-4px;">
                            <img src="../images/user/user.jpg"/>">
                        </a>
                    </shiro:user>
                </c:if>
                <div class="text">
                    <c:if test="${sessionScope.user != null}">
                        <%--用户名，跳到用户主页--%>
                        <a href="#" target="_blank">
                            <c:out value="${sessionScope.user['username']}"/>
                        </a>
                        <%--用户设置，跳到用户主页--%>
                        <shiro:hasRole name="user">
                            <a href="#" target="_blank">
                                <img src="/jsp/img/icon/shezhi.png" class="iconImg">
                                设置
                            </a>
                        </shiro:hasRole>
                        <%--管理员设置，跳到管理页面--%>
                        <shiro:hasRole name="admin">
                            <a href="#" target="_blank">
                                <img src="../images/icon/shezhi.png" class="iconImg">
                                管理员
                            </a>
                        </shiro:hasRole>
                        <%--注销--%>
                        <a href="/user/logout">
                            <img src="../images/icon/end.png" class="iconImg">
                            退了
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.user == null}">
                        <%--<a href="/jsp/user/login.jsp" class="bt">登录</a>--%>
                        <img src="../images/icon/login.png" class="iconImg"
                             style="width: 32px;height: 32px;margin-top: -5px;">
                        <a href="#" style="margin-left: 20px">
                            登录
                        </a>
                        <a href="#" style="margin-left: 20px">
                            注册
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="contain">
    <div class="left">
        <div class="search">
            <div class="searchIcon">
                <img src="/images/book2.png" width="76">
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
                <span>${requestScope.book.bookName}</span>
                <div class="clear"></div>
            </h1>
            <div class="content">
                <div class="clearfix">
                    <%--书籍详情页面的左边--%>
                    <div class="article">
                        <%--书籍简介栏--%>
                        <div class="indent" style="height: 160px;">
                            <div class="subjectwrap clearfix">
                                <div class="subject clearfix">
                                    <div class="mainpic">
                                        <img src="/${requestScope.book.bookImage}" width="107px">
                                    </div>
                                    <div class="info">
                                        <span class="pl">编号:</span>
                                        ${requestScope.book.bookNO}
                                        <br>
                                        <span class="pl">作者:</span>
                                        ${requestScope.book.author}
                                        <br>
                                        <span class="pl">副标题:</span>
                                        ${requestScope.book.subHead}
                                        <br>
                                        <span class="pl">出版社:</span>
                                        ${requestScope.book.press}
                                        <br>
                                        <span class="pl">出版年:</span>
                                        ${requestScope.book.pressYear}
                                        <br>
                                        <span class="pl">页数:</span>
                                        ${requestScope.book.pageNum}
                                        <br>
                                        <span class="pl">定价:</span>
                                        ${requestScope.book.price}
                                        <br>
                                        <span class="pl">ISBN:</span>
                                        ${requestScope.book.ISBN}
                                        <br>
                                    </div>
                                    <div class="subjectLeft">
                                        <span class="pl">文献类型:</span>
                                        ${requestScope.book.bookType}
                                        <br>
                                        <span class="pl">学科主题:</span>
                                        ${requestScope.cname}
                                        <br>
                                        <span class="pl">总点击数:</span>
                                        ${requestScope.book.searchNum}
                                        <br>
                                    </div>
                                </div>
                                <div id="interest_sectl">
                                    <div class="rating_wrap clearbox">
                                        <div class="rating_logo">豆瓣评分</div>
                                        <div class="rating_self clearfix">
                                            <strong class="rating_num">${requestScope.book.score}</strong>
                                            <div class="rating_right">
                                                <c:choose>
                                                    <c:when test="${requestScope.book.score>=8.5}">
                                                        <div class="bigstar45"></div>
                                                    </c:when>
                                                    <c:when test="${requestScope.book.score<8.5 && requestScope.book.score>=8}">
                                                        <div class="bigstar40"></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="bigstar35"></div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="rating_sum">
                                                    <span style="color: #37a">${requestScope.book.scoreNum}人评价</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--评价--%>
                            <div id="interest_sect_level" class="clearfix">
                                <div class="ll j a_stars">
                                    评价:
                                    <span id="rating">
                                        <span id="stars">
                                            <a href="javascript:;" class="j a_collect_btn"
                                               name="pbtn-27019309-collect-1">
                                                <img src="https://img3.doubanio.com/f/shire/95cc2fa733221bb8edd28ad56a7145a5ad33383e/pics/rating_icons/star_hollow_hover@2x.png"
                                                     id="star1" width="16" height="16">
                                            </a>
                                            <a href="javascript:;" class="j a_collect_btn"
                                               name="pbtn-27019309-collect-2">
                                                <img src="https://img3.doubanio.com/f/shire/95cc2fa733221bb8edd28ad56a7145a5ad33383e/pics/rating_icons/star_hollow_hover@2x.png"
                                                     id="star2" width="16" height="16">
                                            </a>
                                            <a href="javascript:;" class="j a_collect_btn"
                                               name="pbtn-27019309-collect-3">
                                                <img src="https://img3.doubanio.com/f/shire/95cc2fa733221bb8edd28ad56a7145a5ad33383e/pics/rating_icons/star_hollow_hover@2x.png"
                                                     id="star3" width="16" height="16">
                                            </a>
                                            <a href="javascript:;" class="j a_collect_btn"
                                               name="pbtn-27019309-collect-4">
                                                <img src="https://img3.doubanio.com/f/shire/95cc2fa733221bb8edd28ad56a7145a5ad33383e/pics/rating_icons/star_hollow_hover@2x.png"
                                                     id="star4" width="16" height="16">
                                            </a>
                                            <a href="javascript:;" class="j a_collect_btn"
                                               name="pbtn-27019309-collect-5">
                                                <img src="https://img3.doubanio.com/f/shire/95cc2fa733221bb8edd28ad56a7145a5ad33383e/pics/rating_icons/star_hollow_hover@2x.png"
                                                     id="star5" width="16" height="16">
                                            </a>
                                        </span>
                                        <span id="rateword" class="pl"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <%--详情--%>
                        <div class="related_info" style="margin-top: 12%;">
                            <h2>
                                <span>内容简介</span>
                                &nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                            </h2>
                            <div class="indent">
                                <div>
                                    <div class="intro">
                                        <p>
                                            ${requestScope.book.bookDesc}
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <h2>
                                <span>作者简介</span>
                                &nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                            </h2>
                            <div class="indent">
                                <div>
                                    <div class="intro">
                                        <p>
                                            ${requestScope.book.authorDesc}
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <h2>
                                <span>目录</span>
                                &nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                            </h2>
                            <div class="indent" id="short_catalog">
                                ${requestScope.book.shortCatalog}
                                · · · · · ·
                                (<a onclick="fullCatalog()">更多</a>)
                            </div>
                            <div class="indent" style="display:none" id="full_catalog">
                                ${requestScope.book.longCatalog}
                                · · · · · · (<a onclick="shortCatalog()">收起</a>)
                            </div>
                            <h2>
                                <span>馆藏信息</span>
                                &nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                            </h2>
                            <div class="indent">
                                <div>
                                    <div class="intro">
                                        <%--用户table--%>
                                        <%--<table class="layui-table" lay-skin="line">
                                            <colgroup>
                                                <col width="150">
                                                <col width="150">
                                                <col width="200">
                                                <col>
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>索书号</th>
                                                <th>条形码</th>
                                                <th>馆藏地</th>
                                                <th>书刊状态</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${requestScope.bclcList}">
                                                <tr>
                                                    <td>${item.bookNO}</td>
                                                    <td>${item.barCode}</td>
                                                    <td>${item.storeAddress}</td>
                                                    <c:if test="${item.status=='可借'}">
                                                        <td style="color: rgb(0, 128, 0);">${item.status}</td>
                                                    </c:if>
                                                    <c:if test="${item.status=='借出'}">
                                                        <td style="color: rgb(255, 0, 0);">${item.status}</td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>--%>
                                        <%--管理员table--%>
                                        <table class="layui-table" lay-skin="line">
                                            <colgroup>
                                                <col width="100">
                                                <col width="100">
                                                <col width="200">
                                                <col>
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>索书号</th>
                                                <th>条形码</th>
                                                <th>馆藏地</th>
                                                <th>书刊状态</th>
                                                <th>书籍借阅</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${requestScope.bclcList}">
                                                <tr>
                                                    <td>${item.bookNO}</td>
                                                    <td>${item.barCode}</td>
                                                    <td>${item.storeAddress}</td>
                                                    <c:if test="${item.status=='可借'}">
                                                        <td style="color: rgb(0, 128, 0);">${item.status}</td>
                                                    </c:if>
                                                    <c:if test="${item.status=='借出'}">
                                                        <td style="color: rgb(255, 0, 0);">${item.status}</td>
                                                    </c:if>
                                                    <td>
                                                        <button class="layui-btn" onclick="borrowBook(this)">借阅</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <%--猜你喜欢--%>
                            <div class="subject_show">
                                <h2>
                                    <span>喜欢读"<c:out value="${requestScope.book.bookName}"/>"的人也喜欢</span>
                                    &nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
                                </h2>
                                <div class="content clearfix" id="guessYouLikeByThis">

                                </div>
                            </div>
                        </div>
                    </div>
                    <%--右边，即侧边栏--%>
                    <div class="right">
                        <%--作者作品--%>
                        <div id="authorBook" class="right mb40">
                            <div class="rankTitle">
                                <h3>作者作品</h3>
                            </div>
                            <div class="tabWrap channelList">
                                <div class="rankListWrap">
                                    <ul class="rankList rankHover numList">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%--编辑推荐--%>
                        <div id="totalHits" class="right mb40">
                            <div class="rankTitle">
                                <h3>编辑推荐</h3>
                            </div>
                            <div class="tabWrap channelList">
                                <div class="rankListWrap">
                                    <ul class="rankList rankHover numList">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%--同类作品排行--%>
                        <%--<div id="similarBooks" class="right mb40">
                            <div class="rankTitle">
                                <h3>同类作品排行</h3>
                            </div>
                            <div class="tabWrap channelList">
                                <div class="rankListWrap">
                                    <ul class="rankList rankHover numList">

                                    </ul>
                                </div>
                            </div>
                        </div>--%>
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
    $(function () {
        giveMark();
        authorBook();
        totalHits();
        hotBorrow();
        guessYouLikeByThis();
    });
    layui.use(['form', 'element', 'flow'], function () {
        var $ = layui.jquery;//不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var form = layui.form();
        var element = layui.element();
        var flow = layui.flow;
    });
    // ------左边start------

    // 评分
    function giveMark() {
        $("#star1").hover(function () {
            $("#star1").attr('src', "../images/icon/star_onmouseover.png");
            $("#rateword").html("很差");
        }, function () {
            $("#star1").attr('src', "../images/icon/star_hollow.png");
            $("#rateword").html("");
        });
        $("#star2").hover(function () {
            $("#star1").attr('src', "../images/icon/star_onmouseover.png");
            $("#star2").attr('src', "../images/icon/star_onmouseover.png");
            $("#rateword").html("较差");
        }, function () {
            $("#star1").attr('src', "../images/icon/star_hollow.png");
            $("#star2").attr('src', "../images/icon/star_hollow.png");
            $("#rateword").html("");
        });
        $("#star3").hover(function () {
            $("#star1").attr('src', "../images/icon/star_onmouseover.png");
            $("#star2").attr('src', "../images/icon/star_onmouseover.png");
            $("#star3").attr('src', "../images/icon/star_onmouseover.png");
            $("#rateword").html("还行");
        }, function () {
            $("#star1").attr('src', "../images/icon/star_hollow.png");
            $("#star2").attr('src', "../images/icon/star_hollow.png");
            $("#star3").attr('src', "../images/icon/star_hollow.png");
            $("#rateword").html("");
        });
        $("#star4").hover(function () {
            $("#star1").attr('src', "../images/icon/star_onmouseover.png");
            $("#star2").attr('src', "../images/icon/star_onmouseover.png");
            $("#star3").attr('src', "../images/icon/star_onmouseover.png");
            $("#star4").attr('src', "../images/icon/star_onmouseover.png");
            $("#rateword").html("推荐");
        }, function () {
            $("#star1").attr('src', "../images/icon/star_hollow.png");
            $("#star2").attr('src', "../images/icon/star_hollow.png");
            $("#star3").attr('src', "../images/icon/star_hollow.png");
            $("#star4").attr('src', "../images/icon/star_hollow.png");
            $("#rateword").html("");
        });
        $("#star5").hover(function () {
            $("#star1").attr('src', "../images/icon/star_onmouseover.png");
            $("#star2").attr('src', "../images/icon/star_onmouseover.png");
            $("#star3").attr('src', "../images/icon/star_onmouseover.png");
            $("#star4").attr('src', "../images/icon/star_onmouseover.png");
            $("#star5").attr('src', "../images/icon/star_onmouseover.png");
            $("#rateword").html("力荐");
        }, function () {
            $("#star1").attr('src', "../images/icon/star_hollow.png");
            $("#star2").attr('src', "../images/icon/star_hollow.png");
            $("#star3").attr('src', "../images/icon/star_hollow.png");
            $("#star4").attr('src', "../images/icon/star_hollow.png");
            $("#star5").attr('src', "../images/icon/star_hollow.png");
            $("#rateword").html("");
        });
    }
    // 目录 更多 缩小
    function fullCatalog() {
        $("#short_catalog").css("display", "none");
        $("#full_catalog").css("display", "block");
    }
    function shortCatalog() {
        $("#short_catalog").css("display", "block");
        $("#full_catalog").css("display", "none");
    }

    // 书籍借阅
    function borrowBook(thisObj) {
        var td = $(thisObj).parent().parent().find('td');
        var status = td.eq(3).html();
        if (status == "可借") {
            layer.prompt({
                title: "请输入借阅号：",
                offset: "200px"
            }, function (val, index) {
                var bookNO = td.eq(0).html();
                var barCode = td.eq(1).html();
                $.ajax({
                    url: "/book/borrowBook?credNum=" + val + "&barCode=" + barCode + "&bookNO=" + bookNO,
                    type: "post",
                    data: "",
                    dataType: "text",
                    async: false,
                    success: function (data) {
                        if (data == "success") {
                            layer.alert('借阅成功！', {offset: "200px", icon: 1});
                        }
                        if (data == "overMax") {
                            layer.alert('超过最大借阅数！', {offset: "200px", icon: 2});
                        }
                        if (data == "error") {
                            layer.alert('未知错误！', {offset: "200px", icon: 2});
                        }
                    },
                    error: function () {
                        alert("总点击排行榜出错！");
                    }
                });
                layer.close(index);
            });
        } else {
            layer.alert('书籍已借出！', {offset: "200px", icon: 2});
        }
    }

    // 猜你喜欢
    function guessYouLikeByThis() {
        $.ajax({
            url: "/book/guessYouLikeByThis?targetBook=" + ${requestScope.book.bookId},
            type: "post",
            data: "",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data) {
                    var books = data.bl;
                    $("#guessYouLikeByThis dl").remove();
                    var end = books.length;
                    if (end > 10)
                        end = 10;
                    for (var i = 0; i < end; i++) {
                        var book = books[i];
                        var dl;
                        var dl2 = '<dt><a href="/book/findBook?bookId=' + book.bookId + '"><img class="m_sub_img" src="/' + book.bookImage + '"></a></dt><dd><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></dd></dl>';
                        if (i % 5 == 0)
                            dl = '<dl class="">' + dl2;
                        else
                            dl = '<dl class="dl_left">' + dl2;
                        $("#guessYouLikeByThis").append(dl);
                        if (i!=0 && i % 4 == 0)
                            $("#guessYouLikeByThis").append('<dl class="clear"></dl>');
                    }
                }
            },
            error: function () {
                alert("总点击排行榜出错！");
            }
        });
    }


    // ------左边end------

    // ------侧边栏start------

    // 作者作品
    function authorBook() {
        $.ajax({
            url: "/book/authorBook?author=" + "当年明月",
            type: "post",
            data: "",
            dataType: "json",
            async: false,
            success: function (data) {
                if (data) {
                    var books = data.books;
                    $("#authorBook ul li").remove();
                    for (var i = 0; i < books.length; i++) {
                        var book = books[i];
                        if (i == 0)
                            var li = '<li><div class="hoverHide" style="display: none;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></div><div class="detailWrap" style="display: block;"><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        else
                            var li = '<li><div class="hoverHide" style="display: block;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></div><div class="detailWrap" style="display: none;"><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        $("#authorBook ul ").append(li);
                    }
                }
            },
            error: function () {
                alert("总点击排行榜出错！");
            }
        });
        $("#authorBook ul li").hover(function () {
            $("#authorBook .hoverHide").css("display", "block");
            $("#authorBook .detailWrap").css("display", "none");
            $(this).children('.hoverHide').css("display", "none");
            $(this).children('.detailWrap').css("display", "block");
        });
    }
    // 编辑推荐
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
                            var li = '<li><div class="hoverHide" style="display: none;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></div><div class="detailWrap" style="display: block;"><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        else
                            var li = '<li><div class="hoverHide" style="display: block;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></div><div class="detailWrap" style="display: none;"><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
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
                            var li = '<li><div class="hoverHide" style="display: none;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></div><div class="detailWrap" style="display: block;"><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
                        else
                            var li = '<li><div class="hoverHide" style="display: block;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></div><div class="detailWrap" style="display: none;"><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
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
    /*function similarBooks() {
     $.ajax({
     url: "/book/similarBooks?cnum=" + "K",
     type: "post",
     data: "",
     dataType: "json",
     async: false,
     success: function (data) {
     if (data) {
     var books = data.books;
     $("#similarBooks ul li").remove();
     var length;
     if (books.length > 10)
     length = 10;
     else
     length = books.length;
     for (var i = 0; i < length; i++) {
     var book = books[i];
     if (i == 0)
     var li = '<li><div class="hoverHide" style="display: none;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></div><div class="detailWrap" style="display: block;"><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
     else
     var li = '<li><div class="hoverHide" style="display: block;"><em>' + book.searchNum + '</em><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></div><div class="detailWrap" style="display: none;"><span class="num">' + (i + 1) + '</span><a href="/book/findBook?bookId=' + book.bookId + '"><img src="../' + book.bookImage + '"></a><div class="detailInfo"><h4><a href="/book/findBook?bookId=' + book.bookId + '">' + book.bookName + '</a></h4><p>作者：<i>' + book.author + '</i></p><p>编号：<i>' + book.bookNO + '</i></p></div></div></li>';
     $("#similarBooks ul ").append(li);
     }
     }
     },
     error: function () {
     alert("总点击排行榜出错！");
     }
     });
     $("#similarBooks ul li").hover(function () {
     $("#similarBooks .hoverHide").css("display", "block");
     $("#similarBooks .detailWrap").css("display", "none");
     $(this).children('.hoverHide').css("display", "none");
     $(this).children('.detailWrap').css("display", "block");
     });
     }*/
    // ------侧边栏end------

</script>
</body>
</html>
