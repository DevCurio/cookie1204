package board.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNum;
	private String  noticeTitle;	
	private String noticeWriter;
	private String  noticeContent;
	private String noticeOriginalImage;
	private String noticeRenameImage;
	private Date noticeDate;
	private String noticeDelete;
	
	
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int noticeNum, String noticeTitle, String noticeWriter, String noticeContent,
			String noticeOriginalImage, String noticeRenameImage, Date noticeDate, String noticeDelete) {
		super();
		this.noticeNum = noticeNum;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.noticeOriginalImage = noticeOriginalImage;
		this.noticeRenameImage = noticeRenameImage;
		this.noticeDate = noticeDate;
		this.noticeDelete = noticeDelete;
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeOriginalImage() {
		return noticeOriginalImage;
	}
	public void setNoticeOriginalImage(String noticeOriginalImage) {
		this.noticeOriginalImage = noticeOriginalImage;
	}
	public String getNoticeRenameImage() {
		return noticeRenameImage;
	}
	public void setNoticeRenameImage(String noticeRenameImage) {
		this.noticeRenameImage = noticeRenameImage;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeDelete() {
		return noticeDelete;
	}
	public void setNoticeDelete(String noticeDelete) {
		this.noticeDelete = noticeDelete;
	}
	@Override
	public String toString() {
		return "Notice [noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle + ", noticeWriter=" + noticeWriter
				+ ", noticeContent=" + noticeContent + ", noticeOriginalImage=" + noticeOriginalImage
				+ ", noticeRenameImage=" + noticeRenameImage + ", noticeDate=" + noticeDate + ", noticeDelete="
				+ noticeDelete + "]";
	}
	
	


	
	
	
}