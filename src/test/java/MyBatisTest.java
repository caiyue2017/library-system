import librarySystem.config.RootConfig;
import librarySystem.dao.BookDao;
import librarySystem.domain.Book;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class MyBatisTest {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    @Autowired
    private BookDao bookDao;

    @Test
    public void testConn(){
        SqlSession session = sqlSessionFactory.openSession();
        session.selectList("librarySystem.dao.BookDao.getAllBooks");
    }
    @Test
    public void testFindBooks(){
        List<Book> bookList = bookDao.getAllBooks();
        System.out.println(bookList.get(0).getAuthor());
    }
}
