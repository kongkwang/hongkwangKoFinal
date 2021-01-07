package com.kh.ddoda.diary.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ddoda.diary.domain.Diary;
import com.kh.ddoda.diary.domain.PageInfo;
import com.kh.ddoda.diary.domain.Reply;
import com.kh.ddoda.diary.domain.Search;
import com.kh.ddoda.diary.store.DiaryStore;


@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryStore dStore;
	
	@Override
	public int getListCount(String userId) {
		return dStore.getListCount(userId);
	}

	@Override
	public ArrayList<Diary> selectList(PageInfo pi, String userId) {
		return dStore.selectList(pi,userId);
	}

	@Override
	public int addReadCount(int diaryNo) {
		return dStore.addReadCount(diaryNo);
	}

	@Override
	public Diary selectDiary(int diaryNo) {
		return dStore.selectDiary(diaryNo);
	}
	@Override
	public Diary selectDiary(Diary diary) {
		return dStore.selectDiary(diary);
	}

	@Override
	public int registerDiary(Diary diary) {
		
		return dStore.insertDiary(diary);
	}

	@Override
	public int modifyDiary(Diary diary) {
		return dStore.updateDiary(diary);
	}

	@Override
	public int deleteDiary(int diaryNo) {
		return dStore.deleteDiary(diaryNo);
	}

	@Override
	public int insertReply(Reply reply) {
		return dStore.insertReply(reply);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int diaryNo) {
		return dStore.selectReplyList(diaryNo);
	}


	@Override
	public ArrayList<Diary> selectSearchList(Search search) {
		return dStore.selectSearchList(search);
	}

	@Override
	public int changePublicCode(Diary diary) {
		return dStore.changePublicCode(diary);
	}




}
