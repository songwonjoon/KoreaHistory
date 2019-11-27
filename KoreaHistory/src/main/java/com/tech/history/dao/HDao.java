package com.tech.history.dao;

import java.util.ArrayList;

import com.tech.history.dto.HistoryHDto;

public interface HDao {
	public ArrayList<HistoryHDto> list(int rowStart, int rowEnd, 
			String searchKeyword, String selNum);
	public int selectBoardCount(String searchKeyword, String selNum);
	public HistoryHDto modify_view(String q_num);
	public void qwrite(String q_num,String qtitle, String writer, String w_content,String qname);
	public void qdelete(String q_num);
	public void modify_his(String q_num,String qtitle, 
			String writer, String w_content);
	public void insert_reply(String qtitle, String a_content,String q_num);
	public String getReply(String a_content);
	public HistoryHDto content_view(String q_num);
	public void getOx(String q_num);
	public void showOx(String q_num);
	public void update_reply(String q_num, String a_content);
	
	
	
}
