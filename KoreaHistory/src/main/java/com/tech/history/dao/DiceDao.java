package com.tech.history.dao;

import com.tech.history.dto.DiceGameDto;

public interface DiceDao {
	DiceGameDto getCom(String string);

	DiceGameDto getUser(String string);

	void userRun(int userGround, String string);

	void cpuRun(int cpuGround, String string);

	int getUserWin(String id);

	void userWinUpdate(int userWin, String id);

	int getUserLose(String id);

	void userLoseUpdate(int userLose, String id);
}
