<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="bean.Subject" %>
<%@ include file="/Base-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目情報変更完了</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
        .main-flex {
            display: flex;
            min-height: 100vh;
            background: #fff;
        }
        .sidebar-area {
            width: 180px;
            background: #fff;
            padding-left: 24px;
            padding-top: 36px;
            padding-right: 0;
            font-size: 1.07em;
            border: none;
            box-sizing: border-box;
            min-height: 100%;
        }
        .main-content {
            flex: 1;
            min-width: 0;
            padding: 16px 0 8px 0;
            background: #fff;
        }
        .subject-title-bar {
            background: #f2f3f5;
            max-width: 900px;
            width: 100%;
            margin: 0 auto 16px auto;
            padding: 8px 16px;
            border-radius: 0.5em 0.5em 0 0;
            box-sizing: border-box;
        }
        .subject-title {
            font-size: 1.5em;
            font-weight: bold;
            color: #222;
            margin: 0;
            letter-spacing: 0.04em;
        }
        .done-msg {
            margin: 32px auto 0 auto;
            padding: 16px 0;
            max-width: 900px;
            text-align: center;
            font-size: 0.7em;
            color: #222;
            font-weight: normal;
            background: #c6f6c6;   /* 緑色の背景 */
            border-radius: 8px;
        }
        .list-link-wrapper {
            max-width: 900px;
            margin: 40px auto 0 auto;
            padding-left: 16px;
        }
        .list-link {
            color: #1e90ff;
            font-size: 1.1em;
            font-weight: bold;
            text-decoration: underline;
            display: inline-block;
        }
        @media (max-width: 900px) {
            .subject-title-bar, .done-msg, .list-link-wrapper { max-width: 98vw; padding-left: 4px; padding-right: 4px; }
            .subject-title-bar { padding: 6px 4px; }
        }
    </style>
</head>
<body>
    <div class="main-flex">
        <div class="sidebar-area">
            <%@ include file="/Base-sidebar.jsp" %>
        </div>
        <div class="main-content">
            <div class="subject-title-bar">
                <span class="subject-title">科目情報変更</span>
            </div>
            <div class="done-msg">
                科目情報の変更が完了しました。
            </div>
            <div class="list-link-wrapper">
                <a href="<%= request.getContextPath() %>/subject/SubjectUpdate" class="list-link">科目一覧</a>
            </div>
        </div>
    </div>
    <%@ include file="/Base-footer.jsp" %>
</body>
</html>
