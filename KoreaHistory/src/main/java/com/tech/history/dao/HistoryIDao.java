package com.tech.history.dao;

import java.util.ArrayList;

import com.tech.history.dto.MemberDto;
import com.tech.history.dto.QuestionDto;

public interface HistoryIDao {
	public MemberDto mainform(String id);

	public QuestionDto question(int qNum);

	public QuestionDto question_proc(int qNum);

	public String getId(String id);

	public int getScore(String id);

	public void scoreUpdate(int score, String id);

	public ArrayList<MemberDto> getRank();

	public int getCount(String id);

	public void cntUpdate(int cnt, String id);

	public String getAns1(int parseInt);

	public String getAns2(int parseInt);

	public String getAns3(int parseInt);

	public String getAns4(int parseInt);
}
