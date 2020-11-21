package beans;

public class free_audit {

	private int id;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getSubmission_date() {
		return submission_date;
	}
	public void setSubmission_date(String submission_date) {
		this.submission_date = submission_date;
	}
	public String getConfirmation_status() {
		return confirmation_status;
	}
	public void setConfirmation_status(String confirmation_status) {
		this.confirmation_status = confirmation_status;
	}
	public String getTrashed_status() {
		return trashed_status;
	}
	public void setTrashed_status(String trashed_status) {
		this.trashed_status = trashed_status;
	}
	public String getLatest_confirmation_email_sent_time() {
		return latest_confirmation_email_sent_time;
	}
	public void setLatest_confirmation_email_sent_time(String latest_confirmation_email_sent_time) {
		this.latest_confirmation_email_sent_time = latest_confirmation_email_sent_time;
	}
	public String getConfirmation_url() {
		return confirmation_url;
	}
	public void setConfirmation_url(String confirmation_url) {
		this.confirmation_url = confirmation_url;
	}
	private String name;
	private String source_page;
	private String msg;
	private String submission_date;
	private String confirmation_status;
	private String trashed_status;
	private String latest_confirmation_email_sent_time;
	private String confirmation_url;
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	private String email;
	private String phone;
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
	public String getSource_page() {
		return source_page;
	}
	public void setSource_page(String source_page) {
		this.source_page = source_page;
	}
	
}
