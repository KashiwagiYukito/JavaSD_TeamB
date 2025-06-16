package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;

public class StudentDAO extends DAO {

    public List<Student> findBySchoolCd(String schoolCd) throws Exception {
        List<Student> list = new ArrayList<>();

        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM student WHERE schoolCd = ? ORDER BY schoolCd DESC";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, schoolCd); 

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Student order = new Student();
                order.setNo(rs.getInt("no"));
                order.setName(rs.getString("name"));
                order.setEntYear(rs.getInt("entYear"));
                order.setClassNum(rs.getInt("classNum"));
                order.setisAttend(rs.getBoolean("isAttend"));
                order.setSchoolCd(rs.getString("schoolCd")); 
                list.add(order);
            }
        }

        return list;
    }
}
