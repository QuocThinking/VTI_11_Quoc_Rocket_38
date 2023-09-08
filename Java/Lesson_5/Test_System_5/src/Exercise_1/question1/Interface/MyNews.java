package Exercise_1.question1.Interface;

import java.util.Scanner;

public class MyNews {
    public static void main(String[] args) {
        /*
        c) Tạo chương trình demo có tên là MyNews và tạo một menu
lựa chọn gồm các mục sau:
 Insert news
 View list news
 Average rate
 Exit
Nếu người dùng chọn 1 từ bàn phím thì tạo một object của
class News và nhập giá trị cho các thuộc tính Title,
PublishDate, Author, Content sau đó yêu cầu người dùng
nhập vào 3 đánh giá để lưu vào Rates.
Nếu người dùng chọn 2 từ bàn phím thì thực thi method
Display().
Nếu người dùng chọn 3 từ bàn phím thì thực hiện method
Calculate() để tính đánh giá trung bình, sau đó thực thi
method Display().
Trường hợp người dùng chọn 4 thì sẽ thoát khỏi chương
trình.
         */

        Scanner sc = new Scanner(System.in);
        News news = null;

        while (true){
            System.out.println("Chọn 1 : Insert news");
            System.out.println("Chọn 2 : View list news");
            System.out.println("Chọn 3 : Average rate");
            System.out.println("Chọn 4: Exit");

            int choice = sc.nextInt();
            sc.nextLine();

            switch (choice){
                case 1 :
                    news = new News();
                    System.out.println("Nhập tiêu đề");
                    String title = sc.nextLine();
                    news.setTitle(title);

                    System.out.println("Nhập publishDate ");
                    String publish = sc.nextLine();
                    news.setPublishDate(publish);

                    System.out.println(("Nhập Author"));
                    String author = sc.nextLine();
                    news.setAuthor(author);

                    System.out.println(("Nhập Content"));
                    String content = sc.nextLine();
                    news.setContent(content);

                    for(int i = 0; i < 3; i ++){
                        System.out.println("Nhập đánh giá thứ " + (i + 1) + " :");
                        int rate = sc.nextInt();
                        news.setRates(i,rate);
                    }
                    break;

                case 2 :
                    if(news != null){
                        news.Display();
                    }else {
                        System.out.println("Không có tin tức");
                    }
                    break;
                case 3:
                    if(news != null){
                        news.Calculate();
                        news.Display();
                    }else {
                        System.out.println("Không có tin tức");
                    }
                    break;
                case 4:
                    System.out.println("Tạm biệt!");
                    sc.close();
                    System.exit(0);

                default:
                    System.out.println("Chọn không hợp lệ. Vui lòng chọn lại.");
            }
        }

    }
}
