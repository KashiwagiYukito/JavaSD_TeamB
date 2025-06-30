<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>メインメニュー</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/style.css">
  <style>
    body {
      background: #fff;
      font-family: "Meiryo", sans-serif;
      margin: 0;
    }
    .main-flex {
  display: flex;
  min-height: calc(100vh - 166px);
  width: 100vw;
  background: #fff;
}

/* サイドバー：幅と右余白を増やす */
.sidebar-area {
  width: 180px;             /* サイドバーやや太め */
  background: #fff;
  padding-left: 24px;       /* 左余白 */
  padding-top: 36px;
  padding-right: 0;
  min-height: calc(100vh - 166px);
  font-size: 1.07em;
  /* 境界線無しにする→境界線はメインの擬似要素で */
  border: none;
  box-sizing: border-box;
  position: relative;
}

/* 境界線をメインの直前に擬似要素で描画 */
.main-menu-main {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  min-width: 0;
  padding-top: 32px;
  padding-left: 64px;      /* メインエリアの左余白を多めに（画像準拠） */
  position: relative;
}

/* メインの直前に境界線を引く */
.main-menu-main::before {
  content: '';
  position: absolute;
  left: -32px;     /* サイドバーからメインまでの余白分マイナス */
  top: 0;
  width: 1.5px;
  height: 100%;
  background: #e4e6ed;
  z-index: 2;
  border-radius: 1px;
}

/* 以下カードなどは以前のままでOK */


/* ヘッダーとカードは変更不要（もともと画像通り） */
.main-menu-header {
  width: 100%;
  max-width: 1150px;
  background: #f4f6f8;
  border-radius: 0.7em 0.7em 0 0;
  font-size: 2em;
  font-weight: bold;
  padding: 0.7em 0 0.5em 1.2em;
  margin-bottom: 36px;
  border-bottom: 1.2px solid #dde3e8;
  text-align: left;
}
.main-menu-cards {
  display: flex;
  gap: 40px;
  margin-top: 0;
  justify-content: flex-start;
  width: 1100px;
  max-width: 96vw;
}


.main-menu-card {
  min-width: 260px;
  min-height: 190px;
  max-width: 320px;
  border-radius: 14px;
  box-shadow: 0 7px 20px #aaa4;
  padding: 34px 18px 18px 28px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  font-size: 1.38em;
  font-weight: 500;
  margin-bottom: 10px;
}

.main-menu-card.card-student { background: #dabcbc; }
.main-menu-card.card-score   { background: #b9e0c1; }
.main-menu-card.card-subject { background: #bbbce0; }

.main-menu-link {
  color: #1a5cff;
  font-size: 1.19em;
  text-decoration: underline;
  font-weight: bold;
  margin-left: 8px;
  display: inline-block;
}
.main-menu-link:hover { color: #0c3288; }

@media (max-width: 1100px) {
  .main-menu-header, .main-menu-cards { width: 99vw; max-width: 99vw; }
  .main-menu-cards { flex-direction: column; gap: 22px; }
  .main-menu-card { min-width: 0; width: 94vw; max-width: 98vw;}
}
@media (max-width: 750px) {
  .sidebar-area { display: none; }
  .main-menu-header { font-size: 1.1em; }
  .main-menu-cards { gap: 14px; }
}
  </style>
</head>
<body>
<div class="main-flex">
  <!-- サイドバー -->
  <div class="sidebar-area">
    <%@ include file="/sidebar.jsp" %>
  </div>
  <!-- メイン -->
  <div class="main-menu-main">
    <div class="main-menu-header">
      メニュー
    </div>
    <div class="main-menu-cards">
      <!-- 学生管理 -->
      <div class="main-menu-card card-student d-flex align-items-center justify-content-center">
        <a href="<%=request.getContextPath()%>/main/StudentListServlet" class="main-menu-link">学生管理</a>
      </div>
      <!-- 成績管理 -->
      <div class="main-menu-card card-score">
        <div style="margin-bottom: 0.2em; font-size: 1.13em;">成績管理</div>
        <div style="margin-left:22px;">
          <a href="<%=request.getContextPath()%>/main/ScoreListServlet" class="main-menu-link">成績登録</a><br>
          <a href="<%=request.getContextPath()%>/main/ScoreListServlet" class="main-menu-link">成績参照</a>
        </div>
      </div>
      <!-- 科目管理 -->
      <div class="main-menu-card card-subject d-flex align-items-center justify-content-center">
        <a href="<%=request.getContextPath()%>/main/SubjectListServlet" class="main-menu-link">科目管理</a>
      </div>
    </div>
  </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
