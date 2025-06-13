<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報変更</title>
</head>
<body>
    <div class="container">
        <h2>学生情報変更</h2>
        <form action="StudentUpdateExecute.action" method="post">
            <%-- 変更対象の学生番号をhiddenで送信 --%>
            <input type="hidden" name="no" value="${student.no}">

            <div class="form-group">
                <label>入学年度</label>
                <p><c:out value="${student.entYear}" /></p>
            </div>
            <div class="form-group">
                <label>学生番号</label>
                <p><c:out value="${student.no}" /></p>
            </div>
            <div class="form-group">
                <label for="name">氏名</label>
                <input type="text" id="name" name="name" value="<c:out value="${student.name}" />" required>
            </div>
            <div class="form-group">
                <label for="classNum">クラス</label>
                <select id="classNum" name="classNum">
                    <c:forEach var="num" items="${class_num_set}">
                        <option value="${num}" <c:if test="${num == student.classNum}">selected</c:if>>${num}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label><input type="checkbox" name="isAttend" value="true" <c:if test="${student.attend}">checked</c:if>>
                <span class="checkbox-label">在学中</span></label>
            </div>

            <div class="button-group">
                <a href="StudentList.action" class="button-back">戻る</a>
                <button type="submit" class="button-save">変更</button>
            </div>
        </form>
    </div>
</body>
</html>
