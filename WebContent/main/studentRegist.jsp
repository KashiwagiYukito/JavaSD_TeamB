<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生情報登録</title>
    <link rel="stylesheet" href="/style.css">
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
        .student-register-main {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 40px;
            padding-left: 52px;
            position: relative;
        }
        .student-register-main::before {
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
            margin: 0 0 2.2rem 0;
        }
        .regist-label {
            font-weight: bold;
            font-size: 1.1rem;
            margin-bottom: 0.35rem;
        }
        .regist-form .form-control,
        .regist-form .form-select {
            max-width: 700px;
        }
        .regist-form {
            margin-top: 0.6rem;
        }
        .regist-btn {
            margin-top: 1.3rem;
            width: 160px;
            background: #545a66;
            color: #fff;
            font-size: 1.13rem;
            font-weight: bold;
            border-radius: 7px;
            padding: 0.44em 0;
            border: none;
            box-shadow: 0 2px 8px #2221;
            letter-spacing: 0.08em;
        }
        .regist-btn:hover {
            background: #333b46;
        }
        .regist-back {
            display: inline-block;
            margin-top: 1.2rem;
            margin-left: 0.3rem;
            font-size: 1rem;
            color: #1677ff;
            text-decoration: underline;
        }
        .regist-back:hover {
            color: #165eea;
            text-decoration: underline;
        }
        .err-msg {
            color: #ffb84d;
            font-size: 1.08rem;
            margin-left: 0.2em;
            margin-top: 0.2em;
        }
        @media (max-width: 800px) {
            .regist-title { font-size: 1.2rem; }
            .regist-form .form-control,
            .regist-form .form-select { max-width: 100%; }
            .regist-btn { width: 100%; }
        }
    </style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="student-register-main">
        <div class="container mt-4">
            <div class="regist-title">学生情報登録</div>
            <form class="regist-form" action="<%= request.getContextPath() %>/main/StudentRegistServlet" method="post" autocomplete="off">
                <div class="mb-2">
                    <div class="regist-label">入学年度</div>
                    <select name="entYear" class="form-select">
                        <option value="">------</option>
                        <option value="2022" <c:if test="${param.entYear == '2022'}">selected</c:if>>2022</option>
                        <option value="2023" <c:if test="${param.entYear == '2023'}">selected</c:if>>2023</option>
                        <option value="2024" <c:if test="${param.entYear == '2024'}">selected</c:if>>2024</option>
                    </select>
                    <c:if test="${not empty entYearError}">
                        <div class="err-msg">${entYearError}</div>
                    </c:if>
                </div>
                <div class="mb-2">
                    <div class="regist-label">学生番号</div>
                    <input type="text" class="form-control" name="no" placeholder="学生番号を入力してください"
                           value="${param.no}" required>
                    <c:if test="${not empty errorMsg}">
                        <div class="err-msg">${errorMsg}</div>
                    </c:if>
                </div>
                <div class="mb-2">
                    <div class="regist-label">氏名</div>
                    <input type="text" class="form-control" name="name" placeholder="氏名を入力してください"
                           value="${param.name}" required>
                </div>
                <div class="mb-2">
                    <div class="regist-label">クラス</div>
                    <select name="classNum" class="form-select" required>
                        <option value="">------</option>
                        <option value="131" <c:if test="${param.classNum == '131'}">selected</c:if>>131</option>
                        <option value="102" <c:if test="${param.classNum == '102'}">selected</c:if>>102</option>
                        <option value="201" <c:if test="${param.classNum == '201'}">selected</c:if>>201</option>
                        <option value="202" <c:if test="${param.classNum == '202'}">selected</c:if>>202</option>
                    </select>
                </div>
                <button type="submit" class="regist-btn">登録して終了</button><br>
                <a href="<%=request.getContextPath()%>/main/StudentListServlet" class="regist-back">戻る</a>
            </form>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
