package main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.Class_NumDAO;
import dao.StudentDAO;

@WebServlet("/main/StudentListServlet")
public class StudentListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String schoolCd = (String) request.getSession().getAttribute("schoolCd");
            String entYearStr = request.getParameter("entYear");
            String classNum = request.getParameter("classNum");
            String isAttendStr = request.getParameter("isAttend");

            // パラメータをnull・空チェックして型変換
            Integer entYear = (entYearStr != null && !entYearStr.isEmpty()) ? Integer.parseInt(entYearStr) : null;
            Boolean isAttend = null;
            if (isAttendStr != null) isAttend = true;

            StudentDAO studentDao = new StudentDAO();

            List<Student> list;

            // ▼ どれも指定されてなければ「全件表示」
            boolean noFilter =
                (entYear == null)
                && (classNum == null || classNum.isEmpty())
                && (isAttendStr == null);

            if (noFilter) {
                // 最初のアクセス時 or 絞り込み条件なしは全件表示
                list = studentDao.findBySchool(schoolCd);
            } else {
                // どれか指定されていたら条件検索
                if (isAttend == null) isAttend = false; // ←必須: 未指定時は在学中でない人のみ出る場合はfalse、両方出したければnull
                list = studentDao.search(schoolCd, entYear, classNum, isAttend);
            }

            // 年度・クラスリスト
            List<Integer> entYearList = studentDao.getEntYears(schoolCd);
            Class_NumDAO classNumDao = new Class_NumDAO();
            List<String> classNumList = classNumDao.getClassNums(schoolCd);

            request.setAttribute("studentList", list);
            request.setAttribute("entYearList", entYearList);
            request.setAttribute("classNumList", classNumList);

            request.getRequestDispatcher("/main/studentList.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/main/studentList.jsp").forward(request, response);
        }
    }
}

