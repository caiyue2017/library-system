package librarySystem.dao;

import librarySystem.domain.BookCLC;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookCLCDao {
    List<BookCLC> findByBookNO(@Param("bookNO") String bookNO);

    List<BookCLC> findByStatus(@Param("bookNO") String bookNO);
}
