package model;

import java.util.Date;

public class InfoBoard {
	private int num;
	private int no;
	private String psubject;
	private String pcontent;
	private String genre;
	private Date schedule1;
	private Date schedule2;
	private String cast;
	private String poster;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getPsubject() {
		return psubject;
	}
	public void setPsubject(String psubject) {
		this.psubject = psubject;
	}
	
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public Date getSchedule1() {
		return schedule1;
	}
	public void setSchedule1(Date schedule1) {
		this.schedule1 = schedule1;
	}
	
	public Date getSchedule2() {
		return schedule2;
	}
	public void setSchedule2(Date schedule2) {
		this.schedule2 = schedule2;
	}
	
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	
	@Override
	public String toString() {
		return "InfoBoard [num=" + num + ", no=" + no + ", psubject=" + psubject + ", pcontent=" + pcontent + ", genre=" + genre
				+ ", schedule1=" + schedule1 + ", schedule2=" + schedule2 + ", cast=" + cast + ", poster=" + poster
				+ "]";
	}
	
}
