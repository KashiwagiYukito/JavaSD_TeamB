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
            margin-bottom: 2.2rem;
            width: 100%;
            max-width: 480px;
        }
        .subedit-label {
            font-weight: bold;
            font-size: 1.1rem;
            margin-bottom: 0.35rem;
        }
        .subedit-form .form-control {
            max-width: 700px;
        }
        .subedit-form {
            margin-top: 0.6rem;
            width: 100%;
            max-width: 480px;
        }
        .subedit-btn {
            margin-top: 1.3rem;
            width: 90px;
            background: #1677ff;
            color: #fff;
            font-size: 1.13rem;
            font-weight: bold;
            border-radius: 7px;
            padding: 0.44em 0;
            border: none;
            box-shadow: 0 2px 8px #1677ff22;
            letter-spacing: 0.08em;
        }
        .subedit-btn:hover {
            background: #165eea;
        }
        .subedit-back {
            display: inline-block;
            margin-top: 1.2rem;
            margin-left: 0.3rem;
            font-size: 1rem;
            color: #1677ff;
            text-decoration: underline;
        }
        .subedit-back:hover {
            color: #165eea;
            text-decoration: underline;
        }
        @media (max-width: 800px) {
            .subedit-title { font-size: 1.2rem; }
            .subedit-form .form-control { max-width: 100%; }
            .subedit-btn { width: 100%; }
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
        <form class="subedit-form" action="SubjectEditServlet" method="post" autocomplete="off">
            <div class="mb-2">
                <div class="subedit-label">科目コード</div>
                <div><%= request.getAttribute("cd") %></div>
                <input type="hidden" name="cd" value="<%= request.getAttribute("cd") %>">
            </div>
            <div class="mb-2">
                <div class="subedit-label">科目名</div>
                <input type="text" class="form-control" name="name"
                    value="<%= request.getAttribute("name") %>" placeholder="科目名を入力してください" required>
            </div>
            <button type="submit" class="subedit-btn">変更</button><br>
            <a href="subjectList.jsp" class="subedit-back">戻る</a>
        </form>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
