package librarySystem.domain;

import java.util.Date;

public class Book {
    private String bookNO;
    private String bookName;
    private String author;
    private String press;
    private String pressYear;
    private String translator;
    private String bookDesc;
    private Integer pageNum;
    private String bookImage;
    private String bookType;
    private String cnum;
    private Double price;
    private int searchNum;
    private int borrowNum;
    private String score;
    private int storeNumber;
    private int borrowNumber;
    private Date addTime;

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public int getStoreNumber() {
        return storeNumber;
    }

    public void setStoreNumber(int storeNumber) {
        this.storeNumber = storeNumber;
    }

    public int getBorrowNumber() {
        return borrowNumber;
    }

    public void setBorrowNumber(int borrowNumber) {
        this.borrowNumber = borrowNumber;
    }


    public String getPressYear() {
        return pressYear;
    }

    public void setPressYear(String pressYear) {
        this.pressYear = pressYear;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getTranslator() {
        return translator;
    }

    public void setTranslator(String translator) {
        this.translator = translator;
    }

    public String getBookDesc() {
        return bookDesc;
    }

    public void setBookDesc(String bookDesc) {
        this.bookDesc = bookDesc;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public String getBookImage() {
        return bookImage;
    }

    public void setBookImage(String bookImage) {
        this.bookImage = bookImage;
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType;
    }

    public String getCnum() {
        return cnum;
    }

    public void setCnum(String cnum) {
        this.cnum = cnum;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getSearchNum() {
        return searchNum;
    }

    public void setSearchNum(int searchNum) {
        this.searchNum = searchNum;
    }

    public int getBorrowNum() {
        return borrowNum;
    }

    public void setBorrowNum(int borrowNum) {
        this.borrowNum = borrowNum;
    }
}
