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
	private final String baseSqlWithTestNo =
			"SELECT s.ent_year, s.class_num, s.no AS student_no, s.name, " +
		    "sc.no AS test_no, sc.point " +
			"FROM student s " +
			"LEFT JOIN TEST sc ON s.no = sc.student_no " +  // ← score → TEST
			"AND sc.subject_cd = ? AND sc.school_cd = ? AND sc.no = ? " +
			"WHERE s.ent_year = ? AND s.class_num = ? " +
			"ORDER BY s.no, sc.no";

	    /**
	     * 検索メソッド
	     */
	    public List<TestListSubject> filter(int entYear, String classNum, Subject subject, School school, int testNo) throws Exception {
	        List<TestListSubject> list = new ArrayList<>();

	        try (Connection con = getConnection();
	             PreparedStatement st = con.prepareStatement(baseSqlWithTestNo)) {
	            st.setString(1, subject.getCd());
	            st.setString(2, school.getCd());
	            st.setInt(3, testNo);
	            st.setInt(4, entYear);
	            st.setString(5, classNum);

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

	    /**
	     * 入学年度一覧を取得
	     */
	    public List<Integer> getEntYears(String schoolCd) throws Exception {
	        List<Integer> list = new ArrayList<>();
	        String sql = "SELECT DISTINCT ENT_YEAR FROM STUDENT WHERE SCHOOL_CD=? ORDER BY ENT_YEAR DESC";
	        try (Connection conn = getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            ps.setString(1, schoolCd);
	            try (ResultSet rs = ps.executeQuery()) {
	                while (rs.next()) {
	                    list.add(rs.getInt("ENT_YEAR"));
	                }
	            }
	        }
	        System.out.println("getEntYears(" + schoolCd + ") => " + list);
	        return list;
	    }


	    /**
	     * クラス一覧を取得
	     */
	    public List<String> getClassNums(String schoolCd) throws Exception {
	        List<String> list = new ArrayList<>();
	        String sql = "SELECT DISTINCT CLASS_NUM FROM STUDENT WHERE SCHOOL_CD=? ORDER BY CLASS_NUM";
	        try (Connection conn = getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            ps.setString(1, schoolCd);
	            try (ResultSet rs = ps.executeQuery()) {
	                while (rs.next()) {
	                    list.add(rs.getString("CLASS_NUM"));
	                }
	            }
	        }
	        return list;
	    }


	    /**
	     * テスト回数一覧を取得
	     */
	    public List<Integer> getTestNos(String schoolCd, String subjectCd) throws Exception {
	        List<Integer> list = new ArrayList<>();
	        String sql = "SELECT DISTINCT NO FROM TEST WHERE SCHOOL_CD=? AND SUBJECT_CD=? ORDER BY NO";
	        try (Connection conn = getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            ps.setString(1, schoolCd);
	            ps.setString(2, subjectCd);
	            try (ResultSet rs = ps.executeQuery()) {
	                while (rs.next()) {
	                    list.add(rs.getInt("NO"));
	                }
	            }
	        }
	        return list;
	    }


}
