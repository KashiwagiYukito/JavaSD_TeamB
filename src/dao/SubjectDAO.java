package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Subject;

public class SubjectDAO extends DAO {
    public Subject findByCdAndSchool(String cd, String schoolCd) throws Exception {
        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM subject WHERE cd = ? AND schoolcd = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, cd);
            st.setString(2, schoolCd);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Subject subject = new Subject();
                subject.setSchoolCd(rs.getString("schoolcd"));
                subject.setCd(rs.getString("cd"));
                subject.setName(rs.getString("name"));
                return subject;
            }
        }
        return null;
    }

    public List<Subject> findBySchoolCd(String schoolCd) throws Exception {
        List<Subject> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM subject WHERE schoolcd = ? ORDER BY cd DESC";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, schoolCd);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSchoolCd(rs.getString("schoolcd"));
                subject.setCd(rs.getString("cd"));
                subject.setName(rs.getString("name"));
                list.add(subject);
            }
        }
        return list;
    }

    public boolean save(Subject subject) throws Exception {
        try (Connection con = getConnection()) {
            String sql = "INSERT INTO subject (schoolcd, cd, name) VALUES (?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, subject.getSchoolCd());
            st.setString(2, subject.getCd());
            st.setString(3, subject.getName());
            int result = st.executeUpdate();
            return result == 1;
        }
    }

    public boolean delete(String cd, String schoolCd) throws Exception {
        try (Connection con = getConnection()) {
            String sql = "DELETE FROM subject WHERE cd = ? AND schoolcd = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, cd);
            st.setString(2, schoolCd);
            int result = st.executeUpdate();
            return result == 1;
        }
    }
}
