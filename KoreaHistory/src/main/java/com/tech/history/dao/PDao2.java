package com.tech.history.dao;

import java.util.ArrayList;

import com.tech.history.dto.PhotoDto;
import com.tech.history.dto.PhotoDto2;
import com.tech.history.page.SearchPhoto;

public interface PDao2 {

	public int selCount2(String sWord, String selNum);
	public ArrayList<PhotoDto2> photo_list2(int rowStart, int rowEnd,
			String sWord, String string);
	public void pwrite2(String ptitle, String pid, String p_content, String pname);
	public void pdelete2(String p_num);
	public PhotoDto2 photo_view2(String p_num);
	public PhotoDto2 photo_modify2(String p_num);
	public void photo_mo2(String p_num, String ptitle, String pid, String p_content);
	
}
