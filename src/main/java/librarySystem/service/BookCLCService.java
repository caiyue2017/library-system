package librarySystem.service;

import librarySystem.domain.BookCLC;
import librarySystem.domain.SearchWords;

import java.util.List;


/**
 * Created by 阿越 on 2017/5/19.
 */

public interface BookCLCService {

    List<BookCLC> findByBookNO(String bookNO);

    List<BookCLC> findByStatus(String bookNO);
}
