<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>ログイン</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    .login-outer {
      min-height: calc(100vh - 166px);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .login-box {
      width: 480px;
      background: #fff;
      border-radius: 20px;
      box-shadow: 0 4px 22px #0072ff11;
      border: 2.5px solid #f2f5fb;
      margin: 36px 0;
    }
    .login-header {
      font-size: 2.3rem;
      font-weight: bold;
      background: #f4f6f8;
      border-radius: 18px 18px 0 0;
      padding: 22px 0 14px 0;
      border-bottom: 2px solid #e1e4e8;
      letter-spacing: 0.08em;
      text-align: center;
    }
    .login-form {
      padding: 36px 38px 20px 38px;
    }
    /* ラベルを枠内左上に絶対配置 */
    .input-wrap {
      position: relative;
      margin-bottom: 30px;
    }
    .input-label-inside {
      position: absolute;
      left: 18px;
      top: 10px;
      color: #888;
      font-size: 1.04em;
      font-weight: 500;
      pointer-events: none;
      z-index: 2;
      background: transparent;
    }
    .login-input {
      width: 100%;
      height: 54px;
      font-size: 1.22em;
      border-radius: 12px;
      background: #e8f1fe;
      border: none;
      padding-left: 17px;
      padding-top: 25px; /* ラベル分の上余白を確保 */
      font-weight: bold;
      color: #222;
    }
    .pw-row {
      display: flex;
      align-items: center;
      justify-content: flex-start;
      margin-bottom: 22px;
      margin-left: 3px;
      font-size: 1.05em;
    }
    .login-btn {
      width: 325px;
      height: 56px;
      font-size: 1.35em;
      background: #1677ff;
      color: #fff;
      border: none;
      border-radius: 15px;
      font-weight: bold;
      letter-spacing: 0.1em;
      margin-top: 10px;
      box-shadow: 0 4px 10px #1677ff22;
    }
    .login-btn:hover { background: #0c57b8; }
    @media (max-width: 700px) {
      .login-box { width: 96vw; min-width: 0; }
      .login-form { padding: 20px 2vw 15px 2vw; }
      .login-btn { width: 95%; }
    }
  </style>
</head>
<body>
<div class="login-outer">
  <div class="login-box">
    <div class="login-header">ログイン</div>
    <%-- 認証エラーの場合は "error=auth" をリクエストパラメータで受け取る例 --%>
      <%
        String error = request.getParameter("error");
        if ("auth".equals(error)) {
      %>
        <div class="login-err">
          ログインに失敗しました。IDまたはパスワードが正しくありません。
        </div>
      <% } %>
    <form action="<%= request.getContextPath() %>/main/LoginServlet" method="post" autocomplete="off" class="login-form">
      <div class="input-wrap">
        <label for="login-id" class="input-label-inside">ID</label>
        <input type="text" name="id" id="login-id" class="login-input" autocomplete="username" required>
      </div>
      <div class="input-wrap">
        <label for="login-pw" class="input-label-inside">パスワード</label>
        <input type="password" name="password" id="login-pw" class="login-input" autocomplete="current-password" required>
      </div>
      <div class="pw-row mb-4">
        <input type="checkbox" class="form-check-input" id="pwshow">
        <label for="pwshow" style="user-select:none;margin-left:6px;margin-bottom:0;">パスワードを表示</label>
      </div>
      <div class="text-center">
        <button type="submit" class="login-btn">ログイン</button>
      </div>
    </form>
  </div>
</div>
<script>
  // パスワード表示/非表示
  document.getElementById('pwshow').addEventListener('change', function() {
    document.getElementById('login-pw').type = this.checked ? 'text' : 'password';
  });
</script>
<%@ include file="/footer.jsp" %>
</body>
</html>
