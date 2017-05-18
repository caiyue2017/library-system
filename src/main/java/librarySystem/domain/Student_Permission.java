package librarySystem.domain;

/**
 * Created by 阿越 on 2017/5/16.
 */
public class Student_Permission {
    private int pid;
    private String sno;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    @Override
    public String toString() {
        return "Student_Permission{" +
                "pid=" + pid +
                ", sno='" + sno + '\'' +
                '}';
    }
}
