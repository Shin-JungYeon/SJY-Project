package model;

public class Joinreq {
	private String id;
	private int no;
	private String reqpicture;
	private String reqid;
	private String reqpass;
	private String reqname;
	private int reqgender;
	private String reqtel;
	private String reqemail;
	private String reqnick;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getReqpicture() {
		return reqpicture;
	}
	public void setReqpicture(String reqpicture) {
		this.reqpicture = reqpicture;
	}
	
	public String getReqid() {
		return reqid;
	}
	public void setReqid(String reqid) {
		this.reqid = reqid;
	}
	
	public String getReqpass() {
		return reqpass;
	}
	public void setReqpass(String reqpass) {
		this.reqpass = reqpass;
	}
	
	public String getReqname() {
		return reqname;
	}
	public void setReqname(String reqname) {
		this.reqname = reqname;
	}
	
	public int getReqgender() {
		return reqgender;
	}
	public void setReqgender(int reqgender) {
		this.reqgender = reqgender;
	}
	
	public String getReqtel() {
		return reqtel;
	}
	public void setReqtel(String reqtel) {
		this.reqtel = reqtel;
	}
	
	public String getReqemail() {
		return reqemail;
	}
	public void setReqemail(String reqemail) {
		this.reqemail = reqemail;
	}
	
	public String getReqnick() {
		return reqnick;
	}
	public void setReqnick(String reqnick) {
		this.reqnick = reqnick;
	}
	
	@Override
	public String toString() {
		return "Request [id=" + id + ", no=" + no + ", reqpicture=" + reqpicture + ", reqid=" + reqid + ", reqpass=" + reqpass + ", reqname=" + reqname
				+ ", reqgender=" + reqgender + ", reqtel=" + reqtel + ", reqemail=" + reqemail + ", reqnick=" + reqnick
				+ "]";
	}
}
