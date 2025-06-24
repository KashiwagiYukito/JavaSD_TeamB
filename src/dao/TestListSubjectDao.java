package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Subject;
import bean.TestListSubject;

public class TestListSubjectDao extends DAO {
	private final String baseSql =
	        "SELECT s.ent_year, s.class_num, s.no AS student_no, s.name, " +
	        "sc.no AS test_no, sc.point " +
	        "FROM student s " +
	        "LEFT JOIN score sc ON s.no = sc.student_no " +
	        "AND sc.subject_cd = ? AND sc.school_cd = ? " +
	        "WHERE s.ent_year = ? AND s.class_num = ? " +
	        "ORDER BY s.no, sc.no";

	    /**
	     * 検索メソッド
	     */
	    public List<TestListSubject> filter(int entYear, String classNum, Subject subject, School school) throws Exception {
	        List<TestListSubject> list = new ArrayList<>();

	        try (Connection con = getConnection();
	             PreparedStatement st = con.prepareStatement(baseSql)) {
	            st.setString(1, subject.getCd());
	            st.setString(2, school.getCd());
	            st.setInt(3, entYear);
	            st.setString(4, classNum);

	            try (ResultSet rs = st.executeQuery()) {
	                list = postFilter(rs);
	            }
	        }
	        return list;
	    }

	    /**
	     * ResultSetからリスト生成
	     */
	    protected List<TestListSubject> postFilter(ResultSet rs) throws SQLException {
	        List<TestListSubject> result = new ArrayList<>();
	        String prevNo = null;
	        TestListSubject bean = null;

	        while (rs.next()) {
	            String studentNo = rs.getString("student_no");
	            if (!studentNo.equals(prevNo)) {
	                bean = new TestListSubject();
	                bean.setEntYear(rs.getInt("ent_year"));
	                bean.setStudentNo(studentNo);
	                bean.setStudentName(rs.getString("name"));
	                bean.setClassNum(rs.getString("class_num"));
	                result.add(bean);
	                prevNo = studentNo;
	            }
	            // 回数（test_no）がnullの場合を考慮
	            int testNo = rs.getInt("test_no");
	            int point = rs.getInt("point");
	            if (!rs.wasNull()) {
	                bean.putPoint(testNo, point);
	            }
	        }
	        return result;
	    }
}