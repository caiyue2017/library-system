package librarySystem.service;

import librarySystem.domain.SearchWords;

import java.util.List;


/**
 * Created by 阿越 on 2017/5/19.
 */

public interface SearchWordsService {
    SearchWords find(String searchWord);

    void addSearchNum(String searchWord);

    void add(String searchWords, String searchTypes, String book_type);

    List<SearchWords> findAllAndOrder(int page,int pageNum);

    List<SearchWords> findAll();
}
