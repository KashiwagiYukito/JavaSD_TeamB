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

        // プルダウンリストの取得
        try {
            TestListSubjectDao testDao = new TestListSubjectDao();
            SubjectDAO subjectDao = new SubjectDAO();

            List<Integer> entYearList = testDao.getEntYears(schoolCd);
            List<String> classNumList = testDao.getClassNums(schoolCd);
            List<Subject> subjectList = subjectDao.filterBySchool(schoolCd);
            List<Integer> testNoList = new ArrayList<>();

            // ★ここを修正★
            // subjectCdがリクエストパラメータにある場合はそれを使用
            // 無い場合は、subjectListが空でなければ最初の科目をデフォルトとして使用
            String actualSubjectCdForTestNo = subjectCd;
            if ((subjectCd == null || subjectCd.isEmpty()) && !subjectList.isEmpty()) {
                // JSP側で科目プルダウンの初期選択値を設定できるように、
                // リクエストパラメータのsubjectCdが空の場合でも、subjectListの最初の科目をデフォルトとして設定
                actualSubjectCdForTestNo = subjectList.get(0).getCd();
            }

            if (actualSubjectCdForTestNo != null && !actualSubjectCdForTestNo.isEmpty()) {
                testNoList = testDao.getTestNos(schoolCd, actualSubjectCdForTestNo);
            }
            // ★修正ここまで★


            request.setAttribute("entYearList", entYearList);
            request.setAttribute("classNumList", classNumList);
            request.setAttribute("subjectList", subjectList);
            request.setAttribute("testNoList", testNoList);

            // 選択中の値をリクエスト属性に設定して、JSPで再表示できるようにする
            request.setAttribute("selectedEntYear", entYear);
            request.setAttribute("selectedClassNum", classNum);
            request.setAttribute("selectedSubjectCd", subjectCd); // ユーザーが選択した科目コード
            request.setAttribute("selectedTestNo", testNoStr); // ユーザーが選択した回数

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorType", "system_error");
            request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
            return;
        }

        // 検索条件不足チェックに「testNoStr」も加える
        // 初回表示時（検索パラメータがまだない状態）は、検索条件不足としない
        if (request.getParameterMap().containsKey("entYear") ||
            request.getParameterMap().containsKey("classNum") ||
            request.getParameterMap().containsKey("subjectCd") ||
            request.getParameterMap().containsKey("no")) {
            if (entYear == null || classNum == null || subjectCd == null || testNoStr == null ||
                entYear.isEmpty() || classNum.isEmpty() || subjectCd.isEmpty() || testNoStr.isEmpty()) {
                request.setAttribute("errorType", "lack_condition");
                request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
                return;
            }
        }


        // 成績リスト検索
        // 検索条件がすべて揃っている場合のみ検索を実行
        if (entYear != null && !entYear.isEmpty() &&
            classNum != null && !classNum.isEmpty() &&
            subjectCd != null && !subjectCd.isEmpty() &&
            testNoStr != null && !testNoStr.isEmpty()) {
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
                        Integer.parseInt(entYear), classNum, subject, school, testNo);
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
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorType", "system_error");
                request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
                return;
            }
        }
        request.getRequestDispatcher("/main/scoreList.jsp").forward(request, response);
    }
}