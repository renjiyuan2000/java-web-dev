package com.bo.service;


import com.bo.entity.User;
import com.bo.utils.Md5Util;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author mq_xu
 * @ClassName UserService
 * @Description 用户业务逻辑类
 * @Date 2019/9/26
 * @Version 1.0
 **/
public class UserService {
  private List<User> userList;

  public void setUserList(List<User> userList) {
    this.userList = userList;
  }

  /**
   * 用户登陆功能
   *
   * @param account
   * @param password
   * @return user
   */
  public User signIn(String account, String password) {
    for (User user : userList) {
      if (user.getAccount().equals(account) && user.getPassword().equals(Md5Util.crypt(password))) {
        return user;
      }
    }
    return null;
  }

  public static void main(String[] args) {
    User user = new UserService().signIn("13951905171", Md5Util.crypt("111"));
    if (user != null) {
      System.out.println(user);
    } else {
      System.out.println("登录失败");
    }
  }
}