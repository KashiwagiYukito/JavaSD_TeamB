<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生情報登録</title>
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
        .regist-main-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 40px;
            padding-left: 52px;
            position: relative;
        }
        .regist-main-area::before {
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
        .regist-title {
            font-size: 1.7rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.8rem 1.2rem;
            border-radius: 0.6rem 0.6rem 0 0;
            margin-bottom: 1.3rem;
            width: 100%;
            max-width: 480px;
        }
        .regist-comp-msg {
            background: #93c9b2;
            color: #222;
            font-size: 1.15rem;
            padding: 0.55em 1.5em 0.55em 1.3em;
            border-radius: 2px;
            margin-bottom: 2.2em;
            text-align: center;
            margin-left: 0;
            width: 100%;
            max-width: 480px;
        }
        .regist-links {
            margin-top: 3.5em;
            margin-left: 0.2em;
        }
        .regist-links a {
            color: #1677ff;
            font-size: 1.1rem;
            margin-right: 2.5em;
            text-decoration: underline;
        }
        .regist-links a:hover {
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
    <div class="regist-main-area">
        <div class="regist-title">学生情報登録</div>
        <div class="regist-comp-msg">登録が完了しました</div>
        <div class="regist-links">
            <a href="studentRegist.jsp">戻る</a>
            <a href="<%=request.getContextPath()%>/main/StudentListServlet">学生一覧</a>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
