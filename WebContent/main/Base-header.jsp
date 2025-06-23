<%-- Base-header.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>得点管理システム</title>

  <%-- Bootstrap CSS --%>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

  <%-- カスタムCSS (必ずBootstrapの後で読み込む) --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
  <%-- ★修正点：ヘッダーに app-header クラスを追加 --%>
  <header class="app-header">
    <h1>得点管理システム</h1>
  </header>

