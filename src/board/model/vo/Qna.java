package board.model.vo;

import java.sql.Date;

public class Qna {
	
    private int qnaNum;
	private String qnaTitle;
	private String qnaContent;
	private String qnaWriter;
	private int qnaReRef;
	private int qnaReLev;
	private Date qnaDate;
	private String qnaDelete;
	
	
	
	public Qna() {}
	public Qna(int qnaNum, String qnaTitle, String qnaContent, String qnaWriter, int qnaReRef, int qnaReLev,
			Date qnaDate, String qnaDelete) {
		super();
		this.qnaNum = qnaNum;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
		this.qnaReRef = qnaReRef;
		this.qnaReLev = qnaReLev;
		this.qnaDate = qnaDate;
		this.qnaDelete = qnaDelete;
	}
	
	
	
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public int getQnaReRef() {
		return qnaReRef;
	}
	public void setQnaReRef(int qnaReRef) {
		this.qnaReRef = qnaReRef;
	}
	public int getQnaReLev() {
		return qnaReLev;
	}
	public void setQnaReLev(int qnaReLev) {
		this.qnaReLev = qnaReLev;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaDelete() {
		return qnaDelete;
	}
	public void setQnaDelete(String qnaDelete) {
		this.qnaDelete = qnaDelete;
	}
	
	
	
	@Override
	public String toString() {
		return "Qna [qnaNum=" + qnaNum + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaWriter="
				+ qnaWriter + ", qnaReRef=" + qnaReRef + ", qnaReLev=" + qnaReLev + ", qnaDate=" + qnaDate
				+ ", qnaDelete=" + qnaDelete + "]";
	};
	
}
