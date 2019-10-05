package com.bo.listener;

import com.bo.entity.Book;
import com.bo.entity.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author mq_xu
 * @ClassName ContextLoaderListener
 * @Description 上下文加载监听，在服务器启动的时候即刻生效，用来生成用户数据和图书数据
 * @Date 2019/9/27
 * @Version 1.0
 **/

@WebListener
public class ContextLoaderListener implements ServletContextListener {

  /**
   * @Description 容器初始化方法
   * @param sce
   */
  @Override
  public void contextInitialized(ServletContextEvent sce) {
    System.out.println("容器启动");
    //创建并生成用户数据列表
    List<User> userList = new ArrayList<>(3);
    User[] users = {
            new User(1, "aaa@qq.com", "698d51a19d8a121ce581499d7b701668", "一号", "user1.jpg", "江苏南京", LocalDate.of(2018, 6, 11)),
            new User(2, "bbb@qq.com", "698d51a19d8a121ce581499d7b701668", "二号", "user2.jpg", "浙江杭州", LocalDate.of(2019, 2, 18)),
            new User(3, "ccc@qq.com", "698d51a19d8a121ce581499d7b701668", "三号", "user3.jpg", "湖北武汉", LocalDate.of(2019, 8, 19))
    };
    userList = Arrays.asList(users);

    //创建并生成图书数据列表
    List<Book> bookList = new ArrayList<>(10);
    Book[] books = {
            new Book(1, "持久战", "持久战.jpg", "[中] 毛泽东"),
            new Book(2, "中国兵器史", "中国兵器史.jpg", "[中]周纬"),
            new Book(3, "战争与和平", "战争与和平.jpg", "[俄]列夫·尼古拉耶维奇·托尔斯泰 "),
            new Book(4, "战争艺术概论", "战争艺术概论.jpg", "[瑞士]A·H·若米尼"),
            new Book(5, "海权论", "海权论.jpg", "[美]阿尔弗雷德·塞耶·马汉"),
            new Book(6, "二战全史", "二战全史.jpg", "[中]思不群"),
    };
    bookList = Arrays.asList(books);

    //获得全局变量
    ServletContext servletContext = sce.getServletContext();
    //设置全局变量属性，将用户和图书列表数据记入，整个应用可以共享
    servletContext.setAttribute("userList", userList);
    servletContext.setAttribute("bookList", bookList);
  }

  /**
   * 销毁方法
   *
   * @param sce
   */
  @Override
  public void contextDestroyed(ServletContextEvent sce) {
    System.out.println("容器销毁");
  }
}