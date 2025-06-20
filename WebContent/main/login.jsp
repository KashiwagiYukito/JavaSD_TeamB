<%-- login.jsp --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="Base-header.jsp" />

<body>

    <div class="login-box">
        <div class="login-header">
            <h2>ログイン</h2>
        </div>

        <form action="LoginController" method="post">
            <div class="form-wrapper">
                <div class="form-group">
                    <input type="text" class="form-control" id="id" name="id"
                           placeholder="ID" maxlength="20" required>
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password"
                           placeholder="パスワード" maxlength="20" required>
                </div>

                <div class="show-password">
                    <input type="checkbox" id="chk_d_ps" onclick="togglePasswordVisibility()">
                    <label for="chk_d_ps" class="mb-0">パスワードを表示</label>
                </div>

                <div class="text-center">
                    <button type="submit" name="login" class="btn login-button">ログイン</button>
                </div>

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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePasswordVisibility() {
            const pw = document.getElementById("password");
            pw.type = (pw.type === "password") ? "text" : "password";
        }
    </script>
</body>
<jsp:include page="Base-footer.jsp" />