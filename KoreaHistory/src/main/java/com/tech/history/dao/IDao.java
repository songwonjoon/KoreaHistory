package com.tech.history.dao;

import java.util.ArrayList;

import com.tech.history.dto.Historydto;
import com.tech.history.dto.Replydto;

public interface IDao {
	public ArrayList<Historydto> historylist(int rowStart, int rowEnd,String searchKeyword,String selNum);
	public void historywrite( String hname,  String htitle,  String hcontent, String fname);
	public void modify( String hid, String htitle,  String hcontent, String fname);
	public void delete( String hid);
	public void hitUp(String hid);
	public Historydto historyContent(String hid);
	public int selectHistoryCount(String searchKeyword, String selNum);
	public ArrayList<Replydto> getReply(String htitle, String hname);
	public void insertReply(String htitle, String content, String hname, int recnt);
	public String getHtitle(String hid);
	public void replyModify(String content,String cid);
	public void replyDelete(String cid);
	public int gethindent(String htitle);
	public void updateReply(int recnt, String htitle);
	public int getAdmin(String id);

}
