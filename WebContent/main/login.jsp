<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログイン画面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
        }
        label {
            display: block;
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
    <h2>ログイン</h2>
    <form action="LoginController" method="post">
        <label for="id">ID：</label>
        <input type="text" id="id" name="id" required>

        <label for="password">パスワード：</label>
        <input type="password" id="password" name="password" required>

        <!-- ここが追加部分 -->
        <label>
            <input type="checkbox" onclick="togglePasswordVisibility()">
            パスワードを表示
        </label>

        <br><br>
        <input type="submit" value="ログイン">
    </form>
</body>
</html>
