package model;

public class Request {
	private String id;
	private String joinreq;
	private String pointreq;
	private int no;
	private int jnum;
	private int pnum;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getJoinreq() {
		return joinreq;
	}
	public void setJoinreq(String joinreq) {
		this.joinreq = joinreq;
	}
	
	public String getPointreq() {
		return pointreq;
	}
	public void setPointreq(String pointreq) {
		this.pointreq = pointreq;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getJnum() {
		return jnum;
	}
	public void setJnum(int jnum) {
		this.jnum = jnum;
	}
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	
	@Override
	public String toString() {
		return "Request [id=" + id + ", joinreq=" + joinreq + ", pointreq=" + pointreq + ", no=" + no + ", jnum=" + jnum + ", pnum=" + pnum + "]";
	}

	
}
