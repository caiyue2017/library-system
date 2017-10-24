package librarySystem.service;

import librarySystem.domain.Book;
import librarySystem.domain.BookClass;

import java.util.List;

/**
 * Created by 阿越 on 2017/5/19.
 */

public interface BookClassService {
    BookClass findByCNum(String cnum);
}
