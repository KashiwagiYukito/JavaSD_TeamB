package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Subject;

/**
 * SubjectDAO
 * 科目情報（SUBJECTテーブル）に対するデータアクセス処理を行うクラスです。
 */
public class SubjectDAO extends DAO {

    /**
     * 科目情報をすべて取得します。
     * @return List<Subject> 科目情報リスト
     * @throws Exception データベース操作時の例外
     */
    public List<Subject> findAll() throws Exception {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT * FROM SUBJECT";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Subject s = new Subject();
                s.setSchoolCd(rs.getString("SCHOOL_CD"));
                s.setCd(rs.getString("CD"));
                s.setName(rs.getString("NAME"));
                list.add(s);
            }
        }
        return list;
    }

    /**
     * 主キー（学校コード＋科目コード）で科目情報を1件取得します。
     * @param schoolCd 学校コード
     * @param cd 科目コード
     * @return Subject 科目情報（見つからない場合はnull）
     * @throws Exception データベース操作時の例外
     */
    public Subject findById(String schoolCd, String cd) throws Exception {
        String sql = "SELECT * FROM SUBJECT WHERE SCHOOL_CD = ? AND CD = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schoolCd);
            ps.setString(2, cd);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Subject s = new Subject();
                    s.setSchoolCd(rs.getString("SCHOOL_CD"));
                    s.setCd(rs.getString("CD"));
                    s.setName(rs.getString("NAME"));
                    return s;
                }
            }
        }
        return null;
    }

    /**
     * 科目情報を追加します。
     * @param s 追加する科目情報
     * @throws Exception データベース操作時の例外
     */
    public void insert(Subject s) throws Exception {
        String sql = "INSERT INTO SUBJECT (SCHOOL_CD, CD, NAME) VALUES (?, ?, ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getSchoolCd());
            ps.setString(2, s.getCd());
            ps.setString(3, s.getName());
            ps.executeUpdate();
        }
    }

    /**
     * 科目情報を更新します。
     * @param s 更新後の科目情報
     * @param oldSchoolCd 変更前の学校コード
     * @param oldCd 変更前の科目コード
     * @throws Exception データベース操作時の例外
     */
    public void update(Subject s, String oldSchoolCd, String oldCd) throws Exception {
        String sql = "UPDATE SUBJECT SET SCHOOL_CD = ?, CD = ?, NAME = ? WHERE SCHOOL_CD = ? AND CD = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getSchoolCd());
            ps.setString(2, s.getCd());
            ps.setString(3, s.getName());
            ps.setString(4, oldSchoolCd);
            ps.setString(5, oldCd);
            ps.executeUpdate();
        }
    }

    /**
     * 科目情報を削除します。
     * @param schoolCd 学校コード
     * @param cd 科目コード
     * @throws Exception データベース操作時の例外
     */
    public void delete(String schoolCd, String cd) throws Exception {
        String sql = "DELETE FROM SUBJECT WHERE SCHOOL_CD = ? AND CD = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schoolCd);
            ps.setString(2, cd);
            ps.executeUpdate();
        }
    }
}
