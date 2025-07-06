package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import bean.TestListStudent;

public class TestListStudentDao extends DAO {
    // 成績一覧（学生）の基本SQL
    private static final String baseSql =
        "SELECT s.name AS subject_name, s.cd AS subject_cd, t.no, t.point " +
    	"FROM test t " +
    	"JOIN subject s ON t.subject_cd = s.cd AND t.school_cd = s.school_cd " +
        "WHERE t.student_no = ? " +
        "ORDER BY s.cd, t.no";

    /**
     * 学生に紐づく成績一覧を取得
     */
    public List<TestListStudent> filter(Student student) {
        List<TestListStudent> list = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(baseSql)) {

            ps.setString(1, student.getNo());
            try (ResultSet rs = ps.executeQuery()) {
                list = postFilter(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 必要に応じて例外処理
        }
        return list;
    }

    /**
     * ResultSetからTestListStudentリストを生成
     */
    private List<TestListStudent> postFilter(ResultSet rs) throws SQLException {
        List<TestListStudent> list = new ArrayList<>();
        while (rs.next()) {
            TestListStudent bean = new TestListStudent();
            bean.setSubjectName(rs.getString("subject_name"));
            bean.setSubjectCd(rs.getString("subject_cd"));
            bean.setNum(rs.getInt("no"));
            bean.setPoint(rs.getInt("point"));
            list.add(bean);
        }
        return list;
    }
}
