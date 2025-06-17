<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="Base-Header.jsp" />

<!-- ログアウトリンク -->
<div class="text-end mb-3">
  <a href="logout.jsp" class="link-secondary">ログアウト</a>
</div>

<!-- メニューエリア -->
<div class="row g-4">

  <!-- 学生管理 -->
  <div class="col-md-4">
    <div class="p-4 rounded text-center" style="background-color: #f8d7da;">
      <a href="studentList.jsp" class="text-decoration-none fs-5 fw-bold text-dark">学生管理</a>
    </div>
  </div>

  <!-- 成績確認・登録 -->
  <div class="col-md-4">
    <div class="p-4 rounded text-center" style="background-color: #d4edda;">
      <div class="mb-2">
        <a href="scoreList.jsp" class="text-decoration-none fs-6 text-dark">成績確認</a>
      </div>
      <div>
        <a href="scoreEntry.jsp" class="text-decoration-none fs-6 text-dark">成績登録</a>
      </div>
    </div>
  </div>

  <!-- 科目登録 -->
  <div class="col-md-4">
    <div class="p-4 rounded text-center" style="background-color: #e2d6f3;">
      <a href="subjectEntry.jsp" class="text-decoration-none fs-5 text-dark">科目登録</a>
    </div>
  </div>

</div>

<jsp:include page="Base-footer.jsp" />
