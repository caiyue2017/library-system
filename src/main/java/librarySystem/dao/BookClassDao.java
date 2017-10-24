package librarySystem.dao;

import librarySystem.domain.BookClass;
import org.apache.ibatis.annotations.Param;

public interface BookClassDao {
    BookClass findByCNum(@Param("cnum")String cnum);
}
