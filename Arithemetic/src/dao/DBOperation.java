package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBOperation {
	private MyDBConnection myDB;
	private Connection conn;
	private Statement stmt;
	private int scores;
	private int number1;
	private int number2;
	private String name;
	private String password;

	// 初始化
	public DBOperation(MyDBConnection myDB) {
		this.myDB = myDB;
		try {
			stmt = this.myDB.getMyConnection().createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 往user表中插入一条数据
	public void insertData(String name, String password, int scores) {
		try {
			String newType1 = new String(name.getBytes(), "GBK"); // 字节转码
			String newTyep2 = new String(password.getBytes(), "GBK");
			String sql = "INSERT INTO user(scores,name,password) VALUES(" + scores + ",'" + newType1 + "','" + newTyep2
					+ "')";
			stmt.executeUpdate(sql);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 删除user表的一条记录
	public void deleteData(int scores) {
		String sql = "DELETE FROM user WHERE scores = " + scores + "";
		System.out.print(sql);
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查询密码
	public boolean selectPassword(String mpassword) {
		String sql = "SELECT scores,name,password FROM user";
		try {
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				password = rs.getString("password");
				number2++;
				if (password.equals(mpassword) && (number2 == number1)) {
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	// 查询名字
	public boolean selectName(String mname) {
		String sql = "SELECT scores,name,password FROM user";
		try {
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				name = rs.getString("name");
				number1++;
				if (name.equals(mname)) {
					return true;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public void closeStatement() {
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int getScores() {
		return scores;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public void setNumber1() {
		number1 = 0;
	}

	public void setNumber2() {
		number2 = 0;
	}
}
