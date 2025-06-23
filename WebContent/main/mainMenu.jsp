<%-- mainMenu.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="Base-header.jsp" />

<%-- bodyタグはBase-header.jspで開始し、Base-footer.jspで閉じます --%>

<%-- ヘッダーとフッター以外の全コンテンツを囲む --%>
<div class="page-wrapper">

    <%-- サイドバーとメインコンテンツを横並びにするコンテナ --%>
    <div class="page-container">

        <%-- サイドバーを読み込む --%>
        <jsp:include page="Base-sidebar.jsp" />

        <%-- メインコンテンツ（カードなどが表示される右側エリア） --%>
        <main class="main-content">

            <div class="content-header">
                <a href="logout.jsp" class="logout-link">ログアウト</a>
            </div>

            <div class="menu-title-bar">
                <h2 class="menu-title">メニュー</h2>
            </div>

            <div class="row g-4 justify-content-start">
                <div class="col-lg-4">
                    <div class="menu-card menu-card-student">
                        <a href="StudentList.action">学生管理</a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="menu-card menu-card-grade">
                        <div class="menu-card-title">成績管理</div>
                        <a href="TestRegist.action">成績登録</a>
                        <a href="TestList.action">成績参照</a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="menu-card menu-card-subject">
                        <a href="SubjectList.action">科目管理</a>
                    </div>
                </div>
            </div>

            <%-- フッターをメインコンテンツの最下部に配置 --%>
            <footer class="app-footer">
                 <p>© teamB 得点管理システム</p>
            </footer>

        </main>
    </div>
</div>

<jsp:include page="Base-footer.jsp" />
