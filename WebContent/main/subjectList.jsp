<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目一覧</title>
</head>
<body>
    <h2>科目一覧</h2>
    <c:if test="${not empty error}">
        <div style="color:red;">${error}</div>
    </c:if>
    <table border="1">
        <tr>
            <th>科目コード</th>
            <th>科目名</th>
        </tr>
        <c:forEach var="subject" items="${subjectList}">
            <tr>
                <td>${subject.cd}</td>
                <td>${subject.name}</td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <a href="subject_update.jsp">変更</a>
    <a href="subject_delete.jsp">削除</a>
</body>
</html>
