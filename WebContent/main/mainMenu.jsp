<%-- mainMenu.jsp --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Base-header.jsp" %>

<div class="main-flex">
  <!-- サイドバー -->
  <div class="sidebar-area">
    <%@ include file="/Base-sidebar.jsp" %>
  </div>
  <!-- メイン画面 -->
  <div class="main-menu-main">
    <div class="main-menu-header">
      メニュー
    </div>
    <div class="main-menu-cards">
      <!-- ① 学生管理カード -->
      <div class="main-menu-card card-student d-flex align-items-center justify-content-center">
        <a href="studentList.jsp" class="main-menu-link">学生管理</a>
      </div>
      <!-- ② 成績管理カード -->
      <div class="main-menu-card card-score">
        <div class="main-menu-card-title">成績管理</div>
        <div class="main-menu-card-sub">
          <a href="<%=request.getContextPath()%>/grade/Create" class="main-menu-link">成績登録</a><br>
          <a href="<%=request.getContextPath()%>/grade/TestListController" class="main-menu-link">成績参照</a>
        </div>
      </div>
      <!-- ③ 科目管理カード -->
      <div class="main-menu-card card-subject d-flex align-items-center justify-content-center">
        <a href="${pageContext.request.contextPath}/subject/SubjectUpdate?action=list" class="main-menu-link">科目管理</a>
      </div>
    </div>
  </div>
</div>
<%@ include file="/Base-footer.jsp" %>
