package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class lecture{
	private String lec_id;
	private Date lec_date;
	private String room_id;
	private String lec_name;
	private String lecturer_id;
	private String lec_mess;
	public final static SimpleDateFormat form=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public String getLec_id() {
		return lec_id;
	}
	public void setLec_id(String lec_id) {
		this.lec_id = lec_id;
	}
	public Date getLec_date() {
		return lec_date;
	}
	public void setLec_date(Date lec_date) {
		this.lec_date = lec_date;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getLec_name() {
		return lec_name;
	}
	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	public String getLecturer_id() {
		return lecturer_id;
	}
	public void setLecturer_id(String lecturer_id) {
		this.lecturer_id = lecturer_id;
	}
	public String getLec_mess() {
		return lec_mess;
	}
	public void setLec_mess(String lec_mess) {
		this.lec_mess = lec_mess;
	}
	
}