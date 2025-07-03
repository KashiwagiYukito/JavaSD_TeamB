package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TestDAO;

@WebServlet("/main/ScoreDeleteServlet")
public class ScoreDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] deleteTargets = request.getParameterValues("deleteTargets");

        if (deleteTargets != null) {
            TestDAO dao = new TestDAO();
            for (String target : deleteTargets) {
                String[] parts = target.split("_");
                if (parts.length == 3) {
                    String studentNo = parts[0];
                    String subjectCd = parts[1];
                    int testNo = Integer.parseInt(parts[2]);

                    try {
                        dao.delete(studentNo, subjectCd, testNo);
                    } catch (Exception e) {
                        e.printStackTrace();
                        // 必要ならここでリクエストにエラーメッセージセット可
                    }
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/main/ScoreListServlet");
    }
}
