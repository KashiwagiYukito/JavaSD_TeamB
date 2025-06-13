package bean;

public class Subject implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    //学校コード
    private String schoolCd;
    //科目コード
    private String cd;
    //科目の名前
    private String name;

    //所属している学校の取得
    public String getSchoolCd() {
        return schoolCd;
    }

    //所属している学校の設定
    public void setSchoolCd(String schoolCd) {
        this.schoolCd = schoolCd;
    }

    //科目コードの取得
    public String getCd() {
        return cd;
    }

    //科目コードの設定
    public void setCd(String cd) {
        this.cd = cd;
    }

    //科目の名前の取得
    public String getName() {
        return name;
    }

    //科目の名前の設定
    public void setName(String name) {
        this.name = name;
    }
}
