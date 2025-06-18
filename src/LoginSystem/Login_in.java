package accounts;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import tool.CommonServlet;

/**
 * ログイン処理を担当するコントローラ。
 * /accounts/login にアクセスされたときにこのクラスが処理を行う。
 */
@WebServlet(urlPatterns = { "/accounts/login" })
public class LoginController extends CommonServlet {

    /**
     * GETメソッドでアクセスされた場合（例: 初回ログイン画面表示時）に実行される処理。
     */
    @Override
    protected void get(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // login-in.jsp というログイン画面にフォワード（サーバー内部で遷移）
        req.getRequestDispatcher("login-in.jsp").forward(req, resp);
    }

    /**
     * POSTメソッドでアクセスされた場合（例: ログインフォーム送信時）に実行される処理。
     */
    @Override
    protected void post(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 現在のセッションを取得（存在しない場合は新規作成）
        HttpSession session = req.getSession();

        // 入力フォームから送信されたログイン名とパスワードを取得
        String login = req.getParameter("login");
        String password = req.getParameter("password");

        // UserDAO（データベースアクセスクラス）を使ってログイン処理を実行
        UserDAO dao = new UserDAO();
        User user = dao.login(login, password);  // 該当するユーザーがいれば User オブジェクトが返る

        if (user != null) {
            // 認証成功時：ユーザー情報をセッションに保存
            session.setAttribute("session_user", user);

            // 管理者フラグをセッションに設定（"admin" という文字列と一致するかで判定）
            session.setAttribute("isAdmin", "admin".equalsIgnoreCase(user.getRole()));

            // ログイン成功後、メイン画面（/main）にリダイレクト（ブラウザにURLを再要求させる）
            resp.sendRedirect(req.getContextPath() + "/main");

        } else {
            // 認証失敗時：入力されたログイン名を再表示用にセット
            req.setAttribute("login", login);

            // エラーメッセージをリクエストに追加（JSP側で表示用）
            req.setAttribute("errorMessage", "ログイン名またはパスワードが違います");

            // ログイン画面に戻る（入力ミスを修正して再試行させる）
            req.getRequestDispatcher("login-in.jsp").forward(req, resp);
        }
    }
}
