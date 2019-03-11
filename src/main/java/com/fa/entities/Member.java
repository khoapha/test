package com.fa.entities;

public class Member {
  private int id;
  private String Fristname;
  private String Lastname;
  private String Username;
  private String Password;
  private String Phone;
  private String Email;
  private String Description;
  private String CreateDate;
  private String UpdateTime;
  public Member() {
    super();
  }
  public Member(int id, String fristname, String lastname, String username,
      String password, String phone, String email, String description,
      String createDate, String updateTime) {
    super();
    this.id = id;
    Fristname = fristname;
    Lastname = lastname;
    Username = username;
    Password = password;
    Phone = phone;
    Email = email;
    Description = description;
    CreateDate = createDate;
    UpdateTime = updateTime;
  }
  public Member(String fristname, String lastname, String username,
      String password, String phone, String email, String description,
      String createDate, String updateTime) {
    super();
    Fristname = fristname;
    Lastname = lastname;
    Username = username;
    Password = password;
    Phone = phone;
    Email = email;
    Description = description;
    CreateDate = createDate;
    UpdateTime = updateTime;
  }
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public String getFristname() {
    return Fristname;
  }
  public void setFristname(String fristname) {
    Fristname = fristname;
  }
  public String getLastname() {
    return Lastname;
  }
  public void setLastname(String lastname) {
    Lastname = lastname;
  }
  public String getUsername() {
    return Username;
  }
  public void setUsername(String username) {
    Username = username;
  }
  public String getPassword() {
    return Password;
  }
  public void setPassword(String password) {
    Password = password;
  }
  public String getPhone() {
    return Phone;
  }
  public void setPhone(String phone) {
    Phone = phone;
  }
  public String getEmail() {
    return Email;
  }
  public void setEmail(String email) {
    Email = email;
  }
  public String getDescription() {
    return Description;
  }
  public void setDescription(String description) {
    Description = description;
  }
  public String getCreateDate() {
    return CreateDate;
  }
  public void setCreateDate(String createDate) {
    CreateDate = createDate;
  }
  public String getUpdateTime() {
    return UpdateTime;
  }
  public void setUpdateTime(String updateTime) {
    UpdateTime = updateTime;
  }
  @Override
  public String toString() {
    return "Member [id=" + id + ", Fristname=" + Fristname + ", Lastname="
        + Lastname + ", Username=" + Username + ", Password=" + Password
        + ", Phone=" + Phone + ", Email=" + Email + ", Description="
        + Description + ", CreateDate=" + CreateDate + ", UpdateTime="
        + UpdateTime + "]";
  }
  
  
}
