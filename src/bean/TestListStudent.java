package bean;

public class TestListStudent {
    private String subjectName;
    private String subjectCd;
    private int num;
    private int point;

    private String studentNo;
    private String name;
    private int year;
    private int classNum;

    public TestListStudent() {}

    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }

    public String getSubjectCd() { return subjectCd; }
    public void setSubjectCd(String subjectCd) { this.subjectCd = subjectCd; }

    public int getNum() { return num; }
    public void setNum(int num) { this.num = num; }

    public int getPoint() { return point; }
    public void setPoint(int point) { this.point = point; }

    public String getStudentNo() { return studentNo; }
    public void setStudentNo(String studentNo) { this.studentNo = studentNo; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public int getClassNum() { return classNum; }
    public void setClassNum(int classNum) { this.classNum = classNum; }
}