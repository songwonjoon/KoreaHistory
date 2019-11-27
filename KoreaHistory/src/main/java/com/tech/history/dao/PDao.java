package com.tech.history.dao;

import java.util.ArrayList;

import com.tech.history.dto.PhotoDto;
import com.tech.history.page.SearchPhoto;

public interface PDao {

	public int selCount(String sWord, String selNum);
	public ArrayList<PhotoDto> photo_list(int rowStart, int rowEnd,
			String sWord, String string);
	public void pwrite(String ptitle, String pid, String p_content, String pname);
	public void pdelete(String p_num);
	public PhotoDto photo_view(String p_num);
	public PhotoDto photo_modify(String p_num);
	public void photo_mo(String p_num, String ptitle, String pid, String p_content);
	
}
