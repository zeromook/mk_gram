package pj.zeromook.user.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class PjzeromookUserVO {

	/* 유저 이메일*/
	private String user_email;
	/* 유저 이름*/
	private String user_name;
	/* 유저 휴대폰번호*/
	private String user_phone;
	/* 유저 우편번호*/
	private String user_zipcode;
	/* 유저 주소*/
	private String user_address;
	/* 유저 상세주소*/
	private String user_detail_address;
	/* 유저 주소 참고사항*/
	private String user_extra_address;
	/* 유저 아이디*/
	private String user_id;
	/* 유저 비밀번호*/
	private String user_password;
	/* 유저 파일명*/
	private String user_fname;
	/* 유저 랜덤변환값*/
	private String user_realfname;
	/* 유저 파일크기*/
	private long user_fsize;
	/* 친구신청한 유저 아이디*/
	private String friend_id;
	
	MultipartFile file;
	
	/* 유저 검색단어 */
	private String searchKeyword;
	/*추천친구 전체보기 여부*/
	private String allShowRecommendYN;
	/*친구신청 전체보기 여부*/
	private String allShowInvitedYN;
	
	
	public String getUser_fname() {
		return user_fname;
	}
	public void setUser_fname(String user_fname) {
		this.user_fname = user_fname;
	}
	public String getUser_realfname() {
		return user_realfname;
	}
	public void setUser_realfname(String user_realfname) {
		this.user_realfname = user_realfname;
	}
	public long getUser_fsize() {
		return user_fsize;
	}
	public void setUser_fsize(long user_fsize) {
		this.user_fsize = user_fsize;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		// 업로드 파일 접근
		if(! file.isEmpty()){
			// b_fname : 사용자가 올린 파일명
			this.user_fname = file.getOriginalFilename();
			this.user_fsize = file.getSize();
			
			// member_realfname : 서버에 저장되는 파일명
			UUID uuid = UUID.randomUUID();
			// 여기서 this는 멤버변수 member_realfname 자기자신
			this.user_realfname = uuid.toString() + "_" + user_fname;
			// 해당 경로로 변경
			//b_fname을 b_realfname으로 변경
			File f = new File("/Project/resources/image/user/"+user_realfname);
			System.out.println(f.getAbsolutePath());
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
	
	
	
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_zipcode() {
		return user_zipcode;
	}
	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	public String getUser_detail_address() {
		return user_detail_address;
	}
	public void setUser_detail_address(String user_detail_address) {
		this.user_detail_address = user_detail_address;
	}
	public String getUser_extra_address() {
		return user_extra_address;
	}
	public void setUser_extra_address(String user_extra_address) {
		this.user_extra_address = user_extra_address;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getFriend_id() {
		return friend_id;
	}
	public void setFriend_id(String friend_id) {
		this.friend_id = friend_id;
	}
	public String getAllShowRecommendYN() {
		return allShowRecommendYN;
	}
	public void setAllShowRecommendYN(String allShowRecommendYN) {
		this.allShowRecommendYN = allShowRecommendYN;
	}
	public String getAllShowInvitedYN() {
		return allShowInvitedYN;
	}
	public void setAllShowInvitedYN(String allShowInvitedYN) {
		this.allShowInvitedYN = allShowInvitedYN;
	}
	
}
