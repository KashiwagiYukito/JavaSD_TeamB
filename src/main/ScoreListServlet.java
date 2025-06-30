package main;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/main/ScoreListServlet")
public class ScoreListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String schoolCd = (String) request.getSession().getAttribute("schoolCd");
        String entYear = request.getParameter("entYear");
        String classNum = request.getParameter("classNum");
        String subjectCd = request.getParameter("subjectCd");
        String testNoStr = request.getParameter("no");
        int testNo = 0;
        if (testNoStr != null && !testNoStr.isEmpty()) {
            testNo = Integer.parseInt(testNoStr);
        }


        // プルダウンリストの取得（今まで通り）
        try {
            TestListSubjectDao testDao = new TestListSubjectDao();
            SubjectDAO subjectDao = new SubjectDAO();

            List<Integer> entYearList = testDao.getEntYears(schoolCd);
            List<String> classNumList = testDao.getClassNums(schoolCd);
            List<Subject> subjectList = subjectDao.filterBySchool(schoolCd);
            List<Integer> testNoList = new ArrayList<>();
            if (subjectCd != null && !subjectCd.isEmpty()) {
                testNoList = testDao.getTestNos(schoolCd, subjectCd);
            }

            request.setAttribute("entYearList", entYearList);
            request.setAttribute("classNumList", classNumList);
            request.setAttribute("subjectList", subjectList);
            request.setAttribute("testNoList", testNoList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorType", "system_error");
            request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
            return;
        }

        // 検索条件不足チェックに「testNoStr」も加える
        if (entYear == null || classNum == null || subjectCd == null || testNoStr == null ||
            entYear.isEmpty() || classNum.isEmpty() || subjectCd.isEmpty() || testNoStr.isEmpty()) {
            request.setAttribute("errorType", "lack_condition");
            request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
            return;
        }

        // 成績リスト検索
        try {
            SubjectDAO subjectDAO = new SubjectDAO();
            SchoolDAO schoolDAO = new SchoolDAO();
            Subject subject = null;
            School school = null;
            try {
                subject = subjectDAO.findById(schoolCd, subjectCd);
                school = schoolDAO.findById(schoolCd);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorType", "system_error");
                request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
                return;
            }

            TestListSubjectDao dao = new TestListSubjectDao();
            List<TestListSubject> list = null;
            try {

                list = dao.filter(
                    Integer.parseInt(entYear), classNum, subject, school, testNo);  // ★引数追加
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorType", "system_error");
                request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
                return;
            }

            if (list == null || list.isEmpty()) {
                request.setAttribute("errorType", "not_found");
            } else {
                request.setAttribute("scoreList", list);
                if (subject != null) {
                    request.setAttribute("subjectName", subject.getName());
                }
                request.setAttribute("testNo", testNoStr); // 画面に回数も渡す
            }
            request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorType", "system_error");
            request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
        }
    }
}
