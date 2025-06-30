<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Subject" %>
<%@ include file="/Base-header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目管理</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <style>
        .main-content {
            flex: 1;
            padding: 40px 48px 32px 48px;
            min-width: 0;
            background: #fff;
        }
        /* タイトルバー（中央寄せ・幅を狭く） */
        .subject-title-bar {
            background: #f2f3f5;
            max-width: 900px;
            margin: 0 auto;
            padding: 24px 32px 18px 32px;
            border-radius: 0.5em 0.5em 0 0;
            box-sizing: border-box;
        }
        .subject-title {
            font-size: 2em;
            font-weight: bold;
            color: #222;
            margin: 0;
            letter-spacing: 0.04em;
        }
        /* 新規作成リンクをバーの下、右端に */
        .register-link-wrapper {
            max-width: 900px;
            margin: 0 auto 24px auto;
            display: flex;
            justify-content: flex-end;
        }
        .register-link {
            color: #1e90ff;
            text-decoration: underline;
            font-size: 1.1em;
            cursor: pointer;
            font-weight: bold;
            margin-top: 8px;
            margin-right: 8px;
        }
        .subject-list {
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
        }
        .subject-header, .subject-row {
            display: flex;
            align-items: center;
            padding: 12px 0;
        }
        .subject-header {
            font-weight: bold;
            border-bottom: 2px solid #888;
            font-size: 1.1em;
        }
        .subject-row {
            border-bottom: 1px solid #bbb;
            font-size: 1.05em;
        }
        .col-code {
            flex: 0 0 120px;
            text-align: left;
            padding-right: 24px;
        }
        .col-name {
            flex: 1 1 200px;
            text-align: left;
            padding-right: 24px;
        }
        .col-actions {
            flex: 0 0 140px;
            text-align: left;
        }
        .link-btn {
            background: none;
            border: none;
            color: #1e90ff;
            text-decoration: underline;
            cursor: pointer;
            padding: 0 8px;
            font: inherit;
        }
        @media (max-width: 900px) {
            .main-content {
                padding: 24px 8px 24px 8px;
            }
            .subject-list,
            .subject-title-bar,
            .register-link-wrapper {
                max-width: 98vw;
            }
            .subject-title-bar {
                padding: 16px 8px 10px 8px;
            }
            .register-link {
                margin-right: 2px;
            }
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
                <h1 class="subject-title">科目管理</h1>
            </div>
            <div class="register-link-wrapper">
                <a href="subject_register.jsp" class="register-link">新規作成</a>
            </div>
            <div class="subject-list">
                <div class="subject-header">
                    <div class="col-code">科目コード</div>
                    <div class="col-name">科目名</div>
                    <div class="col-actions"></div>
                </div>
                <%
                    String error = (String)request.getAttribute("error");
                    if (error != null && !error.isEmpty()) {
                %>
                    <div class="alert alert-danger w-100 mx-auto"><%= error %></div>
                <%
                    }
                    List<Subject> subjectList = (List<Subject>)request.getAttribute("subjectList");
                    if (subjectList != null && !subjectList.isEmpty()) {
                        for (Subject subject : subjectList) {
                %>
                    <div class="subject-row">
                        <div class="col-code"><%= subject.getCd() %></div>
                        <div class="col-name"><%= subject.getName() %></div>
                        <div class="col-actions">
                            <form action="subject_delete.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="schoolCd" value="<%= subject.getSchoolCd() %>">
                                <input type="hidden" name="subjectCd" value="<%= subject.getCd() %>">
                                <input type="hidden" name="subjectName" value="<%= subject.getName() %>">
                                <input type="submit" value="削除" class="link-btn">
                            </form>
                            <form action="<%= request.getContextPath() %>/subject/SubjectUpdate" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="schoolCd" value="<%= subject.getSchoolCd() %>">
                                <input type="hidden" name="cd" value="<%= subject.getCd() %>">
                                <input type="submit" value="変更" class="link-btn">
                            </form>
                        </div>
                    </div>
                <%
                        }
                    } else {
                %>
                    <div class="subject-row text-center">
                        データがありません
                    </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <%@ include file="/Base-footer.jsp" %>
</body>
</html>
