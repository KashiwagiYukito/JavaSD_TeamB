<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<%@ include file="/sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目登録エラー</title>
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .error-card {
            background: #fff4f4;
            border-radius: 12px;
            box-shadow: 0 6px 18px #8881;
            padding: 2.5rem 1.5rem;
            max-width: 450px;
            margin: 2rem auto;
            text-align: center;
        }
        .section-title { font-weight: bold; font-size: 1.2rem; margin-bottom: 1rem; }
    </style>
</head>
<body>
<div class="container">
    <div class="error-card">
        <div class="section-title">科目登録エラー</div>
        <div class="mb-3 text-danger">科目登録時にエラーが発生しました。</div>
        <a href="subjectRegist.jsp" class="btn btn-primary">科目登録画面に戻る</a>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
