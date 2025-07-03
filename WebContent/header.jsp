<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    bean.Teacher loginUser = (bean.Teacher) session.getAttribute("user");
    String username = (loginUser != null) ? loginUser.getName() : null;
%>
<div style="margin: 0 100px;">
  <div style="background: #e9f2fc; padding: 18px 24px; border-bottom: 1.5px solid #d0deee; display: flex; align-items: center; justify-content: space-between;">
    <div style="font-size: 2rem; font-weight: bold; color: #222;">
      得点管理システム
    </div>
    <div>
      <% if (username != null) { %>
        <span style="font-size: 1.15rem; margin-right: 1.3em; color: #222;"> <%= username %> 様</span>
        <a href="logout.jsp" style="font-size: 1.08rem; color: #1677ff; text-decoration: underline; margin-left: 0.8em;">ログアウト</a>
      <% } %>
    </div>
  </div>