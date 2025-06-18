package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Class_Num;

/**
 * Class_NumDAO
 * クラス情報（CLASS_NUMテーブル）に対するデータアクセス処理を行うクラスです。
 */
public class Class_NumDAO extends DAO {

    /**
     * クラス情報をすべて取得します。
     * @return List<Class_Num> クラス情報リスト
     * @throws Exception データベース操作時の例外
     */
    public List<Class_Num> findAll() throws Exception {
        List<Class_Num> list = new ArrayList<>();
        String sql = "SELECT * FROM CLASS_NUM";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Class_Num cn = new Class_Num();
                cn.setSchoolCd(rs.getString("SCHOOL_CD"));
                cn.setClassNum(rs.getString("CLASS_NUM"));
                list.add(cn);
            }
        }
        return list;
    }

    /**
     * 主キーでクラス情報を1件取得します。
     * @param schoolCd 学校コード
     * @param classNum クラス番号
     * @return Class_Num クラス情報（見つからない場合はnull）
     * @throws Exception データベース操作時の例外
     */
    public Class_Num findById(String schoolCd, String classNum) throws Exception {
        String sql = "SELECT * FROM CLASS_NUM WHERE SCHOOL_CD = ? AND CLASS_NUM = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schoolCd);
            ps.setString(2, classNum);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Class_Num cn = new Class_Num();
                    cn.setSchoolCd(rs.getString("SCHOOL_CD"));
                    cn.setClassNum(rs.getString("CLASS_NUM"));
                    return cn;
                }
            }
        }
        return null;
    }

    /**
     * クラス情報を追加します。
     * @param cn 追加するクラス情報
     * @throws Exception データベース操作時の例外
     */
    public void insert(Class_Num cn) throws Exception {
        String sql = "INSERT INTO CLASS_NUM (SCHOOL_CD, CLASS_NUM) VALUES (?, ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cn.getSchoolCd());
            ps.setString(2, cn.getClassNum());
            ps.executeUpdate();
        }
    }

    /**
     * クラス情報を更新します。
     * @param cn 更新後のクラス情報
     * @param oldSchoolCd 変更前の学校コード
     * @param oldClassNum 変更前のクラス番号
     * @throws Exception データベース操作時の例外
     */
    public void update(Class_Num cn, String oldSchoolCd, String oldClassNum) throws Exception {
        String sql = "UPDATE CLASS_NUM SET SCHOOL_CD = ?, CLASS_NUM = ? WHERE SCHOOL_CD = ? AND CLASS_NUM = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cn.getSchoolCd());
            ps.setString(2, cn.getClassNum());
            ps.setString(3, oldSchoolCd);
            ps.setString(4, oldClassNum);
            ps.executeUpdate();
        }
    }

    /**
     * クラス情報を削除します。
     * @param schoolCd 学校コード
     * @param classNum クラス番号
     * @throws Exception データベース操作時の例外
     */
    public void delete(String schoolCd, String classNum) throws Exception {
        String sql = "DELETE FROM CLASS_NUM WHERE SCHOOL_CD = ? AND CLASS_NUM = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schoolCd);
            ps.setString(2, classNum);
            ps.executeUpdate();
        }
    }
}

