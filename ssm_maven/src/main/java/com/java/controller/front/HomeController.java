package com.java.controller.front;

import com.github.pagehelper.PageInfo;
import com.java.pojo.Book;
import com.java.pojo.Type;
import com.java.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/book")
public class HomeController {
    @Autowired
    private IBookService bookService;
    @RequestMapping("/getBookList")
    /*查询所有图书*/
    public String getBookList(@RequestParam(defaultValue = "1")Integer pageNum, @RequestParam(defaultValue = "3")Integer pageSize, Model model){
        List<Book> bookList = bookService.findBookList (pageNum,pageSize);
        PageInfo<Book> pageInfo = new PageInfo<> (bookList);
        model.addAttribute ("pageInfo",pageInfo);
        return "admin/bookList.jsp";
    }
    @RequestMapping("/getBookTypeList")
    //查询所有图书分类
    public @ResponseBody List<Type> getBookTypeList(){
       List<Type> list=bookService.findBookTypeList ();
       return list;
    }
    @RequestMapping("/getBookListByTypeId")
    //通过typeId查询图书
    public @ResponseBody List<Type> getBookListByTypeId(Integer type_id){
        return bookService.findBookListByTypeId (type_id);
    }
    @RequestMapping("/saveBook")
    //新增
    public @ResponseBody boolean saveBook(@RequestBody Book book){
        return bookService.findInsertBook (book);
    }
    @RequestMapping("/mutifyedBook")
    //修改
    public @ResponseBody boolean mutifyedBook(Integer book_id, HttpSession session){
        try {
            Book book = bookService.mutifyBook (book_id);
            session.setAttribute ("book",book);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
