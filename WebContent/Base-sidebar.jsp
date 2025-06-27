<%-- Base-sidebar.jsp --%>

<%@ page contentType="text/html; charset=UTF-8" %>

<nav>
    <a href="mainMenu.jsp">メニュー</a><br><br>
    <a href="StudentList.action">学生管理</a><br><br>
    <span>成績管理</span><br>
    &nbsp;&nbsp;<a href="TestRegist.action">成績登録</a><br><br>
    &nbsp;&nbsp;<a href="TestList.action">成績参照</a><br><br>
    <a href="<%= request.getContextPath() %>/subject/SubjectUpdate">科目一覧</a><br>
</nav>
