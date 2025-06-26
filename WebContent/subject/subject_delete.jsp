<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>

	    <meta charset="UTF-8">
	    <title>得点管理システム</title>

		<!-- cssの適用 -->
	    <link rel="stylesheet" type="text/css" href="css/style.css">

	</head>

	<body>

		<!-- Base-header.jspの適用 -->
		<jsp:include page="/Base-header.jsp" />

		<!-- メインレイアウト -->
		<div class="main-flex">

	    	<!-- Base-sidebar.jspの適用 -->
	    	<div class="sidebar-area">
	    		<jsp:include page="/Base-sidebar.jsp" />
			</div>

			 <!-- 右：メインコンテンツ -->
        	<div class="main-menu-main">


	    	<div class="main-menu-header">科目情報削除</div>

			<!-- 削除する科目の名前を確認をする -->
		    <p>「${subject.name}(${subject.cd})」を削除してよろしいですか？</p>

		    <!-- 削除ボタン -->
		    <form action="subject_delete_done.jsp" method="post">
		        <input type="hidden" name="subjectId" value="${subject.cd}">
		        <button type="submit">削除</button>
		    </form>

		    <!-- 科目一覧に戻るリンク -->
		    <p><a href="subjectList.jsp" class="right">科目一覧へ</a></p>
			</div>
		</div>
	</body>

	<!-- Base-footer.jspの適用 -->
	<jsp:include page="/Base-footer.jsp" />

</html>