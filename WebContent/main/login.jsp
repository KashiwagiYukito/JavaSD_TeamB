<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログイン画面</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Meiryo', sans-serif;
            background-color: #ffffff;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 100%;
            max-width: 560px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }

        .login-header {
            background-color: #f2f2f2;
            padding: 14px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            color: #444;
            border-bottom: 1px solid #ccc;
        }

        .form-group {
            position: relative;
            margin-bottom: 28px;
        }

        .form-control {
            background-color: #f0f8ff;
            font-size: 15px;
            padding: 24px 10px 10px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-label-inside {
            position: absolute;
            top: 8px;
            left: 12px;
            font-size: 13px;
            color: #888;
            pointer-events: none;
        }

        .login-btn {
            background-color: #007bff;
            color: white;
            width: 150px;
            padding: 14px 0;
            font-size: 16px;
        }

        .login-btn:hover {
            background-color: #0056b3;
        }

        .form-check-inline {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            margin-top: 4px;
        }

        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>

<body>

<div class="login-container">
    <div class="card">
        <div class="login-header">ログイン</div>
        <div class="card-body p-4">
            <form action="LoginController" method="post">
                <div class="form-group">
                    <span class="form-label-inside">ID</span>
                    <input type="text" class="form-control" id="id" name="id" required>
                </div>
                <div class="form-group">
                    <span class="form-label-inside">パスワード</span>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-check-inline">
                    <input type="checkbox" class="form-check-input" id="showPassword" onclick="togglePasswordVisibility()">
                    <label class="form-check-label" for="showPassword">パスワードを表示</label>
                </div>
                <div class="text-center mt-3">
                    <button type="submit" class="btn login-btn">ログイン</button>
                </div>

                <% String error = (String)request.getAttribute("error");
                   if (error != null) { %>
                   <div class="error-message"><%= error %></div>
                <% } %>
            </form>
        </div>
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
