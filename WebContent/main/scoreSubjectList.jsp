<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>成績一覧（科目）</title>
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
            max-width: 1100px;
        }
        .score-searchbox {
            background: #fff;
            border-radius: 12px;
            border: 1.5px solid #e2e5e8;
            padding: 2.1rem 2.2rem 2.0rem 2.2rem;
            margin-bottom: 1.7rem;
            width: 100%;
            max-width: 1100px;
            box-shadow: none;
        }
        .score-search-form-row,
        .score-search-form-row2 {
            display: flex;
            align-items: flex-end;
            gap: 36px;
        }
        .score-search-form-row { margin-bottom: 20px; }
        .score-search-label {
            font-size: 1.15em;
            font-weight: bold;
            margin-bottom: 6px;
            margin-right: 18px;
            min-width: 96px;
        }
        .score-search-select {
            min-width: 120px;
            max-width: 180px;
            font-size: 1.15em;
            margin-right: 8px;
        }
        .score-search-input {
            min-width: 320px;
            max-width: 360px;
            font-size: 1.13em;
        }
        .score-search-btn {
            background: #646c72;
            color: #fff;
            font-size: 1.18em;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            padding: 0.43em 2.6em;
            margin-left: auto;
            margin-bottom: 0;
            box-shadow: none;
            transition: background 0.2s;
        }
        .score-search-btn:hover { background: #495057; color: #fff; }
        .score-searchbox-divider {
            border: none;
            border-top: 1.2px solid #d6dade;
            margin: 22px 0 20px 0;
        }
        .score-table-box {
            background: #fff;
            border-radius: 10px;
            border: 1.5px solid #ececec;
            margin-top: 1.2rem;
            padding: 1.2rem 1.2rem 1.0rem 1.2rem;
            width: 100%;
            max-width: 1100px;
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
        .subject-label {
            font-size: 1.09em;
            margin: 0.5em 0 0.8em 0.2em;
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
        <div class="score-title">成績一覧（科目）</div>
        <div class="score-searchbox">
    <!-- 1段目: 科目情報 検索フォーム（この画面のまま再表示） -->
    <form action="<%= request.getContextPath() %>/main/ScoreSubjectListServlet" method="get" autocomplete="off">
        <div class="score-search-form-row">
            <div class="score-search-label">科目情報</div>
            <select name="entYear" class="form-select score-search-select">
                <option value="">------</option>
                <c:forEach var="year" items="${entYearList}">
                    <option value="${year}" <c:if test="${param.entYear == year}">selected</c:if>>${year}</option>
                </c:forEach>
            </select>
            <select name="classNum" class="form-select score-search-select">
                <option value="">------</option>
                <c:forEach var="cls" items="${classNumList}">
                    <option value="${cls}" <c:if test="${param.classNum == cls}">selected</c:if>>${cls}</option>
                </c:forEach>
            </select>
            <select name="subjectCd" class="form-select score-search-select">
                <option value="">------</option>
                <c:forEach var="subj" items="${subjectList}">
                    <option value="${subj.cd}" <c:if test="${param.subjectCd == subj.cd}">selected</c:if>>${subj.name}</option>
                </c:forEach>
            </select>
            <button type="submit" class="score-search-btn">検索</button>
        </div>
    </form>

    <hr class="score-searchbox-divider">

    <!-- 2段目: 学生番号 検索フォーム（学生別画面へ遷移） -->
    <form action="<%= request.getContextPath() %>/main/ScoreListStudentServlet" method="get" autocomplete="off">
        <div class="score-search-form-row2">
            <div class="score-search-label">学生情報</div>
            <input type="text" class="form-control score-search-input" name="studentNo" value="" placeholder="学生番号を入力してください">
            <button type="submit" class="score-search-btn">検索</button>
        </div>
    </form>
</div>
        <c:if test="${errorType == 'not_found'}">
            <div class="no-score">学生情報が存在しませんでした</div>
        </c:if>
        <!-- 科目名見出し -->
        <c:if test="${not empty subjectLabel}">
            <div class="subject-label">
                科目：${subjectLabel}
            </div>
        </c:if>
        <!-- 検索結果テーブル -->
        <c:if test="${not empty subjectScoreList}">
            <div class="score-table-box">
                <table class="table score-table mb-0">
                    <thead>
                        <tr>
                            <th>入学年度</th>
                            <th>クラス</th>
                            <th>学生番号</th>
                            <th>氏名</th>
                            <th>1回</th>
                            <th>2回</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${subjectScoreList}">
                            <tr>
                                <td>${row.entYear}</td>
                                <td>${row.classNum}</td>
                                <td>${row.studentNo}</td>
                                <td>${row.studentName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty row.point1}">${row.point1}</c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty row.point2}">${row.point2}</c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
