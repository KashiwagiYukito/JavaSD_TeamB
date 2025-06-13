package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;

public class StudentDAO extends DAO {
	public List<Student> findByStudent(int ) throws Exception {
		List<Student> list = new ArrayList<>();
	
	try (Connection con = getConnection()) {
		String sql = "SELECT * FROM  WHERE  = ? ORDER BY  DESC";
	PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1,);
		ResultSet rs = st.executeQuery();
	
		while (rs.next()) {
			School order = new School();
		    order.set(rs.get(""));
		    order.set(rs.get(""));
		    list.add(order);
		}
	}
	return list;
	}
}
