package bean;


public class Student implements java.io.Serializable{


	private String no;
	private String name;
	private int entYear;
	private String classNum;
	private boolean isAttend;
	private String schoolCd;

	//学籍番号の取得
	public String getNo() {
	    return no;
	}

	//学籍番号の設定
	public void setNo(String no) {
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
	public String getClassNum() {
	    return classNum;
	}

	//学年とクラスの設定
	public void setClassNum(String classNum) {
	    this.classNum = classNum;
	}

	//在学しているかどうかを取得
	public boolean isAttend() {
	    return isAttend;
	}

	public void setAttend(boolean isAttend) {
	    this.isAttend = isAttend;
	}

	public String getSchoolCd() {
	    return schoolCd;
	}

	public void setSchoolCd(String schoolCd) {
	    this.schoolCd = schoolCd;
	}
}