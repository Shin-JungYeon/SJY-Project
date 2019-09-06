package model;

import java.util.Date;

public class Board {
	private int	num;
	private String id;
	private String pass;
	private int bclass;  //공지 : 0, 포인트 : 1, 리뷰 : 2, 정보 : 3, 자유 : 4
	private String subject;
	private String name;
	private String content;
	private Date regdate;
	private String file;
	private int readcnt;
	private int likecnt;
	private int ref;
	private int reflevel;
	private int refstep;
	private String genre;
	private Date watchdate;
	private String watchloc;
	private int grade;
	private int no;
	private int	likenum;
	private String likeid;
	private String psub;
	private String pcon;
	private Date schedule1;
	private Date schedule2;
	private String cast;
	
	//getter, setter, toString
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public int getBclass() {
		return bclass;
	}
	public void setBclass(int bclass) {
		this.bclass = bclass;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	
	public int getReflevel() {
		return reflevel;
	}
	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}
	
	public int getRefstep() {
		return refstep;
	}
	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public Date getWatchdate() {
		return watchdate;
	}
	public void setWatchdate(Date watchdate) {
		this.watchdate = watchdate;
	}
	
	public String getWatchloc() {
		return watchloc;
	}
	public void setWatchloc(String watchloc) {
		this.watchloc = watchloc;
	}
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	
	public String getLikeid() {
		return likeid;
	}
	public void setLikeid(String likeid) {
		this.likeid = likeid;
	}
	
	@Override
	public String toString() {
		return "Board [num=" + num + ", id=" + id + ", pass=" + pass + ", bclass=" + bclass + ", subject=" + subject + ", name=" + name
				+ ", content=" + content + ", regdate=" + regdate + ", file=" + file + ", readcnt=" + readcnt
				+ ", likecnt=" + likecnt + ", ref=" + ref + ", reflevel=" + reflevel + ", refstep=" + refstep
				+ ", genre=" + genre + ", watchdate=" + watchdate + ", watchloc=" + watchloc + ", grade=" + grade
				+ ", no=" + no + ", likenum=" + likenum + ", likeid=" + likeid + "]";
	}
	public String getPsub() {
		return psub;
	}
	public void setPsub(String psub) {
		this.psub = psub;
	}
	public String getPcon() {
		return pcon;
	}
	public void setPcon(String pcon) {
		this.pcon = pcon;
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
	
	
}
