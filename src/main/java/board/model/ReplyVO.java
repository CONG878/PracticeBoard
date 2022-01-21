package board.model;

import java.sql.Timestamp;

public class ReplyVO {
	private int num;
	private int refNum;
	private String comment;
	private String writerId;
	private String writerName;
	private Timestamp writerDate;
	private int goodHit;
	private int badHit;
	private String ip;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRefNum() {
		return refNum;
	}

	public void setRefNum(int refNum) {
		this.refNum = refNum;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

	public int getGoodHit() {
		return goodHit;
	}

	public void setGoodHit(int goodHit) {
		this.goodHit = goodHit;
	}

	public int getBadHit() {
		return badHit;
	}

	public void setBadHit(int badHit) {
		this.badHit = badHit;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
