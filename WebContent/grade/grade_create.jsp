<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Base-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>成績登録</title>
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>成績登録</h2>
<form action="<%=request.getContextPath()%>/grade/GradeCreateServlet" method="post">
    <div>
        <label for="student_id">学生:</label>
        <select name="student_id" id="student_id">
            <c:forEach var="student" items="${studentList}">
                <option value="${student.no}">${student.name}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label for="subject_id">科目:</label>
        <select name="subject_id" id="subject_id">
            <c:forEach var="subject" items="${subjectList}">
                <option value="${subject.cd}">${subject.name}</option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label for="score">点数:</label>
        <input type="number" name="score" id="score" required min="0" max="100">
    </div>
    <div>
        <button type="submit">登録</button>
    </div>
</form>

</div>
</body>
</html>
<%@ include file="/Base-footer.jsp" %>
