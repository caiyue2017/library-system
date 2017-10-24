package librarySystem.service;

import librarySystem.domain.BookClass;
import librarySystem.domain.BookRecommend;

import java.util.List;

/**
 * Created by 阿越 on 2017/5/19.
 */

public interface BookRecommendService {
    List<Integer> findTheirLike(int reader1, int reader2);

    float findPerference(int reader1, int bookId);

    List<Integer> findReaders();


    List<Integer> findBooks(Integer key);

    BookRecommend findReadersByBookId(int credNum, int bookId);
}
