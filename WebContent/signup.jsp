<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザー新規登録</title>
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
<form action="signup" method="post">
	<label for="name">名前</label><br/>
	<input name="name" id="name">(10文字以下)<br/>
	<br/>
	<label for="account">アカウントID</label><br/>
	<input name="account" id="account">(半角英数字6～20字)<br/>
	<br/>
	<label for="password">登録用パスワード</label><br/>
	<input name="password" id="password">(記号含む半角6文字以上255文字以下)<br/>
	<br/>
	<label for="password">確認用パスワード</label><br/>
	<input name="password" id="password">(確認のため、もう一度入力してください)<br/>
	<br/>
	<label for="branch">支店名</label><br/>
	<select name="department">
	<option value="本社">本社</option>
	<option value="支店A">支店A</option>
	<option value="支店B">支店B</option>
	<option value="支店C">支店C</option>
	</select><br/>
	<br/>
	<label for="department">部署</label><br/>
	<select name="department">
	<option value="総務人事担当者">総務人事担当者</option>
	<option value="情報管理担当者">情報管理担当者</option>
	<option value="店長">店長</option>
	<option value="社員">社員</option>
	</select><br/>
	<br/>

	<input type="submit" value="登録"/><br/>
	<a href="ユーザー管理画面のjsp">戻る</a>
</form>
<div class="copyright">Copyright(c)Jun Kawashima</div>
</div>
</body>
</html>