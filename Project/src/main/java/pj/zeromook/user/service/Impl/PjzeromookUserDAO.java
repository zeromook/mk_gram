package pj.zeromook.user.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
//import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.zeromook.user.service.PjzeromookUserVO;

@Repository("PjzeromookUserDAO")
public class PjzeromookUserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int PjzeromookUserJoin(PjzeromookUserVO vo){
		int resultCount = mybatis.insert("PjzeromookUserDAO.PjzeromookUserJoin",vo);
		return resultCount;
	}
	
	public int PjzeromookUserJoinIDCheck(String user_id) {
		int resultCount = mybatis.selectOne("PjzeromookUserDAO.PjzeromookUserJoinIDCheck",user_id);
		return resultCount;
	}

	/**
	 * 이메일 중복확인
	 * */
	public int PjzeromookUserJoinEmailCheck(String user_email) {
		int resultCount = mybatis.selectOne("PjzeromookUserDAO.PjzeromookUserJoinEmailCheck",user_email);
		return resultCount;
	}

	/**
	 * 로그인
	 * */
	public int PjzeromookUserLogin(PjzeromookUserVO vo) {
		int resultCount = mybatis.selectOne("PjzeromookUserDAO.PjzeromookUserLogin",vo);
		System.out.println("로그인확인 resultCount"+resultCount);
		return resultCount;
	}
	
	
	/**
	 * 유저정보저장
	 * */
	public PjzeromookUserVO  PjzeromookUserInfo(PjzeromookUserVO vo) {
		PjzeromookUserVO result = mybatis.selectOne("PjzeromookUserDAO.PjzeromookUserInfo",vo);
		return result;
	}
	
	
	/**
	 * 본인을 제외하고 검색단어도 확인하는 유저리스트
	 * */
	public List<PjzeromookUserVO>  PjzeromookUserList(PjzeromookUserVO vo) {
		List<PjzeromookUserVO> result = mybatis.selectList("PjzeromookUserDAO.PjzeromookUserList", vo);
		return result;
	}
	
	
	
	/**
	 * 친구신청하기
	 * */
	public int pjzeromookFriendInvite(PjzeromookUserVO vo) {
		int result = mybatis.insert("PjzeromookUserDAO.pjzeromookFriendInvite", vo);
		return result;
	}
	
	
	/**
	 * 내가 받은 친구신청 목록
	 * */
	public List<PjzeromookUserVO> PjzeromookReceivedFriendInvite(PjzeromookUserVO vo) {
		List<PjzeromookUserVO> result = mybatis.selectList("PjzeromookUserDAO.PjzeromookReceivedFriendInvite", vo);
		return result;
	}
	
	
	/**
	 * 친구 수락
	 * */
	public int pjzeromookFriendAccess(PjzeromookUserVO vo){
		int result = mybatis.delete("PjzeromookUserDAO.PjzeromookDeleteFriendInvite", vo);
		int result2 = mybatis.insert("PjzeromookUserDAO.PjzeromookFriendAccess", vo);
		int result3 = mybatis.insert("PjzeromookUserDAO.PjzeromookFriendAccess2", vo);
		return result + result2 + result3;
	}
	
	
	/**
	 * 친구 추천
	 * */
	public List<PjzeromookUserVO> PjzeromookFriendRecommend(PjzeromookUserVO vo){
		List<PjzeromookUserVO> result = mybatis.selectList("PjzeromookUserDAO.PjzeromookFriendRecommend", vo);
		return result;
	}
	
	/**
	 * 친구 수
	 * */
	public int PjzeromookUserCnt(PjzeromookUserVO vo){
		int result = mybatis.selectOne("PjzeromookUserDAO.PjzeromookUserCnt", vo);
		return result;
	}

	/**
	 * 내정보 수정
	 * */
	public int pjzeromookUserInfoUpdate(PjzeromookUserVO vo){
		int result = mybatis.update("PjzeromookUserDAO.pjzeromookUserInfoUpdate",vo);
		return result;
	}
	
	
	
	
}
