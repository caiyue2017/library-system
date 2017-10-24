package librarySystem.dao;

import librarySystem.domain.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {
    List<Book> getAllBooks();

    List<Book> findBooksByName(@Param("searchWords") String searchWords);
    List<Book> findBooksByNameAndType(@Param("searchWords") String searchWords, @Param("type") String type);

    List<Book> findBooksByAuthor(@Param("searchWords")String searchWords);
    List<Book> findBooksByAuthorAndType(@Param("searchWords") String searchWords, @Param("type") String type);

    List<Book> findBooksByNO(@Param("searchWords")String searchWords);
    List<Book> findBooksByNOAndType(@Param("searchWords") String searchWords, @Param("type") String type);

    List<Book> findBooksByPress(@Param("searchWords")String searchWords);
    List<Book> findBooksByPressAndType(@Param("searchWords") String searchWords, @Param("type") String type);

    List<Book> findBorrowNumAndOrder();

    List<Book> findSearchNumAndOrder();

    List<Book> orderAddTime();

    List<Book> orderByBorrowNum();

    List<Book> orderByScore();

    List<Book> findOtherBooksByAuthor(@Param("author") String author);

    List<Book> findSimilarBooksByCnum(@Param("cnum") String cnum);

    Book findBookByBookNO(@Param("bookNO") String bookNO);

    Book findBookByBookId(@Param("id") int bookId);
}
