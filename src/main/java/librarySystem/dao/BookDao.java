package librarySystem.dao;

import librarySystem.domain.Book;

import java.util.List;

public interface BookDao {
    List<Book> getAllBooks();
}
