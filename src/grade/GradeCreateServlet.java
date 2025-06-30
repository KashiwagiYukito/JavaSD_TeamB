package grade;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.Subject;
import bean.Test;
import dao.StudentDAO;
import dao.SubjectDAO;
import dao.TestDAO;

@WebServlet("/grade/GradeCreateServlet")
public class GradeCreateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ★ 学生リスト取得
        List<Student> studentList = new ArrayList<>();
        try {
            studentList = new StudentDAO().findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("studentList", studentList);

        // ★ 科目リスト取得
        List<Subject> subjectList = new ArrayList<>();
        try {
            subjectList = new SubjectDAO().findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("subjectList", subjectList);

        // JSPへ
        request.getRequestDispatcher("/grade/grade_create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // パラメータ受取
        String studentId = request.getParameter("student_id");
        String subjectId = request.getParameter("subject_id");
        int score = Integer.parseInt(request.getParameter("score"));

        // Bean生成
        Test test = new Test();
        test.setStudentId(studentId);   // ここ型がintならintに変換
        test.setSubjectId(subjectId);   // ここ型がintならintに変換
        test.setScore(score);

        // 登録処理
        TestDAO dao = new TestDAO();
        try {
            dao.insert(test);
            request.setAttribute("test", test);
            request.getRequestDispatcher("/grade/grade_create_done.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "成績登録に失敗しました");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
