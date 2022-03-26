package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestMysql {
	// ��½�������ݿ�
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

	// ��userquestion����в���ɾ������
	public void insertMysqlData(String sql) {
		try {
			System.out.println("���յ��Ĳ���Ϊ��" + sql);
			st = conn.createStatement();
			st.executeUpdate(sql);
			st.close();
			System.out.println("����!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// ��ѯuserquestion���е�����
	public ResultSet selectSqlData(String sql) {
		try {
			System.out.println("���յĲ���ɾ������Ϊ" + sql);
			st = conn.createStatement();
			ret = st.executeQuery(sql);
			return ret;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	// ����user�������
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

	// �ر����ݿ�
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
