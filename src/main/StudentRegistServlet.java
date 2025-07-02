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
        request.setCharacterEncoding("UTF-8"); // 文字化け防止

        String entYearStr = request.getParameter("entYear");
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String classNum = request.getParameter("classNum");
        String isAttend = request.getParameter("isAttend");
        String schoolCd = (String) request.getSession().getAttribute("schoolCd");

        // 入学年度未選択エラーチェック
        boolean hasError = false;
        if (entYearStr == null || entYearStr.isEmpty()) {
            request.setAttribute("entYearError", "入学年度を選択してください");
            hasError = true;
        }

        // 入力値の再セット（エラー時の再描画用、必要に応じて追加）
        request.setAttribute("no", no);
        request.setAttribute("name", name);
        request.setAttribute("classNum", classNum);
        request.setAttribute("isAttend", isAttend);

        if (hasError) {
            request.getRequestDispatcher("/main/studentRegist.jsp").forward(request, response);
            return;
        }

        Student s = new Student();
        int entYear = Integer.parseInt(entYearStr);
        s.setEntYear(entYear);
        s.setNo(no);
        s.setName(name);
        s.setClassNum(classNum);
        s.setAttend(isAttend != null);
        s.setSchoolCd(schoolCd);

        try {
            StudentDAO dao = new StudentDAO();

            // ★ 重複チェック
            if (dao.findById(no) != null) {
                request.setAttribute("errorMsg", "学生番号が重複しています");
                request.getRequestDispatcher("/main/studentRegist.jsp").forward(request, response);
                return;
            }

            dao.insert(s);
            request.getRequestDispatcher("/main/studentRegistComp.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "登録エラー");
            request.getRequestDispatcher("/main/studentRegist.jsp").forward(request, response);
        }
    }
}
