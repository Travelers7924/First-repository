package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestMysql {
	// 登陆本地数据库
	private static final String url = "jdbc:mysql://localhost:3306/arithemetic";
	private static final String user = "root";
	private static final String password = "111111";
	private static ResultSet ret = null;
	private static final String name = "com.mysql.cj.jdbc.Driver";
	public Connection conn = null;
	public Statement st = null;

	public TestMysql() {
		try {
			Class.forName(name);
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 对userquestion表进行插入删除操作
	public void insertMysqlData(String sql) {
		try {
			System.out.println("接收到的参数为：" + sql);
			st = conn.createStatement();
			st.executeUpdate(sql);
			st.close();
			System.out.println("结束!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查询userquestion表中的数据
	public ResultSet selectSqlData(String sql) {
		try {
			System.out.println("接收的插入删除参数为" + sql);
			st = conn.createStatement();
			ret = st.executeQuery(sql);
			return ret;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	// 更新user表的数据
	public void updateData(String name, int score) {
		String sql = "UPDATE user SET scores = " + score + " where name = '" + name + "'";
		System.out.print(sql);
		try {
			st = conn.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 关闭数据库
	public void closeMysql() {
		try {
			this.ret.close();
			this.st.close();
			this.conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
