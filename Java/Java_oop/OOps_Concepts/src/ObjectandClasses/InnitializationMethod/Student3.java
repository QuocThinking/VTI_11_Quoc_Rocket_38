package ObjectandClasses.InnitializationMethod;

class Student3 {
    int id;
    String name;

    void insert(int r, String n){
        id = r;
        name = n;

    }
    void display() {
        System.out.println(id + " " + name);
    }

}
class testStudent3 {
    public static void main(String[] args) {
        Student3 s1  = new Student3();
        Student3 s2  = new Student3();
        s1.insert(101, "Le Quoc");
        s1.display();
        s2.insert(102, "Le Quoc");
        s2.display();
    }
}
