package pj.zeromook.boardMain.service;

import java.util.List;

import pj.zeromook.user.service.PjzeromookUserVO;

public interface PjzeromookBoardService {

	//내글 목록
	public List<PjzeromookBoardVO> PjzeromookBoardMine(PjzeromookUserVO vo);
	//메인화면 글목록(내글  + 친구글)
	public List<PjzeromookBoardVO> PjzeromookBoardList(PjzeromookUserVO vo);
	//파일업로드 check
	public int PjzeromookBoardUploadFile(PjzeromookBoardVO vo);
	//방금 올린 파일 글번호 가져오기
	public int PjzeromookBoardNoCheck(PjzeromookBoardVO vo);
	//게시글 업로드
	public int PjzeromookBoardUpload(PjzeromookBoardVO vo);
	//파일 삭제
	public int PjzeromookBoardDeleteFile(PjzeromookBoardVO vo);
	//댓글 개수
	public int PjzeromookBoardCommentCnt(PjzeromookBoardVO vo);
	//좋아요 개수
	public int PjzeromookBoardLikeCnt(PjzeromookBoardVO vo);
	
}
