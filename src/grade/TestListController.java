// TestListController.java
package grade;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.TestListStudent;
import dao.TestListStudentDao;

@WebServlet("/grade/TestListController")
public class TestListController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/grade/testList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String mode = request.getParameter("searchType");
        if ("student".equals(mode)) {
            searchByStudent(request, response);
        } else {
            doGet(request, response);
        }
    }

    private void searchByStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentNo = request.getParameter("studentId");
        List<TestListStudent> gradeList = null;

        if (studentNo != null && !studentNo.isEmpty()) {
            Student stu = new Student();
            stu.setNo(studentNo);
            TestListStudentDao dao = new TestListStudentDao();
            gradeList = dao.filter(stu);
        }
        request.setAttribute("testList", gradeList);

        if (gradeList == null || gradeList.isEmpty()) {
            request.setAttribute("error", "該当する学生の成績が見つかりませんでした。");
        }
        request.getRequestDispatcher("/grade/testList.jsp").forward(request, response);
    }
}
