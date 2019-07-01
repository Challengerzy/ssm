<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>文件上传</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/file/upload1" method="post" enctype="multipart/form-data">
    请选择文件,springMVC: <input type="file" name="upload">
    <input type="submit" value="上传">
</form>

<form action="${pageContext.request.contextPath}/file/upload2" method="post" enctype="multipart/form-data">
    请选择文件,跨服务器: <input type="file" name="upload">
    <input type="submit" value="上传">
</form>
</body>
</html>
