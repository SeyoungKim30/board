package board.vo;

public class Member {
	private String id;
	private String password;
	private String username;
	private boolean admin;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String password, String username, boolean admin) {
		super();
		this.id = id;
		this.password = password;
		this.username = username;
		this.admin = admin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	
}
