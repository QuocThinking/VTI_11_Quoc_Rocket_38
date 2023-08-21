import java.util.Date;

public class Question {
    private int QuestionId;
    private String Content;

    private int CategoryId;

    private int TypeId;

    private Date CreateDate;

    public Question(int questionId, String content, int categoryId, int typeId, Date createDate) {
        QuestionId = questionId;
        Content = content;
        CategoryId = categoryId;
        TypeId = typeId;
        CreateDate = createDate;
    }

    public int getQuestionId() {
        return QuestionId;
    }

    public void setQuestionId(int questionId) {
        QuestionId = questionId;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int categoryId) {
        CategoryId = categoryId;
    }

    public int getTypeId() {
        return TypeId;
    }

    public void setTypeId(int typeId) {
        TypeId = typeId;
    }

    public Date getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(Date createDate) {
        CreateDate = createDate;
    }

    @Override
    public String toString() {
        return "Question{" +
                "QuestionId=" + QuestionId +
                ", Content='" + Content + '\'' +
                ", CategoryId=" + CategoryId +
                ", TypeId=" + TypeId +
                ", CreateDate=" + CreateDate +
                '}';
    }
}
