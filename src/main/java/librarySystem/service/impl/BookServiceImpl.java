package librarySystem.service.impl;

import librarySystem.dao.BookDao;
import librarySystem.domain.Book;
import librarySystem.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 阿越 on 2017/5/19.
 */
@Service
public class BookServiceImpl implements BookService{
    @Autowired
    BookDao bookDao;

    public List<Book> findBooksByNameAndType(String searchWords, String book_type) {
        if (book_type.equals("all"))
            return bookDao.findBooksByName(searchWords);
        else
            return bookDao.findBooksByNameAndType(searchWords, book_type);
    }

    public List<Book> findBooksByAuthorAndType(String searchWords, String book_type) {
        if (book_type.equals("all"))
            return bookDao.findBooksByAuthor(searchWords);
        else
            return bookDao.findBooksByAuthorAndType(searchWords, book_type);
    }

    public List<Book> findBooksByNOAndType(String searchWords, String book_type) {
        if (book_type.equals("all"))
            return bookDao.findBooksByNO(searchWords);
        else
            return bookDao.findBooksByNOAndType(searchWords, book_type);
    }

    public List<Book> findBooksByPressAndType(String searchWords, String book_type) {
        if (book_type.equals("all"))
            return bookDao.findBooksByPress(searchWords);
        else
            return bookDao.findBooksByPressAndType(searchWords, book_type);
    }

    public List<Book> findBorrowNumAndOrder() {
        return bookDao.findBorrowNumAndOrder();
    }

    public List<Book> findSearchNumAndOrder() {
        return bookDao.findSearchNumAndOrder();
    }

    public List<Book> orderAddTime() {
        return bookDao.orderAddTime();
    }

    public List<Book> orderByBorrowNum() {
        return bookDao.orderByBorrowNum();
    }

    public List<Book> orderByScore() {
        return bookDao.orderByScore();
    }

    public List<Book> findOtherBooksByAuthor(String author) {
        return bookDao.findOtherBooksByAuthor(author);
    }

    public List<Book> findSimilarBooksByCnum(String cnum) {
        return bookDao.findSimilarBooksByCnum(cnum);
    }

    public Book findBookByBookNO(String bookNO) {
        return bookDao.findBookByBookNO(bookNO);
    }

    public Book findBookByBookId(int bookId) {
        return bookDao.findBookByBookId(bookId);
    }
}
