package librarySystem.dao;

import librarySystem.domain.BookClass;
import librarySystem.domain.BookRecommend;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookRecommendDao {
    List<Integer> findTheirLike(@Param("credNum1") int reader1, @Param("credNum2")int reader2);

    float findPerference(@Param("credNum") int reader, @Param("bookId") int bookId);

    List<Integer> findReaders();


    List<Integer> findBooks(@Param("credNum") Integer key);

    BookRecommend findReadersByBookId(@Param("credNum") int credNum,@Param("bookId") int bookId);
}
