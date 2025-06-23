<%-- Base-sidebar.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>

<<<<<<< HEAD
<<<<<<< HEAD
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
=======
<nav class="app-sidebar-classic">
    <a href="mainMenu.jsp" class="sidebar-link">メニュー</a>
    <a href="StudentList.action" class="sidebar-link">学生管理</a>
>>>>>>> branch 'master' of https://github.com/KashiwagiYukito/JavaSD_TeamB.git

    <%-- 「成績管理」は太字ではない、通常のテキスト --%>
    <p class="sidebar-subtitle">成績管理</p>

<<<<<<< HEAD
</div>
>>>>>>> branch 'master' of https://github.com/KashiwagiYukito/JavaSD_TeamB.git
=======
    <%-- サブメニューは少し字下げする --%>
    <a href="TestRegist.action" class="sidebar-link sidebar-sub-link">成績登録</a>
    <a href="TestList.action" class="sidebar-link sidebar-sub-link">成績参照</a>

    <a href="SubjectList.action" class="sidebar-link">科目管理</a>
</nav>
>>>>>>> branch 'master' of https://github.com/KashiwagiYukito/JavaSD_TeamB.git
=======
<nav>
    <a href="mainMenu.jsp">メニュー</a><br><br>
    <a href="StudentList.action">学生管理</a><br><br>
    <span>成績管理</span><br>
    &nbsp;&nbsp;<a href="TestRegist.action">成績登録</a><br><br>
    &nbsp;&nbsp;<a href="TestList.action">成績参照</a><br><br>
    <a href="SubjectList.action">科目管理</a><br>
</nav>
>>>>>>> branch 'master' of https://github.com/KashiwagiYukito/JavaSD_TeamB.git
