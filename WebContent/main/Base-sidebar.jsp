<%-- Base-sidebar.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>

<<<<<<< HEAD
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>サイドバー</title>
</head>
<body>
    <a href="mainMenu.jsp">メインメニュー</a><br>
    <a href=".jsp">学生管理</a><br>
    <p>成績管理</p>
    <a href=".jsp">成績登録</a><br>
    <a href=".jsp">成績参照</a><br>
    <a href="subjectList.jsp">科目管理</a><br>
</body>
</html>
=======
<%-- サイドバー全体を囲む --%>
<div class="user-sidebar">

    <a href="mainMenu.jsp">メニュー</a>
    <br>
    <a href="StudentList.action">学生管理</a>
    <br>
    <%-- 「成績管理」を見出しとして扱う --%>
    <div class="sidebar-subtitle">成績管理</div>
    <a href="TestRegist.action">成績登録</a>
    <br>
    <a href="TestList.action">成績参照</a>
    <br>
    <a href="SubjectList.action">科目管理</a>
    <br>

</div>
>>>>>>> branch 'master' of https://github.com/KashiwagiYukito/JavaSD_TeamB.git
