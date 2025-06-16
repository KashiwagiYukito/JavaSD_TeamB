package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Class_Num;

public class Class_NumDAO extends DAO {
	public List<Class_Num> findByClass_Num(int Class_Num) throws Exception {
		List<Class_Num> list = new ArrayList<>();
	
	try (Connection con = getConnection()) {
		String sql = "SELECT * FROM CLASS_NUM WHERE CLASS_NUM = ? ORDER BY SCHOOL_CD ASC";
	PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1,Class_Num);
		ResultSet rs = st.executeQuery();
	
		while (rs.next()) {
			Class_Num order = new Class_Num();
		    order.setSchoolCd(rs.getString("SCHOOL_CD"));
		    order.setClassNum(rs.getInt("CLASS_NUM"));
		    list.add(order);
		}
	}
	return list;
	}
}