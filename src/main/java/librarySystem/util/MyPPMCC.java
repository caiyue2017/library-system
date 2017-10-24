package librarySystem.util;

import librarySystem.service.BookRecommendService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 阿越 on 2017/5/30.
 */
public class MyPPMCC implements CalculateSimilar {

    private BookRecommendService bookRecommendService;

    public MyPPMCC(BookRecommendService bookRecommendService) {
        this.bookRecommendService = bookRecommendService;
    }

    public double calculateSimilar(int reader1, int reader2) {
        // 找出双方都喜欢的图书的编号
        List<Integer> bookList = bookRecommendService.findTheirLike(reader1, reader2);
        double x = 0;
        double y = 0;
        double sq_x = 0;
        double sq_y = 0;
        double xy = 0;
        int n = bookList.size();
        System.out.println(bookList.size());
        if (n == 0)
            return 0;
        // 求和
        for (int bookId : bookList) {
            double p_x = bookRecommendService.findPerference(reader1, bookId);
            double p_y = bookRecommendService.findPerference(reader2, bookId);
            x += p_x;
            y += p_y;
            sq_x += Math.pow(p_x, 2);
            sq_y += Math.pow(p_y, 2);
            xy += p_x * p_y;
        }
        double numerator = xy - x * y / n;
        System.out.println(numerator);
        double denominator = Math.sqrt((sq_x - x * x / n)
                * (sq_y - y * y / n));
        System.out.println(denominator);
        // 分母不能为0
        if (denominator == 0) {
            return 0;
        }
        System.out.println(numerator / denominator);
        return numerator / denominator;
    }
}
