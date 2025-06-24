<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/main/mainMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>成績登録完了</title>
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>成績登録が完了しました</h2>
    <p>学生ID: ${test.studentId}</p>
    <p>科目ID: ${test.subjectId}</p>
    <p>点数: ${test.score}</p>
    <a href="grade_create.jsp">続けて登録する</a>
    <a href="/top.jsp">メニューに戻る</a>
</div>
</body>
</html>
