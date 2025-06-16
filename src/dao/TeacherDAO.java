package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Teacher;

public class TeacherDAO extends DAO {

    public List<Teacher> findById(String id) throws Exception {
        List<Teacher> list = new ArrayList<>();

        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM Teacher WHERE id = ? ORDER BY id DESC";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Teacher order = new Teacher();
                order.setId(rs.getString("id"));
                order.setPassword(rs.getString("password"));
                order.setName(rs.getString("name"));
                order.setSchoolCd(rs.getString("schoolcd"));
                list.add(order); 
            }
        }

        return list;
    }
}
