package service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.TestMysql;

public class SelectScores {
	public static List<Integer> doService(String username) {
		String sql = null;
		ResultSet ret = null;
		List<Integer> lt = new ArrayList<Integer>();
		int id;
		TestMysql test = new TestMysql();
		sql = "SELECT score FROM scores WHERE username = '" + username + "'";
		ret = test.selectSqlData(sql);
		try {
			while (ret.next()) {
				lt.add(ret.getInt("score"));
				System.out.println(ret.getInt("score"));
			}
			ret.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		test.closeMysql();
		return lt;
	}
}
