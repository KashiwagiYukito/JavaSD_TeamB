package main;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Subject;
import bean.TestListSubject;
import dao.SchoolDAO;
import dao.SubjectDAO;
import dao.TestListSubjectDao;

@WebServlet("/main/ScoreSubjectListServlet")
public class ScoreSubjectListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String entYearStr = request.getParameter("entYear");
        String classNum = request.getParameter("classNum");
        String subjectCd = request.getParameter("subjectCd");
        String schoolCd = (String) request.getSession().getAttribute("schoolCd");

        try {
            SubjectDAO subjectDAO = new SubjectDAO();
            TestListSubjectDao dao = new TestListSubjectDao();

            // 常にリストをセットしてJSPに渡す
            List<Subject> subjectList = subjectDAO.filterBySchool(schoolCd);
            List<Integer> entYearList = dao.getEntYears(schoolCd);
            List<String> classNumList = dao.getClassNums(schoolCd);

            request.setAttribute("subjectList", subjectList);
            request.setAttribute("entYearList", entYearList);
            request.setAttribute("classNumList", classNumList);

            // 入力チェック（testNoStrは不要）
            if (entYearStr == null || entYearStr.isEmpty()
                    || classNum == null || classNum.isEmpty()
                    || subjectCd == null || subjectCd.isEmpty()) {
                request.setAttribute("errorType", "lack_condition");
                request.getRequestDispatcher("/main/scoreReference.jsp").forward(request, response);
                return;
            }

            // 検索条件OKの場合のみ成績一覧取得
            int entYear = Integer.parseInt(entYearStr);

            SchoolDAO schoolDAO = new SchoolDAO();
            Subject subject = subjectDAO.findById(schoolCd, subjectCd);
            School school = schoolDAO.findById(schoolCd);

            // 1回目
            List<TestListSubject> test1 = dao.filter(entYear, classNum, subject, school, 1);
            // 2回目
            List<TestListSubject> test2 = dao.filter(entYear, classNum, subject, school, 2);

            // 学生番号でマージ
            java.util.Map<String, TestListSubject> map = new java.util.LinkedHashMap<>();
            for (TestListSubject t : test1) {
                map.put(t.getStudentNo(), t);
                t.setPoint1(t.getPointInteger(1)); // ← StringではなくIntegerで渡す
            }
            for (TestListSubject t : test2) {
                TestListSubject existing = map.get(t.getStudentNo());
                if (existing != null) {
                    existing.setPoint2(t.getPointInteger(2));
                } else {
                    t.setPoint2(t.getPointInteger(2));
                    map.put(t.getStudentNo(), t);
                }
            }


            List<TestListSubject> scoreList = new java.util.ArrayList<>(map.values());

            if (scoreList.isEmpty()) {
                request.setAttribute("errorType", "not_found");
            } else {
                request.setAttribute("subjectScoreList", scoreList);
                request.setAttribute("subjectLabel", subject.getName());
            }
            request.getRequestDispatcher("/main/scoreSubjectList.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "データベースエラーが発生しました。");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
