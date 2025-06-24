package grade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Test;
import dao.TestDAO;

@WebServlet("/grade/Create")
public class GradeCreateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 学生リスト・科目リストなどを表示用にセット（DAO経由で取得）
        // request.setAttribute("studentList", studentList);
        // request.setAttribute("subjectList", subjectList);
        request.getRequestDispatcher("/grade/grade_create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // パラメータ受取
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        int subjectId = Integer.parseInt(request.getParameter("subject_id"));
        int score = Integer.parseInt(request.getParameter("score"));

        // Bean生成
        Test test = new Test();
        test.setStudentId(studentId);
        test.setSubjectId(subjectId);
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
