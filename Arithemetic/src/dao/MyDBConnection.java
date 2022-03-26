package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MyDBConnection {
	private String DBDriver = "com.mysql.cj.jdbc.Driver";
	private String DBURL = "jdbc:mysql://localhost:3306/arithemetic?characterEncoding=utf-8";
	private String DBUser = "root";
	private String DBPass = "111111";
	private Connection conn = null;
	private Statement stmt = null;

	public MyDBConnection() {
		try {
			Class.forName(DBDriver);
			conn = DriverManager.getConnection(DBURL, DBUser, DBPass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getMyConnection() {
		return conn;

	}

	public Statement getMyStatement() {
		return stmt;
	}

	public void closeMyConnection() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
