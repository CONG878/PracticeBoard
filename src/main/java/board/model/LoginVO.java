package board.model;

public class LoginVO {
	private String loginId;

	public LoginVO() {
	}

	public LoginVO(String loginId) {
		super();
		this.loginId = loginId;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
}
