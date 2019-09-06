package model;

public class Pointreq {
	private int no;
	private String id;
	private String reqid;
	private int usablepoint;
	private int itempoint;
	private int restpoint;
	private int itemno;
	private String itemname;
	private String reqtel;
	private String reqemail;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getReqid() {
		return reqid;
	}
	public void setReqid(String reqid) {
		this.reqid = reqid;
	}
	
	public int getUsablepoint() {
		return usablepoint;
	}
	public void setUsablepoint(int usablepoint) {
		this.usablepoint = usablepoint;
	}
	
	public int getItempoint() {
		return itempoint;
	}
	public void setItempoint(int itempoint) {
		this.itempoint = itempoint;
	}
	
	public int getRestpoint() {
		return restpoint;
	}
	public void setRestpoint(int restpoint) {
		this.restpoint = restpoint;
	}
	
	public int getItemno() {
		return itemno;
	}
	public void setItemno(int itemno) {
		this.itemno = itemno;
	}
	
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
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
	
	@Override
	public String toString() {
		return "Pointreq [no=" + no + ", id=" + id + ", reqid=" + reqid + ", usablepoint=" + usablepoint + ", itempoint=" + itempoint + ", restpoint="
				+ restpoint + ", itemno=" + itemno + ", itemname=" + itemname + ", reqtel=" + reqtel + ", reqemail=" + reqemail + "]";
	}
}
