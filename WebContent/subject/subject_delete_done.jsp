<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
    	<title>得点管理システム</title>

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

			<p>削除が完了しました。</p>

		    <!-- 科目一覧に戻るリンク -->
		    <p><a href="subjectList.jsp" class="right">戻る</a></p>
			</div>
		</div>
	</body>

	<!-- Base-footer.jspの適用 -->
	<jsp:include page="/Base-footer.jsp" />
</html>