package student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentDAO;

@WebServlet("/student/update")
public class Student_Update extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // 編集画面へ遷移（一覧画面の「変更」ボタンからパラメータで値が渡される想定）
        String entYear = req.getParameter("entYear");
        String no = req.getParameter("no");
        String name = req.getParameter("name");
        String classNum = req.getParameter("classNum");
        String attend = req.getParameter("attend");

        // DBから取得する場合はこちら（主キーのみ渡された場合用）
        Student student = null;
        if (no != null && name == null) {
            try {
                StudentDAO dao = new StudentDAO();
                student = dao.findById(no);
            } catch (Exception e) {
                req.setAttribute("error", "学生情報の取得に失敗しました: " + e.getMessage());
            }
        } else {
            // パラメータから生成
            student = new Student();
            if (entYear != null && !entYear.isEmpty()) student.setEntYear(Integer.parseInt(entYear));
            student.setNo(no);
            student.setName(name);
            student.setClassNum(classNum);
            student.setAttend("true".equals(attend) || "1".equals(attend));
        }

        req.setAttribute("student", student);
        req.getRequestDispatcher("/student/Student_Update.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // フォームからの更新内容を取得
        String entYear = req.getParameter("entYear");
        String no = req.getParameter("no");
        String name = req.getParameter("name");
        String classNum = req.getParameter("classNum");
        String attend = req.getParameter("attend");

        // 更新前の主キー値（学生番号）をhiddenで持たせている場合はこちら
        String oldNo = req.getParameter("oldNo");
        if (oldNo == null || oldNo.isEmpty()) oldNo = no; // 変更不可ならnoでOK

        Student student = new Student();
        if (entYear != null && !entYear.isEmpty()) student.setEntYear(Integer.parseInt(entYear));
        student.setNo(no);
        student.setName(name);
        student.setClassNum(classNum);
        student.setAttend(attend != null && (attend.equals("true") || attend.equals("1") || attend.equals("on")));

        // schoolCdは本例では省略（必要ならhiddenで渡してください）
        try {
            StudentDAO dao = new StudentDAO();
            dao.update(student, oldNo);

            req.setAttribute("student", student);
            req.setAttribute("message", "学生情報を更新しました。");
        } catch (Exception e) {
            req.setAttribute("error", "更新に失敗しました: " + e.getMessage());
        }

        // 更新後も編集画面に戻す（完了画面を作りたい場合はforward先を変更）
        req.getRequestDispatcher("/student/Student_Update.jsp").forward(req, resp);
    }
}
