package Exercise_1.question1.Interface;

public class News implements  INews{
/*
ID (int), Title (String), PublishDate (String), Author (String),
Content (String) và AverageRate (float).
Tạo các setter và getter cho từng thuộc tính, riêng AverageRate thì chỉ
có getter.

 */


    private int id;

    private String title;

    private String publishDate;

    private String Author;

    private String content;

    private float averageRate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        Author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public float getAverageRate() {
        return averageRate;
    }

    public void setAverageRate(float averageRate) {
        this.averageRate = averageRate;
    }


     /*
 Implement các method trong interface INews như sau:
a) Method Display() sẽ in ra Title, PublishDate, Author,
Content và AverageRate của tin tức ra console.
b) Method có tên Calculate() để thiết đặt thuộc tính
Khai báo một array có tên Rates kiểu int gồm 3 phần tử
AverageRate là trung bình cộng của 3 phần tử của array
Rates.
  */
    private int[] Rates = new int[3];

    public void setRates(int index,int rates) {
        if(index >= 0 && index < Rates.length){
            Rates[index] = rates;
        }

    }

    @Override
    public void Display() {
        System.out.println("Title : " + this.title);
        System.out.println("PublishDate : " + this.publishDate);
        System.out.println("Author : " + this.Author);
        System.out.println("Content : " + this.content);
        System.out.println("AverageRate : " + this.Calculate());
    }

    @Override
    public float Calculate() {
       averageRate = (float) (Rates[0] + Rates[1] + Rates[2]) / 3;
       return averageRate;
    }




}
