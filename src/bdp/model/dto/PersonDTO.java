package bdp.model.dto;

public class PersonDTO {
	Integer person_id;
	String user_id;
	String user_pwd;

	public PersonDTO(Integer person_id, String user_id, String user_pwd) {
		super();
		this.person_id = person_id;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PersonDTO [person_id=");
		builder.append(person_id);
		builder.append(", user_id=");
		builder.append(user_id);
		builder.append(", user_pwd=");
		builder.append(user_pwd);
		builder.append("]");
		return builder.toString();
	}
	public Integer getPerson_id() {
		return person_id;
	}
	public void setPerson_id(Integer person_id) {
		this.person_id = person_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	
}// end of class
