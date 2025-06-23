<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目情報変更</title>
</head>
<body>
    <h2>科目情報変更</h2>
    <c:if test="${not empty error}">
        <div style="color:red;">${error}</div>
    </c:if>
    <form method="post" action="SubjectUpdate">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="schoolCd" value="${subject.schoolCd}"/>
        <input type="hidden" name="cd" value="${subject.cd}"/>
        <p>学校コード: <b>${subject.schoolCd}</b></p>
        <p>科目コード: <b>${subject.cd}</b></p>
        <p>
            科目名: <input type="text" name="name" value="${subject.name}" required/>
        </p>
        <button type="submit">変更</button>
    </form>
    <br>
    <a href="subject_update.jsp">戻る</a>
</body>
</html>
