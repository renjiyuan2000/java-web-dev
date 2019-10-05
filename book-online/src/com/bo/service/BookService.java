package com.bo.service;

import com.bo.entity.Book;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author mq_xu
 * @ClassName Test
 * @Description 图书业务逻辑类
 * @Date 2019/9/26
 * @Version 1.0
 **/
public class BookService {

    public static List<Book> init() {
        List<Book> bookList = new ArrayList<>(6);
        Book[] books = {
                new Book(1, "持久战", "持久战.jpg", "[中] 毛泽东"),
                new Book(2, "中国兵器史", "中国兵器史.jpg", "[中]周纬"),
                new Book(3, "战争与和平", "战争与和平.jpg", "[俄]列夫·尼古拉耶维奇·托尔斯泰 "),
                new Book(4, "战争艺术概论", "战争艺术概论.jpg", "[瑞士]A·H·若米尼"),
                new Book(5, "海权论", "海权论.jpg", "[美]阿尔弗雷德·塞耶·马汉"),
                new Book(6, "二战全史", "二战全史.jpg", "[中]思不群"),
        };
        bookList = Arrays.asList(books);
        return bookList;
    }

  public static void main(String[] args) {
        List<Book> bookList = BookService.init();
        for (Book book : bookList) {
            System.out.println(book);
        }
  }
}