package bean;

public class Test implements java.io.Serializable {

	//テストの回数
	private int no;
	//学籍番号
    private int studentNo;
    //科目コード
    private String subjectCd;
    //学校コード
    private String schoolCd;
    //点数
    private int point;
    //クラス番号
    private int classNum;

    //テストの回数の取得
    public int getNo() {
        return no;
    }

    //テストの回数の設定
    public void setNo(int no) {
        this.no = no;
    }

    //学籍番号の取得
    public int getStudentNo() {
        return studentNo;
    }

    //学籍番号の設定
    public void setStudentNo(int studentNo) {
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

    //クラス番号の取得
    public int getClassNum() {
        return classNum;
    }

    //クラス番号の設定
    public void setClassNum(int classNum) {
        this.classNum = classNum;
    }
}