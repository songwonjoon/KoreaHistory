package com.tech.history.dto;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private int q_cnt;
	private int score;
	private String email;
	private String ecertify;
	private int admin;

	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQ_cnt() {
		return q_cnt;
	}

	public void setQ_cnt(int q_cnt) {
		this.q_cnt = q_cnt;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEcertify() {
		return ecertify;
	}

	public void setEcertify(String ecertify) {
		this.ecertify = ecertify;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}
}
