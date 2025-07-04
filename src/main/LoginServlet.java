package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import dao.TeacherDAO;

@WebServlet("/main/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginId = request.getParameter("id");
        String password = request.getParameter("password");

        try {
            TeacherDAO dao = new TeacherDAO();
            Teacher teacher = dao.login(loginId, password);
            if (teacher != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", teacher);
                session.setAttribute("schoolCd", teacher.getSchoolCd());
                response.sendRedirect(request.getContextPath() + "/main/mainMenu.jsp");
            } else {
                // エラーメッセージと入力IDをセットして再表示
                request.setAttribute("loginError", "IDまたはパスワードが確認できませんでした");
                request.setAttribute("enteredId", loginId);
                request.getRequestDispatcher("/main/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("loginError", "システムエラー");
            request.setAttribute("enteredId", loginId); // 例外時も入力IDを保持（お好みで）
            request.getRequestDispatcher("/main/login.jsp").forward(request, response);
        }
    }
}
