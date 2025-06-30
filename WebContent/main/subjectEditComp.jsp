<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目情報変更</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: #fff;
            margin: 0;
        }
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
            font-size: 1.07em;
            min-height: calc(100vh - 166px);
            box-sizing: border-box;
            position: relative;
            margin-right: 150px;
        }
        .subedit-main-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 40px;
            padding-left: 52px;
            position: relative;
        }
        .subedit-main-area::before {
            content: '';
            position: absolute;
            left: -26px;
            top: 0;
            width: 1.5px;
            height: 100%;
            background: #e4e6ed;
            z-index: 2;
            border-radius: 1px;
        }
        .subedit-title {
            font-size: 1.7rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.8rem 1.2rem;
            border-radius: 0.6rem 0.6rem 0 0;
            margin-bottom: 1.3rem;
            width: 100%;
            max-width: 480px;
        }
        .subedit-comp-msg {
            background: #93c9b2;
            color: #222;
            font-size: 1.15rem;
            padding: 0.55em 1.5em 0.55em 1.3em;
            border-radius: 2px;
            margin-bottom: 2.2em;
            margin-left: 0;
            text-align: center;
            width: 100%;
            max-width: 480px;
        }
        .subedit-links {
            margin-top: 3.5em;
            margin-left: 0.2em;
        }
        .subedit-links a {
            color: #1677ff;
            font-size: 1.1rem;
            margin-right: 2.5em;
            text-decoration: underline;
        }
        .subedit-links a:hover {
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
    <div class="subedit-main-area">
        <div class="subedit-title">科目情報変更</div>
        <div class="subedit-comp-msg">変更が完了しました</div>
        <div class="subedit-links">
            <a href="subjectList.jsp">科目一覧</a>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
