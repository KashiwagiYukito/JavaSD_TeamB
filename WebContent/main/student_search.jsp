<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Search Page</title>
</head>
<body>
    <h2>成績管理</h2>
    <form action="StudentRegisterServlet" method="post">
        <label for="studentNo">入学年度:</label>

        <select id="enrollmentYear" name="enrollmentYear">
    <option value="">-----</option>
    <%
        int currentYear = java.time.Year.now().getValue();
        for (int year = currentYear - 10; year <= currentYear + 10; year++) {
    %>
        <option value="<%= year %>"><%= year %></option>
    <%
        }
    %>
</select>
        <br></form>
</body>
</html>