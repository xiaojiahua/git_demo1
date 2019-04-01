package com.java.mapper;

import com.java.pojo.Book;
import com.java.pojo.Type;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BookMapper {
    //查询所有图书
    @Select ("SELECT * FROM ssm_book")
    List<Book> selectBookList();
    //查询图书分类
    @Select ("select * from ssm_book_type")
    List<Type> selectBookTypeList();
    //通过type_id查询图书
    List<Type> selectBookListByTypyId(Integer Type_id);
    //新增图书
    boolean insertBook(Book book);
    //修改图书信息
    @Select ("update ")
    Book updateBook(Integer book_id);
}