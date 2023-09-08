import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Group {
    private int GroupID;

    private String GroupName;

    private int CreatorId;

    private Date CreateDate;

    private List<Account> accounts ;

    public Group(int groupID, String groupName, int creatorId, Date createDate) {
        GroupID = groupID;
        GroupName = groupName;
        CreatorId = creatorId;
        CreateDate = createDate;

    }

    public int getGroupID() {
        return GroupID;
    }

    public void setGroupID(int groupID) {
        GroupID = groupID;
    }

    public String getGroupName() {
        return GroupName;
    }

    public void setGroupName(String groupName) {
        GroupName = groupName;
    }

    public int getCreatorId() {
        return CreatorId;
    }

    public void setCreatorId(int creatorId) {
        CreatorId = creatorId;
    }

    public Date getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(Date createDate) {
        CreateDate = createDate;
    }

    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }

    @Override
    public String toString() {
        return "Group{" +
                "GroupID=" + GroupID +
                ", GroupName='" + GroupName + '\'' +
                ", CreatorId=" + CreatorId +
                ", CreateDate=" + CreateDate +
                ", accounts=" + accounts +
                '}';
    }
}
