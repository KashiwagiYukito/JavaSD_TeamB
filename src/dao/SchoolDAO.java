package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.School;

/**
 * SchoolDAO
 * 学校情報（SCHOOLテーブル）に対するデータアクセス処理を行うクラスです。
 * データベース接続はDAOクラス（親クラス）から継承します。
 */
public class SchoolDAO extends DAO {

    /**
     * 学校情報をすべて取得します。
     * @return List<School> 学校情報リスト
     * @throws Exception データベース操作時の例外
     */
    public List<School> findAll() throws Exception {
        List<School> list = new ArrayList<>();
        String sql = "SELECT * FROM SCHOOL";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                School s = new School();
                s.setCd(rs.getString("CD"));
                s.setName(rs.getString("NAME"));
                list.add(s);
            }
        }
        return list;
    }

    /**
     * 主キー（学校コード）で学校情報を1件取得します。
     * @param cd 学校コード
     * @return School 学校情報（見つからない場合はnull）
     * @throws Exception データベース操作時の例外
     */
    public School findById(String cd) throws Exception {
        String sql = "SELECT * FROM SCHOOL WHERE CD = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cd);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    School s = new School();
                    s.setCd(rs.getString("CD"));
                    s.setName(rs.getString("NAME"));
                    return s;
                }
            }
        }
        return null;
    }

    /**
     * 学校情報を追加します。
     * @param s 追加する学校情報
     * @throws Exception データベース操作時の例外
     */
    public void insert(School s) throws Exception {
        String sql = "INSERT INTO SCHOOL (CD, NAME) VALUES (?, ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getCd());
            ps.setString(2, s.getName());
            ps.executeUpdate();
        }
    }

    /**
     * 学校情報を更新します。
     * @param s 更新後の学校情報
     * @param oldCd 変更前の学校コード
     * @throws Exception データベース操作時の例外
     */
    public void update(School s, String oldCd) throws Exception {
        String sql = "UPDATE SCHOOL SET CD = ?, NAME = ? WHERE CD = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getCd());
            ps.setString(2, s.getName());
            ps.setString(3, oldCd);
            ps.executeUpdate();
        }
    }

    /**
     * 学校情報を削除します。
     * @param cd 削除対象の学校コード
     * @throws Exception データベース操作時の例外
     */
    public void delete(String cd) throws Exception {
        String sql = "DELETE FROM SCHOOL WHERE CD = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cd);
            ps.executeUpdate();
        }
    }
}

