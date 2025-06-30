<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>成績登録</title>
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .main-flex {
            display: flex;
            min-height: calc(100vh - 166px);
            width: 100vw;
            background: #fff;
        }

        .sidebar-area {
            width: 135px;
            background: #fff;
            padding-left: 50px;
            padding-top: 36px;
            border: none;
            min-height: calc(100vh - 166px);
            font-size: 1.07em;
            box-sizing: border-box;
            position: relative;
            margin-right: 150px;
        }
        .main-menu-main {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 32px;
            padding-left: 0;
            border-left: 1.3px solid #e4e6ed;
        }

        .sidebar-area {
            width: 135px;
            background: #fff;
            padding-left: 50px;
            padding-top: 36px;
            border: none;
            min-height: calc(100vh - 166px);
            font-size: 1.07em;
            box-sizing: border-box;
            position: relative;
            margin-right: 150px;
        }
        .score-main-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 48px;
            border-left: 1.3px solid #e4e6ed;
        }
        .score-title {
            font-size: 1.7rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.8rem 1.2rem;
            border-radius: 0.6rem 0.6rem 0 0;
            margin: 0 0 1.3rem 0;
            width: 100%;
            max-width: 480px;
            border-bottom: 1.2px solid #e4e6ed;
        }
        .score-comp-msg {
            background: #93c9b2;
            color: #222;
            font-size: 1.15rem;
            padding: 0.55em 1.5em 0.55em 1.3em;
            border-radius: 2px;
            margin-bottom: 2.2em;
            text-align: center;
            margin-left: 0;
            max-width: 480px;
            width: 100%;
        }
        .score-links {
            margin-top: 3.5em;
            margin-left: 0.2em;
        }
        .score-links a {
            color: #1677ff;
            font-size: 1.1rem;
            margin-right: 2.5em;
            text-decoration: underline;
        }
        .score-links a:hover {
            color: #165eea;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="score-main-area">
        <div class="score-title">成績管理</div>
        <div class="score-comp-msg">登録が完了しました</div>
        <div class="score-links">
            <a href="scoreRegist.jsp">戻る</a>
            <a href="scoreSearch.jsp">成績参照</a>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
