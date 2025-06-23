package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Student;

@WebServlet("/main/StudentRegisterServlet")
public class StudentRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentService studentService = new StudentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 入力値の取得
        String studentNo = request.getParameter("studentNo");
        String name = request.getParameter("name");
        String enrollmentYear = request.getParameter("enrollmentYear");
        String classNum = request.getParameter("classNum");

        // 学校コードはセッションから取得（ログイン済み前提）
        HttpSession session = request.getSession();
        String schoolCd = (String) session.getAttribute("schoolCd");

        // バリデーション
        if (studentNo == null || studentNo.isEmpty() ||
            name == null || name.isEmpty() ||
            enrollmentYear == null || enrollmentYear.isEmpty() ||
            classNum == null || classNum.isEmpty() ||
            schoolCd == null || schoolCd.isEmpty()) {

            request.setAttribute("errorMessage", "すべての項目を正しく入力してください");
            request.getRequestDispatcher("student_register.jsp").forward(request, response);
            return;
        }

        // 学生オブジェクトの作成とプロパティ設定
        Student student = new Student();
        student.setStudentNo(studentNo);
        student.setName(name);
        student.setEnrollmentYear(Integer.parseInt(enrollmentYear));
        student.setClassNum(classNum);
        student.setIsAttend(true); // ← 在学中を強制的にtrue
        student.setSchoolCd(schoolCd);

        // 登録処理
        boolean isSuccess = studentService.registerStudent(student);

        if (isSuccess) {
            response.sendRedirect("main/student_register_done.jsp");
        } else {
            request.setAttribute("errorMessage", "登録に失敗しました");
            request.getRequestDispatcher("main/student_register.jsp").forward(request, response);
        }
    }
}