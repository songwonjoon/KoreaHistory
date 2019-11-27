package com.tech.history.dao;

import java.util.ArrayList;

import com.tech.history.dto.PhotoDto;
import com.tech.history.dto.PhotoDto1;
import com.tech.history.page.SearchPhoto;

public interface PDao1 {

	public int selCount1(String sWord, String selNum);
	public ArrayList<PhotoDto1> photo_list1(int rowStart, int rowEnd,
			String sWord, String string);
	public void pwrite1(String ptitle, String pid, String p_content, String pname);
	public void pdelete1(String p_num);
	public PhotoDto1 photo_view1(String p_num);
	public PhotoDto1 photo_modify1(String p_num);
	public void photo_mo1(String p_num, String ptitle, String pid, String p_content);
	
}
