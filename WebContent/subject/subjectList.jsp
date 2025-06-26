<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Subject" %>
<%@ page import="dao.DAO" %>
<html>
<head>
    <title>科目管理</title>
    <style>
        body {
            font-family: sans-serif;
            background: #fff;
        }
        .page-title-box {
            position: relative;
            width: 70%;
            margin: 32px auto 0 auto;
            background: #f0f0f0;
            border-bottom: 2px solid #555;
            padding: 24px 32px 32px 32px;
            box-sizing: border-box;
        }
        .page-title {
            font-size: 2em;
            font-weight: bold;
            color: #222;
            margin: 0;
            display: inline-block;
        }
        .register-link {
            position: absolute;
            right: 32px;
            bottom: 16px;
            color: #1e90ff;
            text-decoration: underline;
            font-size: 1em;
            background: none;
            border: none;
            cursor: pointer;
            padding: 0;
        }
        .title-table-space {
            height: 36px;
        }
        table {
            width: 70%;
            border-collapse: collapse;
            margin: 0 auto;
        }
        th, td {
            padding: 12px 30px;
            text-align: left;
        }
        th {
            border-bottom: 2px solid #555;
            background: #f0f0f0;
            font-size: 1.1em;
            font-weight: bold;
            color: #222;
        }
        tr.data-row td {
            border-bottom: 1px solid #222;
        }
        .link-btn {
            background: none;
            border: none;
            color: #1e90ff;
            text-decoration: underline;
            cursor: pointer;
            padding: 0;
            font: inherit;
        }
    </style>
</head>
<body>
    <div class="page-title-box">
        <span class="page-title">科目管理</span>
        <a href="subjectRegister.jsp" class="register-link">新規登録</a>
    </div>
    <div class="title-table-space"></div>
    <table>
        <tr>
            <th>科目コード</th>
            <th>科目名</th>
            <th></th>
        </tr>
        <%
            List<Subject> subjectList = (List<Subject>)request.getAttribute("subjectList");
            if (subjectList != null) {
                for (Subject subject : subjectList) {
        %>
        <tr class="data-row">
            <td><%= subject.getCd() %></td>
            <td><%= subject.getName() %></td>
            <td>
                <form action="SubjectDelete" method="post" style="display:inline;">
                    <input type="hidden" name="schoolCd" value="<%= subject.getSchoolCd() %>">
                    <input type="hidden" name="cd" value="<%= subject.getCd() %>">
                    <input type="submit" value="削除" class="link-btn">
                </form>
                <form action="SubjectUpdate" method="get" style="display:inline;">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="schoolCd" value="<%= subject.getSchoolCd() %>">
                    <input type="hidden" name="cd" value="<%= subject.getCd() %>">
                    <input type="submit" value="変更" class="link-btn">
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
