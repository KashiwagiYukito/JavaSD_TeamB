package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDAO;

@WebServlet("/main/SubjectEditServlet")
public class SubjectEditServlet extends HttpServlet {
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String cd = request.getParameter("cd");
	        String schoolCd = (String) request.getSession().getAttribute("schoolCd");
	        try {
	            SubjectDAO dao = new SubjectDAO();
	            Subject subject = dao.findById(schoolCd, cd);
	            if (subject != null) {
	                request.setAttribute("cd", subject.getCd());
	                request.setAttribute("name", subject.getName());
	            }
	            request.getRequestDispatcher("/main/subjectEdit.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMsg", "データ取得エラー");
	            request.getRequestDispatcher("/main/subjectList.jsp").forward(request, response);
	        }
	    }

	    // POSTリクエスト：更新実行（今まで通り）
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String cd = request.getParameter("cd");
	        String name = request.getParameter("name");
	        String schoolCd = (String) request.getSession().getAttribute("schoolCd");

	        Subject s = new Subject();
	        s.setCd(cd);
	        s.setName(name);
	        s.setSchoolCd(schoolCd);

	        try {
	            SubjectDAO dao = new SubjectDAO();
	            dao.update(s, schoolCd, cd);
	            request.getRequestDispatcher("/main/subjectEditComp.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMsg", "変更エラー");
	            // 再表示のときもcdをパラメータで渡す
	            request.setAttribute("cd", cd);
	            request.setAttribute("name", name);
	            request.getRequestDispatcher("/main/subjectEdit.jsp").forward(request, response);
	        }
	    }
}
