package ObjectandClasses.keystatic.variables;

public class testStudent {
    public static void main(String[] args) {
        Student.change();
        Student s1 = new Student(100, "Le Quoc");
        Student s2 = new Student(222,"Aryan");
        Student s3 = new Student(333,"Sonoo");
        s1.display();
        s2.display();
        s3.display();


    }
}
