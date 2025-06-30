package main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentDAO;

@WebServlet("/main/StudentListServlet")
public class StudentListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        String schoolCd = (String) request.getSession().getAttribute("schoolCd");
	        System.out.println("DEBUG: セッションのschoolCd = " + schoolCd); // ←追加！
	        StudentDAO dao = new StudentDAO(); 
	        List<Student> list = dao.findBySchool(schoolCd);
	        System.out.println("DEBUG: studentList.size() = " + (list != null ? list.size() : "null")); // ←追加！
	        request.setAttribute("studentList", list);
	        request.getRequestDispatcher("/main/studentList.jsp").forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.getRequestDispatcher("/main/studentList.jsp").forward(request, response);
	    }
	}

}
