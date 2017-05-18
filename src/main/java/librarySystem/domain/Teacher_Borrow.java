package librarySystem.domain;

import java.util.Date;

/**
 * Created by 阿越 on 2017/5/16.
 */
public class Teacher_Borrow {
    private String bookNO;
    private String tid;
    private Date borrowDate;
    private Date returnDate;
    private String status;

    @Override
    public String toString() {
        return "Teacher_Borrow{" +
                "bookNO='" + bookNO + '\'' +
                ", tid='" + tid + '\'' +
                ", borrowDate=" + borrowDate +
                ", returnDate=" + returnDate +
                ", status='" + status + '\'' +
                '}';
    }

    public String getBookNO() {
        return bookNO;
    }

    public void setBookNO(String bookNO) {
        this.bookNO = bookNO;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public Date getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
