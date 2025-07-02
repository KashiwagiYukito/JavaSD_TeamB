<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>成績参照結果</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/style.css">
    <style>
        /* CSSスタイルは省略（変更なし） */
        body { background: #f7fafd; }
        .main-flex { display: flex; min-height: calc(100vh - 120px); }
        .sidebar-area { width: 160px; background: #fff; border-right: 1px solid #e0e8ef; padding-top: 28px; padding-left: 20px; }
        .main-content-area { flex: 1; padding: 38px 0 0 0; background: transparent; }
        .section-card {
            max-width: 980px;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 2px 14px #c7d3ea18;
            margin: 0 auto;
            border: 1.8px solid #e8edf5;
        }
        .section-header {
            font-size: 2em;
            font-weight: bold;
            background: #f4f6fa;
            border-radius: 16px 16px 0 0;
            padding: 18px 32px 13px 32px;
            border-bottom: 1.2px solid #e1e4e8;
            letter-spacing: 0.06em;
        }
        .section-body {
            padding: 32px 36px 20px 36px;
        }
        .info-label {
            font-weight: 600;
            font-size: 1.18em;
            width: 100px;
            min-width: 100px;
        }
        .sub-label {
            font-size: 1.07em;
            color: #333;
            font-weight: 500;
            margin-bottom: 2px;
            margin-right: 2px;
        }
        .select-box {
            min-width: 160px;
            max-width: 200px;
            font-size: 1.11em;
            border-radius: 10px;
            padding: 7px 15px;
        }
        .search-btn {
            background: #656e7c;
            color: #fff;
            font-size: 1.13em;
            font-weight: bold;
            border-radius: 11px;
            padding: 0.30em 2.3em;
            border: none;
            margin-left: 12px;
            margin-bottom: 2px;
            box-shadow: 0 1px 6px #d5dde877;
            transition: background 0.2s;
        }
        .search-btn:hover { background: #495057; }
        .info-message {
            color: #25b0e7;
            font-size: 1.08em;
            margin: 18px 0 6px 10px;
            letter-spacing: 0.03em;
            margin-left: 2px;
            margin-top: 8px;
            text-align: left;
        }
        .student-input {
            min-width: 320px;
            max-width: 360px;
            font-size: 1.08em;
            border-radius: 10px;
            padding: 7px 15px;
        }
        .result-table-area {
            margin-top: 32px;
        }
        @media (max-width: 900px) {
            .section-body { padding: 20px 8px 12px 8px; }
            .main-flex { flex-direction: column; }
            .sidebar-area { width: 100%; border-right: none; border-bottom: 1px solid #e0e8ef; }
            .main-content-area { padding-top: 12px; }
            .info-message { text-align: left; }
        }
    </style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="main-content-area">
        <div class="section-card">
            <div class="section-header">成績参照</div>
            <div class="section-body">
                <%-- 検索フォーム部分をインクルード --%>
                <%@ include file="/scoreReference.jsp" %>

                <div class="result-table-area">
                    <%-- エラーメッセージの表示 --%>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger mt-3">${error}</div>
                    </c:if>

                    <%-- 科目情報検索結果の表示 --%>
                    <c:if test="${not empty subjectResult}">
                        <div class="mb-2 mt-4">
                            科目情報 : <span style="font-weight:bold;">${selectedSubjectName}</span>
                        </div>
                        <table class="table table-bordered table-striped mb-0">
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
                                <c:forEach var="s" items="${subjectResult}">
                                    <tr>
                                        <td>${s.entYear}</td>
                                        <td>${s.classNum}</td>
                                        <td>${s.no}</td>
                                        <td>${s.name}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${s.score1 != null}">${s.score1}</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${s.score2 != null}">${s.score2}</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <%-- 学生情報検索結果の表示 --%>
                    <c:if test="${not empty studentResult}">
                        <div class="mb-2 mt-4">
                            学生情報 : <span style="font-weight:bold;">${studentResult.no}</span>
                        </div>
                        <table class="table table-bordered table-striped mb-0">
                            <thead>
                                <tr>
                                    <th>入学年度</th>
                                    <th>学生番号</th>
                                    <th>氏名</th>
                                    <th>クラス</th>
                                    <th>在学中</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${studentResult.entYear}</td>
                                    <td>${studentResult.no}</td>
                                    <td>${studentResult.name}</td>
                                    <td>${studentResult.classNum}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${studentResult.attend}">○</c:when>
                                            <c:otherwise>×</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>