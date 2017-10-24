package librarySystem.util;

import librarySystem.domain.BookRecommend;
import librarySystem.service.BookRecommendService;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.*;

/**
 * Created by 阿越 on 2017/5/30.
 */
public class BookRecommendUtil {
    private BookRecommendService bookRecommendService;
    public BookRecommendUtil(BookRecommendService bookRecommendService){
        this.bookRecommendService = bookRecommendService;
    }
    public List<Integer> bookRecommend(Integer targetReader, int neighbour, int recommendBooks, CalculateSimilar calculateSimilar,int targetBook) {
        List<Integer> readers = bookRecommendService.findReaders();
        readers.remove(targetReader);
        // map<读者借阅号,相似度>
        Map<Integer,Double> resultsMap = new HashMap<Integer, Double>();
        // 皮尔逊相关系数计算相似度
        for (int comparisonReader:readers){
            double result = calculateSimilar.calculateSimilar(targetReader,comparisonReader);
            resultsMap.put(comparisonReader,Math.abs(result));
        }
        // 以相似度从大到小排序
        resultsMap = MapSort(resultsMap);

        // 除去没有阅读指定书籍的用户
        if (targetBook != -1) {
            List<Integer> list = new ArrayList<Integer>();
            for (Map.Entry<Integer, Double> map : resultsMap.entrySet()) {
                System.out.println("处理前"+map.getKey()+":"+map.getValue());
                BookRecommend bookRecommend = bookRecommendService.findReadersByBookId(map.getKey(), targetBook);
                if (bookRecommend == null)
                    list.add(map.getKey());
            }
            if (list!=null) {
                for (int i : list) {
                    resultsMap.remove(i);
                }
            }
        }

        int count = 0;
        // 以其相邻的其他用户来推荐图书，此处相邻用户数为neighbour
        // map<书籍ID,推荐度>
        Map<Integer,Double> recommendMap = new HashMap<Integer, Double>();
        for (Map.Entry<Integer,Double> map:resultsMap.entrySet()){
            System.out.println("处理后"+map.getKey()+":"+map.getValue());
            if (count>=neighbour)
                break;
            List<Integer> tempBooks = bookRecommendService.findTheirLike(targetReader,map.getKey());
            List<Integer> books = bookRecommendService.findBooks(map.getKey());
            // 找到目标用户没有看过而相邻用户看过的书
            for (Integer temp:tempBooks)
                books.remove(temp);
            // 推荐逻辑：书籍乘以权重
            for (int bookId:books) {
                double value = map.getValue();
                if (recommendMap.containsKey(bookId))
                    value  += recommendMap.get(bookId);
                recommendMap.put(bookId, value);
            }
            count++;
        }

        // 以权重高低进行排序
        recommendMap = MapSort(recommendMap);
        int count2 = 0;
        // list<书籍ID>
        List<Integer> recommendBookIds = new ArrayList<Integer>();
        // 根据设置的推荐图书的数量返回图书，此处推荐图书数量为recommendBooks
        for (Map.Entry<Integer,Double> map:recommendMap.entrySet()){
            if (count2>=recommendBooks)
                break;
            recommendBookIds.add(map.getKey());
            count2++;
        }
        return recommendBookIds;
    }



    private Map<Integer, Double> MapSort(Map<Integer, Double> resultsMap) {
        // 转化成list
        List<Map.Entry<Integer,Double>> results = new ArrayList<Map.Entry<Integer, Double>>(resultsMap.entrySet());
        // 从大到小排序
        Collections.sort(results, new Comparator<Map.Entry<Integer, Double>>() {
            public int compare(Map.Entry<Integer, Double> o1, Map.Entry<Integer, Double> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
        Map<Integer, Double> result = new LinkedHashMap<Integer, Double>();
        for (Map.Entry<Integer, Double> entry : results)
        {
            result.put( entry.getKey(), entry.getValue() );
        }
        return result;
    }
}
