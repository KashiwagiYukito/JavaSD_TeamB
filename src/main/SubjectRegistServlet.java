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
    	request.setCharacterEncoding("UTF-8");

        String schoolCd = (String) request.getSession().getAttribute("schoolCd");
        String cd = request.getParameter("cd");
        String name = request.getParameter("name");

        // 入力値をリクエスト属性にセット（再表示時に使う）
        request.setAttribute("cd", cd);
        request.setAttribute("name", name);

        // === ① 科目コードが3文字でなければエラー ===
        if (cd == null || cd.length() != 3) {
            request.setAttribute("errorType", "length");
            request.getRequestDispatcher("/main/subjectRegist.jsp").forward(request, response);
            return;
        }

        try {
            SubjectDAO dao = new SubjectDAO();

            // === ② 重複チェック ===
            if (dao.findById(schoolCd, cd) != null) {
                // すでに同じコードの科目がある場合
                request.setAttribute("errorType", "duplicate");
                request.getRequestDispatcher("/main/subjectRegist.jsp").forward(request, response);
                return;
            }

            // === ③ 登録処理 ===
            Subject subject = new Subject();
            subject.setSchoolCd(schoolCd);
            subject.setCd(cd);
            subject.setName(name);

            dao.insert(subject);
            request.getRequestDispatcher("/main/subjectRegistComp.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "登録処理でエラーが発生しました。");
            request.getRequestDispatcher("/main/subjectRegist.jsp").forward(request, response);
        }
    }
}
