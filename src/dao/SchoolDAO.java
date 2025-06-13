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
		String sql = "SELECT * FROM school WHERE CD = ? ORDER BY name DESC";
	PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, CD);
		ResultSet rs = st.executeQuery();
	
		while (rs.next()) {
			School order = new School();
		    order.setCd(rs.getString("CD"));
		    order.setName(rs.getString("NAME"));
		    list.add(order);
		}
	}
	return list;
	}
}