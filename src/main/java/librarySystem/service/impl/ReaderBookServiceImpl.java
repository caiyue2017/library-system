package librarySystem.service.impl;

import librarySystem.dao.BookClassDao;
import librarySystem.dao.ReaderBookDao;
import librarySystem.domain.BookClass;
import librarySystem.service.BookClassService;
import librarySystem.service.ReaderBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by 阿越 on 2017/5/19.
 */
@Service
public class ReaderBookServiceImpl implements ReaderBookService {
    @Autowired
    ReaderBookDao readerBookDao;

    public void add(String credNum, String barCode, String bookNO, Date returnDate, Date borrowDate, String status) {
        readerBookDao.add(credNum,barCode,bookNO,returnDate,borrowDate,status);
    }
}
