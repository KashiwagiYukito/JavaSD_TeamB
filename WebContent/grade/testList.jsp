<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Base-header.jsp" %>
<%@ include file="/Base-sidebar.jsp" %>

<div class="main-area container" style="margin-top: 50px; max-width: 900px;">
    <div class="search-box p-4 rounded shadow-sm bg-white">
        <div class="mb-4">
            <h2 class="mb-1" style="font-size: 1.4rem; font-weight: bold;">成績参照</h2>
        </div>

        <%-- 科目情報で検索 --%>
        <form action="gradeSearchSubject" method="get" class="mb-4">
            <div class="row g-3 align-items-end">
                <div class="col-md-3">
                    <label for="year" class="form-label">入学年度</label>
                    <select name="year" id="year" class="form-select">
                        <c:forEach var="year" items="${yearList}">
                            <option value="${year}">${year}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="classNum" class="form-label">クラス</label>
                    <select name="classNum" id="classNum" class="form-select">
                        <c:forEach var="cls" items="${classList}">
                            <option value="${cls.id}">${cls.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="subject" class="form-label">科目</label>
                    <select name="subject" id="subject" class="form-select">
                        <c:forEach var="sub" items="${subjectList}">
                            <option value="${sub.id}">${sub.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-dark w-100">検索</button>
                </div>
            </div>
        </form>

        <%-- 学生番号で検索 --%>
        <form action="<%=request.getContextPath()%>/grade/TestListController" method="get">
            <div class="row g-3 align-items-end">
                <div class="col-md-6">
                    <label for="studentId" class="form-label">学生番号</label>
                    <input type="text" name="studentId" id="studentId" class="form-control" placeholder="学生番号を入力してください">
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-dark w-100">検索</button>
                </div>
            </div>
        </form>

        <%-- エラーメッセージ表示 --%>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="error-message mt-3 text-danger fw-bold"><%= error %></div>
        <%
            }
        %>
    </div>
</div>

<%@ include file="/Base-footer.jsp" %>
