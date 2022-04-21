package pj.zeromook.boardMain.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pj.zeromook.boardMain.service.PjzeromookBoardService;
import pj.zeromook.boardMain.service.PjzeromookBoardVO;
import pj.zeromook.user.service.PjzeromookUserVO;

@Service("BoardService")
public class PjzeromookBoardServiceImpl implements PjzeromookBoardService {

	/** PjzeromookBoardDAO */
    @Resource(name = "PjzeromookBoardDAO")
    protected PjzeromookBoardDAO PjzeromookBoardDAO;
	
	
	@Override
	public List<PjzeromookBoardVO> PjzeromookBoardMine(PjzeromookUserVO vo) {
		return PjzeromookBoardDAO.PjzeromookBoardMine(vo);
	}

	@Override
	public List<PjzeromookBoardVO> PjzeromookBoardList(PjzeromookUserVO vo) {
		return PjzeromookBoardDAO.PjzeromookBoardList(vo);
	}

	@Override
	public int PjzeromookBoardUploadFile(PjzeromookBoardVO vo) {
		return PjzeromookBoardDAO.PjzeromookBoardUploadFile(vo);
	}

	@Override
	public int PjzeromookBoardNoCheck(PjzeromookBoardVO vo) {
		return PjzeromookBoardDAO.PjzeromookBoardNoCheck(vo);
	}

	@Override
	public int PjzeromookBoardUpload(PjzeromookBoardVO vo) {
		return PjzeromookBoardDAO.PjzeromookBoardUpload(vo);
	}

	@Override
	public int PjzeromookBoardDeleteFile(PjzeromookBoardVO vo) {
		return PjzeromookBoardDAO.PjzeromookBoardDeleteFile(vo);
	}

	@Override
	public int PjzeromookBoardCommentCnt(PjzeromookBoardVO vo) {
		return PjzeromookBoardDAO.PjzeromookBoardCommentCnt(vo);
	}

	@Override
	public int PjzeromookBoardLikeCnt(PjzeromookBoardVO vo) {
		return PjzeromookBoardDAO.PjzeromookBoardLikeCnt(vo);
	}

}
