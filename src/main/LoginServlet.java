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

@WebServlet("/main/LoginServlet") // ← 大文字で統一
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginId = request.getParameter("id");
        String password = request.getParameter("password");
        System.out.println("入力ID: " + loginId); // 追加
        System.out.println("入力PW: " + password); // 追加

        try {
            TeacherDAO dao = new TeacherDAO();
            Teacher teacher = dao.login(loginId, password);
            System.out.println("teacher = " + teacher); // 追加
            if (teacher != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", teacher);
                session.setAttribute("schoolCd", teacher.getSchoolCd());
                response.sendRedirect(request.getContextPath() + "/main/mainMenu.jsp");
            } else {
                request.setAttribute("loginError", "ログインに失敗しました");
                request.getRequestDispatcher("/main/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("loginError", "システムエラー");
            request.getRequestDispatcher("/main/login.jsp").forward(request, response); // ← forward追加
        }
    }
}
