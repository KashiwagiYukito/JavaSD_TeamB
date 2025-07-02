<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            margin: 0 0 2.2rem 0;
        }
        .edit-label {
            font-weight: bold;
            font-size: 1.1rem;
            margin-bottom: 0.3rem;
        }
        .edit-form .form-control,
        .edit-form .form-select {
            max-width: 700px;
        }
        .edit-form {
            margin-top: 0.6rem;
        }
        .edit-btn {
            margin-top: 1.3rem;
            width: 110px;
        }
        .edit-back {
            display: inline-block;
            margin-top: 1.2rem;
            margin-left: 0.3rem;
            font-size: 1rem;
        }
        .edit-check {
            font-weight: bold;
            margin-right: 0.7rem;
            font-size: 1.07rem;
        }
        @media (max-width: 800px) {
            .edit-title { font-size: 1.2rem; }
            .edit-form .form-control,
            .edit-form .form-select { max-width: 100%; }
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
            <form class="edit-form" action="<%= request.getContextPath() %>/main/StudentEditServlet" method="post" autocomplete="off">
                <div class="mb-2">
                    <div class="edit-label">入学年度</div>
                    <div><%= request.getAttribute("entYear") %></div>
                    <input type="hidden" name="entYear" value="<%= request.getAttribute("entYear") %>">
                </div>
                <div class="mb-2">
                    <div class="edit-label">学生番号</div>
                    <div><%= request.getAttribute("no") %></div>
                    <input type="hidden" name="no" value="<%= request.getAttribute("no") %>">
                </div>
                <div class="mb-2">
                    <div class="edit-label">氏名</div>
                    <input type="text" class="form-control" name="name" value="<%= request.getAttribute("name") %>" required>
                </div>
                <div class="mb-2">
                    <div class="edit-label">クラス</div>
                    <select name="classNum" class="form-select" required>
                        <option value="">------</option>
                        <c:forEach var="cls" items="${classNumList}">
                            <option value="${cls.classNum}" <c:if test="${cls.classNum == classNum}">selected</c:if>>
                               ${cls.classNum}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-check mb-3 mt-3">
                    <label class="edit-check" for="isAttend">在学中</label>
                    <input type="checkbox" class="form-check-input" name="isAttend" id="isAttend"
                        value="true" <%= "true".equals(String.valueOf(request.getAttribute("isAttend"))) ? "checked" : "" %> >
                </div>
                <button type="submit" class="btn btn-primary edit-btn">変更</button><br>
                <a href="<%=request.getContextPath()%>/main/StudentListServlet" class="edit-back">戻る</a>
            </form>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
