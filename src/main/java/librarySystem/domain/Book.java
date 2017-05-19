package librarySystem.domain;

public class Book {
    private String bookNO;
    private String bookName;
    private Integer collectionNum;
    private Integer borrowedNum;
    private String author;
    private String press;
    private String translator;
    private String bookDesc;
    private Integer pageNum;
    private String bookImage;
    private String bookType;
    private String storeAddress;
    private String cnum;
    private Double price;

    @Override
    public String toString() {
        return "Book{" +
                "bookNO='" + bookNO + '\'' +
                ", bookName='" + bookName + '\'' +
                ", collectionNum=" + collectionNum +
                ", borrowedNum=" + borrowedNum +
                ", author='" + author + '\'' +
                ", press='" + press + '\'' +
                ", translator='" + translator + '\'' +
                ", bookDesc='" + bookDesc + '\'' +
                ", pageNum=" + pageNum +
                ", bookImage='" + bookImage + '\'' +
                ", bookType='" + bookType + '\'' +
                ", storeAddress='" + storeAddress + '\'' +
                ", cnum='" + cnum + '\'' +
                ", price=" + price +
                '}';
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

    public String getStoreAddress() {
        return storeAddress;
    }

    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
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
