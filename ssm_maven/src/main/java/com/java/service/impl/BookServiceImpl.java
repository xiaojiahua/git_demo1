package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.BookMapper;
import com.java.pojo.Book;
import com.java.pojo.Type;
import com.java.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements IBookService {
    @Autowired
    private BookMapper bookMapper;
    @Override
    public List<Book> findBookList(Integer pageNum,Integer pageSize){
        PageHelper.startPage (pageNum,pageSize);
        return bookMapper.selectBookList ();
    }
    @Override
    public List<Type> findBookTypeList(){
          return bookMapper.selectBookTypeList ();
    }

    @Override
    public List<Type> findBookListByTypeId(Integer type_id) {
        return bookMapper.selectBookListByTypyId (type_id);
    }

    @Override
    public boolean findInsertBook(Book book) {
        return bookMapper.insertBook (book);
    }

    @Override
    public Book mutifyBook(Integer book_id) {
        return bookMapper.updateBook (book_id);
    }
}
