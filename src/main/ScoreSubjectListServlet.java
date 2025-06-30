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
	    String testNoStr = request.getParameter("no");
	    String schoolCd = (String) request.getSession().getAttribute("schoolCd");

	    // 検索条件の入力チェック
	    if (entYearStr == null || entYearStr.isEmpty()
	            || classNum == null || classNum.isEmpty()
	            || subjectCd == null || subjectCd.isEmpty()
	            || testNoStr == null || testNoStr.isEmpty()) {
	        request.setAttribute("errorType", "lack_condition");
	        request.getRequestDispatcher("/main/scoreListSubject.jsp").forward(request, response);
	        return;
	    }

	    int entYear = Integer.parseInt(entYearStr);
	    int testNo = Integer.parseInt(testNoStr);

	    try {
	        SubjectDAO subjectDAO = new SubjectDAO();
	        SchoolDAO schoolDAO = new SchoolDAO();
	        Subject subject = subjectDAO.findById(schoolCd, subjectCd);
	        School school = schoolDAO.findById(schoolCd);

	        TestListSubjectDao dao = new TestListSubjectDao();
	        List<TestListSubject> scoreList = dao.filter(entYear, classNum, subject, school, testNo);

	        if (scoreList == null || scoreList.isEmpty()) {
	            request.setAttribute("errorType", "not_found");
	        } else {
	            request.setAttribute("scoreList", scoreList);
	            request.setAttribute("subjectName", subject.getName());
	        }
	        request.getRequestDispatcher("/main/scoreListSubject.jsp").forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMsg", "データベースエラーが発生しました。");
	        request.getRequestDispatcher("/error.jsp").forward(request, response);
	    }
	}
}
