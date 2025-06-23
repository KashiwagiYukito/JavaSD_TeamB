<%-- mainMenu.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="Base-header.jsp" />

<%-- ページ全体（サイドバー＋メインコンテンツ）を囲む --%>
<div class="page-container">
    <div class="row g-0">

        <%-- 左カラム（3/12の幅）：サイドバーを読み込む --%>
        <div class="col-md-3 col-lg-2">
            <jsp:include page="Base-sidebar.jsp" />
        </div>

        <%-- 右カラム（9/12の幅）：メインコンテンツ --%>
        <div class="col-md-9 col-lg-10 main-content">

            <div class="logout-link">
                <a href="logout.jsp">ログアウト</a>
            </div>

            <div class="menu-title-bar">
                <h2 class="menu-title">メニュー</h2>
            </div>

            <div class="row g-4 justify-content-start">
                <div class="col-md-4">
                    <div class="menu-card menu-card-student">
                        <a href="StudentList.action">学生管理</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="menu-card menu-card-grade">
                        <div class="menu-card-title">成績管理</div>
                        <a href="TestRegist.action">成績登録</a>
                        <a href="TestList.action">成績参照</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="menu-card menu-card-subject">
                        <a href="SubjectList.action">科目管理</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="Base-footer.jsp" />