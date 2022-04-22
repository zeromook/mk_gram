package pj.zeromook.boardMain.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pj.zeromook.boardMain.service.PjzeromookBoardVO;
import pj.zeromook.boardMain.service.Impl.PjzeromookBoardServiceImpl;
import pj.zeromook.rt.ResultVO;
import pj.zeromook.user.service.PjzeromookUserVO;
import pj.zeromook.user.service.Impl.PjzeromookUserServiceImpl;

@Controller
public class PjzeromookBoardController {

	
	/** PjzeromookUserServiceImpl */
    @Resource(name = "UserService")
    protected PjzeromookUserServiceImpl UserService;
	
    /** PjzeromookBoardServiceImpl */
    @Resource(name = "BoardService")
    protected PjzeromookBoardServiceImpl BoardService;
	
	//main 게시판페이지
	@RequestMapping("pj/zeromook/main/board.do")
	public String geToTheLoginPage(Model m,HttpSession session){
		PjzeromookUserVO user = (PjzeromookUserVO) session.getAttribute("user");
		List<PjzeromookUserVO> friendInviteList = UserService.PjzeromookReceivedFriendInvite(user);
		List<PjzeromookUserVO> friendRecommendList = UserService.PjzeromookFriendRecommend(user);
		m.addAttribute("friendRecommendList", friendRecommendList);
		m.addAttribute("friendInviteList",friendInviteList);
		m.addAttribute("user",user);
		return "main/board";
	}
	

	
	//친구검색 팝업창
	@RequestMapping("pj/zeromook/main/searchFriendPop.do")
	public String goToTheSearchFriendPopup(@RequestParam(value = "user_id", required = true) String user_id, Model m,HttpSession session){
		PjzeromookUserVO user = (PjzeromookUserVO) session.getAttribute("user");
		m.addAttribute("user_id",user_id);
		m.addAttribute("user",user);
		return "main/searchFriendPop";
	}
	
	
	//팝업에서 친구검색하기
	@RequestMapping("pj/zeromook/main/searchFriend.do")
	@ResponseBody
	public List<PjzeromookUserVO> searchFriend(@ModelAttribute("PjzeromookUserVO")PjzeromookUserVO vo,HttpSession session){
		PjzeromookUserVO sessionVO = (PjzeromookUserVO) session.getAttribute("user");
		vo.setUser_id(sessionVO.getUser_id());
		List<PjzeromookUserVO> userList = new ArrayList<PjzeromookUserVO>();
		userList = UserService.PjzeromookUserList(vo);
		return userList;
	}
	
	//친구신청하기
	@RequestMapping("pj/zeromook/main/friendInvite.do")
	@ResponseBody
	public String friendInvite(@ModelAttribute("PjzeromookUserVO")PjzeromookUserVO vo,HttpSession session){
		PjzeromookUserVO sessionVO = (PjzeromookUserVO) session.getAttribute("user");
		vo.setUser_id(sessionVO.getUser_id());
		ResultVO resultVO = new ResultVO();
		int friendInvite = 0;
		try{
			friendInvite = UserService.pjzeromookFriendInvite(vo);
			if(friendInvite > 0){
				resultVO.setResultMessage("SUCCESS");
			}else{
				resultVO.setResultMessage("FAIL");
			}
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
		}
		return resultVO.getResultMessage();
	}
	

	//친구신청 수락
	@RequestMapping("pj/zeromook/main/friendAccess.do")
	@ResponseBody
	public String friendAccess(@ModelAttribute("PjzeromookUserVO")PjzeromookUserVO vo,HttpSession session){
		PjzeromookUserVO sessionVO = (PjzeromookUserVO) session.getAttribute("user");
		vo.setUser_id(sessionVO.getUser_id());
		ResultVO resultVO = new ResultVO();
		int friendAccess = 0;
		try{
			friendAccess = UserService.pjzeromookFriendAccess(vo);
			if(friendAccess > 2){
				resultVO.setResultMessage("SUCCESS");
			}else{
				resultVO.setResultMessage("FAIL");
			}
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
		}
		return resultVO.getResultMessage();
	}
	
	
	
