<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="bean.Subject" %>
<%@ include file="/Base-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目情報変更</title>
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
        .simple-form {
            max-width: 900px;
            margin: 0 auto;
            padding: 0 16px;
        }
        .form-label {
            font-weight: bold;
            margin-bottom: 4px;
            color: #222;
            display: block;
        }
        .form-value {
            margin-bottom: 12px;
            font-size: 1em;
            color: #222;
            padding-left: 1em;
        }
        .subject-name-input-wrapper {
            width: 100%;
            margin-bottom: 16px;
        }
        .subject-name-input {
            width: 100%;
            border: 1.5px solid #bbb;
            border-radius: 5px;
            padding: 8px 12px;
            font-size: 1em;
            background: #fff;
            color: #222;
            box-sizing: border-box;
            height: 38px;
        }
        .form-actions {
            margin-top: 16px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 6px;
        }
        .btn-primary {
            background: #1e90ff;
            color: #fff;
            border: none;
            font-weight: bold;
            border-radius: 4px;
            padding: 8px 28px;
            font-size: 1em;
        }
        .btn-primary:active {
            background: #156dc1;
        }
        .btn-link {
            background: none;
            border: none;
            color: #1e90ff;
            font-size: 1em;
            font-weight: bold;
            text-decoration: underline;
            cursor: pointer;
            padding: 0;
        }
        .error {
            color: #dc3545;
            margin-bottom: 12px;
            text-align: center;
        }
        @media (max-width: 900px) {
            .subject-title-bar, .simple-form { max-width: 98vw; padding: 0 4px; }
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
            <div class="simple-form">
                <%
                    String error = (String)request.getAttribute("error");
                    if (error != null) {
                %>
                <div class="error"><%= error %></div>
                <%
                    }
                    Subject subject = (Subject)request.getAttribute("subject");
                    if (subject == null) {
                %>
                    <div class="error">科目情報が取得できませんでした。</div>
                <%
                    } else {
                %>
                <form action="SubjectUpdate" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="oldSchoolCd" value="<%= subject.getSchoolCd() %>">
                    <input type="hidden" name="oldCd" value="<%= subject.getCd() %>">
                    <label class="form-label">科目コード</label>
                    <div class="form-value"><%= subject.getCd() %></div>
                    <label for="name" class="form-label">科目名</label>
                    <div class="subject-name-input-wrapper">
                        <input type="text" id="name" name="name" class="subject-name-input" value="<%= subject.getName() %>" required>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">変更</button>
                        <button type="button" class="btn-link" onclick="window.location.href='<%= request.getContextPath() %>/subject/SubjectUpdate'">戻る</button>
                    </div>
                </form>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <%@ include file="/Base-footer.jsp" %>
</body>
</html>
