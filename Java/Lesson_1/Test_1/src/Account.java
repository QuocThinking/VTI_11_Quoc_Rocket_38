import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Account {
    private int AccountId;
    private String Email;
    private String UserName;

    private String FullName;

    private Department departmentId;

    private Position positionId;

    private Date createDate;

    private List<Group> groups = new ArrayList<>();

    public List<Group> getGroups() {
        return groups;
    }



    public void addGroup(Group group){
        groups.add(group);
    }

    public Account() {
    }

    public Account(int accountId, String email, String userName, String fullName, Department departmentId, Position positionId, Date createDate) {
        AccountId = accountId;
        Email = email;
        UserName = userName;
        FullName = fullName;
        this.departmentId = departmentId;
        this.positionId = positionId;
        this.createDate = createDate;
    }

    public int getAccountId() {
        return AccountId;
    }

    public void setAccountId(int accountId) {
        AccountId = accountId;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String fullName) {
        FullName = fullName;
    }

    public Department getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Department departmentId) {
        this.departmentId = departmentId;
    }

    public Position getPositionId() {
        return positionId;
    }

    public void setPositionId(Position positionId) {
        this.positionId = positionId;
    }

    public Date getCreateDate() {
        return createDate;
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
                ", departmentId=" + departmentId +
                ", positionId=" + positionId +
                ", createDate=" + createDate +
                '}';
    }


}
