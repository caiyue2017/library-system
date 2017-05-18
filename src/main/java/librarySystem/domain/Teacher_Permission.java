package librarySystem.domain;

/**
 * Created by 阿越 on 2017/5/16.
 */
public class Teacher_Permission {
    private String tid;
    private int pid;

    @Override
    public String toString() {
        return "Teacher_Permission{" +
                "tid='" + tid + '\'' +
                ", pid=" + pid +
                '}';
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
}
