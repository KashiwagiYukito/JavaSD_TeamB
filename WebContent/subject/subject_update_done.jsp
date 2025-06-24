<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>変更完了</title>
</head>
<body>
    <h2>科目情報を変更しました</h2>
    <p>学校コード: ${subject.schoolCd}</p>
    <p>科目コード: ${subject.cd}</p>
    <p>新しい科目名: ${subject.name}</p>
    <a href="SubjectUpdate?action=list">一覧に戻る</a>
</body>
</html>
