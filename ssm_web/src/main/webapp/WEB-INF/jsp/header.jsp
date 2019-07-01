<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        .nav {
            background-color: #F8F8F8;
            height: 40px;
        }

        #home {
            font-size: 23px;
            color: black;
            margin-left: 20px;
        }

        #logout {
            float: right;
            margin-right: 20px;
            margin-top: 10px;
        }

        #username {
            font-size: 18px;
            float: right;
            margin-right: 30px;
            margin-top: 5px;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="nav">
        <div class="title">
            <span id="home">
            <a href="${pageContext.request.contextPath}/book/findAll">首页</a>
            </span>
            <span id="logout">
                <a href="${pageContext.request.contextPath}/user/logout">退出</a>
            </span>
            <span id="username">
                ${sessionScope.username},你好
            </span>
        </div>

    </div>
</div>

</body>
</html>
