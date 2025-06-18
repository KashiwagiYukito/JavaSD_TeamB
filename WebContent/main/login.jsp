<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="Base-header.jsp" />

<body>

    <div class="login-box">
        <div class="login-header">
            <h2>ログイン</h2>
        </div>

        <form class="p-4" action="LoginController" method="post">
            <div class="form-wrapper">
                <!-- ID -->
                <div class="form-group">
                    <input type="text" class="form-control" id="id" name="id"
                           placeholder="ID" maxlength="20" required>
                </div>

                <!-- パスワード -->
                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password"
                           placeholder="パスワード" maxlength="20" required>
                </div>

                <!-- パスワード表示 -->
                <div class="show-password">
                    <input type="checkbox" id="chk_d_ps" onclick="togglePasswordVisibility()">
                    <label for="chk_d_ps" class="mb-0">パスワードを表示</label>
                </div>

                <!-- ログインボタン -->
                <div class="text-center">
                    <button type="submit" name="login" class="btn login-button">ログイン</button>
                </div>

                <!-- エラーメッセージ -->
                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                    <div class="error-message mt-3"><%= error %></div>
                <%
                    }
                %>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePasswordVisibility() {
            const pw = document.getElementById("password");
            pw.type = (pw.type === "password") ? "text" : "password";
        }
    </script>
</body>
</html>
<jsp:include page="Base-footer.jsp" />
