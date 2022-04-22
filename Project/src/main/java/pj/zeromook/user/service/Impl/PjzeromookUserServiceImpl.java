package pj.zeromook.user.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pj.zeromook.user.service.PjzeromookUserService;
import pj.zeromook.user.service.PjzeromookUserVO;

@Service("UserService")
public class PjzeromookUserServiceImpl implements PjzeromookUserService {

	/** PjzeromookUserDAO */
    @Resource(name = "PjzeromookUserDAO")
    protected PjzeromookUserDAO PjzeromookUserDAO;
	
	@Override
	public int PjzeromookUserJoin(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.PjzeromookUserJoin(vo);
	}

	@Override
	public int PjzeromookUserJoinIDCheck(String user_id) {
		return PjzeromookUserDAO.PjzeromookUserJoinIDCheck(user_id);
	}

	@Override
	public int PjzeromookUserJoinEmailCheck(String user_email) {
		return PjzeromookUserDAO.PjzeromookUserJoinEmailCheck(user_email);
	}

	@Override
	public int PjzeromookUserLogin(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.PjzeromookUserLogin(vo);
	}

	@Override
	public PjzeromookUserVO PjzeromookUserInfo(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.PjzeromookUserInfo(vo);
	}

	@Override
	public List<PjzeromookUserVO> PjzeromookUserList(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.PjzeromookUserList(vo);
	}

	@Override
	public int pjzeromookFriendInvite(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.pjzeromookFriendInvite(vo);
	}

	@Override
	public List<PjzeromookUserVO> PjzeromookReceivedFriendInvite(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.PjzeromookReceivedFriendInvite(vo);
	}

	@Override
	public int pjzeromookFriendAccess(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.pjzeromookFriendAccess(vo);
	}

	@Override
	public List<PjzeromookUserVO> PjzeromookFriendRecommend(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.PjzeromookFriendRecommend(vo);
	}

	@Override
	public int PjzeromookUserCnt(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.PjzeromookUserCnt(vo);
	}

	@Override
	public int pjzeromookUserInfoUpdate(PjzeromookUserVO vo) {
		return PjzeromookUserDAO.pjzeromookUserInfoUpdate(vo);
	}


	

}
