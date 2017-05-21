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
            margin-right: 15px;
            margin-top: 15px;
            position: relative;
            background-color: #fcfcfc;
            line-height: 60px;
            width: 120px;
            text-align: center;
        }
        .layui-flow-more {
            text-align: center;
            position: relative;
            top: 20px;
            right: 10px;
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
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>三国(217)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>东野圭吾(217)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>平凡世界(119)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>白夜行(102)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>java(76)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>三国(217)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>东野圭吾(217)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>平凡世界(119)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>白夜行(102)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>java(76)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>三国(217)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>东野圭吾(217)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>平凡世界(119)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>白夜行(102)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>java(76)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>三国(217)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>东野圭吾(217)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>平凡世界(119)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>白夜行(102)</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item">
                                <a>
                                    <span>java(76)</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="layui-tab-item">
                    <ul id="hotBorrow" class="flow">
                        <li>
                            <div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;border: 1px solid #f2f2f2;">
                                <a>
                                    <div class="mainpic">
                                        <img src="../images/book/b2.jpg" style="width: 107px">
                                    </div>
                                    <div class="info">
                                        <span>书名：</span>
                                        蔡康永的说话之道
                                        <br>
                                        <span>作者：</span>
                                        蔡康永
                                        <br>
                                        <span>出版社：</span>
                                        湖南文艺出版社
                                        <br>
                                        <span>出版年：</span>
                                        2014-7-1
                                        <br>
                                        <span>页数：</span>
                                        224
                                        <br>
                                        <span>定价：</span>
                                        30.00元
                                        <br>
                                        <span>豆瓣评分：</span>
                                        7.2
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li style="margin-left: 340px;">
                            <div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;border: 1px solid #f2f2f2;">
                                <a>
                                    <div class="mainpic">
                                        <img src="../images/book/b2.jpg" style="width: 107px">
                                    </div>
                                    <div class="info">
                                        <span>书名：</span>
                                        蔡康永的说话之道
                                        <br>
                                        <span>作者：</span>
                                        蔡康永
                                        <br>
                                        <span>出版社：</span>
                                        湖南文艺出版社
                                        <br>
                                        <span>出版年：</span>
                                        2014-7-1
                                        <br>
                                        <span>页数：</span>
                                        224
                                        <br>
                                        <span>定价：</span>
                                        30.00元
                                        <br>
                                        <span>豆瓣评分：</span>
                                        7.2
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;border: 1px solid #f2f2f2;">
                                <a>
                                    <div class="mainpic">
                                        <img src="../images/book/b2.jpg" style="width: 107px">
                                    </div>
                                    <div class="info">
                                        <span>书名：</span>
                                        蔡康永的说话之道
                                        <br>
                                        <span>作者：</span>
                                        蔡康永
                                        <br>
                                        <span>出版社：</span>
                                        湖南文艺出版社
                                        <br>
                                        <span>出版年：</span>
                                        2014-7-1
                                        <br>
                                        <span>页数：</span>
                                        224
                                        <br>
                                        <span>定价：</span>
                                        30.00元
                                        <br>
                                        <span>豆瓣评分：</span>
                                        7.2
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li style="margin-left: 340px;">
                            <div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;border: 1px solid #f2f2f2;">
                                <a>
                                    <div class="mainpic">
                                        <img src="../images/book/b2.jpg" style="width: 107px">
                                    </div>
                                    <div class="info">
                                        <span>书名：</span>
                                        蔡康永的说话之道
                                        <br>
                                        <span>作者：</span>
                                        蔡康永
                                        <br>
                                        <span>出版社：</span>
                                        湖南文艺出版社
                                        <br>
                                        <span>出版年：</span>
                                        2014-7-1
                                        <br>
                                        <span>页数：</span>
                                        224
                                        <br>
                                        <span>定价：</span>
                                        30.00元
                                        <br>
                                        <span>豆瓣评分：</span>
                                        7.2
                                    </div>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="layui-tab-item">3</div>
            </div>
        </div>
    </div>
</div>
<script src="../js/layui/layui.js"></script>
<script>
    layui.use(['form', 'element', 'flow'], function () {
        var $ = layui.jquery;//不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var form = layui.form();
        var element = layui.element();
        var flow = layui.flow;
        flow.load({
            elem: '#hotSearch' //流加载容器
            , done: function (page, next) { //执行下一页的回调
                //模拟数据插入
                setTimeout(function () {
                    var lis = [];
                    for (var i = 0; i < 20; i++) {
                        lis.push('<li> <div class="nav-item"> <a> <span class="nav-txt">三国(217)</span> </a> </div> </li>')
                    }
                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < 10); //假设总页数为 10
                }, 500);
            }
        });
        flow.load({
            elem: '#hotBorrow' //流加载容器
            , done: function (page, next) { //执行下一页的回调
                //模拟数据插入
                setTimeout(function () {
                    var lis = [];
                    for (var i = 0; i < 6; i++) {
                        if (i%2==0)
                            lis.push('<li><div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;"><a><div class="mainpic"><img src="../images/book/b2.jpg" style="width: 107px"></div><div class="info"><span>书名：</span>蔡康永的说话之道<br><span>作者：</span>蔡康永<br><span>出版社：</span>湖南文艺出版社<br><span>出版年：</span>2014-7-1<br><span>页数：</span>224<br><span>定价：</span>30.00元<br><span>豆瓣评分：</span>7.2</div></a></div></li>');
                        else
                            lis.push('<li style="margin-left: 340px;"><div class="nav-item" style="text-align: left;width: 300px;height: 166.4px;line-height: 0px;border: 1px solid #f2f2f2;"><a><div class="mainpic"><img src="../images/book/b2.jpg" style="width: 107px"></div><div class="info"><span>书名：</span>蔡康永的说话之道<br><span>作者：</span>蔡康永<br><span>出版社：</span>湖南文艺出版社<br><span>出版年：</span>2014-7-1<br><span>页数：</span>224<br><span>定价：</span>30.00元<br><span>豆瓣评分：</span>7.2</div></a></div></li>');

                    }
                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < 10); //假设总页数为 10
                }, 500);
            }
        });
    });
</script>
</body>
</html>
