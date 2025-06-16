<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログアウト</title>
    <style>
        body {
            font-family: "MS ゴシック", sans-serif;
            background-color: white;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 50px auto;
            padding: 0;
            background-color: white;
        }

        .full-header {
            width: 100%;
            max-width: 1000px;
            background-color: #d9e9f9;
            padding: 15px;
            font-size: 24px;
            text-align: left;
            font-weight: bold; /* 太字に変更 */
            margin: 0 auto 10px auto; /* 隙間を小さく */
        }

        .section-title {
            background-color: #f2f2f2;
            padding: 10px 15px;
            font-weight: bold;
            text-align: left;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        .message {
            background-color: #dff0d8;
            border: 1px solid #c8e5bc;
            padding: 6px 0;
            margin: 20px auto 30px auto; /* 下に余白を追加 */
            text-align: center;
            font-size: 14px;
            font-weight: bold;
            width: 100%;
        }

        .login-link {
            padding-left: 15px;
            text-align: left;
        }

        a {
            color: #007acc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="full-header">得点管理システム</div>

    <div class="container">
        <div class="section-title">ログアウト</div>

        <div class="message">ログアウトしました</div>

        <div class="login-link"><a href="Login">ログイン</a></div>
    </div>
</body>
</html>
