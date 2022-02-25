package heritage.model;

public class Contact {

	private int id;
	private User asker;
	private User asked;
	private int status;

	public Contact() {

	}

	public Contact(int id, User asker, User asked, int status) {
		super();
		this.id = id;
		this.asker = asker;
		this.asked = asked;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getAsker() {
		return asker;
	}

	public void setAsker(User asker) {
		this.asker = asker;
	}

	public User getAsked() {
		return asked;
	}

	public void setAsked(User asked) {
		this.asked = asked;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}

}