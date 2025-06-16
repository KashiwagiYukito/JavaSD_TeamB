package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Subject;

public class SubjectDAO extends DAO {
    public List<Subject> findBySchoolCd(String schoolCd) throws Exception {
        List<Subject> list = new ArrayList<>();

        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM subject WHERE schoolcd = ? ORDER BY cd DESC";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, schoolCd);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Subject order = new Subject();
                order.setSchoolCd(rs.getString("schoolcd"));
                order.setCd(rs.getString("cd"));
                order.setName(rs.getString("name"));
                list.add(order); 
            }
        }

        return list;
    }
}
