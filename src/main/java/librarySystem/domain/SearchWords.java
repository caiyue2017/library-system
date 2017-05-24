package librarySystem.domain;

/**
 * Created by 阿越 on 2017/5/21.
 */
public class SearchWords {
    private String searchWord;
    private String searchType;
    private String bookType;
    private int searchNum;

    @Override
    public String toString() {
        return "SearchWords{" +
                "searchWord='" + searchWord + '\'' +
                ", searchType='" + searchType + '\'' +
                ", bookType='" + bookType + '\'' +
                ", searchNum=" + searchNum +
                '}';
    }

    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType;
    }

    public int getSearchNum() {
        return searchNum;
    }

    public void setSearchNum(int searchNum) {
        this.searchNum = searchNum;
    }
}
