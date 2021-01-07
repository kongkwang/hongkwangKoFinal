package com.kh.ddoda.diary.store;

import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.diary.domain.Diary;
import com.kh.ddoda.diary.domain.PageInfo;
import com.kh.ddoda.diary.domain.Reply;
import com.kh.ddoda.diary.domain.Search;



@Repository
public class DiaryStoreLogic implements DiaryStore{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Diary diary;
	private PageInfo pageInfo;
	private Reply reply;
	private Search search;
	private Pagination pagination;
	
	@Override
	public int getListCount(String userId) {
		
		return sqlSession.selectOne("diaryMapper.getListCount", userId);
	}

	@Override
	public ArrayList<Diary> selectList(PageInfo pi, String userId) {
		int offset=(pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("diaryMapper.selectList", userId, rowBounds);
	}
	
	@Override
	public int addReadCount(int diaryNo) {
		return sqlSession.update("diaryMapper.updateCount", diaryNo);
	}

	@Override
	public Diary selectDiary(int diaryNo) {
		return sqlSession.selectOne("diaryMapper.selectOne", diaryNo);
	}
	@Override
	public Diary selectDiary(Diary diary) {
		return sqlSession.selectOne("diaryMapper.selectOneByDate", diary);
	}

	@Override
	public int insertDiary(Diary diary) {
		int result=sqlSession.insert("diaryMapper.insertDiary", diary);
		
		return result;
	}

	@Override
	public int updateDiary(Diary diary) {
		return sqlSession.update("diaryMapper.updateDiary", diary);
	}

	@Override
	public int deleteDiary(int diaryNo) {
		return sqlSession.delete("diaryMapper.deleteDiary", diaryNo);
	}

	@Override
	public int insertReply(Reply reply) {
		return sqlSession.insert("diaryMapper.insertReply", reply);
	}

	/*
	 * @Override public ArrayList<Reply> selectReplyList(int refBid) {
	 * System.out.println("refBid=" + refBid); return
	 * (ArrayList)sqlSession.selectList("diaryMapper.selectReplyList", refBid); }
	 */


	@Override
	public ArrayList<Diary> selectSearchList(Search search) {
		return (ArrayList)sqlSession.selectList("diaryMapper.searchList", search);
	}

	@Override
	public int changePublicCode(Diary diary) {
		int result= sqlSession.update("diaryMapper.updatePublicCode", diary);
		return result;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int refBid) {
		return (ArrayList)sqlSession.selectList("diaryMapper.selectReplyList", refBid);
	}


}
