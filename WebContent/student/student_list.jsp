<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>

	    <meta charset="UTF-8">
	    <title>学生管理</title>

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

            <!-- タイトル -->
            <div class="main-menu-header">学生管理</div>

            <!-- 新規登録リンク -->
            <a href="student_register.jsp" class="main-menu-link">新規登録</a>


		    <form action="StudentList.action" method="post">

			    <!-- 学生情報の絞り込み -->

			    <div class="row">

				    <!-- 入学年度 -->
		            <label for="entYear">入学年度</label>
		            <select name="f1" id="entYear">
		                <option value="">--------</option>
		                <!-- 必要に応じてJSTLで選択肢を動的生成 -->

		            </select>

				    <!-- クラス -->
		            <label for="classCd">クラス</label>
		            <select name="f2" id="classCd">
		                <option value="">--------</option>
		                <!-- 必要に応じてJSTLで選択肢を動的生成 -->

		            </select>

		            <!-- 在学中？ -->
		            <input type="checkbox" name="f3" id="isActive" value="true">
					<label for="isActive">在学中</label>

					<!-- 絞り込みボタン -->
					<button type="submit">絞り込み</button>

		        </div>
	    	</form>
		</div>

			<!-- 学生一覧表示部分 -->
			<div id="studentTableArea">
			    <c:if test="${not empty studentList}">
			        <table>
			            <tr>
			                <th>入学年度</th>
			                <th>学生番号</th>
			                <th>氏名</th>
			                <th>クラス</th>
			                <th>在学中</th>
			                <th>操作</th>
			            </tr>

			            <c:forEach var="s" items="${studentList}">
			                <tr>
			                    <td>${s.enrollmentYear}</td>
			                    <td>${s.studentNo}</td>
			                    <td>${s.name}</td>
			                    <td>${s.classNum}</td>
			                    <td>
			                        <c:choose>
			                            <c:when test="${s.active}">○</c:when>
			                            <c:otherwise>×</c:otherwise>
			                        </c:choose>
			                    </td>
			                    <td><a href="StudentEditServlet?studentNo=${s.studentNo}">変更</a></td>
			                </tr>
			            </c:forEach>
			        </table>
			    </c:if>
			</div>

		</div>

		<!-- Base-footer.jspの適用 -->
		<jsp:include page="/Base-footer.jsp" />


	</body>

</html>