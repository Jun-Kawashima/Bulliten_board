<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新規投稿</title>
</head>
<body>

<div class="main-contents">
<c:if test="${ not empty errorMessage }">
	<div class="${ errorMessages }">
		<ul>
			<c:forEach items="${ errorMessages }" var="message">
					<c:out value="${ message }"/>
			</c:forEach>
		</ul>
	</div>
	<c:remove var="errorMessages" scope="session"/>
</c:if>
<form action="new-post" method="post">
	<label for="object">件名</label><br/>
	<input name="object" id="object">(50文字以下)<br/>
	<br/>
	<label for="text">本文</label><br/>
	<input name="text" id="text">(1000文字以下)<br/>
	<textarea name = "text" rows="20" cols="300" class ="text-box"></textarea><br/>
	<br/>
	<label for="category">カテゴリー</label><br/>
	<input name="category" id="category">(10文字以下)<br/>
	<br/>
</form>
<input type="submit" value="投稿"><a href="ホーム画面">戻る</a> <br />

<div class = "messages">
	<c:forEach items = "${ messages }" var = "message">
		<div class = "message">
			<div class = "account-name">
				<span class ="account"><c:out value = "${ message.account }" /></span>
				<span class ="name"><c:out value = "${ message.name }" /></span>
			</div>
			<div class = "text"><c:out value = "${ message.text }" /></div>
			<div class = "date"><fmt:formatDate value = "${ message.insertDate }" pattern = "yyyy/MM/dd HH:mm:ss" /></div>
		</div>
	</c:forEach>
</div>

<div class = "copyright">Copyright (c)Jun kawashima</div>
</div>
</body>
</html>