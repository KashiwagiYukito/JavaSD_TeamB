<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生登録</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <%@ include file="Base-header.jsp" %>

    <h2>学生登録</h2>

    <% if (request.getAttribute("errorMessage") != null) { %>
        <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
    <% } %>

    <form action="<%= request.getContextPath() %>/main/StudentRegisterServlet" method="post">
        <label for="studentNo">学生番号:</label>
        <input type="text" id="studentNo" name="studentNo" maxlength="10" required>
        <br>

        <label for="name">氏名:</label>
        <input type="text" id="name" name="name" maxlength="30" required>
        <br>

        <label for="enrollmentYear">入学年度:</label>
        <input type="text" id="enrollmentYear" name="enrollmentYear" maxlength="4" required>
        <br>

        <label for="classNum">クラス:</label>
        <input type="text" id="classNum" name="classNum" maxlength="10" required>
        <br>

        <input type="submit" value="登録">
    </form>

    <br>
    <a href="<%= request.getContextPath() %>/StudentListServlet">← 学生一覧へ戻る</a>

    <%@ include file="Base-footer.jsp" %>

</body>
</html>