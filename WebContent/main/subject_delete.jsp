<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>

	    <meta charset="UTF-8">
	    <title>科目情報削除</title>


		<!-- Base-header.jspの適用 -->
		<jsp:include page="Base-header.jsp" />

		<!-- Base-sidebar.jspの適用 -->
    	<jsp:include page="Base-sidebar.jsp" />

	</head>

	<body>

	    <h2>科目情報削除</h2>

		<!-- 削除する科目の名前を確認をする -->
	    <p>「${subject.name}(${subject.cd})」を削除してよろしいですか？</p>

	    <!-- 削除ボタン -->
	    <form action="SubjectDelete.action" method="post">
	        <input type="hidden" name="subjectId" value="${subject.cd}">
	        <button type="submit">削除</button>
	    </form>

	    <!-- 科目一覧に戻るリンク -->
	    <p><a href="SubjectList.action">戻る</a></p>

	</body>

</html>