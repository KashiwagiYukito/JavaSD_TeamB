<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="Base-header.jsp" />

<!-- ログアウトリンク -->
<div class="text-end mb-3">
  <a href="logout.jsp" class="link-secondary fs-6">ログアウト</a>
</div>

<!-- ✅ メニューラベル（薄い灰色背景） -->
<div class="mb-4 p-2" style="background-color: #f2f2f2;">
  <!-- ✅ 画面タイトル追加 -->
<div class="text-center my-4">
  <h2 class="fw-bold text-dark">メインメニュー</h2>
</div>

</div>

<!-- メニュー項目 -->
<div class="row g-4 justify-content-start">

  <!-- 学生管理 -->
  <div class="col-md-3 d-flex">
    <div class="p-4 rounded text-center w-100 h-100" style="background-color: #f8d7da;">
      <a href="logout.jsp" class="fs-5 text-decoration-underline text-primary">学生管理</a>
    </div>
  </div>

  <!-- 成績管理 -->
  <div class="col-md-3 d-flex">
    <div class="p-4 rounded text-center w-100 h-100" style="background-color: #d4edda;">
      <div class="fs-5 fw-bold mb-2 text-dark">成績管理</div>
      <div class="mb-2">
        <a href="logout.jsp" class="fs-5 text-decoration-underline text-primary">成績登録</a>
      </div>
      <div>
        <a href="logout.jsp" class="fs-5 text-decoration-underline text-primary">成績参照</a>
      </div>
    </div>
  </div>

  <!-- 科目登録 -->
  <div class="col-md-3 d-flex">
    <div class="p-4 rounded text-center w-100 h-100" style="background-color: #e2d6f3;">
      <a href="logout.jsp" class="fs-5 text-decoration-underline text-primary">科目管理</a>
    </div>
  </div>

</div>

<jsp:include page="Base-footer.jsp" />
