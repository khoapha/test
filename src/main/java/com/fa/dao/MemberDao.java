package com.fa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fa.entities.Member;
import com.fa.utils.DBUtils;
import com.fa.utils.LogFactory;

public class MemberDao {
  Connection conn = null;

  public int createMember(Member member) {
    if (conn == null) {
      conn = DBUtils.connection();
    }
    try {
      String sql = "INSERT INTO dbo.Member(Username,Email,Password) VALUES(?,?,?)";
      PreparedStatement st = conn.prepareStatement(sql);
      st.setString(1, member.getUsername());
      st.setString(2, member.getEmail());
      st.setString(3, member.getPassword());
      boolean a = st.execute();
      if (a = true) {
        return 1;
      } else {
        return 0;
      }
    } catch (Exception e) {
      LogFactory.getLogger().error(e.getMessage());
    } finally {
      conn = null;
    }
    return 0;
  }

  public Member checkLogin(String email, String password) {
    if (conn == null) {
      conn = DBUtils.connection();
    }
    Member member = new Member();
    try {
      String sql = "Select * from dbo.Member WHERE Email = '" + email
          + "' AND Password = '" + password + "' ";
      PreparedStatement st = conn.prepareStatement(sql);
      ResultSet rs = st.executeQuery();
  
      while (rs.next()) {
          member.setId(rs.getInt("id"));
          member.setUsername(rs.getString("Username"));
          member.setFristname(rs.getString("Fristname"));
          member.setLastname(rs.getString("Lastname"));
          member.setEmail(rs.getString("Email"));
          member.setPhone(rs.getString("Phone"));
          member.setDescription(rs.getString("Description"));
      }
      System.out.println("ec"+member.toString());
      return member;
    } catch (Exception e) {
      e.printStackTrace();
      LogFactory.getLogger().error(e.getMessage());
    } finally {
      conn = null;
    }
    return member;
  }

  public Member updateMember(Member member) {
    if(conn == null) {
      conn = DBUtils.connection();
    }
    Member memberTemp = new Member();
    try {
      String query = "UPDATE dbo.Member SET Fristname =  ? ,Lastname = ?,Phone = ?, Description = ? WHERE id = ?";
      PreparedStatement st= conn.prepareStatement(query);
      st.setString(1, member.getFristname());
      st.setString(2, member.getLastname());
      st.setString(3, member.getPhone());
      st.setString(4, member.getDescription());
      st.setInt(5, member.getId());
      ResultSet rs = st.executeQuery();
      while(rs.next()) {
        memberTemp.setId(rs.getInt(1));
        memberTemp.setFristname(rs.getString("Fristname"));
        memberTemp.setLastname("Lastname");
        memberTemp.setEmail("Email");
        memberTemp.setPhone("Phone");
        memberTemp.setDescription("Descriptiton");
        
      }
      return member;
    } catch (Exception e) {
        LogFactory.getLogger().error(e.getMessage());
    }
    return member;
  }

}
