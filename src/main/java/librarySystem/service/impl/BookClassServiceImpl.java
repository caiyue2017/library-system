package librarySystem.service.impl;

import librarySystem.dao.BookClassDao;
import librarySystem.domain.Book;
import librarySystem.domain.BookClass;
import librarySystem.service.BookClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 阿越 on 2017/5/19.
 */
@Service
public class BookClassServiceImpl implements BookClassService {
    @Autowired
    BookClassDao bookClassDao;

    public BookClass findByCNum(String cnum) {
        return bookClassDao.findByCNum(cnum);
    }
}
