package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import dao.TeacherDAO;

@WebServlet("/main/LoginController")
public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ★修正点1: リクエストの文字コードをUTF-8に設定
        request.setCharacterEncoding("UTF-8");

        // パラメータ取得
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        TeacherDAO dao = new TeacherDAO();
        Teacher teacher = null;

        try {
            // ★修正点2: IDが入力されている場合、前後の空白を除去して教員情報を取得
            if (id != null && !id.trim().isEmpty()) {
                teacher = dao.findById(id.trim());
            }

            // ★修正点3: 安全なログイン判定
            // 1. teacherオブジェクトがnullでない (IDが存在する)
            // 2. データベースのパスワードがnullでない
            // 3. 入力されたパスワードがnullでない
            // 4. パスワードが一致する (前後空白を除去して比較)
            if (teacher != null && teacher.getPassword() != null && password != null &&
                teacher.getPassword().trim().equals(password.trim())) {

                // ログイン成功：セッションに保存し、メインメニューへリダイレクト
                HttpSession session = request.getSession();
                session.setAttribute("teacher", teacher);
                session.setAttribute("schoolCd", teacher.getSchoolCd());
                response.sendRedirect("mainMenu.jsp");
                return; // 以降の処理は不要なため終了
            }

        } catch (Exception e) {
            // ★修正点4: 例外を握りつぶさず、コンソールにスタックトレースを出力
            e.printStackTrace();
            // ユーザーには汎用的なエラーメッセージを表示
            request.setAttribute("error", "システムエラーが発生しました。");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // ログイン失敗（ID/パスワード不一致、またはID未入力）
        request.setAttribute("error", "IDまたはパスワードが正しくありません。");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}