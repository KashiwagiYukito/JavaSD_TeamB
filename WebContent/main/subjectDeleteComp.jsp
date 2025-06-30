<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目情報削除</title>
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
        .delete-main-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 40px;
            padding-left: 52px;
            position: relative;
        }
        .delete-main-area::before {
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
        .delete-title {
            font-size: 1.7rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.8rem 1.2rem;
            border-radius: 0.6rem 0.6rem 0 0;
            width: 100%;
            max-width: none;
            margin-bottom: 0.9rem;
        }
        .delete-msg {
            background: #98c8b0;
            color: #232;
            font-size: 1.10rem;
            padding: 0.53em 0 0.53em 1.2em;
            margin-bottom: 3.2rem;
            width: 100%;
            text-align: center;  /* 中央寄せ */
        }
        .delete-links {
            margin-left: 0.2em;
            margin-top: 40px;
        }
        .delete-links a {
            color: #1677ff;
            font-size: 1.13rem;
            text-decoration: underline;
        }
        .delete-links a:hover {
            color: #165eea;
        }
    </style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="delete-main-area">
        <div class="delete-title">科目情報削除</div>
        <div class="delete-msg">削除が完了しました</div>
        <div class="delete-links">
            <a href="subjectList.jsp">科目一覧</a>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
