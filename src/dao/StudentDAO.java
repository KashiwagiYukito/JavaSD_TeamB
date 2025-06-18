package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;

public class StudentDAO extends DAO {

    // 1. noをStringで取得してgetで取得し、Studentで返す
    public Student findByNo(String no) throws Exception {
        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM student WHERE no = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, no);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Student student = new Student();
                student.setNo(rs.getInt("no")); 
                student.setName(rs.getString("name"));
                student.setEntYear(rs.getInt("entYear"));
                student.setClassNum(rs.getString("classNum")); 
                student.setisAttend(rs.getBoolean("isAttend"));
                student.setSchoolCd(rs.getString("schoolCd"));
                return student;
            }
        }
        return null;
    }

    // 2. filter1: school, entYear, classNum, isAttendでList<Student>を返す
    public List<Student> findBySchoolEntYearClassNumIsAttend(String school, int entYear, String classNum, boolean isAttend) throws Exception {
        List<Student> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM student WHERE schoolCd = ? AND entYear = ? AND classNum = ? AND isAttend = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, school);
            st.setInt(2, entYear);
            st.setString(3, classNum);
            st.setBoolean(4, isAttend);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setNo(rs.getInt("no"));
                student.setName(rs.getString("name"));
                student.setEntYear(rs.getInt("entYear"));
                student.setClassNum(rs.getString("classNum")); 
                student.setisAttend(rs.getBoolean("isAttend"));
                student.setSchoolCd(rs.getString("schoolCd"));
                list.add(student);
            }
        }
        return list;
    }

    // 3. filter2: school, entYear, isAttendでList<Student>を返す
    public List<Student> findBySchoolEntYearIsAttend(String school, int entYear, boolean isAttend) throws Exception {
        List<Student> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM student WHERE schoolCd = ? AND entYear = ? AND isAttend = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, school);
            st.setInt(2, entYear);
            st.setBoolean(3, isAttend);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setNo(rs.getInt("no"));
                student.setName(rs.getString("name"));
                student.setEntYear(rs.getInt("entYear"));
                student.setClassNum(rs.getString("classNum"));
                student.setisAttend(rs.getBoolean("isAttend"));
                student.setSchoolCd(rs.getString("schoolCd"));
                list.add(student);
            }
        }
        return list;
    }

    // 4. filter3: school, isAttendでList<Student>を返す
    public List<Student> findBySchoolIsAttend(String school, boolean isAttend) throws Exception {
        List<Student> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM student WHERE schoolCd = ? AND isAttend = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, school);
            st.setBoolean(2, isAttend);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setNo(rs.getInt("no"));
                student.setName(rs.getString("name"));
                student.setEntYear(rs.getInt("entYear"));
                student.setClassNum(rs.getString("classNum")); 
                student.setisAttend(rs.getBoolean("isAttend"));
                student.setSchoolCd(rs.getString("schoolCd"));
                list.add(student);
            }
        }
        return list;
    }

    // 5. save: Studentを保存し、booleanで結果を返す
    public boolean save(Student student) throws Exception {
        try (Connection con = getConnection()) {
            String sql = "INSERT INTO student (no, name, entYear, classNum, isAttend, schoolCd) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, student.getNo());
            st.setString(2, student.getName());
            st.setInt(3, student.getEntYear());
            st.setString(4, student.getClassNum()); 
            st.setBoolean(5, student.getisAttend());
            st.setString(6, student.getSchoolCd());
            int result = st.executeUpdate();
            return result == 1;
        }
    }
}
