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

            List<Subject> subjectList = subjectDAO.filterBySchool(schoolCd);
            List<Integer> entYearList = dao.getEntYears(schoolCd);
            List<String> classNumList = dao.getClassNums(schoolCd);

            request.setAttribute("subjectList", subjectList);
            request.setAttribute("entYearList", entYearList);
            request.setAttribute("classNumList", classNumList);

            if (entYearStr == null || entYearStr.isEmpty()
                    || classNum == null || classNum.isEmpty()
                    || subjectCd == null || subjectCd.isEmpty()) {
                request.setAttribute("errorType", "lack_condition");
                request.getRequestDispatcher("/main/scoreReference.jsp").forward(request, response);
                return;
            }

            int entYear = Integer.parseInt(entYearStr);

            SchoolDAO schoolDAO = new SchoolDAO();
            Subject subject = subjectDAO.findById(schoolCd, subjectCd);
            School school = schoolDAO.findById(schoolCd);

            List<TestListSubject> test1 = dao.filter(entYear, classNum, subject, school, 1);
            List<TestListSubject> test2 = dao.filter(entYear, classNum, subject, school, 2);

            java.util.Map<String, TestListSubject> map = new java.util.LinkedHashMap<>();
            for (TestListSubject t : test1) {
                map.put(t.getStudentNo(), t);
                t.setPoint1(t.getPointInteger(1));
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

            // ★ここで"点数が一つもない"ならscoreListを空にする
            boolean allEmpty = true;
            for (TestListSubject t : scoreList) {
                // 1回も2回もnullか空なら→点数なし
                Integer p1 = t.getPoint1();
                Integer p2 = t.getPoint2();
                if ((p1 != null && p1 >= 0) || (p2 != null && p2 >= 0)) {
                    allEmpty = false;
                    break;
                }
            }

            if (scoreList.isEmpty() || allEmpty) {
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
