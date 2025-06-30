package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectDAO;

@WebServlet("/main/SubjectDeleteServlet")
public class SubjectDeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String schoolCd = (String) request.getSession().getAttribute("schoolCd");
        String cd = request.getParameter("cd");

        try {
            SubjectDAO dao = new SubjectDAO();
            dao.delete(schoolCd, cd);
            request.getRequestDispatcher("/main/subjectDeleteComp.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "削除処理でエラーが発生しました。");
            request.getRequestDispatcher("/main/subjectList.jsp").forward(request, response);
        }
    }

    // 削除確認画面表示
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cd = request.getParameter("cd");
        String schoolCd = (String) request.getSession().getAttribute("schoolCd");

        try {
            SubjectDAO dao = new SubjectDAO();
            // 科目情報を取得
            bean.Subject subject = dao.findById(schoolCd, cd);
            if (subject != null) {
                request.setAttribute("cd", subject.getCd());
                request.setAttribute("name", subject.getName());
                request.setAttribute("schoolCd", subject.getSchoolCd());
            }
            request.getRequestDispatcher("/main/subjectDelete.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "データ取得エラー");
            request.getRequestDispatcher("/main/subjectList.jsp").forward(request, response);
        }
    }
}
