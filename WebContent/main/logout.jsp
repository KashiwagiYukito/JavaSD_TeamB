<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ログアウト</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .logout-title {
            font-size: 1.7rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.8rem 1.2rem;
            border-radius: 0.6rem 0.6rem 0 0;
            margin-bottom: 1.6rem;
        }
        .logout-msg {
            background: #93c9b2;
            color: #222;
            font-size: 1.15rem;
            padding: 0.55em 1.5em 0.55em 1.3em;
            border-radius: 2px;
            margin-bottom: 2.2em;
            margin-left: 0;
            text-align: center;
            width: 100%;
        }
        .logout-link {
            color: #1677ff;
            font-size: 1.08rem;
            margin-left: 0.2em;
            text-decoration: underline;
            display: inline-block;
            margin-top: 2.5rem;
        }
        .logout-link:hover {
            color: #165eea;
            text-decoration: underline;
        }
        .container-logout {
            margin-top: 24px;
            max-width: 1000px;
        }
    </style>
</head>
<body>
<div class="container container-logout">
    <div class="logout-title">ログアウト</div>
    <div class="logout-msg">ログアウトしました</div>
    <a href="login.jsp" class="logout-link">ログイン</a>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
