<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>学生管理</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body { background: #fff; margin: 0;font-family: "Meiryo", sans-serif; }
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
.student-list-main {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    min-width: 0;
    padding-top: 40px;
    padding-left: 52px;
    position: relative;
}
.student-list-main::before {
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
.student-title {
    font-size: 1.7rem;
    font-weight: bold;
    background: #f4f4f4;
    padding: 0.8rem 1.2rem;
    border-radius: 0.6rem 0.6rem 0 0;
    margin-bottom: 1.5rem;
    width: 100%;
    max-width: 880px;
    display: inline-block;
}
.student-new {
    float: right;
    font-size: 1.07rem;
    margin-top: 1.1rem;
}
.student-search-card {
    background: #fff;
    border-radius: 10px;
    border: 1.5px solid #ececec;
    padding: 2rem 1.6rem 1.2rem 1.6rem;
    margin-bottom: 2.5rem;
    width: 100%;
    max-width: 880px;
}
.student-btn {
    background: #545a66;
    color: #fff;
    border: none;
    border-radius: 9px;
    font-size: 1.1rem;
    font-weight: bold;
    padding: 0.47rem 1.3rem;
    min-width: 85px;
    margin-left: 20px;
}
.student-btn:hover { background: #333b46;}
.student-table-box {
    background: #fff;
    border-radius: 10px;
    border: 1.5px solid #ececec;
    margin-top: 0.2rem;
    padding: 1.2rem 1.0rem 1.0rem 1.0rem;
    width: 100%;
    max-width: 880px;
}
.student-table th, .student-table td {
    font-size: 1.08rem;
    vertical-align: middle;
    padding: 0.44em 0.7em 0.44em 0.7em;
}
.student-table th {
    border-bottom: 2px solid #bbb;
    font-weight: bold;
    background: #fff;
    text-align: left;
}
.student-table tr { border-bottom: 1px solid #e0e0e0;}
.student-table a { color: #1677ff; font-weight: 500; text-decoration: underline;}
.student-table a:hover { color: #165eea;}
.student-radio { font-size: 1.3rem; text-align: center;}
.no-student {
    margin-top: 1.5rem;
    margin-left: 0.2em;
    font-size: 1.1rem;
    color: #444;
}
</style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="student-list-main">
        <div style="width:100%;max-width:880px;">
            <span class="student-title">学生管理</span>
            <a href="<%= request.getContextPath() %>/main/studentRegist.jsp" class="student-new">新規登録</a>
        </div>
        <!-- 絞り込みフォーム -->
        <div class="student-search-card mb-4">
            <form action="<%= request.getContextPath() %>/main/StudentListServlet" method="get" class="row g-3 align-items-end">
                <div class="col-auto fw-bold">入学年度</div>
                <div class="col-md-3">
                    <select class="form-select" name="entYear">
                        <option value="">------</option>
                        <c:forEach var="year" items="${entYearList}">
                            <option value="${year}" <c:if test="${param.entYear == year}">selected</c:if>>${year}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-auto fw-bold">クラス</div>
                <div class="col-md-3">
                    <select class="form-select" name="classNum">
                        <option value="">------</option>
                        <c:forEach var="cls" items="${classNumList}">
                            <option value="${cls}" <c:if test="${param.classNum == cls}">selected</c:if>>${cls}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-auto form-check ms-2">
                    <input class="form-check-input" type="checkbox" id="isAttend" name="isAttend" value="1"
                        <c:if test="${param.isAttend == '1'}">checked</c:if>>
                    <label class="form-check-label" for="isAttend">在学中</label>
                </div>
                <div class="col-auto">
                    <button type="submit" class="student-btn">絞込み</button>
                </div>
            </form>
        </div>
        <!-- 結果表示部 -->
        <c:choose>
            <c:when test="${not empty studentList}">
                <div class="mb-1" style="font-size:1.05rem;">検索結果：${fn:length(studentList)}件</div>
                <div class="student-table-box">
                    <table class="table student-table mb-0">
                        <thead>
                            <tr>
                                <th>入学年度</th>
                                <th>学生番号</th>
                                <th>氏名</th>
                                <th>クラス</th>
                                <th>在学中</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="student" items="${studentList}">
                                <tr>
                                    <td>${student.entYear}</td>
                                    <td>${student.no}</td>
                                    <td>${student.name}</td>
                                    <td>${student.classNum}</td>
                                    <td class="student-radio">
                                        <c:choose>
                                            <c:when test="${student.attend}">〇</c:when>
                                            <c:otherwise>×</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="StudentEditServlet?no=${student.no}">変更</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-student">学生情報が存在しませんでした</div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
