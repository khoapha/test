package com.fa.dao;

import java.security.acl.Group;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.derby.client.am.DateTime;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.fa.entities.Content;
import com.fa.utils.DBUtils;


public class ContentDao {
  private SessionFactory sessionFactory;

  public int addContent(Content content) {
    if(sessionFactory == null) {
      sessionFactory = DBUtils.ConnectionUtil.getSessionFactory();
    }
    try {
      Session session = sessionFactory.openSession();
      session.beginTransaction();
      SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
      Date date = new Date();  
      String temp = formatter.format(date);
     content.setCreateDate(convertUtilToSql(formatter.parse(temp) ));
     content.setSort(true);
     session.save(content);
     session.getTransaction().commit();
     return 1;
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      sessionFactory = null;
    }
    return 0;
  }
  private static java.sql.Date convertUtilToSql(java.util.Date uDate) {
    return new java.sql.Date(uDate.getTime());
  }
  public List<Content> getListContent(int id) {
    if (sessionFactory == null) {
      sessionFactory = DBUtils.ConnectionUtil.getSessionFactory();
    }
    List<Content> contents = null;
    try {
      Session session = sessionFactory.openSession();
      session.beginTransaction();
      String querySQL = "From Content WHERE AuthorId = :AuthorId";
      Query query = session.createQuery(querySQL);
      query.setParameter("AuthorId", id);
      contents = (List<Content>) query.list();
      return contents;
    } catch (Exception e) {
      System.out.println(e.toString());
    } finally {
      sessionFactory = null;
    }
    return contents;
  }

  public Content getInfoContentUpdate(int id) {
    if (sessionFactory == null) {
      sessionFactory = DBUtils.ConnectionUtil.getSessionFactory();
    }
    Content content = null;
    try {
      Session session = sessionFactory.openSession();
      session.beginTransaction();
      content = (Content) session.get(Content.class, id);
      return content;
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      sessionFactory = null;
    }
    return content;
  }
  public void updateContent(Content content2) {
    if(sessionFactory == null) {
      sessionFactory = DBUtils.ConnectionUtil.getSessionFactory();
    }
    try {
      Session session = sessionFactory.openSession();
      session.beginTransaction();
      Content content = (Content) session.get(Content.class, content2.getId());
     content.setSort(content2.isSort());
     content.setBrief(content2.getBrief());
     content.setTitle(content2.getContent());
     content.setUpdateTime(new Date());
     content.setContent(content2.getContent());
     session.update(content);
     session.getTransaction().commit();
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      sessionFactory = null;
    }
   
  }
  public List<Content> findContent(String name) {
    if(sessionFactory == null) {
      sessionFactory = DBUtils.ConnectionUtil.getSessionFactory();
    }
    List<Content> list = null;
    try {
      Session session = sessionFactory.openSession();
      session.beginTransaction();
      String query = "From Content WHERE Title like :Title";
      Query Query = session.createQuery(query);
      Query.setParameter("Title","%"+name+"%");
      list = (ArrayList<Content>) Query.list();
      return list;

    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      sessionFactory = null;
    }
    return list;
  }
  public int deleteContent(int id) {
    if(sessionFactory == null) {
      sessionFactory = DBUtils.ConnectionUtil.getSessionFactory();
    }
    List<Content> list = null;
    try {
      Session session = sessionFactory.openSession();
      session.beginTransaction();
      String Query = "delete from Content Where id = :id";
      Query query = session.createQuery(Query);
      query.setParameter("id",id);
      int result = query.executeUpdate();
      session.getTransaction().commit();
      return result;
    } catch (Exception e) {
      e.printStackTrace();
    }finally {
      sessionFactory = null;
    }
    return 0;
  }

}
