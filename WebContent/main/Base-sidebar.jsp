<%-- Base-sidebar.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>

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