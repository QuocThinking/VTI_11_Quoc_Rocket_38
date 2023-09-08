package ObjectandClasses.InnitializationMethod.Account;

public class TestAccount {
    public static void main(String[] args) {
        Account a1 = new Account(13678, "Le Quoc", 4000);
        a1.displayInfo();
        a1.deposit(5000);
        a1.checkBalance();
        a1.withdraw(1000);
        a1.checkBalance();
    }



}
