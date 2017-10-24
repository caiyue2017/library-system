package librarySystem.dao;

import librarySystem.domain.Permission;
import org.apache.ibatis.annotations.Param;

public interface PermissionDao {
    Permission find(@Param("pid") Integer pid);
}
