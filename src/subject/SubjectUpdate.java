package subject;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDAO;

@WebServlet("/SubjectUpdate")
public class SubjectUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            SubjectDAO dao = new SubjectDAO();

            switch (action) {
                case "list":
                    // 科目一覧表示
                    List<Subject> subjectList = dao.findAll();
                    req.setAttribute("subjectList", subjectList);
                    forward(req, resp, "/subjectList.jsp");
                    break;

                case "select":
                    // 科目コード選択画面
                    List<Subject> subjectListForSelect = dao.findAll();
                    req.setAttribute("subjectList", subjectListForSelect);
                    forward(req, resp, "/subjectUpdate.jsp1");
                    break;

                case "edit":
                    // 編集フォーム表示
                    String editSchoolCd = req.getParameter("schoolCd");
                    String editCd = req.getParameter("cd");
                    Subject subject = dao.findById(editSchoolCd, editCd);
                    if (subject == null) {
                        req.setAttribute("error", "該当する科目がありません");
                        forward(req, resp, "/subjectUpdate.jsp1");
                        return;
                    }
                    req.setAttribute("subject", subject);
                    forward(req, resp, "/subjectUpdate_form.jsp");
                    break;

                default:
                    // デフォルトは一覧
                    List<Subject> defaultList = dao.findAll();
                    req.setAttribute("subjectList", defaultList);
                    forward(req, resp, "/subjectList.jsp");
            }
        } catch (Exception e) {
            req.setAttribute("error", "エラー: " + e.getMessage());
            forward(req, resp, "/subjectList.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "";

        try {
            SubjectDAO dao = new SubjectDAO();

            if ("update".equals(action)) {
                // 科目情報の更新
                String schoolCd = req.getParameter("schoolCd");
                String cd = req.getParameter("cd");
                String name = req.getParameter("name");

                Subject subject = dao.findById(schoolCd, cd);
                if (subject != null) {
                    subject.setName(name);
                    dao.update(subject, schoolCd, cd);
                    req.setAttribute("subject", subject);
                    forward(req, resp, "/subjectUpdate_done.jsp");
                } else {
                    req.setAttribute("error", "該当する科目がありません");
                    forward(req, resp, "/subjectUpdate_form.jsp");
                }
            } else if ("select".equals(action)) {
                // 科目コード選択から編集画面へ
                String schoolCd = req.getParameter("schoolCd");
                String cd = req.getParameter("cd");
                resp.sendRedirect(req.getContextPath() + "/SubjectUpdate?action=edit&schoolCd=" + schoolCd + "&cd=" + cd);
            } else {
                // デフォルトは一覧
                List<Subject> subjectList = dao.findAll();
                req.setAttribute("subjectList", subjectList);
                forward(req, resp, "/subjectList.jsp");
            }
        } catch (Exception e) {
            req.setAttribute("error", "エラー: " + e.getMessage());
            forward(req, resp, "/subjectList.jsp");
        }
    }

    private void forward(HttpServletRequest req, HttpServletResponse resp, String path)
            throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher(path);
        rd.forward(req, resp);
    }
}
