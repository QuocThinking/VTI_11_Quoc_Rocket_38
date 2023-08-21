import java.util.Date;

public class Account {
    private int AccountId;
    private String Email;
    private String UserName;

    private String FullName;

    private int DepartmentId;

    private int PositionId;

    private Date createDate;

    public Account(int accountId, String email, String userName, String fullName, int departmentId, int positionId, Date createDate) {
        AccountId = accountId;
        Email = email;
        UserName = userName;
        FullName = fullName;
        DepartmentId = departmentId;
        PositionId = positionId;
        this.createDate = createDate;
    }

    public int getAccountId() {
        return AccountId;
    }

    public String getEmail() {
        return Email;
    }

    public String getUserName() {
        return UserName;
    }

    public String getFullName() {
        return FullName;
    }

    public int getDepartmentId() {
        return DepartmentId;
    }

    public int getPositionId() {
        return PositionId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setAccountId(int accountId) {
        AccountId = accountId;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public void setFullName(String fullName) {
        FullName = fullName;
    }

    public void setDepartmentId(int departmentId) {
        DepartmentId = departmentId;
    }

    public void setPositionId(int positionId) {
        PositionId = positionId;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Account{" +
                "AccountId=" + AccountId +
                ", Email='" + Email + '\'' +
                ", UserName='" + UserName + '\'' +
                ", FullName='" + FullName + '\'' +
                ", DepartmentId=" + DepartmentId +
                ", PositionId=" + PositionId +
                ", createDate=" + createDate +
                '}';
    }
}
