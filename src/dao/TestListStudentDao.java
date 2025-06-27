package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import bean.TestListStudent;

public class TestListStudentDao extends DAO {

    private static final String baseSql =
        "SELECT s.name AS subject_name, s.cd AS subject_cd, " +
        "t.student_no, stu.name AS student_name, stu.ent_year, stu.class_num, " +
        "t.no, t.point " +
        "FROM test t " +
        "JOIN subject s ON t.subject_cd = s.cd AND t.school_cd = s.school_cd " +
        "JOIN student stu ON t.student_no = stu.no " +
        "WHERE t.student_no = ? " +
        "ORDER BY s.cd, t.no";

    public List<TestListStudent> filter(Student student) {
        List<TestListStudent> list = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(baseSql)) {

            ps.setString(1, student.getNo());

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TestListStudent bean = new TestListStudent();
                    bean.setSubjectName(rs.getString("subject_name"));
                    bean.setSubjectCd(rs.getString("subject_cd"));
                    bean.setStudentNo(rs.getString("student_no"));
                    bean.setName(rs.getString("student_name"));
                    bean.setYear(rs.getInt("ent_year"));  // ← 修正済
                    bean.setClassNum(rs.getInt("class_num"));
                    bean.setNum(rs.getInt("no"));         // ← 修正済
                    bean.setPoint(rs.getInt("point"));
                    list.add(bean);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
