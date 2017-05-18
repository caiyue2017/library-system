package librarySystem.domain;

import java.util.Date;

/**
 * Created by 阿越 on 2017/5/16.
 */
public class Student_Borrow {
    private String bookNO;
    private String sno;
    private Date borrowDate;
    private Date returnDate;
    private String status;

    @Override
    public String toString() {
        return "Student_Borrow{" +
                "bookNO='" + bookNO + '\'' +
                ", sno='" + sno + '\'' +
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

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
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
