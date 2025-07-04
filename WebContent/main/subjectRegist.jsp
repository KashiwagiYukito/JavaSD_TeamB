<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>科目情報登録</title>
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
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
        .subject-regist-main {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            min-width: 0;
            padding-top: 40px;
            padding-left: 52px;
            position: relative;
        }
        .subject-regist-main::before {
            /* サイドバーとメイン間の縦線 */
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
        .subreg-title {
            font-size: 1.7rem;
            font-weight: bold;
            background: #f4f4f4;
            padding: 0.8rem 1.2rem;
            border-radius: 0.6rem 0.6rem 0 0;
            margin-bottom: 1.3rem;
            width: 100%;
            max-width: 480px;
        }
        .subreg-label {
            font-weight: bold;
            font-size: 1.1rem;
            margin-bottom: 0.35rem;
        }
        .subreg-form .form-control {
            max-width: 700px;
        }
        .subreg-form {
            margin-top: 0.6rem;
        }
        .subreg-btn {
            margin-top: 1.3rem;
            width: 90px;
            background: #1677ff;
            color: #fff;
            font-size: 1.13rem;
            font-weight: bold;
            border-radius: 7px;
            padding: 0.44em 0;
            border: none;
            box-shadow: 0 2px 8px #1677ff22;
            letter-spacing: 0.08em;
        }
        .subreg-btn:hover {
            background: #165eea;
        }
        .subreg-back {
            display: inline-block;
            margin-top: 1.2rem;
            margin-left: 0.3rem;
            font-size: 1rem;
            color: #1677ff;
            text-decoration: underline;
        }
        .subreg-back:hover {
            color: #165eea;
            text-decoration: underline;
        }
        @media (max-width: 800px) {
            .subreg-title { font-size: 1.2rem; }
            .subreg-form .form-control { max-width: 100%; }
            .subreg-btn { width: 100%; }
        }
    </style>
</head>
<body>
<div class="main-flex">
    <div class="sidebar-area">
        <%@ include file="/sidebar.jsp" %>
    </div>
    <div class="subject-regist-main">
        <div class="subreg-title">科目情報登録</div>
        <form class="subreg-form" action="<%= request.getContextPath() %>/main/SubjectRegistServlet" method="post" autocomplete="off">
            <div class="mb-2">
                <div class="subreg-label">科目コード</div>
                <input type="text" class="form-control" name="cd" placeholder="科目コードを入力してください" required>
            </div>
            <div class="mb-2">
                <div class="subreg-label">科目名</div>
                <input type="text" class="form-control" name="name" placeholder="科目名を入力してください" required>
            </div>
            <button type="submit" class="subreg-btn">登録</button><br>
            <a href="<%=request.getContextPath()%>/main/SubjectListServlet">戻る</a>
        </form>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
