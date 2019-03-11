package com.fa.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
public class Content {
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  private int id;
  private String Title;
  private String Brief;
  private String Content;
  @Temporal(TemporalType.DATE)
  private Date CreateDate; 
  @Temporal(TemporalType.DATE)
  private Date UpdateTime;
  private boolean Sort;
  private int AuthorId;
  public Content() {
    super();
  }
  
  public Content(String title, String brief, String content, Date createDate,
      Date updateTime) {
    super();
    Title = title;
    Brief = brief;
    Content = content;
    CreateDate = createDate;
    UpdateTime = updateTime;
  }
  public Content(int id, String title, String brief, String content,
      Date createDate, Date updateTime) {
    super();
    this.id = id;
    Title = title;
    Brief = brief;
    Content = content;
    CreateDate = createDate;
    UpdateTime = updateTime;
  }
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public String getTitle() {
    return Title;
  }
  public void setTitle(String title) {
    Title = title;
  }
  public String getBrief() {
    return Brief;
  }
  public void setBrief(String brief) {
    Brief = brief;
  }
  public String getContent() {
    return Content;
  }
  public void setContent(String content) {
    Content = content;
  }
  public Date getCreateDate() {
    return CreateDate;
  }
  public void setCreateDate(Date createDate) {
    CreateDate = createDate;
  }
  public Date getUpdateTime() {
    return UpdateTime;
  }
  public void setUpdateTime(Date updateTime) {
    UpdateTime = updateTime;
  }

  public boolean isSort() {
    return Sort;
  }

  public void setSort(boolean sort) {
    this.Sort = sort;
  }

  public int getAuthorId() {
    return AuthorId;
  }

  public void setAuthorId(int AuthorId) {
    this.AuthorId = AuthorId;
  }

  @Override
  public String toString() {
    return "Content [id=" + id + ", Title=" + Title + ", Brief=" + Brief
        + ", Content=" + Content + ", CreateDate=" + CreateDate
        + ", UpdateTime=" + UpdateTime + ", Sort=" + Sort + ", AuthorId="
        + AuthorId + "]";
  }
  
}
