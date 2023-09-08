import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Main {


    public static void main(String[] args) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        // Tạo đối tượng Department
        Department department = new Department(101, "IT Developer");
        Department department1 = new Department(102, "Sale Marketing");
        Department department2 = new Department(103, "CEO Company");

        // Tạo đối tượng Position
        Position position = new Position(110, "Java_Backend");
        Position position1 = new Position(111, "Sales English");
        Position position2 = new Position(112, "CEO Manager");
        Position position3 = new Position(112, "Develop");

        List<Account> accounToAddG1 = new ArrayList<>();
        //Tạo account
        Account account = new Account(1, "abc", "Quoc", "Le Quoc", department, position, dateFormat.parse("2023-09-13"));
        Account account1 = new Account(2, "abc@gmail.com", "Lan", "Nguyen Ngoc Lan", department1, position3, dateFormat.parse("2023-09-13"));
        Account account2 = new Account(3, "acc3@gmail.com", "Linh", "Nguyen Ngoc Linh", department2, position2, dateFormat.parse("2023-09-13"));
        Account account3 = new Account(4, "acc4@gmail.com", "Hoai", "Nguyen Ngoc Hoai", department2, position3, dateFormat.parse("2023-09-13"));

        // Thêm account vào danh sách
        accounToAddG1.add(account1);
        accounToAddG1.add(account2);
        accounToAddG1.add(account3);


        Question question = new Question(1, "Html-css", 303, 5, dateFormat.parse("2023-09-23"));

        // Tạo danh sách group

        Group g1 = new Group(3, "Java Fresher", 1, dateFormat.parse("2022-10-12"));
        Group g3 = new Group(4, "c# Fresher", 2, dateFormat.parse("2022-08-14"));
        Group g2 = new Group(5, "Reactjs Fresher", 3, dateFormat.parse("2022-07-11"));
        Group g4 = new Group(1, "Marketing", 202, dateFormat.parse("2020-01-09"));
        Group g5 = new Group(1, "Content", 202, dateFormat.parse("2020-01-09"));
        Group g6 = new Group(2, "Leader", 203, dateFormat.parse("2020-01-09"));
        Group g7 = new Group(3, "Java Fresher", 203, dateFormat.parse("2020-01-09"));
        Group g9 = new Group(1, "Java Fresher", 204, dateFormat.parse("2020-01-09"));
        Group g10 = new Group(2, "Java Fresher", 204, dateFormat.parse("2020-01-09"));

        // thêm account vào group
        g1.setAccounts(accounToAddG1);



        System.out.println(g4.toString());





        /* TEST 1 */
//        System.out.println("thông tin Account");
//
//        System.out.println(account.toString());
//
//        System.out.println("thông tin Group");
//
////        System.out.println(group.toString());
//
//        System.out.println("thông tin Question");
//
//        System.out.println(question.toString());

        System.out.println("LESSON 2 (TWO)");

        /* TEST 2 */


        //Question 1 :

        System.out.println("**QUESION1 : Kiểm tra account có xuất hiện trong department không");
        System.out.println("- Nhân viên thứ 2 : " + account1.getFullName());
        if (account1.getDepartmentId() == null) {
            System.out.println("- Nhân viên: " + account1.getFullName() + " này chưa có phòng ban");
        } else {
            System.out.println("- Phòng ban của nhân viên : " + account1.getFullName() + " là : " + account1.getDepartmentId().getDepartmentName());
        }


        //Question 2 :

        System.out.println("**QUESTION 2 " + "Kiểm tra Group có account");
        System.out.println("Account tên " + account2.getFullName() + " có thông tin group là : ");
        // kiem tra so luong account trong moi group
        int checkaccount = account2.getGroups().size();
        if (checkaccount == 0) {
            System.out.println("Nhân viên này chưa có group");
        } else if (checkaccount <= 2) {
            for (Group group2 : account2.getGroups()) {
                System.out.println(group2.getGroupName() + ", ");
            }
            System.out.println();
        } else if (checkaccount == 3) {
            System.out.println("Nhân viên này là người quan trọng tham gia nhiều Group");
            for (Group group : account2.getGroups()) {
                System.out.println(group.getGroupName() + ",");
            }
        } else if (checkaccount >= 4) {
            System.out.println("Nhân viên này là người hóng chuyện, group nào cũng tham gia");
        }

        //Question 3
        System.out.println("**QUESTION 3 " + "Toán tử tenary cho question 1");
        // Khai báo biến string
        String message = (account1.getDepartmentId() == null) ? "Nhân viên này chua có phòng ban" :
                "Phòng ban của nhân viên này là " + account1.getDepartmentId().getDepartmentName();
        System.out.println(message);


        //Question 4
        System.out.println("**QUESTION 4 " + "Toán tử tenary cho Position");
        System.out.println("Kiểm tra account " + account1.getFullName() + " có phải Dev không");
        String positionName = account1.getPositionId().getPositionName();
        String message1 = (positionName.equals("Develop")) ? "Dây là developer" : "Người này không phải là Developer";

        System.out.println(message1);

        //Question 5
        System.out.println("**QUESTION 5 " + "Lấy số lượng account trong group 1");
        int n = g1.getAccounts().size();
        switch (n) {
            case 1:
                System.out.println("Nhóm có một thành viên");
                break;
            case 2:
                System.out.println("Nhóm có hai thành viên");
                break;
            case 3:
                System.out.println("Nhóm có ba thành viên");
                break;
            default:
                System.out.println("Nhóm có nhiều thành viên");
        }


        //Question 6
        System.out.println("**QUESTION 6 " + "kiểm tra account 2 có group nào chưa");
        // thêm group vào account
        account2.addGroup(g2);
        account2.addGroup(g5);
        int n1 = account2.getGroups().size();
        switch (n1){
            case 0:
                System.out.println("Nhân viên này chưa có group");
                break;
            case 1:
                System.out.println("Group của nhân viên này là "
                        + account2.getGroups().get(0).getGroupName());
                break;
            case 2:
                System.out.println("Group của nhân viên này là "
                        + account2.getGroups().get(0).getGroupName() + ", " + account2.getGroups().get(1).getGroupName());
                break;
            case 3:
                System.out
                        .println("Nhân viên này là người quan trọng, tham gia nhiều group");
                break;
            default:
                System.out
                        .println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
        }

        System.out.println(account1.getPositionId().getPositionName());

        //Question 7 :
        System.out.println("**QUESTION 7 " + "kiểm tra position của account 1");
        String n3 = account3.getPositionId().getPositionName();
        switch (n3){
            case "Develop":
                System.out.println("Đây là Developer");
                break;
            default:
                System.out.println("Người này không phải là Developer");
                break;
        }
    }
}