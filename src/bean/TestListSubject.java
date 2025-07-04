package bean;

import java.util.HashMap;
import java.util.Map;

public class TestListSubject {
	private int entYear;
    private String studentNo;
    private String studentName;
    private String classNum;
    private String errorPoint;
    private Map<Integer, Integer> points = new HashMap<>();

    public TestListSubject() {}

	public int getEntYear() {
		return entYear;
	}

	public void setEntYear(int entYear) {
		this.entYear = entYear;
	}

	public String getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getClassNum() {
		return classNum;
	}

	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}

	public String getErrorPoint() {
	    return errorPoint;
	}
	public void setErrorPoint(String errorPoint) {
	    this.errorPoint = errorPoint;
	}

	public Map<Integer, Integer> getPoints() {
		return points;
	}

	public void setPoints(Map<Integer, Integer> points) {
		this.points = points;
	}

	// キー（回数）に対応する点数を取得
    public String getPoint(int key) {
        Integer value = points.get(key);
        return (value != null) ? String.valueOf(value) : "-";
    }

    // 点数マップへ値セット
    public void putPoint(int key, int value) {
        points.put(key, value);
    }
}
