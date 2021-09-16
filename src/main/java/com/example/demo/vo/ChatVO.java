package com.example.demo.vo;


import java.util.Date;

public class ChatVO {
	
	private int chat_no;
	private int chat_room_no;
	private String message;
	private Date chat_date;
	private int speaker_no;
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public int getChat_room_no() {
		return chat_room_no;
	}
	public void setChat_room_no(int chat_room_no) {
		this.chat_room_no = chat_room_no;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getChat_date() {
		return chat_date;
	}
	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}
	public int getSpeaker_no() {
		return speaker_no;
	}
	public void setSpeaker_no(int speaker_no) {
		this.speaker_no = speaker_no;
	}
	public ChatVO(int chat_no, int chat_room_no, String message, Date chat_date, int speaker_no) {
		super();
		this.chat_no = chat_no;
		this.chat_room_no = chat_room_no;
		this.message = message;
		this.chat_date = chat_date;
		this.speaker_no = speaker_no;
	}
	public ChatVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ChatVO [chat_no=" + chat_no + ", chat_room_no=" + chat_room_no + ", message=" + message + ", chat_date="
				+ chat_date + ", speaker_no=" + speaker_no + "]";
	}
	
}
