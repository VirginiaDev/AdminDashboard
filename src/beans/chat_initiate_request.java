package beans;

public class chat_initiate_request {

	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getLatest_admin_replying_id() {
		return latest_admin_replying_id;
	}
	public void setLatest_admin_replying_id(String latest_admin_replying_id) {
		this.latest_admin_replying_id = latest_admin_replying_id;
	}
	public String getLatest_admin_replying_name() {
		return latest_admin_replying_name;
	}
	public void setLatest_admin_replying_name(String latest_admin_replying_name) {
		this.latest_admin_replying_name = latest_admin_replying_name;
	}
	public String getChat_status() {
		return chat_status;
	}
	public void setChat_status(String chat_status) {
		this.chat_status = chat_status;
	}
	public String getChatid() {
		return chatid;
	}
	public void setChatid(String chatid) {
		this.chatid = chatid;
	}
	public String getLast_reply_by() {
		return last_reply_by;
	}
	public void setLast_reply_by(String last_reply_by) {
		this.last_reply_by = last_reply_by;
	}
	public String getLast_reply_time() {
		return last_reply_time;
	}
	public void setLast_reply_time(String last_reply_time) {
		this.last_reply_time = last_reply_time;
	}
	private String name;
	private String email;
	private String mobile;
	private String message;
	private String latest_admin_replying_id;
	private String latest_admin_replying_name;
	public String getChat_request_status() {
		return chat_request_status;
	}
	public void setChat_request_status(String chat_request_status) {
		this.chat_request_status = chat_request_status;
	}
	private String chat_status;
	private String chatid;
	private String last_reply_by;
	private String last_reply_time;
	private String chat_request_status;
}
