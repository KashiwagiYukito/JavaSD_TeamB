package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Class_NumDAO extends DAO {
    // schoolCdで絞り込み、List<String>でクラス番号リストを返す
    public List<String> findClassNumsBySchoolCd(String schoolCd) throws Exception {
        List<String> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String sql = "SELECT CLASS_NUM FROM CLASS_NUM WHERE SCHOOL_CD = ? ORDER BY CLASS_NUM ASC";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, schoolCd);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                // CLASS_NUMがint型ならStringに変換
                list.add(String.valueOf(rs.getInt("CLASS_NUM")));
            }
        }
        return list;
    }
}
