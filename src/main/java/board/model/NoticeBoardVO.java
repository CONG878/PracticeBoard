package board.model;

import java.sql.Timestamp;

public class NoticeBoardVO {
	private int num;
	private String subject;
	private String content;
	private String writerId;
	private String writerName;
	private Timestamp writerDate;
	private int hit;
	private String ip;
	private int like;
	private int replyCount;

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public Timestamp getWriterDate() {
		return writerDate;
	}

	public void setWriterDate(Timestamp writerDate) {
		this.writerDate = writerDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;

	}

}
