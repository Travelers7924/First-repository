package service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.TestMysql;
import entity.Question;

public class SelectQuestion_03 {
	public static List<Question> doService() {
		String sql = null;
		ResultSet ret = null;
		List<Question> lt = new ArrayList<Question>();
		Question qt = null;
		int id;
		TestMysql test = new TestMysql();

		for (int i = 0; i < 20; i++) {
			qt = new Question();
			sql = "SELECT * FROM question_03 WHERE id = ";
			id = (int) (Math.random() * 20);
			sql = sql + id;
			ret = test.selectSqlData(sql);
			try {
				while (ret.next()) {
					qt.setContent(ret.getString("content"));
					qt.setResult(ret.getString("result"));
				}
				lt.add(qt);
				ret.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		test.closeMysql();
		return lt;
	}
}
