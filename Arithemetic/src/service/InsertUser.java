package service;

import java.io.UnsupportedEncodingException;

import dao.TestMysql;
import entity.User;

public class InsertUser {
	public static void doService(User user) {
		String sql = null;
		String name = user.getUsername();
		int score = user.getScores();
		TestMysql test = new TestMysql();
		String newType = null;
		try {
			newType = new String(name.getBytes(), "GBK");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql = "INSERT INTO scores(username,score) VALUES('" + newType + "'," + score + ")";
		test.insertMysqlData(sql);
		test.updateData(newType, score);
		test.closeMysql();
	}
}
