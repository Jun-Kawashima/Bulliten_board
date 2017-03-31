<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>ホーム</title>
	<script type="text/javascript">
		function stop() {
			if (window.confirm('削除してよろしいですか？')) { // 確認ダイアログを表示
				return true; // 「OK」時は送信を実行
			} else { // 「キャンセル」時の処理
				window.alert('キャンセルされました'); // 警告ダイアログを表示
				return false; // 送信を中止
			}
		}
	</script>
</head>
<body>
<p class="title"><ul align="center"><h1>掲示板</h1></ul></p>
<div class="homeErrorMessages">
	<c:if test="${ not empty errorMessages }">
		<ul>
			<c:forEach items="${ errorMessages }" var="errormessages">
				<c:out value="${ errormessages }" />
			</c:forEach>
		</ul>
	<c:remove var="errorMessages" scope="session" />
	</c:if>
</div>

<div class="header">
	<div class="logout"><a href="logout">ログアウト</a></div><br/>
	<div class="account">
		<span class="name"><c:out value="${ loginUser.name }" /></span>
	</div><br/><br/>
	<div class="managementUser">
		<c:if test="${loginUser.branchId == 1 && loginUser.departmentId == 1}">
			<a href="managementuser">ユーザー管理</a>
		</c:if>
	</div>

	<div class="date">
		<form action="./" method="get">
			<label for="date">日付検索</label>
			 <br />
			 <label><input type="date" name="start" value="${start}"></label>
			  ~
			 <label><input type="date" name="end" value="${end}"></label>
			 <br /><br/>
			 <label for="category">カテゴリ検索</label> <br /> <select name="category">
				<option value="">すべて</option>
				<c:forEach items="${ categories }" var="categories">
					<c:if test="${category == categories.category}">
						<option class="category" value="${ categories.category }"
							selected="${ categories.category }">${ categories.category }</option>
					</c:if>
					<c:if test="${category != categories.category}">
						<option class="category" value="${ categories.category }">${ categories.category }</option>
					</c:if>
				</c:forEach>
			</select> <br /> <input type="submit" value="検索">
		</form>
	</div>
</div>
<br/>
<div class="postLink"><a href="newpost">新規投稿</a></div>


	<c:forEach items="${ messages }" var="message">
		<div class="messages">
			<div class="subject">
				件名:
				<c:out value="${ message.subject }" />
			</div>
			<div class="category">
				カテゴリ:
				<c:out value="${ message.category }" />
			</div>
			<div class="text">
				本文:
				<div class="messageText">
					<c:forEach var="s" items="${fn:split(message.text, '
					')}">
						<div>${s}</div>
					</c:forEach></div>
			</div>
			<br/>

			<div class="messanger">
				投稿者:<c:out value="${ message.name }" /></div>
			<div class="messageTime">
				<fmt:formatDate value="${ message.getCreatedAt() }" pattern="yyyy/MM/dd HH:mm:ss" />
			</div>
			<br/>
			<form action="deletemessage" method="post" onSubmit="return stop()">
				<input type="hidden" name="message.id" value="${ message.id }"></input>
				<c:choose>
					<c:when test="${loginUser.branchId == 1 && loginUser.departmentId == 2}">
						<input  class="messageDelete" type="submit" value="削除"></input>
					</c:when>
					<c:when test="${loginUser.id == message.userId}">
						<input class="messageDelete" type="submit" value="削除"></input>
					</c:when>
					<c:when test="${loginUser.branchId == message.branchId && loginUser.departmentId == 3 && message.departmentId == 4}">
						<input class="messageDelete" type="submit" value="削除"></input>
					</c:when>
				</c:choose>
			</form>
			<br/>

			<c:forEach items="${ comments }" var="comment">
				<c:if test="${ message.id == comment.messageId }">
					<div class="comments">
						<div class="commentText">本文:<br /></div>
							<div class="commentText1">
								<c:forEach var="s" items="${fn:split(comment.text, '
									')}">
									<div>${s}</div>
								</c:forEach>
							</div><br/>
						<div class="commenter">
							投稿者:<c:out value="${ comment.name }" /></div><br/>
						<div class="commentTime">
							<fmt:formatDate value="${ comment.createdAt }" pattern="yyyy/MM/dd HH:mm:ss" />
						</div>
						<br/>
						<div class="commentDelete">
						<form action="deletecomment" method="post" onSubmit="return stop()">
							<input type="hidden" name="comment.id" value="${ comment.id }"></input>
							<c:choose>
								<c:when test="${loginUser.branchId == 1 && loginUser.departmentId == 2}">
									<input  class="commentDelete" type="submit" value="削除"></input>
								</c:when>
								<c:when test="${loginUser.id == comment.userId}">
									<input  class="commentDelete" type="submit" value="削除"></input>
								</c:when>
								<c:when test="${loginUser.branchId == comment.branchId && loginUser.departmentId == 3 && comment.departmentId == 4}">
									<input class="commentDelete" type="submit" value="削除"></input>
								</c:when>
							</c:choose>
						</form>
						</div><br/>
					</div>
				</c:if>
			</c:forEach>

			<div class="form-area">
				<form action="comment" method="post">コメント(500字まで)<br />
					<input type="hidden" name="message_id" value="${ message.id }"></input>
					<textarea name="text" rows="7" cols="119"></textarea><br />
					<input type="submit" value="コメントする">
				</form>
				<br />
			</div>
		</div>
	</c:forEach>

<br />
<br/>
<div class="copyright" align="center">Copyright(c)Jun Kawashima</div>
</body>
</html>