package com.java.service;

import com.java.pojo.Book;
import com.java.pojo.Type;

import java.util.List;

public interface IBookService {
    List<Book> findBookList(Integer pageNum,Integer pageSize);
    List<Type> findBookTypeList();
    List<Type> findBookListByTypeId(Integer type_id);
    boolean findInsertBook(Book book);
    Book mutifyBook(Integer book_id);
}
