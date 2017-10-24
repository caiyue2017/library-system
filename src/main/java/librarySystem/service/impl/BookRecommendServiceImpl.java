package librarySystem.service.impl;

import librarySystem.dao.BookClassDao;
import librarySystem.dao.BookRecommendDao;
import librarySystem.domain.BookClass;
import librarySystem.domain.BookRecommend;
import librarySystem.service.BookClassService;
import librarySystem.service.BookRecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 阿越 on 2017/5/19.
 */
@Service
public class BookRecommendServiceImpl implements BookRecommendService {
    @Autowired
    BookRecommendDao bookRecommendDao;

    public List<Integer> findTheirLike(int reader1, int reader2) {
        return bookRecommendDao.findTheirLike(reader1,reader2);
    }

    public float findPerference(int reader, int bookId) {
        return bookRecommendDao.findPerference(reader,bookId);
    }

    public List<Integer> findReaders() {
        return bookRecommendDao.findReaders();
    }

    public List<Integer> findBooks(Integer key) {
        return bookRecommendDao.findBooks(key);
    }

    public BookRecommend findReadersByBookId(int credNum, int bookId) {
        return bookRecommendDao.findReadersByBookId(credNum,bookId);
    }

}
