package student;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentDAO;

@WebServlet("/student/student_list")
public class StudentList extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // DAOから学生一覧を取得
            StudentDAO dao = new StudentDAO();
            List<Student> studentList = dao.findAll(); // findAll() は全件取得メソッド

            // 取得したリストをリクエストにセット
            request.setAttribute("studentList", studentList);

            // 表示用JSPにフォワード
            RequestDispatcher dispatcher = request.getRequestDispatcher("/subject_delete_done.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "学生データの取得中にエラーが発生しました。");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
