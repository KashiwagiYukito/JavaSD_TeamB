<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>成績管理一覧</title>
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
        .score-list-title {
            font-size: 2rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.9rem 1.6rem 0.9rem 1.5rem;
            border-radius: 0.6rem 0.6rem 0 0;
            margin-bottom: 16px;
            border-bottom: 1.5px solid #ececec;
            width: 100%;
            max-width: 1000px;
        }
        .score-list-searchbox {
            width: 100%;
            max-width: 1000px;
            background: #fff;
            border: 1.5px solid #dde3e8;
            border-radius: 0 0 10px 10px;
            padding: 1.2rem 1.5rem 1.1rem 1.5rem;
            margin-bottom: 1.7rem;
            margin-top: 0;
        }
        .score-list-searchrow {
            display: flex;
            align-items: flex-end;
            gap: 22px;
        }
        .score-list-searchgroup {
            display: flex;
            flex-direction: column;
            min-width: 150px;
            margin-right: 0.3rem;
            flex: 1;
        }
        .score-list-searchlabel {
            font-size: 1.05rem;
            font-weight: bold;
            margin-bottom: 0.2rem;
            color: #3b3b3b;
            letter-spacing: 0.04em;
        }
        .form-select {
            min-width: 110px;
            max-width: 250px;
        }
        .score-list-btn {
            background: #6c757d;
            color: #fff;
            min-width: 90px;
            border: none;
            border-radius: 7px;
            padding: 0.52rem 1.5rem;
            font-size: 1.10rem;
            margin-left: 20px;
            margin-bottom: 2px;
            box-shadow: 1px 1px 4px #e0e0e0;
        }
        .score-list-btn:hover {
            background: #495057;
            color: #fff;
        }
        .score-table-box {
            background: #fff;
            border-radius: 10px;
            border: 1.5px solid #ececec;
            margin-top: 1.4rem;
            padding: 1.4rem 1.2rem 1.2rem 1.2rem;
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
        .score-input {
            width: 100px;
            display: inline-block;
        }
        .score-error {
            color: #ffb84d;
            font-size: 1.03em;
            margin-top: 2px;
            margin-left: 4px;
        }
        @media (max-width: 900px) {
            .score-list-searchbox { padding: 1.1rem 0.2rem 1.2rem 0.2rem; }
            .score-list-searchrow { flex-direction: column; gap: 0.7rem; align-items: flex-start; }
            .score-list-btn { margin-left: 0; }
        }
    </style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="main-menu-main">
        <div class="score-list-title">成績管理</div>
        <div class="score-list-searchbox">
            <form action="<%=request.getContextPath()%>/main/ScoreListServlet" method="get" autocomplete="off" id="scoreForm">
                <%-- デバッグ用情報の削除 --%>
                <%-- リストサイズ（入学年度）：${fn:length(entYearList)}<br>
                リスト内容（入学年度）：${entYearList}<br>
                リストサイズ（クラス）：${fn:length(classNumList)}<br>
                リストサイズ（科目）：${fn:length(subjectList)}<br>
                リストサイズ（回数）：${fn:length(testNoList)}<br> --%>
                <div class="score-list-searchrow">
                    <div class="score-list-searchgroup">
                        <label class="score-list-searchlabel">入学年度</label>
                        <select name="entYear" class="form-select">
                           <option value="">------</option>
                           <c:forEach var="year" items="${entYearList}">
                                <option value="${year}" <c:if test="${selectedEntYear == year}">selected</c:if>>${year}</option>
                           </c:forEach>
                        </select>
                    </div>
                    <div class="score-list-searchgroup">
                        <label class="score-list-searchlabel">クラス</label>
                        <select name="classNum" class="form-select">
                           <option value="">------</option>
                           <c:forEach var="cls" items="${classNumList}">
                                <option value="${cls}" <c:if test="${selectedClassNum == cls}">selected</c:if>>${cls}</option>
                           </c:forEach>
                       </select>
                    </div>
                    <div class="score-list-searchgroup">
                        <label class="score-list-searchlabel">科目</label>
                        <select name="subjectCd" class="form-select" id="subjectSelect">
                           <option value="">------</option>
                           <c:forEach var="sub" items="${subjectList}">
                                <option value="${sub.cd}" <c:if test="${selectedSubjectCd == sub.cd}">selected</c:if>>${sub.name}</option>
                           </c:forEach>
                        </select>
                    </div>
                    <div class="score-list-searchgroup">
                        <label class="score-list-searchlabel">回数</label>
                        <select name="no" class="form-select" id="testNoSelect">
                           <option value="">------</option>
                           <c:forEach var="no" items="${testNoList}">
                                <option value="${no}" <c:if test="${selectedTestNo == no}">selected</c:if>>${no}</option>
                           </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="score-list-btn">検索</button>
                </div>
            </form>
        </div>
        <div class="container mt-4">
            <div class="score-table-box">
                <c:choose>
                  <c:when test="${errorType == 'lack_condition'}">
                      <div style="color: #ff8800;">検索条件をすべて選択してください。</div>
                  </c:when>
                  <c:when test="${errorType == 'not_found'}">
                      <div style="color: #ff4444;">該当データが見つかりませんでした。</div>
                  </c:when>
                  <c:when test="${errorType == 'system_error'}">
                      <div style="color: #ff4444;">システムエラーが発生しました。</div>
                  </c:when>
                </c:choose>
                <c:if test="${not empty scoreList}">
                  <form action="/main/ScoreRegistServlet" method="post" autocomplete="off">
                      <div style="margin-bottom:0.7em;">
                          科目：${subjectName}（${testNo}回）
                      </div>
                      <table class="table score-table mb-0">
                          <thead>
                              <tr>
                                  <th>入学年度</th>
                                  <th>クラス</th>
                                  <th>学生番号</th>
                                  <th>氏名</th>
                                  <th>点数</th>
                              </tr>
                          </thead>
                          <tbody>
                          <c:forEach var="row" items="${scoreList}">
                              <tr>
                                  <td>${row.entYear}</td>
                                  <td>${row.classNum}</td>
                                  <td>${row.studentNo}</td>
                                  <td>${row.studentName}</td>
                                  <td>
                                      <input type="text" name="point_${row.studentNo}" value="${row.getPoint(testNo)}" class="score-input form-control form-control-sm">
                                      <c:if test="${not empty row.errorPoint}">
                                          <div class="score-error">0～100の範囲で入力してください</div>
                                      </c:if>
                                  </td>
                              </tr>
                          </c:forEach>
                          </tbody>
                      </table>
                      <button type="submit" class="btn btn-secondary mt-3">登録して終了</button>
                  </form>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const subjectSelect = document.getElementById('subjectSelect');
    const testNoSelect = document.getElementById('testNoSelect');

    subjectSelect.addEventListener('change', function() {
        const selectedSubjectCd = this.value;
        if (selectedSubjectCd) {
            // 科目が選択されたら、その科目コードをURLパラメータに含めてページを再読み込み
            // これにより、サーバーサイドでtestNoListが正しく取得される
            const url = new URL(window.location.href);
            url.searchParams.set('subjectCd', selectedSubjectCd);
            url.searchParams.delete('no'); // 科目を変更したら回数はリセット
            // 他の選択値も保持するために、既存のパラメータを引き継ぐ
            const entYearParam = document.querySelector('select[name="entYear"]').value;
            const classNumParam = document.querySelector('select[name="classNum"]').value;

            if (entYearParam) url.searchParams.set('entYear', entYearParam); else url.searchParams.delete('entYear');
            if (classNumParam) url.searchParams.set('classNum', classNumParam); else url.searchParams.delete('classNum');

            window.location.href = url.toString();
        } else {
            // 「------」が選択された場合は回数もリセット
            testNoSelect.innerHTML = '<option value="">------</option>';
        }
    });
});
</script>

<%@ include file="/footer.jsp" %>
</body>
</html>