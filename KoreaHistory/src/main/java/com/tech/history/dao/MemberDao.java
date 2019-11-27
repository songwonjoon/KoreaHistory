package com.tech.history.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tech.history.dto.MemberDto;

public class MemberDao {

	DataSource dataSource;
	
	public MemberDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/orcl");
			System.out.println("데이터베이스 접근");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public void join(String id, String pw, String name, String email, String ecertify) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		System.out.println("dao.join() 지나간다");
		
		try {
			conn = dataSource.getConnection();
			String sql = "insert into member(id, pw, name, q_cnt, score, win, lose, email, ecertify, admin)"
					+ " VALUES(?,?,?,0,0,0,0,?,?,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, ecertify);
			int rn = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public String idCheck(String id) {
		String idCheck = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (id=="") {
				idCheck = "중복확인을 위한  아이디를 입력하세요.";
			} else if (rs.next()) {
				idCheck = "해당 아이디 \""+id+"\"(은)는 \"사용할 수 없는 아이디\"입니다.";
			} else {
				idCheck = "해당 아이디는 사용 가능한 아이디 입니다.";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return idCheck;
			
	}

	public String loginCheck(String id, String pw) {
		String loginCheck = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = dataSource.getConnection();
			String sql = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("로그인 가능");
				loginCheck = "로그인 가능";
			} else {
				System.out.println("로그인 불가");
				loginCheck = "로그인 불가";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return loginCheck; //결과값이 로그인이 된다, 안된다. 두가지.
	}
	
	public String nameGet(String id) {
		String name = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = dataSource.getConnection();
			String sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return name;
	}
	//개인정보 수정.
	public void modify(String id, String pw, String name, String email, String ecertify) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		System.out.println("dao.modify() 지나간다");
		
		try {
			conn = dataSource.getConnection();
			String sql = "update member set pw=?, email=?, ecertify=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, email);
			pstmt.setString(3, ecertify);
			pstmt.setString(4, id);
			int rn = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}

	public void modify2(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		System.out.println("dao.modify2() 지나간다");
		
		try {
			conn = dataSource.getConnection();
			String sql = "update member set pw=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			int rn = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
