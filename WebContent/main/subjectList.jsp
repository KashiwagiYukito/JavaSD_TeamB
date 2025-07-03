<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: #fff;
            font-family: "Meiryo", sans-serif;
            margin: 0;
        }
        .main-flex {
            display: flex;
            min-height: calc(100vh - 166px);
            width: 100vw;
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
        .subject-main-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 40px;
            padding-left: 52px;
            position: relative;
        }
        .subject-main-area::before {
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
        .subject-header-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            max-width: 1000px;
            background: #f4f6f8;
            border-radius: 0.7em 0.7em 0 0;
            font-size: 1.7rem;
            font-weight: bold;
            padding: 0.8rem 1.2rem 0.8rem 1.2rem;
            margin-bottom: 0.7rem;
        }
       .subject-title {
            font-size: 1.18em;
            font-weight: bold;
            color: #23272d;
        }
       .subject-new {
            font-size: 1.09rem;
            color: #1677ff;
            text-decoration: underline;
            font-weight: bold;
            margin-left: 18px;
            margin-top: 2px;
        }
       .subject-new:hover {
            color: #165eea;
        }

        .subject-table-box {
            background: #fff;
            border-radius: 0 0 10px 10px;
            border: 1.5px solid #ececec;
            margin-top: 0;
            padding: 0.7rem 0.5rem 1.2rem 0.5rem;
            width: 100%;
            max-width: 920px;
        }
        .subject-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: #fff;
        }
        .subject-table th, .subject-table td {
            font-size: 1.09rem;
            vertical-align: middle;
            padding: 0.55em 0.7em;
        }
        .subject-table th {
            border-bottom: 2px solid #bbb;
            font-weight: bold;
            background: #fff;
            text-align: left;
        }
        .subject-table tr {
            border-bottom: 1px solid #e0e0e0;
        }
        .subject-table td {
            text-align: left;
        }
        .subject-table a {
            color: #1677ff;
            font-weight: 500;
            text-decoration: underline;
            margin: 0 0.4em 0 0;
        }
        .subject-table a:hover {
            color: #165eea;
        }
        .text-right {
            text-align: right;
        }
        @media (max-width: 1000px) {
            .subject-header-box,
            .subject-table-box { max-width: 98vw; }
        }
    </style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="subject-main-area">
        <div class="subject-header-row">
            <span class="subject-title">科目管理</span>
            <a href="subjectRegist.jsp" class="subject-new">新規登録</a>
        </div>
        <div class="subject-table-box">
            <table class="subject-table">
                <thead>
                    <tr>
                        <th style="width:140px;">科目コード</th>
                        <th>科目名</th>
                        <th style="width:80px;"></th>
                        <th style="width:80px;"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="subject" items="${subjectList}">
                        <tr>
                            <td>${subject.cd}</td>
                            <td>${subject.name}</td>
                            <td>
                                <a href="SubjectEditServlet?cd=${subject.cd}">変更</a>
                            </td>
                            <td>
                                <a href="SubjectDeleteServlet?cd=${subject.cd}">削除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
   </div>
<%@ include file="/footer.jsp" %>
</body>
</html>