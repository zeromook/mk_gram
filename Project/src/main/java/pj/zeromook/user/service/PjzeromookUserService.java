package pj.zeromook.user.service;

import java.util.List;

public interface PjzeromookUserService {

	//회원가입
	public int PjzeromookUserJoin(PjzeromookUserVO vo);
	//아이디 체크
	public int PjzeromookUserJoinIDCheck(String user_id);
	//이메일 체크
	public int PjzeromookUserJoinEmailCheck(String user_email);
	//로그인
	public int PjzeromookUserLogin(PjzeromookUserVO vo);
	//유저정보
	public PjzeromookUserVO PjzeromookUserInfo(PjzeromookUserVO vo);
	//친구검색
	public List<PjzeromookUserVO> PjzeromookUserList(PjzeromookUserVO vo);
	//친구 신청
	public int pjzeromookFriendInvite(PjzeromookUserVO vo);
	//내가 받은 친구신청목록
	public List<PjzeromookUserVO> PjzeromookReceivedFriendInvite(PjzeromookUserVO vo);
	//친구신청 수락
	public int pjzeromookFriendAccess(PjzeromookUserVO vo);
	//친구 추천
	public List<PjzeromookUserVO> PjzeromookFriendRecommend(PjzeromookUserVO vo);
	//친구 수
	public int PjzeromookUserCnt(PjzeromookUserVO vo);
	//내정보 수정
	public int pjzeromookUserInfoUpdate(PjzeromookUserVO vo);

	
}
