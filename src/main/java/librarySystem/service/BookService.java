package librarySystem.service;

import librarySystem.domain.Book;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 阿越 on 2017/5/19.
 */

public interface BookService {

    List<Book> findBooksByNameAndType(String searchWords, String book_type);

    List<Book> findBooksByAuthorAndType(String searchWords, String book_type);

    List<Book> findBooksByNOAndType(String searchWords, String book_type);

    List<Book> findBooksByPressAndType(String searchWords, String book_type);

    List<Book> findBorrowNumAndOrder();

    List<Book> findSearchNumAndOrder();
}
