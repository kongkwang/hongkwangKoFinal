package com.kh.ddoda.diary.service;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.ddoda.diary.domain.Diary;
import com.kh.ddoda.diary.domain.PageInfo;
import com.kh.ddoda.diary.domain.Reply;
import com.kh.ddoda.diary.domain.Search;


public interface DiaryService {

	/**
	 *  게시물 개수
	 * @return
	 */
	public int getListCount(String userId);
	
	/**
	 *  전체 게시물 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Diary> selectList(PageInfo pi,String userId);
	
	
	public int addReadCount(int diaryNo);
	public Diary selectDiary(int diaryNo);
	public Diary selectDiary(Diary diary);
//	public Diary selectDiary(Date dateStr);
	public int registerDiary(Diary diary);
	public int modifyDiary(Diary diary);
	public int deleteDiary(int diaryNo);
	public int changePublicCode(Diary diary);
	
	/**
	 * 댓글 삽입
	 * @param reply
	 * @return
	 */
	public int insertReply(Reply reply);
	
	/** 
	 * 댓글리스트 불러오기
	 * @param dId
	 * @return
	 */
	public ArrayList<Reply> selectReplyList(int diaryNo);
	
	public ArrayList<Diary> selectSearchList(Search search);
}
