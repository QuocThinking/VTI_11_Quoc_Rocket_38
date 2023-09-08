package ObjectandClasses.keystatic.variables;

public class Student {
    int rollacc;
    String name;

    static String college = "TTS";
    static  void change (){
        college = "IIS";
    }

    public Student(int rollac, String name) {
        this.rollacc = rollac;
        this.name = name;
    }

    void display(){
        System.out.println(rollacc + " " + name + " " + college);
    }

    @Override
    public String toString() {
        return "Student{" +
                "rollacc=" + rollacc +
                ", name='" + name + '\'' +
                '}';
    }
}
