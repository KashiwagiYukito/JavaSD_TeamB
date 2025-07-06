package main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@WebServlet("/main/ScoreRegistServlet")
public class ScoreRegistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        // 「action」パラメータ取得
        String action = req.getParameter("action");
        String entYear = req.getParameter("entYear");
        String classNum = req.getParameter("classNum");
        String subjectCd = req.getParameter("subjectCd");
        String testNoStr = req.getParameter("testNo");

        // 必須チェック
        if (entYear == null || classNum == null || subjectCd == null || testNoStr == null ||
                entYear.isEmpty() || classNum.isEmpty() || subjectCd.isEmpty() || testNoStr.isEmpty()) {
            req.setAttribute("errorType", "lack_condition");
            req.getRequestDispatcher("/main/scoreList.jsp").forward(req, resp);
            return;
        }

        int testNoInt = 0;
        try { testNoInt = Integer.parseInt(testNoStr); }
        catch (NumberFormatException e) {
            e.printStackTrace();
            req.setAttribute("errorType", "system_error");
            req.getRequestDispatcher("/main/scoreList.jsp").forward(req, resp);
            return;
        }

        TestListSubjectDao dao = new TestListSubjectDao();
        List<TestListSubject> list = new ArrayList<>();
        Subject subject = null;
        School school = null;
        try {
            SubjectDAO subjectDAO = new SubjectDAO();
            SchoolDAO schoolDAO = new SchoolDAO();
            subject = subjectDAO.findById((String) req.getSession().getAttribute("schoolCd"), subjectCd);
            school = schoolDAO.findById((String) req.getSession().getAttribute("schoolCd"));
            list = dao.filter(Integer.parseInt(entYear), classNum, subject, school, testNoInt);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorType", "system_error");
            req.getRequestDispatcher("/main/scoreList.jsp").forward(req, resp);
            return;
        }

        // ----------------- ★ 削除処理分岐 ★ -----------------
        if ("delete".equals(action)) {
            String[] deleteTargets = req.getParameterValues("deleteTargets");
            if (deleteTargets != null && deleteTargets.length > 0) {
                try {
                    for (String val : deleteTargets) {
                        // studentNo_subjectCd_testNo
                        String[] parts = val.split("_");
                        if (parts.length == 3) {
                            String studentNo = parts[0];
                            String subCd = parts[1];
                            int delTestNo = Integer.parseInt(parts[2]);
                            dao.deletePoint(studentNo, subCd, (String) req.getSession().getAttribute("schoolCd"), delTestNo);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    req.setAttribute("errorType", "system_error");
                    req.getRequestDispatcher("/main/scoreList.jsp").forward(req, resp);
                    return;
                }
            }
            // 削除後は再検索画面にリダイレクト（検索条件引き継ぎ）
            resp.sendRedirect(req.getContextPath() + "/main/ScoreListServlet?entYear=" + entYear + "&classNum=" + classNum + "&subjectCd=" + subjectCd + "&no=" + testNoStr);
            return;
        }
        // ----------------------------------------------------

        // ----------------- ★ 登録処理 ★ -----------------
        boolean hasError = false;
        Map<String, Integer> registerPoints = new HashMap<>();
        for (TestListSubject row : list) {
            String pointStr = req.getParameter("point_" + row.getStudentNo());
            row.setPointStr(pointStr);
            if (pointStr != null && !pointStr.isEmpty()) {
                try {
                    int point = Integer.parseInt(pointStr);
                    if (point < 0 || point > 100) {
                        row.setErrorPoint("0～100の範囲で入力してください");
                        hasError = true;
                    } else {
                        row.setErrorPoint(null);
                        registerPoints.put(row.getStudentNo(), point);
                    }
                } catch (NumberFormatException e) {
                    row.setErrorPoint("数値で入力してください");
                    hasError = true;
                }
            } else {
                row.setErrorPoint("点数を入力してください");
                hasError = true;
            }
        }

        if (hasError) {
            req.setAttribute("scoreList", list);
            req.setAttribute("selectedEntYear", entYear);
            req.setAttribute("selectedClassNum", classNum);
            req.setAttribute("selectedSubjectCd", subjectCd);
            req.setAttribute("selectedTestNo", testNoStr);
            req.setAttribute("subjectName", subject != null ? subject.getName() : "");
            req.setAttribute("testNo", testNoStr);
            req.getRequestDispatcher("/main/scoreList.jsp").forward(req, resp);
            return;
        }

        // DB登録
        try {
            for (Map.Entry<String, Integer> entry : registerPoints.entrySet()) {
                String studentNo = entry.getKey();
                int point = entry.getValue();
                dao.updatePoint(
                        studentNo,
                        subjectCd,
                        (String) req.getSession().getAttribute("schoolCd"),
                        testNoInt,
                        point
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorType", "system_error");
            req.getRequestDispatcher("/main/scoreList.jsp").forward(req, resp);
            return;
        }

        // 成績登録完了画面へ
        req.getRequestDispatcher("/main/scoreRegistComp.jsp").forward(req, resp);
    }
}
