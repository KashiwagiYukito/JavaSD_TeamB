<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="Base-header.jsp" />

<!-- ログアウトリンク -->
<div class="text-end mb-3">
  <a href="logout.jsp" class="link-secondary fs-6">ログアウト</a>
</div>

<!-- メニュータイトル（左寄せ） -->
<h4 class="mb-4 text-start">メニュー</h4>

<!-- メニュー項目 -->
<div class="row g-4 justify-content-start">

  <!-- 学生管理 -->
  <div class="col-md-3">
    <div class="p-4 rounded text-center" style="background-color: #f8d7da; min-height: 150px;">
      <a href="studentList.jsp" class="fs-5 fw-bold text-decoration-underline text-primary">学生管理</a>
    </div>
  </div>

  <!-- 成績管理 -->
  <div class="col-md-3">
    <div class="p-4 rounded text-center" style="background-color: #d4edda; min-height: 150px;">
      <div class="fs-5 fw-bold mb-2 text-dark">成績管理</div>
      <div class="mb-2">
        <a href="scoreList.jsp" class="fs-5 text-decoration-underline text-primary">成績確認</a>
      </div>
      <div>
        <a href="scoreEntry.jsp" class="fs-5 text-decoration-underline text-primary">成績登録</a>
      </div>
    </div>
  </div>

  <!-- 科目登録 -->
  <div class="col-md-3">
    <div class="p-4 rounded text-center" style="background-color: #e2d6f3; min-height: 150px;">
      <a href="subjectEntry.jsp" class="fs-5 fw-bold text-decoration-underline text-primary">科目登録</a>
    </div>
  </div>

</div>

<jsp:include page="Base-footer.jsp" />
