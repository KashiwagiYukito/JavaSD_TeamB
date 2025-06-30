package main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.TestListSubject;

@WebServlet("/main/ScoreRegistServlet")
public class ScoreRegistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        // ここで一覧の生徒番号リストなどを取得
        // 例として10人分を作る（実際はDBやセッションから取得すること）
        List<TestListSubject> list = new ArrayList<>();
        // ... list生成（省略）・・・

        boolean hasError = false;
        for (TestListSubject row : list) {
            String pointStr = req.getParameter("point_" + row.getStudentNo());
            if (pointStr != null && !pointStr.isEmpty()) {
                try {
                    int point = Integer.parseInt(pointStr);
                    if (point < 0 || point > 100) {
                        row.setErrorPoint("0～100の範囲で入力してください");
                        hasError = true;
                    } else {
                        // 正常な場合は保存処理等
                    }
                } catch (NumberFormatException e) {
                    row.setErrorPoint("数値で入力してください");
                    hasError = true;
                }
            }
        }

        if (hasError) {
            req.setAttribute("scoreList", list);
            // ここで検索条件等も再度セットする必要がある（省略）
            req.getRequestDispatcher("/main/scoreList.jsp").forward(req, resp);
        } else {
            // 正常登録時の処理（DB保存して一覧などへリダイレクト）
            resp.sendRedirect(req.getContextPath() + "/main/ScoreListServlet");
        }
    }
}
