<%@ page contentType="text/html; charset=UTF-8" %>
<aside style="width: 180px; min-height: 100vh; background: #fff; font-size: 1.13rem; padding-top: 8px;">
  <nav>
    <ul style="list-style: none; padding: 0; margin: 0;">
      <li style="margin-bottom: 1.3em;">
        <a href="mainMenu.jsp" style="color: #1677ff; text-decoration: underline; font-size: 1.13rem;">メニュー</a>
      </li>
      <li style="margin-bottom: 1.3em;">
        <a href="<%=request.getContextPath()%>/main/StudentListServlet" style="color: #1677ff; text-decoration: underline; font-size: 1.13rem;">学生管理</a>
      </li>
      <li style="margin-bottom: 1.1em;">
        <span style="font-size: 1.08em; color: #222;">成績管理</span>
        <ul style="list-style: none; margin-left: 22px; margin-top: 2px; padding-left: 0;">
          <li style="margin-bottom: 0.5em;">
            <a href="<%=request.getContextPath()%>/main/ScoreListServlet" style="color: #1677ff; text-decoration: underline; font-size: 1.13rem;">成績登録</a>
          </li>
          <li>
            <a href="<%=request.getContextPath()%>/main/ScoreReferenceServlet" style="color: #1677ff; text-decoration: underline; font-size: 1.13rem;">成績参照</a>
          </li>
        </ul>
      </li>
      <li style="margin-bottom: 1.3em;">
        <a href="<%=request.getContextPath()%>/main/SubjectListServlet" style="color: #1677ff; text-decoration: underline; font-size: 1.13rem;">科目管理</a>
      </li>
    </ul>
  </nav>
</aside>
