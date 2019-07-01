<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
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
        td, th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">图书信息列表</h3>

    <div style="float: left;margin:8px">
        <form class="form-inline"
              action="${pageContext.request.contextPath}/findUsersByPageServlet?rows=${pageBean.rows}" method="post"
              id="query">
            <div class="form-group">
                <label for="name">书名</label>
                <input type="text" class="form-control" id="name" name="name" value="${condition.name[0]}">
            </div>
            <div class="form-group">
                <label for="address">出版社</label>
                <input type="text" class="form-control" id="address" name="address" value="${condition.address[0]}">
            </div>
            <div class="form-group">
                <label for="email">单价</label>
                <input type="email" class="form-control" id="email" name="email" value="${condition.email[0]}">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>

    <div style="float: right;margin: 8px">
        <a class="btn btn-primary" href="add.jsp">添加联系人</a>
        <a class="btn btn-primary" href="javaScript:deleteUser();">删除选中</a>
    </div>

    <form action="${pageContext.request.contextPath}/deleteUserServlet" method="post" id="form">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th>
                    <label>
                        <input type="checkbox" id="firstCheckbox">
                    </label>
                </th>
                <th>编号</th>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>价格</th>
                <th>分类</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${books}" var="book" varStatus="b">
                <tr>
                    <td>
                        <label>
                            <input type="checkbox" name="id" value="${book.id}">
                        </label>
                    </td>
                    <td>${b.count}</td>
                    <td>${book.bookname}</td>
                    <td>${book.author}</td>
                    <td>${book.company}</td>
                    <td>&yen;${book.price}</td>
                    <td>${book.kind.kname}</td>
                    <td>
                        <a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/deleteUserServlet?id='${user.id}'"
                           onclick="return confirm('确认删除 ${user.name} 吗?')">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <%--分页--%>
    <nav>
        <ul class="pagination">


            <%--判断是否是第一页--%>
            <c:if test="${pageBean.currentPage==1}">
                <li class="disabled">
                    <a aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>

            <%--不是第一页,则可以点击上一页--%>
            <c:if test="${pageBean.currentPage!=1}">
                <li>
                    <a href="${pageContext.request.contextPath}/findUsersByPageServlet?currentPage=${pageBean.currentPage-1}&rows=${pageBean.rows}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>

            <%--左 2 右 2--%>
            <c:choose>
                <c:when test="${pageBean.totalPage<=5}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="${pageBean.totalPage}"/>
                </c:when>

                <c:otherwise>
                    <c:set var="begin" value="${pageBean.currentPage}"/>
                    <c:set var="end" value="${pageBean.currentPage}"/>

                    <c:if test="${begin-3<=0}">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="5"/>
                    </c:if>

                    <c:if test="${begin-3>0}">
                        <c:if test="${end+2>=pageBean.totalPage}">
                            <c:set var="begin" value="${pageBean.totalPage-4}"/>
                            <c:set var="end" value="${pageBean.totalPage}"/>
                        </c:if>

                        <c:if test="${end+2<pageBean.totalPage}">
                            <c:set var="begin" value="${begin-2}"/>
                            <c:set var="end" value="${end+2}"/>
                        </c:if>
                    </c:if>


                </c:otherwise>
            </c:choose>

            <%--左 2 右 2--%>
            <c:forEach begin="${begin}" end="${end}" step="1" var="i">
                <%--判断是否是当前页面,当前页面高亮--%>
                <c:choose>
                    <c:when test="${i==pageBean.currentPage}">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/findUsersByPageServlet?currentPage=${i}&rows=${pageBean.rows}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a>
                        </li>
                    </c:when>
                    <%--不是当前页--%>
                    <c:otherwise>
                        <li>
                            <a href="${pageContext.request.contextPath}/findUsersByPageServlet?currentPage=${i}&rows=${pageBean.rows}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <%--判断是否是最后一页--%>
            <c:if test="${pageBean.currentPage==pageBean.totalPage}">
                <li class="disabled">
                    <a aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

            <%--不是最后一页,则可以点击下一页--%>
            <c:if test="${pageBean.currentPage!=pageBean.totalPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/findUsersByPageServlet?currentPage=${pageBean.currentPage+1}&rows=${pageBean.rows}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

            <span style="margin-left: 10px">
                     每页显示
                    <select name="rows" onchange="chooseRow();" id="select">
                        <option value="3" ${pageBean.rows=="3"?"selected":""}>3</option>
                        <option value="5" ${pageBean.rows=="5"?"selected":""}>5</option>
                        <option value="6" ${pageBean.rows=="6"?"selected":""}>6</option>
                        <option value="7" ${pageBean.rows=="7"?"selected":""}>7</option>
                    </select>
                     条
            </span>
            <span style="font-size: 22px;margin-left: 10px">
                共${requestScope.pageBean.totalCount}条记录,共${requestScope.pageBean.totalPage}页
            </span>
        </ul>
    </nav>

</div>

<script>

    var first = document.getElementById("firstCheckbox");
    var other = document.getElementsByTagName("input");

    first.onclick = function () {
        for (var i = 0; i < other.length; i++) {
            other[i].checked = first.checked;
        }
    };


    function deleteUser() {
        var f = false;
        for (var i = 0; i < other.length; i++) {
            if (other[i].checked) {
                f = true;
                break;
            }
        }

        if (!f) {
            alert("没有条目被选中!");
            return;
        }

        if (confirm("确认删除所选条目吗?")) {
            document.getElementById("form").submit();
        }
    }


    function chooseRow() {
        var rows = document.getElementById("select").value;
        var name = document.getElementsByName("name")[0].value;
        var address = document.getElementsByName("address")[0].value;
        var email = document.getElementsByName("email")[0].value;

        location.href = "${pageContext.request.contextPath}/findUsersByPageServlet?rows=" + rows
            + "&name=" + name + "&address=" + address + "&email=" + email;
    }

</script>
</body>
</html>
