package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;

@WebServlet("/StudentRegisterServlet")
public class StudentRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // フォームデータを取得
        String studentNo = request.getParameter("studentNo");
        String name = request.getParameter("name");
        String enrollmentYear = request.getParameter("enrollmentYear");
        String classNum = request.getParameter("classNum");

        // 入力バリデーション（簡易版）
        if (studentNo == null || studentNo.isEmpty() ||
            name == null || name.isEmpty() ||
            enrollmentYear == null || enrollmentYear.isEmpty() ||
            classNum == null || classNum.isEmpty()) {
            request.setAttribute("errorMessage", "すべての項目を入力してください。");
            request.getRequestDispatcher("jsp/student/student_register.jsp").forward(request, response);
            return;
        }

        // 学生オブジェクト作成
        Student student = new Student();

        // 登録処理
        StudentService studentService = new StudentService();
        boolean isSuccess = studentService.registerStudent(student);

        // 登録成功時の処理
        if (isSuccess) {
            response.sendRedirect("jsp/student/student_register_done.jsp");
        } else {
            request.setAttribute("errorMessage", "登録に失敗しました。");
            request.getRequestDispatcher("jsp/student/student_register.jsp").forward(request, response);
        }
    }
}