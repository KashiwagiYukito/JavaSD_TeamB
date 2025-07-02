<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生情報変更</title>
    <link rel="stylesheet" href="/style.css">
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
            min-height: calc(100vh - 166px);
            font-size: 1.07em;
            box-sizing: border-box;
            position: relative;
            margin-right: 150px;
        }
        .student-edit-main {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 40px;
            padding-left: 52px;
            position: relative;
        }
        .student-edit-main::before {
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
        .edit-title {
            font-size: 1.7rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.8rem 1.2rem;
            border-radius: 0.6rem 0.6rem 0 0;
            margin: 0 0 1.3rem 0;
            width: 100%;
            max-width: 480px;
        }
        .edit-comp-msg {
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
        .edit-links {
            margin-top: 3.5em;
            margin-left: 0.2em;
        }
        .edit-links a {
            color: #1677ff;
            font-size: 1.1rem;
            margin-right: 2.5em;
            text-decoration: underline;
        }
        .edit-links a:hover {
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
    <div class="student-edit-main">
        <div class="container mt-4">
            <div class="edit-title">学生情報変更</div>
            <div class="edit-comp-msg">変更が完了しました</div>
            <div class="edit-links">
                <a href="<%=request.getContextPath()%>/main/StudentListServlet">学生一覧</a>
            </div>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
