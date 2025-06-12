<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生登録</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>学生登録</h2>

    <form action="StudentRegisterServlet" method="post">
        <label for="studentNo">学生番号:</label>
        <input type="text" id="studentNo" name="studentNo" maxlength="10" required>
        <br>

        <label for="name">氏名:</label>
        <input type="text" id="name" name="name" maxlength="30" required>
        <br>

        <label for="enrollmentYear">入学年度:</label>
        <select id="enrollmentYear" name="enrollmentYear">
            <%
                int currentYear = java.time.Year.now().getValue();
                for (int year = currentYear - 10; year <= currentYear + 10; year++) {
            %>
                <option value="<%= year %>"><%= year %></option>
            <% } %>
        </select>
        <br>

        <label for="classNum">クラス:</label>
        <select id="classNum" name="classNum">
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
        </select>
        <br>

        <input type="submit" value="登録">
    </form>

    <br>
    <a href="StudentListServlet">学生一覧へ戻る</a>

</body>
</html>