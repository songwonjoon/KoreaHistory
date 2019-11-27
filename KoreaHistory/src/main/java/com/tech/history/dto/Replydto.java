package com.tech.history.dto;

public class Replydto {
	private String htitle;
	private String content;
	private String cid;
	private String hname;
	private int recnt;
	
	
	public int getRecnt() {
		return recnt;
	}

	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getHtitle() {
		return htitle;
	}

	public void setHtitle(String htitle) {
		this.htitle = htitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
