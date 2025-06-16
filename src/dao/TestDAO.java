package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Test;

public class TestDAO extends DAO {
    public List<Test> findByStudentNo(int no) throws Exception {
        List<Test> list = new ArrayList<>();

        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM Test WHERE no = ? ORDER BY subjectcd DESC";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, no);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Test order = new Test();
                order.setStudentNo(rs.getInt("no"));
                order.setSubjectCd(rs.getString("subjectcd"));
                order.setSchoolCd(rs.getString("schoolcd"));
                order.setPoint(rs.getInt("point"));
                order.setClassNum(rs.getInt("classnum"));
                list.add(order);
            }
        }

        return list;
    }
}
