public class Position {
    private int PositionId;
    private String PositionName;

    public Position(int positionId, String positionName) {
        PositionId = positionId;
        PositionName = positionName;
    }

    public int getPositionId() {
        return PositionId;
    }

    public void setPositionId(int positionId) {
        PositionId = positionId;
    }

    public String getPositionName() {
        return PositionName;
    }

    public void setPositionName(String positionName) {
        PositionName = positionName;
    }

    @Override
    public String toString() {
        return "Position{" +
                "PositionId=" + PositionId +
                ", PositionName='" + PositionName + '\'' +
                '}';
    }
}

