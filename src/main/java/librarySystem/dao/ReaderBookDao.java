package librarySystem.dao;

import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface ReaderBookDao {
    void add(@Param("credNum") String credNum, @Param("barCode") String barCode, @Param("bookNO") String bookNO, @Param("returnDate") Date returnDate,@Param("borrowDate") Date borrowDate, @Param("status") String status);
}
