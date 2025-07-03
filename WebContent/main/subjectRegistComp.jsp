<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目情報登録</title>
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
            font-size: 1.07em;
            min-height: calc(100vh - 166px);
            box-sizing: border-box;
            position: relative;
            margin-right: 150px;
        }
        .main-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 40px;
            padding-left: 52px;
            position: relative;
        }
        .main-area::before {
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
        .main-title {
            font-size: 1.7rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.8rem 1.2rem;
            border-radius: 0.6rem 0.6rem 0 0;
            margin-bottom: 1.1rem;
            width: 100%;
            max-width: 900px;
        }
        .msg-success {
            background: #96c8af;
            color: #222;
            font-size: 1.14rem;
            padding: 0.57em 1.4em 0.57em 1.4em;
            border-radius: 2px;
            margin-bottom: 2.4em;
            margin-left: 0;
            width: 100%;
            max-width: 900px;
            text-align: center;/* これで中央揃え */
        }
        .main-links {
            margin-top: 1.6em;
            margin-left: 0.2em;
        }
        .main-links a {
            color: #1677ff;
            font-size: 1.1rem;
            margin-right: 2.5em;
            text-decoration: underline;
        }
        .main-links a:hover {
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
    <div class="main-area">
        <div class="main-title">科目情報登録</div>
        <div class="msg-success">登録が完了しました</div>
        <div class="main-links">
            <a href="subjectRegist.jsp">戻る</a>
            <a href="<%=request.getContextPath()%>/main/SubjectListServlet">科目一覧</a>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
