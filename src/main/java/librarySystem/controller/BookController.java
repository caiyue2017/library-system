package librarySystem.controller;

import librarySystem.domain.Book;
import librarySystem.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 阿越 on 2017/5/19.
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Resource
    BookService bookService;

    @RequestMapping("/searchBooks")
    public String searchBooks(String searchTypes, String searchWords,String book_type, HttpServletRequest request){
        List<Book> books = new ArrayList<Book>();
        // 书名
        if (searchTypes.equals("1")) {
            books = bookService.findBooksByNameAndType(searchWords,book_type);
            String bookName;
            for(Book book:books){
                bookName = book.getBookName();
                bookName = bookName.replaceAll(searchWords,"<font style='color:red;'>"+searchWords+"</font>");
                book.setBookName(bookName);
            }
        }
        // 作者
        if (searchTypes.equals("2")){
            books = bookService.findBooksByAuthorAndType(searchWords,book_type);
            String author;
            for(Book book:books){
                author = book.getAuthor();
                author = author.replaceAll(searchWords,"<font style='color:red;'>"+searchWords+"</font>");
                book.setAuthor(author);
            }
        }
        // 出版社
        if (searchTypes.equals("3")) {
            books = bookService.findBooksByPressAndType(searchWords,book_type);
            String press;
            for(Book book:books){
                press = book.getPress();
                press = press.replaceAll(searchWords,"<font style='color:red;'>"+searchWords+"</font>");
                book.setPress(press);
            }
        }
        // 书籍编号
        if (searchTypes.equals("4")) {
            books = bookService.findBooksByNOAndType(searchWords,book_type);
            String bookNO;
            for(Book book:books){
                bookNO = book.getBookNO();
                bookNO = bookNO.replaceAll(searchWords,"<font style='color:red;'>"+searchWords+"</font>");
                book.setBookNO(bookNO);
            }
        }
        request.setAttribute("books",books);
        return "searchResult";
    }

}
