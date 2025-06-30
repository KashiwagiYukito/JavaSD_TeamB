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
import dao.TestListStudentDao;

@WebServlet("/main/ScoreListStudentServlet")
public class ScoreListStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentNo = request.getParameter("studentNo");
        List<TestListStudent> studentScoreList = null;
        Student studentInfo = null;

        if (studentNo != null && !studentNo.isEmpty()) {
            StudentDAO sDao = new StudentDAO();
            try {
                studentInfo = sDao.filterByNo(studentNo);
                if (studentInfo != null) {
                    TestListStudentDao dao = new TestListStudentDao();
                    studentScoreList = dao.filter(studentInfo);
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
