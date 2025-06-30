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

@WebServlet("/subject/SubjectUpdate")
public class Subject_Update extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            SubjectDAO dao = new SubjectDAO();

            switch (action) {
                case "edit": {
                    String schoolCd = req.getParameter("schoolCd");
                    String cd = req.getParameter("cd");
                    Subject subject = dao.findById(schoolCd, cd);
                    if (subject == null) {
                        req.setAttribute("error", "該当する科目がありません");
                        List<Subject> subjectList = dao.findAll();
                        req.setAttribute("subjectList", subjectList);
                        forward(req, resp, "/subject/subject_List.jsp");
                        return;
                    }
                    req.setAttribute("subject", subject);
                    forward(req, resp, "/subject/subject_update_form.jsp");
                    break;
                }
                default: {
                    List<Subject> subjectList = dao.findAll();
                    req.setAttribute("subjectList", subjectList);
                    forward(req, resp, "/subject/subject_List.jsp");
                }
            }
        } catch (Exception e) {
            req.setAttribute("error", "エラー: " + e.getMessage());
            forward(req, resp, "/subject/subject_List.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "";

        try {
            SubjectDAO dao = new SubjectDAO();

            if ("update".equals(action)) {
                String oldSchoolCd = req.getParameter("oldSchoolCd");
                String oldCd = req.getParameter("oldCd");
                String name = req.getParameter("name");

                // 主キーは変更不可なのでoldSchoolCd, oldCdを使い、更新対象を特定
                Subject subject = dao.findById(oldSchoolCd, oldCd);
                if (subject != null) {
                    subject.setName(name);
                    // schoolCd, cdは変更不可のため、更新時も同じ値をセット
                    subject.setSchoolCd(oldSchoolCd);
                    subject.setCd(oldCd);
                    dao.update(subject, oldSchoolCd, oldCd);

                    req.setAttribute("subject", subject);
                    forward(req, resp, "/subject/subject_update_done.jsp");
                } else {
                    req.setAttribute("error", "該当する科目がありません");
                    req.setAttribute("subject", subject);
                    forward(req, resp, "/subject/subject_update_form.jsp");
                }
            } else {
                List<Subject> subjectList = dao.findAll();
                req.setAttribute("subjectList", subjectList);
                forward(req, resp, "/subject/subject_List.jsp");
            }
        } catch (Exception e) {
            req.setAttribute("error", "エラー: " + e.getMessage());
            forward(req, resp, "/subject/subject_List.jsp");
        }
    }

    private void forward(HttpServletRequest req, HttpServletResponse resp, String path)
            throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher(path);
        rd.forward(req, resp);
    }
}
