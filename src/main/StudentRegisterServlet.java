package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;

@WebServlet("/main/StudentRegisterServlet")
public class StudentRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentService studentService = new StudentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 入力値の取得
        String studentNo = request.getParameter("studentNo");
        String name = request.getParameter("name");
        request.getParameter("enrollmentYear");
        request.getParameter("classNum");

        // バリデーション
        if (studentNo.isEmpty() || name.isEmpty()) {
            request.setAttribute("errorMessage", "必須項目を入力してください");
            request.getRequestDispatcher("student_register.jsp").forward(request, response);
            return;
        }

        // 学生オブジェクトの作成
        Student student = new Student();

        // 登録処理
        boolean isSuccess = studentService.registerStudent(student);
        if (isSuccess) {
            response.sendRedirect("jsp/student/student_register_done.jsp");
        } else {
            request.setAttribute("errorMessage", "登録に失敗しました");
            request.getRequestDispatcher("student_register.jsp").forward(request, response);
        }
    }
}