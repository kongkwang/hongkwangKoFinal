package com.kh.ddoda.diary.store;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.ddoda.diary.domain.Diary;
import com.kh.ddoda.diary.domain.PageInfo;
import com.kh.ddoda.diary.domain.Reply;
import com.kh.ddoda.diary.domain.Search;

public interface DiaryStore {
	
	/**
	 * �Խ��� ��ü �� ��ȸ
	 * @return
	 */
	public int getListCount(String userId);
	
	/**
	 * �Խ��� ��ü ��ȸ, ����¡
	 * @param pi
	 * @return
	 */
	public ArrayList<Diary> selectList(PageInfo pi, String userId);
	
	
	public int addReadCount(int diaryNo);
	public Diary selectDiary(int diaryNo);
	public Diary selectDiary(Diary diary);
//	public Diary selectDiary(Date dateStr);
	public int insertDiary(Diary diary);
	public int updateDiary(Diary diary);
	public int deleteDiary(int diaryNo);
	public int changePublicCode(Diary diary);
	/**
	 * �Խñ� ��� ���
	 * @param reply
	 * @return
	 */
	public int insertReply(Reply reply);
	
	/** 
	 * �Խñ� �����ȸ
	 * @param dId
	 * @return
	 */
	public ArrayList<Reply> selectReplyList(int diaryNo);
	
	
	public ArrayList<Diary> selectSearchList(Search search);
}
