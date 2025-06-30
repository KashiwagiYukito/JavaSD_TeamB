<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<%@ include file="/sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>成績登録</title>
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .form-card {
            background: #d2f6da;
            border-radius: 12px;
            box-shadow: 0 6px 18px #8881;
            padding: 2rem 1.5rem;
            max-width: 450px;
            margin: 2rem auto;
        }
        .section-title { font-weight: bold; font-size: 1.3rem; margin-bottom: 1rem; }
    </style>
</head>
<body>
<div class="container">
    <div class="section-title">成績登録</div>
    <div class="form-card">
        <form action="scoreRegistServlet" method="post">
            <div class="mb-3">
                <label class="form-label">学生番号</label>
                <input type="text" class="form-control" name="studentNo" required>
            </div>
            <div class="mb-3">
                <label class="form-label">科目コード</label>
                <input type="text" class="form-control" name="subjectCd" required>
            </div>
            <div class="mb-3">
                <label class="form-label">学校CD</label>
                <input type="text" class="form-control" name="schoolCd" required>
            </div>
            <div class="mb-3">
                <label class="form-label">テスト番号</label>
                <input type="number" class="form-control" name="no" required>
            </div>
            <div class="mb-3">
                <label class="form-label">得点</label>
                <input type="number" class="form-control" name="point" required>
            </div>
            <div class="mb-3">
                <label class="form-label">クラス番号</label>
                <input type="text" class="form-control" name="classNum" required>
            </div>
            <button type="submit" class="btn btn-success">登録</button>
            <a class="btn btn-secondary" href="scoreList.jsp">戻る</a>
        </form>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
