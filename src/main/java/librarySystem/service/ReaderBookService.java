package librarySystem.service;

import librarySystem.domain.BookClass;

import java.util.Date;

/**
 * Created by 阿越 on 2017/5/19.
 */

public interface ReaderBookService {

    void add(String credNum, String barCode, String bookNO, Date borrowDate, Date borrowDate1, String status);
}
