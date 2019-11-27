package com.tech.history.dto;

import java.sql.Timestamp;
import java.util.Date;

public class Historydto {
	private int hid;
	private String hname;
	private String htitle;
	private String hcontent;
	private Date hdate;
	private int hhit;
	private int hgroup;
	private int hstep;
	private int hindent;
	private String hfilesrc;
	private String content;
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Historydto() {
		// TODO Auto-generated constructor stub
	}

	public Historydto(int hid, String hname, String htitle, String hcontent, Timestamp hdate, int hhit, int hgroup,
			int hstep, int hindent, String hfilesrc) {
		this.hid = hid;
		this.hname = hname;
		this.htitle = htitle;
		this.hcontent = hcontent;
		this.hdate = hdate;
		this.hgroup = hgroup;
		this.hstep = hstep;
		this.hindent = hindent;
		this.hfilesrc = hfilesrc;
	}

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHtitle() {
		return htitle;
	}

	public void setHtitle(String htitle) {
		this.htitle = htitle;
	}

	public String getHcontent() {
		return hcontent;
	}

	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}

	public Date getHdate() {
		return hdate;
	}

	public void setHdate(Date hdate) {
		this.hdate = hdate;
	}

	public int getHhit() {
		return hhit;
	}

	public void setHhit(int hhit) {
		this.hhit = hhit;
	}

	public int getHgroup() {
		return hgroup;
	}

	public void setHgroup(int hgroup) {
		this.hgroup = hgroup;
	}

	public int getHstep() {
		return hstep;
	}

	public void setHstep(int hstep) {
		this.hstep = hstep;
	}

	public int getHindent() {
		return hindent;
	}

	public void setHindent(int hindent) {
		this.hindent = hindent;
	}

	public String getHfilesrc() {
		return hfilesrc;
	}

	public void setHfilesrc(String hfilesrc) {
		this.hfilesrc = hfilesrc;
	}

}
