package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TeacherDAO;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 入力値の取得
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        try {
            TeacherDAO dao = new TeacherDAO();
            boolean isAuthenticated = dao.authenticate(id, password);

            if (isAuthenticated) {
                // ログイン成功：セッションにID保存してメニューなどへリダイレクト
                HttpSession session = request.getSession();
                session.setAttribute("loginId", id);
                response.sendRedirect("mainMenu.jsp"); // ←ログイン後のページに変更
            } else {
                // ログイン失敗：エラーメッセージをセットしてJSPへ戻る
                request.setAttribute("error", "IDまたはパスワードが間違っています。");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
