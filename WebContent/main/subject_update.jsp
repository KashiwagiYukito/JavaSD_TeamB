<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目情報変更</title>
</head>
<body>
    <div class="container">
        <h2>科目情報変更</h2>
        <form action="SubjectUpdateExecute.action" method="post">
            <%-- 変更対象の科目コードをhiddenで送信 --%>
            <input type="hidden" name="cd" value="${subject.cd}">

            <div class="form-group">
                <label>科目コード</label>
                <p><c:out value="${subject.cd}" /></p>
            </div>
            <div class="form-group">
                <label for="name">科目名</label>
                <input type="text" id="name" name="name" value="<c:out value="${subject.name}" />" required>
            </div>

            <div class="button-group">
                <button type="submit" class="button-save">変更</button><br>
                <a href="SubjectList.action" class="button-back">戻る</a>
            </div>
        </form>
    </div>
</body>
</html>
