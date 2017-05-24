package librarySystem.dao;

import librarySystem.domain.SearchWords;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SearchWordsDao {
    SearchWords find(@Param("searchWord") String searchWord);

    void addSearchNum(@Param("searchWord") String searchWord);

    void add(@Param("searchWord")String searchWords, @Param("searchType")String searchTypes,@Param("bookType") String book_type,@Param("searchNum")int searchNum);

    List<SearchWords> findAllAndOrder(@Param("page")int page,@Param("pageNum")int pageNum);

    List<SearchWords> findAll();
}
