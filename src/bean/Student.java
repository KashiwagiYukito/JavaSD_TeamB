package bean;


public class Student implements java.io.Serializable{

	//学籍番号
	private int no;
	//学生名
	private String name;
	//入学年度
	private int entYear;
	//クラス番号
	private int classNum;
	//在学中フラグ
	private boolean isAttend;
	//学校コード
	private String schoolCd;

	//学籍番号の取得
	public int getNo() {
	    return no;
	}

	//学籍番号の設定
	public void setNo(int no) {
	    this.no = no;
	}

	//学生の名前の取得
	public String getName() {
	    return name;
	}

	//学生の名前の設定
	public void setName(String name) {
	    this.name = name;
	}

	//入学年度の取得
	public int getEntYear() {
	    return entYear;
	}

	//入学年度の設定
	public void setEntYear(int entYear) {
	    this.entYear = entYear;
	}

	//学年とクラスの取得
	public int getClassNum() {
	    return classNum;
	}

	//学年とクラスの設定
	public void setClassNum(int classNum) {
	    this.classNum = classNum;
	}

	//在学しているかどうかを取得
	public boolean isAttend() {
	    return isAttend;
	}

	//在学しているかどうかを設定
	public void setisAttend(boolean isAttend) {
	    this.isAttend = isAttend;
	}

	//所属している学校の取得
	public String getSchoolCd() {
	    return schoolCd;
	}

	//所属している学校の設定
	public void setSchoolCd(String schoolCd) {
	    this.schoolCd = schoolCd;
	}
}