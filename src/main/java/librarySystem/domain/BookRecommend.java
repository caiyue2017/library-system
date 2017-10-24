package librarySystem.domain;

/**
 * Created by 阿越 on 2017/5/30.
 */
public class BookRecommend {
    private int credNum;
    private int bookId;
    private float preference;

    public int getCredNum() {
        return credNum;
    }

    public void setCredNum(int credNum) {
        this.credNum = credNum;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public float getPreference() {
        return preference;
    }

    public void setPreference(float preference) {
        this.preference = preference;
    }
}
