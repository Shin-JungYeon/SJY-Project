package model;
//Bean class
public class Member {
	private int mclass;
	private String id;
	private String pass;
	private String name;
	private String nick;
	private int	gender;
	private String tel;
	private String email;
	private String picture;
	private String genre;
	private String career;
	
	//getter, setter, toString
	public int getMclass() {
		return mclass;
	}
	public void setMclass(int mclass) {
		this.mclass = mclass;
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
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", name=" + name + ", nick=" + nick + ", gender=" + gender + ", tel=" + tel
				+ ", email=" + email + ", picture=" + picture + ", genre=" + genre + ", career=" + career + "]";
	}
	
	
}
