package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.School;

public class SchoolDAO extends DAO {

    public List<School> findByCD(int CD) throws Exception {
        List<School> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM school WHERE cd = ? ORDER BY cd DESC";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, CD);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                School order = new School();
                order.setCd(rs.getString("cd"));
                order.setName(rs.getString("name"));
                list.add(order);
            }
        }
        return list;
    }

    public School findByNo(String no) throws Exception {
        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM school WHERE no = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, no);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                School school = new School();
                school.setCd(rs.getString("cd"));
                school.setName(rs.getString("name"));
                // noカラムがあれば
                // school.setNo(rs.getString("no"));
                return school;
            }
        }
        return null;
    }
}
