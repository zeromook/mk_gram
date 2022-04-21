package pj.zeromook.boardMain.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class PjzeromookBoardVO {

	//게시글 번호
	private String board_no;
	//게시글 제목
	private String board_sj;
	//게시글 내용
	private String board_cn;
	//게시글 좋아요 개수
	private int board_likeCnt;
	//게시글 작성날짜
	private String board_insdt;
	/* 게시글 파일명*/
	private String board_fname;
	/* 게시글 랜덤변환값*/
	private String board_realfname;
	/* 게시글 파일크기*/
	private long board_fsize;
	/*아이디*/
	private String user_id;
	/*이름*/
	private String user_name;
	/*좋아요 여부*/
	private String board_likeYN;
	/*댓글 수*/
	private int board_commentCnt;
	/*파일*/
	MultipartFile file;
	
	
	
	
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		// 업로드 파일 접근
		if(! file.isEmpty()){
			// b_fname : 사용자가 올린 파일명
			this.board_fname = file.getOriginalFilename();
			this.board_fsize = file.getSize();
			
			// member_realfname : 서버에 저장되는 파일명
			UUID uuid = UUID.randomUUID();
			// 여기서 this는 멤버변수 member_realfname 자기자신
			this.board_realfname = uuid.toString() + "_" + board_fname;
			// 해당 경로로 변경
			//b_fname을 b_realfname으로 변경
			File f = new File("D:/workspace/Project/src/main/webapp/resources/image/board/" + board_realfname);
			//여기 경로를 실제 서버에서 할때는 바꿔야함----@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}//end of if
	}//end of setFile()
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getBoard_fname() {
		return board_fname;
	}
	public void setBoard_fname(String board_fname) {
		this.board_fname = board_fname;
	}
	public String getBoard_realfname() {
		return board_realfname;
	}
	public void setBoard_realfname(String board_realfname) {
		this.board_realfname = board_realfname;
	}
	public long getBoard_fsize() {
		return board_fsize;
	}
	public void setBoard_fsize(long board_fsize) {
		this.board_fsize = board_fsize;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getBoard_sj() {
		return board_sj;
	}
	public void setBoard_sj(String board_sj) {
		this.board_sj = board_sj;
	}
	public String getBoard_cn() {
		return board_cn;
	}
	public void setBoard_cn(String board_cn) {
		this.board_cn = board_cn;
	}
	public int getBoard_likeCnt() {
		return board_likeCnt;
	}
	public void setBoard_likeCnt(int board_likeCnt) {
		this.board_likeCnt = board_likeCnt;
	}
	public String getBoard_insdt() {
		return board_insdt;
	}
	public void setBoard_insdt(String board_insdt) {
		this.board_insdt = board_insdt;
	}
	public String getBoard_likeYN() {
		return board_likeYN;
	}
	public void setBoard_likeYN(String board_likeYN) {
		this.board_likeYN = board_likeYN;
	}
	public int getBoard_commentCnt() {
		return board_commentCnt;
	}
	public void setBoard_commentCnt(int board_commentCnt) {
		this.board_commentCnt = board_commentCnt;
	}
}
