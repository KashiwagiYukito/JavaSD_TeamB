package main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.TestListStudent;
import dao.StudentDAO;
import dao.SubjectDAO;
import dao.TestListStudentDao;
import dao.TestListSubjectDao;

@WebServlet("/main/ScoreListStudentServlet")
public class ScoreListStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentNo = request.getParameter("studentNo");
        String schoolCd = (String) request.getSession().getAttribute("schoolCd");

        // ▼--- プルダウンリスト取得 ---▼
        TestListSubjectDao subDao = new TestListSubjectDao();
        List<Integer> entYearList = null;
        List<String> classNumList = null;
        List<bean.Subject> subjectList = null;
        try {
            entYearList = subDao.getEntYears(schoolCd);
            classNumList = subDao.getClassNums(schoolCd);
            SubjectDAO subjectDao = new SubjectDAO();
            subjectList = subjectDao.filterBySchool(schoolCd);
        } catch(Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("entYearList", entYearList);
        request.setAttribute("classNumList", classNumList);
        request.setAttribute("subjectList", subjectList);

        // ▼--- 学生情報・成績リストの取得 ---▼
        List<TestListStudent> studentScoreList = null;
        Student studentInfo = null;

        if (studentNo != null && !studentNo.isEmpty()) {
            StudentDAO sDao = new StudentDAO();
            try {
                studentInfo = sDao.filterByNo(studentNo);
                if (studentInfo != null) {
                    // 学生が存在する場合は成績リスト取得
                    TestListStudentDao dao = new TestListStudentDao();
                    studentScoreList = dao.filter(studentInfo);
                } else {
                    // 学生が存在しない場合も「氏名：（未登録） 学籍番号」形式でJSP表示するため仮のStudentをセット
                    studentInfo = new Student();
                    studentInfo.setName("（未登録）");
                    studentInfo.setNo(studentNo); // フィールド名はStudent.javaに合わせて
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMsg", "データベースエラーが発生しました。");
            }
        }

        request.setAttribute("studentInfo", studentInfo);
        request.setAttribute("studentScoreList", studentScoreList);
        request.getRequestDispatcher("/main/scoreListStudent.jsp").forward(request, response);
    }
}
