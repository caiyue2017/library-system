package librarySystem.service.impl;

import librarySystem.dao.SearchWordsDao;
import librarySystem.domain.SearchWords;
import librarySystem.service.SearchWordsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 阿越 on 2017/5/21.
 */
@Service
public class SearchWordsServiceImpl implements SearchWordsService{
    @Autowired
    SearchWordsDao searchWordsDao;

    public SearchWords find(String searchWord) {
        return searchWordsDao.find(searchWord);
    }

    public void addSearchNum(String searchWord) {
        searchWordsDao.addSearchNum(searchWord);
    }

    public void add(String searchWords, String searchTypes, String book_type) {
        searchWordsDao.add(searchWords, searchTypes, book_type,0);
    }

    public List<SearchWords> findAllAndOrder(int page,int pageNum) {
        return searchWordsDao.findAllAndOrder(page,pageNum);
    }

    public List<SearchWords> findAll() {
        return searchWordsDao.findAll();
    }
}
