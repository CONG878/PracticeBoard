package board.model;

public class LikeVO {
	private String loginId;
	private String subject;
	private String ip;

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public LikeVO(String loginId, String subject, String ip) {
		super();
		this.loginId = loginId;
		this.subject = subject;
		this.ip = ip;
	}

}
