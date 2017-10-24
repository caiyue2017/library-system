package librarySystem.controller;

import librarySystem.domain.Book;
import librarySystem.domain.BookCLC;
import librarySystem.domain.BookClass;
import librarySystem.domain.SearchWords;
import librarySystem.service.*;
import librarySystem.util.BookRecommendUtil;
import librarySystem.util.MyPPMCC;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.model.jdbc.ReloadFromJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.model.JDBCDataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.*;

/**
 * Created by 阿越 on 2017/5/19.
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Resource
    BookService bookService;
    @Resource
    SearchWordsService searchWordsService;
    @Resource
    BookCLCService bookCLCService;
    @Resource
    BookClassService bookClassService;
    @Resource
    ReaderBookService readerBookService;
    @Resource
    DataSource dataSource;
    @Resource
    BookRecommendService bookRecommendService;

    /**
     * 书籍检索
     *
     * @param searchTypes
     * @param searchWords
     * @param book_type
     * @param session
     * @return
     */
    @RequestMapping("/searchBooks")
    public String searchBooks(String searchTypes, String searchWords, String book_type, HttpSession session) {
        // 查找检索词（做热门检索功能）
        SearchWords object = searchWordsService.find(searchWords);
        if (object != null)
            searchWordsService.addSearchNum(searchWords);
        else
            searchWordsService.add(searchWords, searchTypes, book_type);

        // 检索功能
        List<Book> books = new ArrayList<Book>();
        // 书名
        if (searchTypes.equals("1")) {
            books = bookService.findBooksByNameAndType(searchWords, book_type);
            String bookName;
            for (Book book : books) {
                getStoreAndBorrowNum(book);
                bookName = book.getBookName();
                bookName = bookName.replaceAll(searchWords, "<font style='color:red;'>" + searchWords + "</font>");
                book.setBookName(bookName);
            }
        }
        // 作者
        if (searchTypes.equals("2")) {
            books = bookService.findBooksByAuthorAndType(searchWords, book_type);
            String author;
            for (Book book : books) {
                getStoreAndBorrowNum(book);
                author = book.getAuthor();
                author = author.replaceAll(searchWords, "<font style='color:red;'>" + searchWords + "</font>");
                book.setAuthor(author);
            }
        }
        // 出版社
        if (searchTypes.equals("3")) {
            books = bookService.findBooksByPressAndType(searchWords, book_type);
            String press;
            for (Book book : books) {
                getStoreAndBorrowNum(book);
                press = book.getPress();
                press = press.replaceAll(searchWords, "<font style='color:red;'>" + searchWords + "</font>");
                book.setPress(press);
            }
        }
        // 书籍编号
        if (searchTypes.equals("4")) {
            books = bookService.findBooksByNOAndType(searchWords, book_type);
            String bookNO;
            for (Book book : books) {
                getStoreAndBorrowNum(book);
                bookNO = book.getBookNO();
                bookNO = bookNO.replaceAll(searchWords, "<font style='color:red;'>" + searchWords + "</font>");
                book.setBookNO(bookNO);
            }
        }
        session.setAttribute("books", books);
        return "searchResult";
    }


    private void getStoreAndBorrowNum(Book book) {
        List<BookCLC> bookCLCList = bookCLCService.findByBookNO(book.getBookNO());
        book.setStoreNumber(bookCLCList.size());
        bookCLCList = bookCLCService.findByStatus(book.getBookNO());
        book.setBorrowNumber(bookCLCList.size());
    }

    // -----检索页面的推荐栏start------

    @RequestMapping("/hotSearch")
    @ResponseBody
    public Map<String, Object> hotSearch(String page) {
        Map<String, Object> map = new HashMap<String, Object>();
        int pageNum = 6;
        int pageI;
        pageI = Integer.parseInt(page) * pageNum - 5;
        List<SearchWords> searchWordsList = searchWordsService.findAllAndOrder(pageI - 1, pageNum);
        map.put("sw", searchWordsList);
        // 返回总数
        List<SearchWords> allList = searchWordsService.findAll();
        map.put("length", allList.size());
        return map;
    }

    @RequestMapping("/hotBorrow")
    @ResponseBody
    public Map<String, Object> hotBorrow(String page) {
        Map<String, Object> map = new HashMap<String, Object>();
        int pageNum = 4;
        int begin = Integer.parseInt(page) * pageNum - (pageNum - 1);
        int end = Integer.parseInt(page) * pageNum;
        List<Book> bookList = bookService.findBorrowNumAndOrder();
        List<Book> returnList = new LinkedList<Book>();
        map.put("length", bookList.size());
        for (int i = begin; i <= end; i++) {
            if (i - 1 < bookList.size()) {
                Book book = bookList.get(i - 1);
                returnList.add(book);
            }
        }
        map.put("bl", returnList);
        return map;
    }

    @RequestMapping("/hotBooks")
    @ResponseBody
    public Map<String, Object> hotBooks(String page) {
        Map<String, Object> map = new HashMap<String, Object>();
        int pageNum = 4;
        int begin = Integer.parseInt(page) * pageNum - (pageNum - 1);
        int end = Integer.parseInt(page) * pageNum;
        List<Book> bookList = bookService.findSearchNumAndOrder();
        List<Book> returnList = new LinkedList<Book>();
        map.put("length", bookList.size());
        for (int i = begin; i <= end; i++) {
            if (i - 1 < bookList.size()) {
                Book book = bookList.get(i - 1);
                returnList.add(book);
            }
        }
        map.put("bl", returnList);
        return map;
    }

    @RequestMapping("/guessYouLike")
    @ResponseBody
    public Map<String, Object> guessYouLike() throws TasteException {
        Map<String, Object> map = new HashMap<String, Object>();
        // 推荐算法实现：
        // 目标用户
        Integer targetReader = 142253;
        // 相邻用户数
        int neighbour = 2;
        // 推荐书籍数
        int recommendBooks = 1;
        BookRecommendUtil bookRecommendUtil = new BookRecommendUtil(bookRecommendService);
        // 采用皮尔逊相关系数计算相似度
        List<Integer> books = bookRecommendUtil.bookRecommend(targetReader,neighbour,recommendBooks,new MyPPMCC(bookRecommendService),-1);
        List<Book> returnList = new LinkedList<Book>();
        for (int bookId:books){
            Book book = bookService.findBookByBookId(bookId);
            returnList.add(book);
        }
        System.out.println(books);
        map.put("bl", returnList);
        return map;
    }
    // -----检索页面的推荐栏end------


    /**
     * 检索结果展示
     *
     * @param page
     * @param session
     * @return
     */
    @RequestMapping("/searchResult")
    @ResponseBody
    public Map<String, Object> searchResult(String page, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Book> books = (List<Book>) session.getAttribute("books");
        map.put("books", books);
        return map;
    }

    // -----检索结果的侧边栏start------

    /**
     * 总点击排行榜
     * @return
     */
    @RequestMapping("/totalHits")
    @ResponseBody
    public Map<String, Object> totalHits() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Book> books = bookService.findSearchNumAndOrder();
        map.put("books", books);
        return map;
    }
    @RequestMapping("/newBooks")
    @ResponseBody
    public Map<String, Object> newBooks() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Book> books = bookService.orderAddTime();
        map.put("books", books);
        return map;
    }
    @RequestMapping("/hotBorrowInResult")
    @ResponseBody
    public Map<String, Object> hotBorrowInResult() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Book> books = bookService.orderByBorrowNum();
        map.put("books", books);
        return map;
    }
    @RequestMapping("/goodScore")
    @ResponseBody
    public Map<String, Object> goodScore() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Book> books = bookService.orderByScore();
        map.put("books", books);
        return map;
    }
    // -----检索结果的侧边栏end------

    // -----书籍详情的侧边栏 start------
    @RequestMapping("/authorBook")
    @ResponseBody
    public Map<String, Object> authorBook(String author) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Book> books = bookService.findOtherBooksByAuthor(author);
        map.put("books", books);
        return map;
    }
    @RequestMapping("/similarBooks")
    @ResponseBody
    public Map<String, Object> similarBooks(String cnum) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Book> books = bookService.findSimilarBooksByCnum(cnum);
        map.put("books", books);
        return map;
    }

    // -----书籍详情的侧边栏 end------

    /**
     * 书籍链接
     * @param bookId
     * @param request
     * @return
     */
    @RequestMapping("/findBook")
    public String findBook(String bookId,HttpServletRequest request){
        Book book = bookService.findBookByBookId(Integer.parseInt(bookId));
        if (book!=null) {
            request.setAttribute("book", book);
            BookClass bookClass = bookClassService.findByCNum(book.getCnum());
            if (bookClass!=null)
                request.setAttribute("cname",bookClass.getCname());
            List<BookCLC> bookCLCList = bookCLCService.findByBookNO(book.getBookNO());
            if (bookCLCList.size()>0)
                request.setAttribute("bclcList",bookCLCList);
        }
        return "book";
    }

    @RequestMapping("/borrowBook")
    public void borrowBook(String credNum,String barCode,String bookNO,HttpServletResponse response) throws IOException {
        String status = "借出";
        Calendar cal = Calendar.getInstance();
        Date borrowDate = cal.getTime();
        cal.add(Calendar.MONTH,1);
        Date returnDate = cal.getTime();
        readerBookService.add(credNum,barCode,bookNO,returnDate,borrowDate,status);
        bookCLCService.updateStatus(barCode);
        response.getWriter().write("success");
    }

    @RequestMapping("/guessYouLikeByThis")
    @ResponseBody
    public Map<String, Object> guessYouLikeByThis(int targetBook) throws TasteException {
        System.out.println(targetBook);
        Map<String, Object> map = new HashMap<String, Object>();
        // 推荐算法实现：
        // 目标用户
        Integer targetReader = 142255;
        // 相邻用户数
        int neighbour = 2;
        // 推荐书籍数
        int recommendBooks = 2;
        BookRecommendUtil bookRecommendUtil = new BookRecommendUtil(bookRecommendService);
        // 采用皮尔逊相关系数计算相似度
        List<Integer> books = bookRecommendUtil.bookRecommend(targetReader,neighbour,recommendBooks,new MyPPMCC(bookRecommendService),targetBook);
        List<Book> returnList = new LinkedList<Book>();
        for (int bookId:books){
            Book book = bookService.findBookByBookId(bookId);
            returnList.add(book);
        }
        System.out.println(books);
        map.put("bl", returnList);
        return map;
    }
}
