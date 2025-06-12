package bean;

public class Class_Num implements java.io.Serializable {

    private String schoolCd;
    private String classNum;

    // 学校コードの取得
    public String getSchoolCd() {
        return schoolCd;
    }

    // 学校コードの
    public void setSchoolCd(String schoolCd) {
        this.schoolCd = schoolCd;
    }

    // クラス名の取得
    public String getClassNum() {
        return classNum;
    }

    // クラス名の設定
    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }
}
