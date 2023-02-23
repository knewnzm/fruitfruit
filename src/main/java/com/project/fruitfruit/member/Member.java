package com.project.fruitfruit.member;

public class Member {
	private String user_id ; //아이디 {user_id : "user_id, user_pwd : "user_pwd"} 
	private String user_pwd ; //비밀번호
	private String user_name ; //이름
	private String user_nick; //닉네임
	private int user_tel; //전화번호
	private int user_postcode; //우편번호
	private String user_addr1; //상세주소1
	private String user_addr2 ; //상세주소2
	private int user_type; //가입유형
	private String user_account; //계좌번호
	private String user_bank; //은행 이름
	public Member() {
		super();
	}
	public Member(String user_id, String user_pwd, String user_name, String user_nick, int user_tel, int user_postcode,
			String user_addr1, String user_addr2, int user_type, String user_account, String user_bank) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_nick = user_nick;
		this.user_tel = user_tel;
		this.user_postcode = user_postcode;
		this.user_addr1 = user_addr1;
		this.user_addr2 = user_addr2;
		this.user_type = user_type;
		this.user_account = user_account;
		this.user_bank = user_bank;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public int getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(int user_tel) {
		this.user_tel = user_tel;
	}
	public int getUser_postcode() {
		return user_postcode;
	}
	public void setUser_postcode(int user_postcode) {
		this.user_postcode = user_postcode;
	}
	public String getUser_addr1() {
		return user_addr1;
	}
	public void setUser_addr1(String user_addr1) {
		this.user_addr1 = user_addr1;
	}
	public String getUser_addr2() {
		return user_addr2;
	}
	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getUser_bank() {
		return user_bank;
	}
	public void setUser_bank(String user_bank) {
		this.user_bank = user_bank;
	}
	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", user_nick="
				+ user_nick + ", user_tel=" + user_tel + ", user_postcode=" + user_postcode + ", user_addr1="
				+ user_addr1 + ", user_addr2=" + user_addr2 + ", user_type=" + user_type + ", user_account="
				+ user_account + ", user_bank=" + user_bank + "]";
	}
	
	
}
