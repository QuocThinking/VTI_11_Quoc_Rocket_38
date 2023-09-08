package ObjectandClasses.InnitializationMethod.Account;

public class Account {
    private int acc_no;
    private String name;
    private float amount;

    public int getAcc_no() {
        return acc_no;
    }

    public void setAcc_no(int acc_no) {
        this.acc_no = acc_no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public Account(int acc_no, String name, float amount) {
        this.acc_no = acc_no;
        this.name = name;
        this.amount = amount;
    }

    void deposit (float amt){
        amount = amount + amt;
        System.out.println(amt + " deposited");
    }

    void withdraw(float amt){
        if(amt > amount){
            System.out.println("Insufficient Balance");
        }else {
            amount = amount - amt;
            System.out.println(amt + " withdrawn");
        }

    }

    void  checkBalance(){
        System.out.println("balance " + this.amount);
    }

    void displayInfo(){
        System.out.println(acc_no + " " + name + " " + this.amount + "$");
    }
}
