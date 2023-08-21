import java.util.Date;

public class Group {
    private int GroupID;
    private int AccountId;
    private int CreatorId;

    private Date CreateDate;

    public Group(int groupID, int accountId, int creatorId, Date createDate) {
        GroupID = groupID;
        AccountId = accountId;
        CreatorId = creatorId;
        CreateDate = createDate;
    }

    public int getGroupID() {
        return GroupID;
    }

    public int getAccountId() {
        return AccountId;
    }

    public int getCreatorId() {
        return CreatorId;
    }

    public Date getCreateDate() {
        return CreateDate;
    }

    public void setGroupID(int groupID) {
        GroupID = groupID;
    }

    public void setAccountId(int accountId) {
        AccountId = accountId;
    }

    public void setCreatorId(int creatorId) {
        CreatorId = creatorId;
    }

    public void setCreateDate(Date createDate) {
        CreateDate = createDate;
    }

    @Override
    public String toString() {
        return "Group{" +
                "GroupID=" + GroupID +
                ", AccountId=" + AccountId +
                ", CreatorId=" + CreatorId +
                ", CreateDate=" + CreateDate +
                '}';
    }
}
