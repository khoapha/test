package com.fa.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class DBUtils {

  public static Connection connection() {
    Connection con = null;
    try {
      InputStream fis = DBUtils.class.getClassLoader().getResourceAsStream("DBConfig.properties");
      Properties p = new Properties();
      p.load(fis);
      String dname = (String) p.get("driverClassName");
      String url = (String) p.get("url");
      String username = (String) p.get("username");
      String password = (String) p.get("password");
      Class.forName(dname);
      con = DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
      System.out.println("error !!");
      e.printStackTrace();
    }
    return con;
  }
  public static class ConnectionUtil {
    private static SessionFactory sessionFactory = null;
    public static SessionFactory getSessionFactory() {
      if(sessionFactory == null) {
      Configuration configuration = new Configuration();
      configuration.configure();
      ServiceRegistry registry = new StandardServiceRegistryBuilder()
          .applySettings(configuration.getProperties()).build();
      sessionFactory = configuration.buildSessionFactory(registry);
      }
      return sessionFactory;
    }
  }

}
