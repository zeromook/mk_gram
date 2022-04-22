package pj.zeromook.user.web;

import java.util.List;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pj.zeromook.boardMain.service.PjzeromookBoardVO;
import pj.zeromook.boardMain.service.Impl.PjzeromookBoardServiceImpl;
import pj.zeromook.rt.ResultVO;
import pj.zeromook.user.service.PjzeromookUserVO;
import pj.zeromook.user.service.Impl.PjzeromookUserServiceImpl;

@Controller
public class PjzeromookUserController {

	
	/** log 처리 서비스 */
	private static final Logger log = Logger.getLogger("PjzeromookUserController");
	
	/** PjzeromookUserServiceImpl */
    @Resource(name = "UserService")
    protected PjzeromookUserServiceImpl UserService;
	
    /** PjzeromookBoardServiceImpl */
    @Resource(name = "BoardService")
    protected PjzeromookBoardServiceImpl BoardService;
    
    
    
    
	//로그인페이지
	@RequestMapping("pj/zeromook/user/login.do")
	public String geToTheLoginPage(){
		return "user/login";
	}
		
	//회원가입페이지
	@RequestMapping("pj/zeromook/user/joinUserPage.do")
	public String goToTheJoinUserPage(){
		return "user/joinUser";
	}

	
	//이메일 중복확인
	@RequestMapping("pj/zeromook/user/emailCheck.do")
	@ResponseBody
	public String userEmailDuplicateCheck(String user_email){
		int resultCount = 0;
		ResultVO resultVO = new ResultVO();
		try{
			resultCount = UserService.PjzeromookUserJoinEmailCheck(user_email);
			if(resultCount > 0){
				resultVO.setResultMessage("SUCCESS");
			}else{
				resultVO.setResultMessage("ERROR");
			}
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
		}
		return resultVO.getResultMessage();
	}

	//아이디 중복확인
	@RequestMapping("pj/zeromook/user/idCheck.do")
	@ResponseBody
	public String PjzeromookUserJoinIDCheck(String user_id){
		int resultCount = 0;
		ResultVO resultVO = new ResultVO();
		try{
			resultCount = UserService.PjzeromookUserJoinIDCheck(user_id);
			if(resultCount > 0){
				resultVO.setResultMessage("SUCCESS");
			}else{
				resultVO.setResultMessage("ERROR");
			}
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
		}
		return resultVO.getResultMessage();
	}
	
	
	
	// User 회원가입
	@RequestMapping("pj/zeromook/user/userJoin.do")
	@ResponseBody
	public String PjzeromookUserJoin(@ModelAttribute("PjzeromookUserVO")PjzeromookUserVO vo){

		int resultCount = 0;
		ResultVO resultVO = new ResultVO();
		try{
			resultCount = UserService.PjzeromookUserJoin(vo);
			if(resultCount > 0){
				resultVO.setResultMessage("SUCCESS");
			}else{
				resultVO.setResultMessage("ERROR");
			}
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
		}
		
		
		return resultVO.getResultMessage();
	}
	
	// User 로그인
	@RequestMapping("pj/zeromook/user/userLogin.do")
	@ResponseBody
	public String PjzeromookUserLogin(@ModelAttribute("PjzeromookUserVO")PjzeromookUserVO vo,HttpSession session){

		PjzeromookUserVO user = new PjzeromookUserVO();
		ResultVO resultVO = new ResultVO();
		
		int resultCount = 0;
		try{
			resultCount = UserService.PjzeromookUserLogin(vo);
			resultVO.setResultMessage("ERROR");
			if(resultCount > 0){
				resultVO.setResultMessage("SUCCESS");
				user = UserService.PjzeromookUserInfo(vo);
				session.setAttribute("user", user);
			}else{
				resultVO.setResultMessage("ERROR");
			}
		}catch(NullPointerException n){
			resultVO.setResultMessage("ERROR");
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
		}
		
		
		return resultVO.getResultMessage();
	}
	
	
	// User 로그아웃
	@RequestMapping("pj/zeromook/user/userLogout.do")
	public String PjzeromookUserLogout(HttpSession session){
		session.invalidate();
		return "user/login";
	}
	
	
	// 마이페이지
	@RequestMapping("pj/zeromook/user/myPage.do")
	public String PjzeromookMyPage(Model m,HttpSession session){
		PjzeromookUserVO user = (PjzeromookUserVO) session.getAttribute("user");
		List<PjzeromookBoardVO> boardList = BoardService.PjzeromookBoardMine(user);
		int friendCnt = UserService.PjzeromookUserCnt(user);
		List<PjzeromookUserVO> friendInviteList = UserService.PjzeromookReceivedFriendInvite(user);
		m.addAttribute("user",user);
		m.addAttribute("boardList",boardList);
		m.addAttribute("boardCnt",boardList.size());
		m.addAttribute("friendCnt",friendCnt);
		m.addAttribute("friendInviteList",friendInviteList);
		return "user/myPage";
	}
	
	//Password check
	@RequestMapping("pj/zeromook/user/chkPassword.do")
	@ResponseBody
	public String PjzeromookchkPassword(String password,HttpSession session){
		PjzeromookUserVO user = (PjzeromookUserVO) session.getAttribute("user");
		ResultVO resultVO = new ResultVO();
		if(password.equals(user.getUser_password())){
			resultVO.setResultMessage("SUCCESS");
		}else{
			resultVO.setResultMessage("FAIL");
		}
		return resultVO.getResultMessage();
	}
	
	//내정보 수정 버튼
	@RequestMapping("pj/zeromook/user/editMyInfo.do")
	public String PjzeromookeditMyInfo(Model m,HttpSession session){
		PjzeromookUserVO user = (PjzeromookUserVO) session.getAttribute("user");
		m.addAttribute("user",user);
		return "user/editMyInfo";
	}
	
	
	//내정보 수정
	@RequestMapping("pj/zeromook/user/updateMyInfo.do")
	@ResponseBody
	public String PjzeromookUpdateMyInfo(@ModelAttribute("PjzeromookUserVO")PjzeromookUserVO vo,HttpSession session){
		ResultVO resultVO = new ResultVO();
		PjzeromookUserVO user = (PjzeromookUserVO) session.getAttribute("user");
		vo.setSessionUser_id(user.getUser_id());
		int updateInfo = 0;
		try{
			updateInfo = UserService.pjzeromookUserInfoUpdate(vo);
			if(updateInfo > 0){
				resultVO.setResultMessage("SUCCESS");
			}else{
				resultVO.setResultMessage("FAIL");
			}
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
		}
		return resultVO.getResultMessage();
	}
	
}
