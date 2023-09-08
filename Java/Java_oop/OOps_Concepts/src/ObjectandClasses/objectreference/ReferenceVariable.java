package ObjectandClasses.objectreference;

class ReferenceVariable {
    int id ;
    String name;
}
class testVariable{
    public static void main(String[] args) {
        ReferenceVariable r1 = new ReferenceVariable();
        r1.id = 101;
        r1.name = "Le Quoc";
        System.out.println(r1.id + " " + r1.name);

    }
}
