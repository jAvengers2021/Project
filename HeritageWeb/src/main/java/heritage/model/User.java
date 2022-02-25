package heritage.model;

public class User {

	private int id;
	private int id_avatar;
	private String nickname;
	private String password;
	private String mailAddress;

	public User() {

	}

	public User(int id, int id_avatar, String nickname, String mailAddress) {
		super();
		this.id = id;
		this.id_avatar = id_avatar;
		this.nickname = nickname;
		this.mailAddress = mailAddress;
	}

	public User(int id, int id_avatar, String nickname, String password, String mailAddress) {
		super();
		this.id = id;
		this.id_avatar = id_avatar;
		this.nickname = nickname;
		this.password = password;
		this.mailAddress = mailAddress;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_avatar() {
		return id_avatar;
	}

	public void setId_avatar(int id_avatar) {
		this.id_avatar = id_avatar;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMailAddress() {
		return mailAddress;
	}

	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof User) {
			User other = (User)obj;
			if(other.id==this.id) {
				return true;
			}
		}
		return false;
	}
}
