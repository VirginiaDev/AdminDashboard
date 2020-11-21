package beans;

public class quick_enquiry {

	private int id;
	private String name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
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
	public String getSubmission_date() {
		return submission_date;
	}
	public void setSubmission_date(String submission_date) {
		this.submission_date = submission_date;
	}
	private String email;
	private String phone;
	private String company;
	public String getLatest_confirmation_email_sent_time() {
		return latest_confirmation_email_sent_time;
	}
	public void setLatest_confirmation_email_sent_time(String latest_confirmation_email_sent_time) {
		this.latest_confirmation_email_sent_time = latest_confirmation_email_sent_time;
	}
	private String message;
	private String confirmation_status;
	private String trashed_status;
	private String submission_date;
	private String latest_confirmation_email_sent_time;
}
