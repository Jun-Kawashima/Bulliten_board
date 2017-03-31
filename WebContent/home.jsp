<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ホーム画面</title>
</head>
<body>
<div class="main-contents">

<div class="header">
	<c:if test="${ id == 1 }">
		<a href="managementUser">ユーザー管理画面</a>
	</c:if>
	<a href="newpost">新規投稿</a>
	<a href="login">ログアウト</a></div>
</div>

</body>
</html>