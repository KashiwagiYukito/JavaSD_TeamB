<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目情報削除</title>
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { background: #fff; margin: 0; }
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
        .subject-delete-main {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 42px;
            padding-left: 52px;
            position: relative;
        }
        .subject-delete-main::before {
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
            margin-bottom: 1.3rem;
            width: 100%;
            max-width: 830px;
        }
        .delete-text {
            margin-left: 0.2em;
            font-size: 1.13rem;
            margin-bottom: 1.25rem;
        }
        .btn-area {
            margin-bottom: 2.7rem;
        }
        .delete-btn {
            background: #db4d59;
            color: #fff;
            border: none;
            border-radius: 7px;
            padding: 0.45em 1.45em;
            font-size: 1.13rem;
            font-weight: bold;
            margin-right: 0.8rem;
        }
        .delete-btn:hover { background: #c32430; color: #fff; }
        .back-link {
            color: #1677ff;
            text-decoration: underline;
            font-size: 1.05rem;
            margin-left: 0.1em;
        }
        .back-link:hover { color: #0a48aa; }
    </style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="subject-delete-main">
        <div class="main-title">科目情報削除</div>
        <div class="delete-text">
            「<b><%= request.getAttribute("name") %></b>（<%= request.getAttribute("cd") %>）」を削除してもよろしいですか
        </div>
        <div class="btn-area">
            <form action="<%= request.getContextPath() %>/main/SubjectDeleteServlet" method="post" style="display:inline;">
                <input type="hidden" name="cd" value="<%= request.getAttribute("cd") %>">
                <input type="hidden" name="schoolCd" value="<%= request.getAttribute("schoolCd") %>">
                <button type="submit" class="delete-btn">削除</button>
            </form>
        </div>
        <a href="subjectList.jsp" class="back-link">戻る</a>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
