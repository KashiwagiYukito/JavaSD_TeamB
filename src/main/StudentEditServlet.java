package main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Class_Num;
import bean.Student;
import dao.Class_NumDAO;
import dao.StudentDAO;

@WebServlet("/main/StudentEditServlet")
public class StudentEditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");

	    // 入力値の取得
	    String entYear = request.getParameter("entYear");
	    String no = request.getParameter("no");
	    String name = request.getParameter("name");
	    String classNum = request.getParameter("classNum");
	    String isAttend = request.getParameter("isAttend");
	    String schoolCd = (String) request.getSession().getAttribute("schoolCd");

	    Student s = new Student();
	    s.setEntYear(Integer.parseInt(entYear)); // String→int変換
	    s.setNo(no);
	    s.setName(name);
	    s.setClassNum(classNum);
	    s.setAttend(isAttend != null); // チェックされてたらtrue
	    s.setSchoolCd(schoolCd);

	    StudentDAO dao = new StudentDAO();
	    try {
	        dao.update(s, no); // 第2引数は元の学生番号（ここでは変更不可画面のため同じ値）
	        // 完了画面に遷移する例
	        request.getRequestDispatcher("/main/studentEditComp.jsp").forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        // エラー遷移処理
	        request.setAttribute("errorMsg", "更新に失敗しました");
	        request.getRequestDispatcher("/main/studentEdit.jsp").forward(request, response);
	    }
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        String schoolCd = (String) request.getSession().getAttribute("schoolCd");

        try {
            // 学生情報取得
            StudentDAO sDao = new StudentDAO();
            Student student = sDao.findById(no);

            // クラス一覧取得（その学校分だけ）
            Class_NumDAO cDao = new Class_NumDAO();
            List<Class_Num> classNumList = cDao.findAll(); // すべての場合
            request.setAttribute("classNumList", classNumList);
            // 学校ごとのみ欲しい場合は「findBySchool」メソッドをDAOに追加

            // 属性セット
            request.setAttribute("entYear", student.getEntYear());
            request.setAttribute("no", student.getNo());
            request.setAttribute("name", student.getName());
            request.setAttribute("classNum", student.getClassNum());
            request.setAttribute("isAttend", student.isAttend());
            request.setAttribute("classNumList", classNumList);

            request.getRequestDispatcher("/main/studentEdit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "データ取得エラー");
            request.getRequestDispatcher("/main/studentList.jsp").forward(request, response);
        }
    }

}
