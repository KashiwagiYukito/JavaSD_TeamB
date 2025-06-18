package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;

/**
 * StudentDAO
 * 学生情報（STUDENTテーブル）に対するデータアクセス処理を行うクラスです。
 * データベース接続はDAOクラス（親クラス）から継承します。
 */
public class StudentDAO extends DAO {

    /**
     * 学生情報をすべて取得します。
     * @return List<Student> 学生情報のリスト
     * @throws Exception データベース操作時の例外
     */
    public List<Student> findAll() throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM STUDENT";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setNo(rs.getString("NO"));
                s.setName(rs.getString("NAME"));
                s.setEntYear(rs.getInt("ENT_YEAR"));
                s.setClassNum(rs.getString("CLASS_NUM"));
                s.setAttend(rs.getBoolean("IS_ATTEND"));
                s.setSchoolCd(rs.getString("SCHOOL_CD"));
                list.add(s);
            }
        }
        return list;
    }

    /**
     * 主キー（学生番号）で学生情報を1件取得します。
     * @param no 学生番号
     * @return Student 学生情報（見つからない場合はnull）
     * @throws Exception データベース操作時の例外
     */
    public Student findById(String no) throws Exception {
        String sql = "SELECT * FROM STUDENT WHERE NO = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, no);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Student s = new Student();
                    s.setNo(rs.getString("NO"));
                    s.setName(rs.getString("NAME"));
                    s.setEntYear(rs.getInt("ENT_YEAR"));
                    s.setClassNum(rs.getString("CLASS_NUM"));
                    s.setAttend(rs.getBoolean("IS_ATTEND"));
                    s.setSchoolCd(rs.getString("SCHOOL_CD"));
                    return s;
                }
            }
        }
        return null;
    }

    /**
     * 学生情報を追加します。
     * @param s 追加する学生情報
     * @throws Exception データベース操作時の例外
     */
    public void insert(Student s) throws Exception {
        String sql = "INSERT INTO STUDENT (NO, NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getNo());
            ps.setString(2, s.getName());
            ps.setInt(3, s.getEntYear());
            ps.setString(4, s.getClassNum());
            ps.setBoolean(5, s.isAttend());
            ps.setString(6, s.getSchoolCd());
            ps.executeUpdate();
        }
    }

    /**
     * 学生情報を更新します。
     * @param s 更新後の学生情報
     * @param oldNo 更新対象の学生番号
     * @throws Exception データベース操作時の例外
     */
    public void update(Student s, String oldNo) throws Exception {
        String sql = "UPDATE STUDENT SET NO = ?, NAME = ?, ENT_YEAR = ?, CLASS_NUM = ?, IS_ATTEND = ?, SCHOOL_CD = ? WHERE NO = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getNo());
            ps.setString(2, s.getName());
            ps.setInt(3, s.getEntYear());
            ps.setString(4, s.getClassNum());
            ps.setBoolean(5, s.isAttend());
            ps.setString(6, s.getSchoolCd());
            ps.setString(7, oldNo);
            ps.executeUpdate();
        }
    }

    /**
     * 学生情報を削除します。
     * @param no 削除対象の学生番号
     * @throws Exception データベース操作時の例外
     */
    public void delete(String no) throws Exception {
        String sql = "DELETE FROM STUDENT WHERE NO = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, no);
            ps.executeUpdate();
        }
    }
}
