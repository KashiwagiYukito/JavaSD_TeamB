package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Teacher;

/**
 * TeacherDAO
 * 教員情報（TEACHERテーブル）に対するデータアクセス処理を行うクラスです。
 */
public class TeacherDAO extends DAO {

    /**
     * 教員情報をすべて取得します。
     * @return List<Teacher> 教員情報リスト
     * @throws Exception データベース操作時の例外
     */
    public List<Teacher> findAll() throws Exception {
        List<Teacher> list = new ArrayList<>();
        String sql = "SELECT * FROM TEACHER";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Teacher t = new Teacher();
                t.setId(rs.getString("ID"));
                t.setPassword(rs.getString("PASSWORD"));
                t.setName(rs.getString("NAME"));
                t.setSchoolCd(rs.getString("SCHOOL_CD"));
                list.add(t);
            }
        }
        return list;
    }

    /**
     * 主キー（ID）で教員情報を1件取得します。
     * @param id 教員ID
     * @return Teacher 教員情報（見つからない場合はnull）
     * @throws Exception データベース操作時の例外
     */
    public Teacher findById(String id) throws Exception {
        String sql = "SELECT * FROM TEACHER WHERE ID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Teacher t = new Teacher();
                    t.setId(rs.getString("ID"));
                    t.setPassword(rs.getString("PASSWORD"));
                    t.setName(rs.getString("NAME"));
                    t.setSchoolCd(rs.getString("SCHOOL_CD"));
                    return t;
                }
            }
        }
        return null;
    }

    /**
     * 教員情報を追加します。
     * @param t 追加する教員情報
     * @throws Exception データベース操作時の例外
     */
    public void insert(Teacher t) throws Exception {
        String sql = "INSERT INTO TEACHER (ID, PASSWORD, NAME, SCHOOL_CD) VALUES (?, ?, ?, ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getId());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getName());
            ps.setString(4, t.getSchoolCd());
            ps.executeUpdate();
        }
    }

    /**
     * 教員情報を更新します。
     * @param t 更新後の教員情報
     * @param oldId 変更前の教員ID
     * @throws Exception データベース操作時の例外
     */
    public void update(Teacher t, String oldId) throws Exception {
        String sql = "UPDATE TEACHER SET ID = ?, PASSWORD = ?, NAME = ?, SCHOOL_CD = ? WHERE ID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getId());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getName());
            ps.setString(4, t.getSchoolCd());
            ps.setString(5, oldId);
            ps.executeUpdate();
        }
    }

    /**
     * 教員情報を削除します。
     * @param id 削除対象の教員ID
     * @throws Exception データベース操作時の例外
     */
    public void delete(String id) throws Exception {
        String sql = "DELETE FROM TEACHER WHERE ID = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, id);
            ps.executeUpdate();
        }
    }


/**
 * ログイン認証（LOGIN_ID と PASSWORD で教員を取得）
 * @param loginId ログインID
 * @param password パスワード
 * @return Teacher 該当教員情報（見つからない場合はnull）
 * @throws Exception データベース操作時の例外
 */
public Teacher login(String loginId, String password) throws Exception {
    String sql = "SELECT * FROM TEACHER WHERE ID = ? AND PASSWORD = ?";
    try (Connection conn = this.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, loginId);
        ps.setString(2, password);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                Teacher t = new Teacher();
                t.setId(rs.getString("ID"));
                t.setPassword(rs.getString("PASSWORD"));
                t.setName(rs.getString("NAME"));
                t.setSchoolCd(rs.getString("SCHOOL_CD"));
                return t;
            }
        }
    }
    return null;
  }
}