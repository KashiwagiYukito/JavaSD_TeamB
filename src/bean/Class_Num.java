package bean;

public class Class_Num implements java.io.Serializable {

    private int schoolCd;
    private int classNum;

    // 学校コードの取得
    public int getSchoolCd() {
        return schoolCd;
    }
    // 学校コードの設定
    public void setSchoolCd(int schoolCd) {
        this.schoolCd = schoolCd;
    }

    // クラス名の取得
    public int getClassNum() {
        return classNum;
    }

    // クラス名の設定
    public void setClassNum(int classNum) {
        this.classNum = classNum;
    }
}
