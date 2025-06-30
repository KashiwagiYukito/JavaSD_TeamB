package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDAO;

@WebServlet("/main/SubjectRegistServlet")
public class SubjectRegistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String schoolCd = (String) request.getSession().getAttribute("schoolCd");
        String cd = request.getParameter("cd");
        String name = request.getParameter("name");

        Subject subject = new Subject();
        subject.setSchoolCd(schoolCd);
        subject.setCd(cd);
        subject.setName(name);

        try {
            SubjectDAO dao = new SubjectDAO();
            dao.insert(subject);
            request.getRequestDispatcher("/main/subjectRegistComp.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "登録処理でエラーが発生しました。");
            request.getRequestDispatcher("/main/subjectRegist.jsp").forward(request, response);
        }
    }
}
