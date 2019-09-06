package model;

public class MemPoint {
	private int seq;
	private String id;
	private int num;
	private int kbn;
	private String content;
	private int point;
	private int no;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public int getKbn() {
		return kbn;
	}
	public void setKbn(int kbn) {
		this.kbn = kbn;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	@Override
	public String toString() {
		return "MemPoint [seq=" + seq + ", id=" + id + ", num=" + num + ", kbn=" + kbn + ", content=" + content
				+ ", point=" + point + ", no=" + no + "]";
	}
}
