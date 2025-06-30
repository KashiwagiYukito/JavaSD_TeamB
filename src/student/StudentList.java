package student;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentDAO;

@WebServlet("/student/studentlist")
public class StudentList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        processRequest(req, resp);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // 検索条件取得
        String entYear = req.getParameter("f1");
        String classNum = req.getParameter("f2");
        String isActive = req.getParameter("f3");

        try {
            StudentDAO dao = new StudentDAO();
            List<Student> allStudents = dao.findAll();

            // セレクトボックス用リスト作成
            Set<String> entYearSet = new HashSet<>();
            Set<String> classSet = new HashSet<>();
            for (Student s : allStudents) {
                entYearSet.add(String.valueOf(s.getEntYear()));
                if (s.getClassNum() != null && !s.getClassNum().isEmpty()) {
                    classSet.add(s.getClassNum());
                }
            }
            List<String> entYearList = new ArrayList<>(entYearSet);
            entYearList.sort((a, b) -> b.compareTo(a)); // 年度を降順
            List<String> classList = new ArrayList<>(classSet);
            classList.sort(String::compareTo);

            // 絞り込み
            List<Student> filtered = new ArrayList<>();
            for (Student s : allStudents) {
                if (entYear != null && !entYear.isEmpty() && !(String.valueOf(s.getEntYear()).equals(entYear))) continue;
                if (classNum != null && !classNum.isEmpty() && !(s.getClassNum() != null && s.getClassNum().equals(classNum))) continue;
                if (isActive != null && !isActive.isEmpty()) {
                    boolean active = "true".equals(isActive);
                    if (s.isAttend() != active) continue;
                }
                filtered.add(s);
            }

            req.setAttribute("entYearList", entYearList);
            req.setAttribute("classList", classList);
            req.setAttribute("studentList", filtered);

            req.getRequestDispatcher("/student/Student_List.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "エラー: " + e.getMessage());
            req.getRequestDispatcher("/student/Student_List.jsp").forward(req, resp);
        }
    }
}
