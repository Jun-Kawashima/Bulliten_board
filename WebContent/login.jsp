<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored ="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>掲示板へログイン</title>
</head>
<body>
<div class="main-contents">

<c:if test= "${ not empty errorMessages }">
	<div class = "errorMessages">
		<ul>
			<c:forEach items="${ errorMesseges }" var="messege">
				<c:out value="${ message }"/>
			</c:forEach>
		</ul>
	</div>
	<c:remove var="errorMessage" scope="session"/>
</c:if>

<form action="login" method="post"><br/>
	<h4>ログインID</h4>
	<input name="account" id="account"/><br/>

	<h4>パスワード</h4>
	<input name="password" id="password"><br/>
</form>
</div>
</body>
</html>