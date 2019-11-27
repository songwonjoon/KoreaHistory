package com.tech.history.dao;

import java.util.ArrayList;

import com.tech.history.dto.DokdoDto;
import com.tech.history.dto.EastSeaDto;
import com.tech.history.dto.KTW_Dto;
import com.tech.history.dto.K_imDto;
import com.tech.history.dto.SlaveDto;

public interface WikiIDao {

	public ArrayList<DokdoDto> dokdo(String string);

	public ArrayList<EastSeaDto> eastSea(String string);

	public ArrayList<K_imDto> k_im(String string);

	public ArrayList<KTW_Dto> ktw(String string);

	public ArrayList<SlaveDto> slave(String string);

	public void dokdoUpdate(String outline, String history, String japan, String korea, String importance,
			String recognition);

	public void eastSeaUpdate(String outline, String territory, String dispute, String history, String trend);

	public void slaveUpdate(String outline, String detail, String testimony, String present, String japan,
			String denial);

	public void k_imUpdate1(String outline, String time, String time10, String time20, String time30);

	public void k_imUpdate2(String struggle, String enlightenment, String economy, String culture);

	public void ktwUpdate(String outline, String threshold, String korea, String japan, String response,
			String reaction);

	public void dokdoBackup();

	public void eastseaBackup();

	public void k_imBackup();

	public void ktwBackup();

	public void slaveBackup();

}
