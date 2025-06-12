package bean;

public class Test implements java.io.Serializable {

    private int no;
    private String studentNo;
    private String subjectCd;
    private String schoolCd;
    private int point;
    private String classNum;

    //テストの識別番号（例：第１回、第２回）の取得
    public int getNo() {
        return no;
    }

    //テストの識別番号の設定
    public void setNo(int no) {
        this.no = no;
    }

    //学籍番号の取得
    public String getStudentNo() {
        return studentNo;
    }

    //学籍番号の設定
    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    //科目の取得
    public String getSubjectCd() {
        return subjectCd;
    }

    //科目の設定
    public void setSubjectCd(String subjectCd) {
        this.subjectCd = subjectCd;
    }

    //所属している学校のコードの取得
    public String getSchoolCd() {
        return schoolCd;
    }

    //所属している学校のコードの設定
    public void setSchoolCd(String schoolCd) {
        this.schoolCd = schoolCd;
    }

    //得点の取得
    public int getPoint() {
        return point;
    }

    //得点の設定
    public void setPoint(int point) {
        this.point = point;
    }

    //学年とクラスの取得
    public String getClassNum() {
        return classNum;
    }

    //学年とクラスの設定
    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }
}