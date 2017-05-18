package librarySystem.domain;

public class Book {
    private String bookNO;
    private String bookName;
    private Integer collectionNum;
    private Integer borrowedNum;
    private String author;

    public String getBookNO() {
        return bookNO;
    }

    public void setBookNO(String bookNO) {
        this.bookNO = bookNO;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Integer getCollectionNum() {
        return collectionNum;
    }

    public void setCollectionNum(Integer collectionNum) {
        this.collectionNum = collectionNum;
    }

    public Integer getBorrowedNum() {
        return borrowedNum;
    }

    public void setBorrowedNum(Integer borrowedNum) {
        this.borrowedNum = borrowedNum;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
