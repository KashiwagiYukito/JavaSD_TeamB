package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Student;


@WebServlet("/main/Register")
public class StudentRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // フォーム表示
        request.getRequestDispatcher("/main/student_register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 入力値の取得
        String studentNo = request.getParameter("studentNo");
        String name = request.getParameter("name");
        String enrollmentYear = request.getParameter("enrollmentYear");
        String classNum = request.getParameter("classNum");

        // 学校コードはセッションから取得
        HttpSession session = request.getSession(false);
        String schoolCd = (session != null) ? (String) session.getAttribute("schoolCd") : null;

        System.out.println(
        		  "studentNo=" + studentNo +
        		  " name=" + name +
        		  " enrollmentYear=" + enrollmentYear +
        		  " classNum=" + classNum +
        		  " schoolCd=" + schoolCd
        		);


        // バリデーション
        if (isNullOrEmpty(studentNo) || isNullOrEmpty(name) ||
            isNullOrEmpty(enrollmentYear) || isNullOrEmpty(classNum) ||
            isNullOrEmpty(schoolCd)) {

            request.setAttribute("errorMessage", "すべての項目を正しく入力してください");
            request.getRequestDispatcher("/main/student_register.jsp").forward(request, response);
            return;
        }

        // 整数変換エラー対策
        int entYear;
        try {
            entYear = Integer.parseInt(enrollmentYear);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "入学年度は数字で入力してください");
            request.getRequestDispatcher("/main/student_register.jsp").forward(request, response);
            return;
        }

        // 学生オブジェクト生成
        Student student = new Student();
        student.setNo(studentNo);
        student.setName(name);
        student.setEntYear(entYear);
        student.setClassNum(classNum);
        student.setAttend(true); // 在学中
        student.setSchoolCd(schoolCd);

        // 登録処理
        boolean isSuccess = studentService.registerStudent(student);

        if (isSuccess) {
            // 成功→完了画面へ
            response.sendRedirect(request.getContextPath() + "/main/student_register_done.jsp");
        } else {
            // 失敗→エラー表示で戻す
            request.setAttribute("errorMessage", "登録に失敗しました（学生番号重複など）");
            request.getRequestDispatcher("/main/student_register.jsp").forward(request, response);
        }
    }

    // nullまたは空文字判定のヘルパー
    private boolean isNullOrEmpty(String str) {
        return (str == null || str.trim().isEmpty());
    }
}
