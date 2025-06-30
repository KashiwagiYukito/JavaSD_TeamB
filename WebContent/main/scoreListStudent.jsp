<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>成績一覧（学生）</title>
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
        .main-menu-main {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 32px;
            padding-left: 0;
            border-left: 1.3px solid #e4e6ed;
        }
        .score-title {
            font-size: 2rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.9rem 1.6rem 0.9rem 1.5rem;
            border-radius: 0.6rem 0.6rem 0 0;
            margin-bottom: 18px;
            border-bottom: 1.5px solid #ececec;
            width: 100%;
            max-width: 1000px;
        }
        .score-searchbox {
            background: #fff;
            border-radius: 10px;
            border: 1.5px solid #ececec;
            padding: 2rem 2.2rem 1.7rem 2.2rem;
            margin-bottom: 1.7rem;
            width: 100%;
            max-width: 1000px;
        }
        .score-searchrow {
            display: flex;
            align-items: flex-end;
            gap: 2.2rem;
        }
        .score-searchgroup {
            display: flex;
            flex-direction: column;
            min-width: 140px;
            margin-right: 0.2rem;
        }
        .score-searchlabel {
            font-size: 1.05rem;
            font-weight: bold;
            margin-bottom: 0.2rem;
            color: #3b3b3b;
        }
        .form-select {
            min-width: 120px;
            max-width: 200px;
        }
        .score-btn {
            background: #6c757d;
            color: #fff;
            min-width: 80px;
            border: none;
            border-radius: 5px;
            padding: 0.45rem 1.3rem;
            font-size: 1.04rem;
            margin-left: 15px;
            margin-bottom: 2px;
            box-shadow: 1px 1px 3px #e0e0e0;
        }
        .score-btn:hover {
            background: #495057;
            color: #fff;
        }
        .score-table-box {
            background: #fff;
            border-radius: 10px;
            border: 1.5px solid #ececec;
            margin-top: 1.2rem;
            padding: 1.2rem 1.2rem 1.0rem 1.2rem;
            width: 100%;
            max-width: 1000px;
        }
        .score-table th, .score-table td {
            text-align: left;
            font-size: 1.08rem;
            vertical-align: middle;
            padding: 0.44em 1.2em 0.44em 0.3em;
        }
        .score-table th {
            border-bottom: 2px solid #bbb;
            font-weight: bold;
            background: #fff;
        }
        .score-table tr {
            border-bottom: 1px solid #e0e0e0;
        }
        .student-label {
            font-size: 1.09em;
            margin: 0.5em 0 0.8em 0;
            font-weight: 500;
        }
        .error-msg {
            color: #ffb84d;
            font-size: 1.08rem;
            margin-top: 0.6em;
            margin-bottom: 0.4em;
        }
        .no-score {
            color: #666;
            font-size: 1.13rem;
            margin: 1em 0 0 0.2em;
        }
    </style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="main-menu-main">
        <div class="score-title">成績一覧（学生）</div>
        <div class="score-searchbox">
            <form action="scoreListStudentServlet" method="get" autocomplete="off">
                <div class="score-searchrow">
                    <div class="score-searchgroup">
                        <div class="score-searchlabel">科目情報</div>
                        <select name="entYear" class="form-select">
                            <option value="">------</option>
                            <c:forEach var="year" items="${entYearList}">
                                <option value="${year}" <c:if test="${param.entYear == year}">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="score-searchgroup">
                        <div class="score-searchlabel">クラス</div>
                        <select name="classNum" class="form-select">
                            <option value="">------</option>
                            <c:forEach var="cls" items="${classNumList}">
                                <option value="${cls}" <c:if test="${param.classNum == cls}">selected</c:if>>${cls}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="score-searchgroup">
                        <div class="score-searchlabel">科目</div>
                        <select name="subjectCd" class="form-select">
                            <option value="">------</option>
                            <c:forEach var="subj" items="${subjectList}">
                                <option value="${subj.cd}" <c:if test="${param.subjectCd == subj.cd}">selected</c:if>>${subj.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="score-btn">検索</button>
                </div>
                <hr>
                <div class="score-searchrow">
                    <div class="score-searchgroup">
                        <div class="score-searchlabel">学生情報</div>
                        <input type="text" class="form-control" name="studentNo" value="${param.studentNo}" placeholder="学生番号" required>
                        <c:if test="${not empty errorStudentNo}">
                            <div class="error-msg">このフィールドを入力してください。</div>
                        </c:if>
                    </div>
                    <button type="submit" class="score-btn">検索</button>
                </div>
            </form>
        </div>
        <!-- 検索結果：学生情報＆成績テーブル -->
        <c:if test="${not empty studentInfo}">
            <div class="student-label">
                氏名：${studentInfo.name}（${studentInfo.no}）
            </div>
            <c:choose>
                <c:when test="${empty studentScoreList}">
                    <div class="no-score">成績情報が存在しませんでした</div>
                </c:when>
                <c:otherwise>
                    <div class="score-table-box">
                        <table class="table score-table mb-0">
                            <thead>
                                <tr>
                                    <th>科目名</th>
                                    <th>科目コード</th>
                                    <th>回数</th>
                                    <th>点数</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${studentScoreList}">
                                    <c:if test="${not empty row.point}">
                                    <tr>
                                        <td>${row.subjectName}</td>
                                        <td>${row.subjectCd}</td>
                                        <td>${row.no}</td>
                                        <td>${row.point}</td>
                                    </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:if>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
