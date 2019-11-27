package com.tech.history.dao;

import java.util.ArrayList;

import com.tech.history.dto.PhotoDto;
import com.tech.history.dto.PhotoDto4;
import com.tech.history.page.SearchPhoto;

public interface PDao4 {

	public int selCount4(String sWord, String selNum);
	public ArrayList<PhotoDto4> photo_list4(int rowStart, int rowEnd,
			String sWord, String string);
	public void pwrite4(String ptitle, String pid, String p_content, String pname);
	public void pdelete4(String p_num);
	public PhotoDto4 photo_view4(String p_num);
	public PhotoDto4 photo_modify4(String p_num);
	public void photo_mo4(String p_num, String ptitle, String pid, String p_content);
	
}
