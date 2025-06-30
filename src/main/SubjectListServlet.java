package main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDAO;

@WebServlet("/main/SubjectListServlet")
public class SubjectListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String schoolCd = (String) request.getSession().getAttribute("schoolCd");
            System.out.println("schoolCd=" + schoolCd);
            SubjectDAO dao = new SubjectDAO();
            List<Subject> list = dao.filterBySchool(schoolCd);
         // ↓デバッグ表示を入れてみてください
            System.out.println("schoolCd=" + schoolCd);
            System.out.println("科目件数=" + list.size());
            for (Subject s : list) {
                System.out.println(s.getCd() + " / " + s.getName());
            }
            request.setAttribute("subjectList", list);
            request.getRequestDispatcher("/main/subjectList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/main/subjectList.jsp").forward(request, response);
        }
    }
}
