package pj.zeromook.boardMain.service;

public class PjzeromookBoard_CommentVO {

	/*글번호*/
	private String board_no;
	/*아이디*/
	private String user_id;
	/*이름*/
	private String user_name;
	/*답변 깊이*/
	private String board_depth;
	/*댓글 내용*/
	private String board_comment;
	/*댓글 번호*/
	private String board_comment_no;
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
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
	public String getBoard_depth() {
		return board_depth;
	}
	public void setBoard_depth(String board_depth) {
		this.board_depth = board_depth;
	}
	public String getBoard_comment() {
		return board_comment;
	}
	public void setBoard_comment(String board_comment) {
		this.board_comment = board_comment;
	}
	public String getBoard_comment_no() {
		return board_comment_no;
	}
	public void setBoard_comment_no(String board_comment_no) {
		this.board_comment_no = board_comment_no;
	}
}
