package com.fa.utils;

import org.apache.log4j.Logger;

public class LogFactory {
  public static Logger getLogger() {
    Logger logger = Logger.getLogger(LogFactory.class);
    return logger;
  }
}
