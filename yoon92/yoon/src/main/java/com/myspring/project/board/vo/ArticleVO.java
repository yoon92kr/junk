package com.myspring.project.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {
	
	private int articleNO;
	private int parentNO;
	private int hiddenNO;
	private int matchNO;
	
	
	private String title;
	private String content;
	private String imageFileName;
	private String id;
	private Date writeDate;

	private String viewNO;
	
	public ArticleVO() {
		System.out.println("ArticleVO °´Ã¼ »ý¼º");
	}
	
	public String getViewNO() {
		return viewNO;
	}

	public void setViewNO(String viewNO) {
		this.viewNO = viewNO;
	}
	
	public int getMatchNO() {
		return matchNO;
	}

	public void setMatchNO(int matchNO) {
		this.matchNO = matchNO;
	}
	public int getHiddenNO() {
		return hiddenNO;
	}
	public void setHiddenNO(int hiddenNO) {
		this.hiddenNO = hiddenNO;
	}

	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	public int getParentNO() {
		return parentNO;
	}
	public void setParentNO(int parentNO) {
		this.parentNO = parentNO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImageFileName() {
		
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

}
