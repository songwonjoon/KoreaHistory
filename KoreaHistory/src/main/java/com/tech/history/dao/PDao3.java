package com.tech.history.dao;

import java.util.ArrayList;

import com.tech.history.dto.PhotoDto;
import com.tech.history.dto.PhotoDto3;
import com.tech.history.page.SearchPhoto;

public interface PDao3 {

	public int selCount3(String sWord, String selNum);
	public ArrayList<PhotoDto3> photo_list3(int rowStart, int rowEnd,
			String sWord, String string);
	public void pwrite3(String ptitle, String pid, String p_content, String pname);
	public void pdelete3(String p_num);
	public PhotoDto3 photo_view3(String p_num);
	public PhotoDto3 photo_modify3(String p_num);
	public void photo_mo3(String p_num, String ptitle, String pid, String p_content);
	
}
