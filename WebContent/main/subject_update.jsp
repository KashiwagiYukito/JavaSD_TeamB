<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目コード選択</title>
</head>
<body>
    <h2>変更する科目を選択してください</h2>
    <c:if test="${not empty error}">
        <div style="color:red;">${error}</div>
    </c:if>
    <form method="post" action="SubjectUpdate">
        <input type="hidden" name="action" value="select"/>
        <label>科目コード：</label>
        <select name="cd" required>
            <option value="">----選択----</option>
            <c:forEach var="subject" items="${subjectList}">
                <option value="${subject.cd}">${subject.cd}</option>
            </c:forEach>
        </select>
        <button type="submit">編集</button>
    </form>
    <br>
    <a href="subjectList.jsp">一覧に戻る</a>
</body>
</html>
