package ObjectandClasses.keystatic.nonstaticvariable;

public class Couters {
//    int count = 0;

    static  int count = 0; // Chỉ nhận bộ nhớ 1 lần và giữ nguyên ngay tại thời điểm

    Couters(){
        count++;
        System.out.println(count);
    }
}
