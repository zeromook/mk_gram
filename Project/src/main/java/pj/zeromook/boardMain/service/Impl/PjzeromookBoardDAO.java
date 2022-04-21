package pj.zeromook.boardMain.service.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.zeromook.boardMain.service.PjzeromookBoardVO;
import pj.zeromook.user.service.PjzeromookUserVO;

@Repository("PjzeromookBoardDAO")
public class PjzeromookBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//내글 목록
	public List<PjzeromookBoardVO> PjzeromookBoardMine(PjzeromookUserVO vo) {
		return mybatis.selectList("PjzeromookBoardDAO.PjzeromookBoardMine", vo);
	}

	
	//내글     + 친구글 목록
	public List<PjzeromookBoardVO> PjzeromookBoardList(PjzeromookUserVO vo) {
		return mybatis.selectList("PjzeromookBoardDAO.PjzeromookBoardList", vo);
	}
	
	
	//파일 업로드
	public int PjzeromookBoardUploadFile(PjzeromookBoardVO vo){
		return mybatis.insert("PjzeromookBoardDAO.PjzeromookBoardUploadFile",vo);
	}
	
	//글번호 check
	public int PjzeromookBoardNoCheck(PjzeromookBoardVO vo){
		return mybatis.selectOne("PjzeromookBoardDAO.PjzeromookBoardNoCheck",vo);
	}
	
	//게시글 업로드
	public int PjzeromookBoardUpload(PjzeromookBoardVO vo){
		return mybatis.update("PjzeromookBoardDAO.PjzeromookBoardUpload", vo);
	}
	
	//파일 삭제
	public int PjzeromookBoardDeleteFile(PjzeromookBoardVO vo){
		return mybatis.delete("PjzeromookBoardDAO.PjzeromookBoardDeleteFile", vo);
	}
	
	//좋아요 개수
	public int PjzeromookBoardLikeCnt(PjzeromookBoardVO vo){
		return mybatis.selectOne("PjzeromookBoardDAO.PjzeromookBoardLikeCnt",vo);
	}
	
	//댓글 개수
	public int PjzeromookBoardCommentCnt(PjzeromookBoardVO vo){
		return mybatis.selectOne("PjzeromookBoardDAO.PjzeromookBoardCommentCnt",vo);
	}
}
