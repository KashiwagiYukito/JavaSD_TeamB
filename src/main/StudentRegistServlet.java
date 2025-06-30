package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentDAO;

@WebServlet("/main/StudentRegistServlet")
public class StudentRegistServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String entYearStr = request.getParameter("entYear"); // ← entYearStr に統一
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String classNum = request.getParameter("classNum");
        String schoolCd = (String) request.getSession().getAttribute("schoolCd");

        Student s = new Student();
        int entYear = Integer.parseInt(entYearStr);  // ← ここでintに変換
        s.setEntYear(entYear);                       // ← intでセット
        s.setNo(no);
        s.setName(name);
        s.setClassNum(classNum);
        s.setAttend(isAttend != null); 
        s.setSchoolCd(schoolCd);

        try {
            StudentDAO dao = new StudentDAO();
            dao.insert(s);
            request.getRequestDispatcher("/main/studentRegistComp.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "登録エラー");
            request.getRequestDispatcher("/main/studentRegist.jsp").forward(request, response);
        }
    }
}
