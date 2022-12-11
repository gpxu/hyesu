package kr.human.jdbc;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtil {
	// 프로퍼티 파일에서 내용을 읽는 메서드
	private static Properties readDBProperties(String path) {
		Properties properties = new Properties();
		try(FileReader fr = new FileReader(path)){
			properties.load(fr);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return properties;
	}
	// 연결을 해주는 메서드 1 (얘는 안만들어도 됨)
	public static Connection getConnection(String path) {
		Connection conn = null;
		Properties properties = readDBProperties(path); // 프로퍼티 파일 읽기
		try {
			Class.forName(properties.getProperty("o.driverClass"));
			conn = DriverManager.getConnection(
					properties.getProperty("o.url"),
					properties.getProperty("o.user"),
					properties.getProperty("o.password"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	// 연결을 해주는 메서드 2
	public static Connection getConnection(String path, String dbName) {
		Connection conn = null;
		Properties properties = readDBProperties(path); // 프로퍼티 파일 읽기
		try {
			switch (dbName) {
			case "oracle":
				Class.forName(properties.getProperty("o.driverClass"));
				conn = DriverManager.getConnection(
						properties.getProperty("o.url"),
						properties.getProperty("o.user"),
						properties.getProperty("o.password"));
				break;
			case "maria":
				Class.forName(properties.getProperty("m.driverClass"));
				conn = DriverManager.getConnection(
						properties.getProperty("m.url"),
						properties.getProperty("m.user"),
						properties.getProperty("m.password"));
				break;
			case "sqlite":
				Class.forName(properties.getProperty("s.driverClass"));
				conn = DriverManager.getConnection(
						properties.getProperty("s.url"),
						properties.getProperty("s.user"),
						properties.getProperty("s.password"));
				break;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 사용한 자원을 반납해주는 메서드
	public static void close(Connection conn) {
		try {
			if(conn!=null) conn.close(); // 연결 객체 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt!=null) stmt.close(); // 명령 객체 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs!=null) rs.close(); // 결과 객체 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection conn) {
		try {
			if(conn!=null) conn.rollback(); // 실행한 sql명령을 취소시킨다.
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
