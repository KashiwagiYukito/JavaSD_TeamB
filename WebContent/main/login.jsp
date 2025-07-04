<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>ログイン</title>
  <link rel="stylesheet" href="../style.css">
  <style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      background: #fff;
    }
    body {
      display: block;
    }
    .login-outer {
      margin-top: 20px !important;
      margin-bottom: 20px !important;
      padding: 0 !important;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-start;
      background: #fff;
      min-height: unset;
      height: auto;
    }
    .login-box {
      margin: 0 !important;
      background: #fff;
      box-shadow: 0 4px 22px #0072ff11;
      border-radius: 18px;
      border: 2.5px solid #f2f5fb;
      width: 480px;
      padding: 0;
      min-height: 0;
      max-height: none;
    }
    .login-header {
      font-size: 1.4rem;
      font-weight: bold;
      background: #f4f6f8;
      border-radius: 18px 18px 0 0;
      padding: 6px 0 6px 0;
      border-bottom: 2px solid #e1e4e8;
      text-align: center;
    }
    .login-form {
      padding: 12px 20px 10px 20px;
      background: #fff;
    }
    .input-wrap {
      margin-bottom: 14px;
      position: relative;
    }
    .input-label-inside {
      position: absolute;
      left: 14px;
      top: 8px;
      color: #888;
      font-size: 1em;
      font-weight: 500;
      pointer-events: none;
      z-index: 2;
      background: transparent;
    }
    .login-input {
      width: 100%;
      height: 44px;
      font-size: 1.1em;
      border-radius: 10px;
      background: #e8f1fe;
      border: none;
      padding-left: 14px;
      padding-top: 18px;
      font-weight: bold;
      color: #222;
    }
    .pw-row {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 10px;
      font-size: 1em;
      width: 100%;
      gap: 8px;
    }
    .login-btn {
      width: 40%;
      min-width: 180px;
      max-width: 400px;
      height: 50px;
      font-size: 1.08em;
      background: #1677ff;
      color: #fff;
      border: none;
      border-radius: 13px;
      font-weight: bold;
      letter-spacing: 0.1em;
      margin: 10px auto 0 auto;
      box-shadow: 0 4px 10px #1677ff22;
      display: block;
    }
    .login-btn:hover {
      background: #0c57b8;
    }
    .login-err {
      color: #d00;
      text-align: left;
      margin: 12px 24px 0 24px;
      padding: 0;
      font-size: 1em;
      font-weight: 500;
      background: none;
      border: none;
      border-radius: 0;
      display: block;
    }
    @media (max-width: 700px) {
      .login-box { width: 98vw; min-width: 0; }
      .login-form { padding: 12px 2vw 8px 2vw; }
      .login-btn { width: 96%; }
    }
  </style>
</head>
<body>
  <div class="login-outer">
    <div class="login-box">
      <div class="login-header">ログイン</div>
      <%
        String loginError = (String) request.getAttribute("loginError");
        if (loginError != null) {
      %>
        <div class="login-err">
          <%= loginError %>
        </div>
      <%
        }
      %>
      <form action="<%= request.getContextPath() %>/main/LoginServlet" method="post" autocomplete="off" class="login-form">
        <div class="input-wrap">
          <label for="login-id" class="input-label-inside">ID</label>
          <input type="text" name="id" id="login-id" class="login-input" autocomplete="username" required
            value="<%= request.getAttribute("enteredId") != null ? request.getAttribute("enteredId") : "" %>">
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
    document.getElementById('pwshow').addEventListener('change', function() {
      document.getElementById('login-pw').type = this.checked ? 'text' : 'password';
    });
  </script>
  <%@ include file="/footer.jsp" %>
</body>
</html>
