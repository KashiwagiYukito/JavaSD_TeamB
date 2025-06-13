<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログイン画面</title>

	<style>
    body {
        font-family: 'Meiryo', sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-box {
        width: 360px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .login-header {
        background-color: #e0e0e0;
        padding: 15px;
        text-align: center;
    }

    .login-header h2 {
        margin: 0;
        font-size: 18px;
        color: #333;
    }

    .login-form {
        padding: 25px;
    }

    .form-group {
        position: relative;
        margin-bottom: 20px;
    }

    .form-group input[type="text"],
    .form-group input[type="password"] {
        width: 100%;
        padding: 25px 10px 10px 10px; /* 上に余白を追加してラベルのスペースを確保 */
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        background-color: #e6f4fa; /* 水色の背景 */
    }

    .form-group label {
        position: absolute;
        top: 6px;
        left: 10px;
        font-size: 12px;
        color: #777;
        pointer-events: none;
    }

    .show-password {
        font-size: 14px;
        margin-bottom: 18px;
        color: #333;
    }

    .login-button {
        width: 100%;
        background-color: #337ab7;
        border: none;
        padding: 10px;
        color: white;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
    }

    .login-button:hover {
        background-color: #286090;
    }

    .error-message {
        color: red;
        text-align: center;
        margin-top: 10px;
    }
</style>



    <script>
        function togglePasswordVisibility() {
            var pwField = document.getElementById("password");
            pwField.type = pwField.type === "password" ? "text" : "password";
        }
    </script>
</head>
<body>
    <div class="login-box">
        <div class="login-header">
            <h2>ログイン</h2>
        </div>
        <div class="login-form">
            <form action="LoginController" method="post">
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" id="id" name="id" required>
                </div>
                <div class="form-group">
                    <label for="password">パスワード</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="show-password">
                    <input type="checkbox" onclick="togglePasswordVisibility()"> パスワードを表示
                </div>
                <input class="login-button" type="submit" value="ログイン">
            </form>

            <% String error = (String)request.getAttribute("error");
               if (error != null) { %>
               <div class="error-message"><%= error %></div>
            <% } %>
        </div>
    </div>

    <script>
        function togglePasswordVisibility() {
            const pw = document.getElementById("password");
            pw.type = (pw.type === "password") ? "text" : "password";
        }
    </script>
</body>


</html>
