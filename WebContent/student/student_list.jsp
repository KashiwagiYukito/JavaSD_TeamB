<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>

	    <meta charset="UTF-8">
	    <title>得点管理システム</title>

	    <!-- cssの適用 -->
	    <link rel="stylesheet" type="text/css" href="css/style.css">

		<!-- ここに直接スタイルを記述 -->
		    <style>
			/* タイトルと新規登録リンク横並び */
			.filter-header {
			    display: flex;
			    justify-content: space-between;
			    align-items: center;
			    margin-bottom: 16px;
			    width: 100%;
			    max-width: 3000px; /* 学生管理の背景 */
			}

			.register-link {
			    font-weight: bold;
			    text-decoration: none;
			    color: #007bff;
			    margin-left: 500px; /* 右寄せ */
			}

			.register-link:hover {
			    text-decoration: underline;
			}

			/* 絞り込みフォーム全体 */
			.filter-form {
			    display: flex;
			    gap: 30px;
			    align-items: flex-end;
			    flex-wrap: nowrap;  /* 折り返させない */
			    max-width: 640px;

			}

			/* 各項目共通の枠 */
			.form-group {
			    display: flex;
			    flex-direction: column;
			    min-width: 250px; /* 入力フォームの横幅調整 */
			}

			/* チェックボックス */
			.checkbox-group {
			    display: flex;
			    align-items: center;
			    height: 36px;
			}

			.checkbox-group input[type="checkbox"] {
			    margin-right: 6px;
			    width: 16px;
			    height: 16px;
			}

			/* セレクトボックスとボタン */
			.form-group select,
			.submit-button {
			    height: 36px;
			    padding: 4px 8px;
			    border: 1px solid #ccc;
			    border-radius: 4px;
			}

			.form-group label {
			    height: 20px;
			    font-size: 0.9rem;
			    margin-bottom: 4px;
			}

			.submit-button {
			    height: 36px;
			    padding: 4px 8px; /* 内側の余白 */
			    background-color: #6c757d;
			    color: #fff;
			    font-weight: bold;
			    border: none;
			    border-radius: 4px;
			    cursor: pointer;
			    min-width: 80px; /* 必要最小限の幅を設定 */
			    width: auto; /* 必要に応じて調整 */
			}

			.submit-button:hover {
			    background-color: #5a6268;
			}

			.main-menu-header {
			    font-size: 1.2rem;
			    font-weight: bold;
			    margin: 0;
			    padding: 0;
			    line-height: 36px; /* ボタンやセレクトと高さを合わせる */
			}

		    </style>

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
				<!-- タイトルと新規登録を横並び -->
				<div class="filter-header">
				    <div class="main-menu-header">学生管理</div>
				</div>

				<div class="register-link">
				    <a href="student_register.jsp" class="register-link">新規登録</a>
				</div>

				<!-- 絞り込みフォーム -->
			    <form action="${pageContext.request.contextPath}/student/student_list" method="post">
				    <div class="filter-form">

				        <!-- 入学年度 -->
				        <div class="form-group">
				            <label for="entYear">入学年度</label>
				            <select name="f1" id="entYear">
				                <option value="">--------</option>
				            </select>
				        </div>

				        <!-- クラス -->
				        <div class="form-group">
				            <label for="classCd">クラス</label>
				            <select name="f2" id="classCd">
				                <option value="">--------</option>
				            </select>
				        </div>

				        <!-- 在学中 -->
				        <div class="form-group">
				            <label>&nbsp;</label>
				            <div class="checkbox-group">
				                <input type="checkbox" name="f3" id="isActive" value="true">
				                <label for="isActive">在学中</label>
				            </div>
				        </div>

				        <!-- 絞り込み -->
				        <div class="form-group">
				            <label>&nbsp;</label>
				            <button type="submit" class="submit-button">絞込み</button>
				        </div>
				    </div>
				</form>
			</div>

			<!-- 学生一覧表示部分 -->
			<div id="studentTableArea">
			    <c:if test="${not empty studentList}">

			    <!-- ここに追加 -->
		        <p style="margin: 10px 0 20px 0; font-weight: bold;">
		            検索結果：${fn:length(studentList)}件
		        </p>
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
			                    <td>${s.studentNo}</td>
								<td>${s.enrollmentYear}</td>
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
