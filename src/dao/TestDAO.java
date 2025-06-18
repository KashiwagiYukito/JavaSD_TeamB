package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Test;

/**
 * TestDAO
 * テスト得点情報（TESTテーブル）に対するデータアクセス処理を行うクラスです。
 */
public class TestDAO extends DAO {

    /**
     * テスト得点情報をすべて取得します。
     * @return List<Test> テスト得点情報リスト
     * @throws Exception データベース操作時の例外
     */
    public List<Test> findAll() throws Exception {
        List<Test> list = new ArrayList<>();
        String sql = "SELECT * FROM TEST";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Test t = new Test();
                t.setStudentNo(rs.getString("STUDENT_NO"));
                t.setSubjectCd(rs.getString("SUBJECT_CD"));
                t.setSchoolCd(rs.getString("SCHOOL_CD"));
                t.setNo(rs.getInt("NO"));
                t.setPoint(rs.getInt("POINT"));
                t.setClassNum(rs.getString("CLASS_NUM"));
                list.add(t);
            }
        }
        return list;
    }

    /**
     * 主キー（学生番号＋科目コード＋NO）でテスト得点情報を1件取得します。
     * @param studentNo 学生番号
     * @param subjectCd 科目コード
     * @param no テスト番号
     * @return Test テスト得点情報（見つからない場合はnull）
     * @throws Exception データベース操作時の例外
     */
    public Test findById(String studentNo, String subjectCd, int no) throws Exception {
        String sql = "SELECT * FROM TEST WHERE STUDENT_NO = ? AND SUBJECT_CD = ? AND NO = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, studentNo);
            ps.setString(2, subjectCd);
            ps.setInt(3, no);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Test t = new Test();
                    t.setStudentNo(rs.getString("STUDENT_NO"));
                    t.setSubjectCd(rs.getString("SUBJECT_CD"));
                    t.setSchoolCd(rs.getString("SCHOOL_CD"));
                    t.setNo(rs.getInt("NO"));
                    t.setPoint(rs.getInt("POINT"));
                    t.setClassNum(rs.getString("CLASS_NUM"));
                    return t;
                }
            }
        }
        return null;
    }

    /**
     * テスト得点情報を追加します。
     * @param t 追加するテスト得点情報
     * @throws Exception データベース操作時の例外
     */
    public void insert(Test t) throws Exception {
        String sql = "INSERT INTO TEST (STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getStudentNo());
            ps.setString(2, t.getSubjectCd());
            ps.setString(3, t.getSchoolCd());
            ps.setInt(4, t.getNo());
            ps.setInt(5, t.getPoint());
            ps.setString(6, t.getClassNum());
            ps.executeUpdate();
        }
    }

    /**
     * テスト得点情報を更新します。
     * @param t 更新後のテスト得点情報
     * @param oldStudentNo 変更前の学生番号
     * @param oldSubjectCd 変更前の科目コード
     * @param oldNo 変更前のテスト番号
     * @throws Exception データベース操作時の例外
     */
    public void update(Test t, String oldStudentNo, String oldSubjectCd, int oldNo) throws Exception {
        String sql = "UPDATE TEST SET STUDENT_NO = ?, SUBJECT_CD = ?, SCHOOL_CD = ?, NO = ?, POINT = ?, CLASS_NUM = ? WHERE STUDENT_NO = ? AND SUBJECT_CD = ? AND NO = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getStudentNo());
            ps.setString(2, t.getSubjectCd());
            ps.setString(3, t.getSchoolCd());
            ps.setInt(4, t.getNo());
            ps.setInt(5, t.getPoint());
            ps.setString(6, t.getClassNum());
            ps.setString(7, oldStudentNo);
            ps.setString(8, oldSubjectCd);
            ps.setInt(9, oldNo);
            ps.executeUpdate();
        }
    }

    /**
     * テスト得点情報を削除します。
     * @param studentNo 学生番号
     * @param subjectCd 科目コード
     * @param no テスト番号
     * @throws Exception データベース操作時の例外
     */
    public void delete(String studentNo, String subjectCd, int no) throws Exception {
        String sql = "DELETE FROM TEST WHERE STUDENT_NO = ? AND SUBJECT_CD = ? AND NO = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, studentNo);
            ps.setString(2, subjectCd);
            ps.setInt(3, no);
            ps.executeUpdate();
        }
    }
}
