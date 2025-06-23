<%-- Base-sidebar.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>

<nav class="app-sidebar-classic">
    <a href="mainMenu.jsp" class="sidebar-link">メニュー</a>
    <a href="StudentList.action" class="sidebar-link">学生管理</a>

    <%-- 「成績管理」は太字ではない、通常のテキスト --%>
    <p class="sidebar-subtitle">成績管理</p>

    <%-- サブメニューは少し字下げする --%>
    <a href="TestRegist.action" class="sidebar-link sidebar-sub-link">成績登録</a>
    <a href="TestList.action" class="sidebar-link sidebar-sub-link">成績参照</a>

    <a href="SubjectList.action" class="sidebar-link">科目管理</a>
</nav>