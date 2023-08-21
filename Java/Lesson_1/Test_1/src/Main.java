import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Main {

    public static void main(String[] args) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Account account = new Account(1, "abc","Quoc","Le Quoc",2,3,dateFormat.parse("2023-09-13"));
        Group group = new Group(1,4,202,dateFormat.parse("2020-01-09"));
        Question question = new Question(1,"Html-css",303,5,dateFormat.parse("2023-09-23"));

        System.out.println("thông tin Account");

        System.out.println(account.toString());

        System.out.println("thông tin Group");

        System.out.println(group.toString());

        System.out.println("thông tin Question");

        System.out.println(question.toString());


    }
}