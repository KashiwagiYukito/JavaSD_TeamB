package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Test;
import bean.Student;
import bean.Subject;
import bean.School;

public class TestDAO extends DAO {

    // ① フィルター検索
    public List<Test> findByFilter(int entYear, String classNum, Subject subject, int num, School school) throws Exception {
        List<Test> list = new ArrayList<>();

        try (Connection con = getConnection()) {
            String sql = "SELECT t.no, t.subjectcd, t.schoolcd, t.point, t.classnum, " +
                         "s.name AS student_name, s.entyear, s.classnum AS student_classnum, " +
                         "sub.name AS subject_name, sch.name AS school_name " +
                         "FROM Test t " +
                         "JOIN Student s ON t.no = s.no " +
                         "JOIN Subject sub ON t.subjectcd = sub.subjectcd " +
                         "JOIN School sch ON t.schoolcd = sch.schoolcd " +
                         "WHERE s.entyear = ? AND s.classnum = ? " +
                         "AND t.subjectcd = ? AND t.no = ? AND t.schoolcd = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, entYear);
            st.setString(2, classNum);
            st.setString(3, subject.getSubjectCd());
            st.setInt(4, num);
            st.setString(5, school.getSchoolCd());

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Test test = new Test();
                test.setStudentNo(rs.getInt("no"));
                test.setSubjectCd(rs.getString("subjectcd"));
                test.setSchoolCd(rs.getString("schoolcd"));
                test.setPoint(rs.getInt("point"));
                test.setClassNum(rs.getInt("classnum"));

                Student student = new Student();
                student.setNo(rs.getInt("no"));
                student.setName(rs.getString("student_name"));
                student.setEntYear(rs.getInt("entyear"));
                student.setClassNum(rs.getString("student_classnum"));
                test.setStudent(student);

                Subject sub = new Subject();
                sub.setSubjectCd(rs.getString("subjectcd"));
                sub.setName(rs.getString("subject_name"));
                test.setSubject(sub);

                School sch = new School();
                sch.setSchoolCd(rs.getString("schoolcd"));
                sch.setName(rs.getString("school_name"));
                test.setSchool(sch);

                list.add(test);
            }
        }

        return list;
    }

    // ② 保存（Insert）
    public boolean save(List<Test> list) throws Exception {
        try (Connection con = getConnection()) {
            String sql = "INSERT INTO Test (no, subjectcd, schoolcd, point, classnum) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);

            for (Test test : list) {
                st.setInt(1, test.getStudentNo());
                st.setString(2, test.getSubjectCd());
                st.setString(3, test.getSchoolCd());
                st.setInt(4, test.getPoint());
                st.setInt(5, test.getClassNum());
                st.addBatch();
            }

            int[] result = st.executeBatch();
            return result.length == list.size();
        }
    }

    // ③ 削除
    public boolean delete(List<Test> list) throws Exception {
        try (Connection con = getConnection()) {
            String sql = "DELETE FROM Test WHERE no = ? AND subjectcd = ? AND schoolcd = ?";
            PreparedStatement st = con.prepareStatement(sql);

            for (Test test : list) {
                st.setInt(1, test.getStudentNo());
                st.setString(2, test.getSubjectCd());
                st.setString(3, test.getSchoolCd());
                st.addBatch();
            }

            int[] result = st.executeBatch();
            return result.length == list.size();
        }
    }
}