	//내가 받은 친구신청 전체보기 팝업
	@RequestMapping("pj/zeromook/main/allShowFriendInvited.do")
	public String allShowFriendInviteList(Model m,HttpSession session){
		PjzeromookUserVO user = (PjzeromookUserVO) session.getAttribute("user");
		user.setAllShowInvitedYN("Y");
		List<PjzeromookUserVO> friendInviteList = UserService.PjzeromookReceivedFriendInvite(user);
		m.addAttribute("friendInviteList",friendInviteList);
		m.addAttribute("user",user);
		return "main/friendInviteListPop";
	}
	
	//file업로드 
	@RequestMapping("pj/zeromook/main/fileUpload.do")
	@ResponseBody
	public String fileUpload(Model m,HttpSession session, MultipartFile file){
		PjzeromookBoardVO boardVO = new PjzeromookBoardVO();
		ResultVO resultVO = new ResultVO();
		PjzeromookUserVO sessionVO = (PjzeromookUserVO) session.getAttribute("user");
		boardVO.setFile(file);
		boardVO.setUser_name(sessionVO.getUser_name());
		boardVO.setUser_id(sessionVO.getUser_id());
		int uploadFile = 0;
		int board_no = 0;
		int deleteFile = 0;
		try{
			uploadFile = BoardService.PjzeromookBoardUploadFile(boardVO);
			board_no = BoardService.PjzeromookBoardNoCheck(boardVO);
			boardVO.setBoard_no(Integer.toString(board_no));
			if(uploadFile > 0){
				resultVO.setResultMessage("SUCCESS");
			}else{
				deleteFile = BoardService.PjzeromookBoardDeleteFile(boardVO);
				resultVO.setResultMessage("FAIL");
			}
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
			deleteFile = BoardService.PjzeromookBoardDeleteFile(boardVO);
		}
		return resultVO.getResultMessage()+"__________"+Integer.toString(board_no);
	}
	
	
	//게시글 업로드
	@RequestMapping("pj/zeromook/main/boardUpload.do")
	@ResponseBody
	public String boardUpload(@ModelAttribute("PjzeromookBoardVO")PjzeromookBoardVO vo,HttpSession session){
		ResultVO resultVO = new ResultVO();
		int uploadBoard = 0;
		int deleteFile = 0;
		try{
			uploadBoard = BoardService.PjzeromookBoardUpload(vo);
			if(uploadBoard > 0){
				resultVO.setResultMessage("SUCCESS");
			}else{
				resultVO.setResultMessage("FAIL");
				deleteFile = BoardService.PjzeromookBoardDeleteFile(vo);
			}
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
			deleteFile = BoardService.PjzeromookBoardDeleteFile(vo);
		}
		
		return resultVO.getResultMessage();
	}
	
	//파일 삭제
	@RequestMapping("pj/zeromook/main/boardDeleteFile.do")
	@ResponseBody
	public String boardDeleteFile(@ModelAttribute("PjzeromookBoardVO")PjzeromookBoardVO vo,HttpSession session){
		ResultVO resultVO = new ResultVO();
		int deleteFile = 0;
		try{
			deleteFile = BoardService.PjzeromookBoardDeleteFile(vo);
			if(deleteFile > 0){
				resultVO.setResultMessage("SUCCESS");
			}else{
				resultVO.setResultMessage("FAIL");
			}
		}catch(Exception e){
			resultVO.setResultMessage("ERROR");
		}
		System.out.println(resultVO.getResultMessage());
		return resultVO.getResultMessage();
	}
	
	//댓글/좋아요 개수
	@RequestMapping("pj/zeromook/main/chkCountHR.do")
	@ResponseBody
	public PjzeromookBoardVO chkCountHR(@ModelAttribute("PjzeromookBoardVO")PjzeromookBoardVO vo,HttpSession session){
		PjzeromookUserVO sessionVO = (PjzeromookUserVO) session.getAttribute("user");
		vo.setUser_name(sessionVO.getUser_name());
		vo.setUser_id(sessionVO.getUser_id());
		int likeCnt = 0;
		int commentCnt = 0;
		
		likeCnt = BoardService.PjzeromookBoardLikeCnt(vo);
		commentCnt = BoardService.PjzeromookBoardCommentCnt(vo);
		vo.setBoard_likeCnt(likeCnt);
		vo.setBoard_commentCnt(commentCnt);
		return vo;
	}
	
	
	
	
	
}
