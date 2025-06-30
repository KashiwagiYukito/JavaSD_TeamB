<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>成績参照</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/style.css">
    <style>
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
            margin-right: 15px;
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
            color: #2590e2;
            font-size: 1.07em;
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
        .info-message {
            color: #25b0e7;
            font-size: 1.08em;
            margin: 18px 0 6px 10px;
            letter-spacing: 0.03em;
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
                <!-- 科目情報（検索フォーム1） -->
                <form action="<%=request.getContextPath()%>/main/ScoreReferenceServlet" method="get" autocomplete="off" style="margin-bottom: 0;">
                  <div class="d-flex align-items-center mb-1 pb-2" style="border-bottom:1.3px solid #eaeaea;">
                    <span class="info-label">科目情報</span>
                    <div class="d-flex align-items-end flex-grow-1" style="gap:18px;">
                        <div>
                            <div class="sub-label">入学年度</div>
                            <select name="entYear" class="select-box">
                                <option value="">------</option>
                                <c:forEach var="year" items="${entYearList}">
                                    <option value="${year}" <c:if test="${param.entYear == year}">selected</c:if>>${year}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <div class="sub-label">クラス</div>
                            <select name="classNum" class="select-box">
                                <option value="">------</option>
                                <c:forEach var="cls" items="${classNumList}">
                                    <option value="${cls}" <c:if test="${param.classNum == cls}">selected</c:if>>${cls}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <div class="sub-label">科目</div>
                            <select name="subjectCd" class="select-box">
                                <option value="">------</option>
                                <c:forEach var="sub" items="${subjectList}">
                                    <option value="${sub.cd}" <c:if test="${param.subjectCd == sub.cd}">selected</c:if>>${sub.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="search-btn">検索</button>
                    </div>
                  </div>
                  <input type="hidden" name="sj" value="${subjectInfoCode}">
                </form>

                <!-- 学生情報（検索フォーム2） -->
                <form action="<%=request.getContextPath()%>/main/ScoreReferenceServlet" method="get" autocomplete="off" class="mt-3">
                  <div class="d-flex align-items-center mb-1">
                    <span class="info-label">学生情報</span>
                    <div class="d-flex align-items-center flex-grow-1" style="gap:20px;">
                        <div>
                            <div class="sub-label">学生番号</div>
                            <input type="text" name="studentNo" maxlength="10"
                                class="form-control student-input d-inline" placeholder="学生番号を入力してください" value="${param.studentNo}">
                        </div>
                        <button type="submit" class="search-btn">検索</button>
                    </div>
                  </div>
                  <input type="hidden" name="st" value="${studentInfoCode}">
                </form>
                <!-- ↓ この位置に案内文を配置 -->
                <div class="info-message">
                    ※科目情報を選択または学生情報を入力して検索ボタンをクリックしてください
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>