package bean;

public class School implements java.io.Serializable{

	private String cd;
	private String name;

	//学校コードの取得
	public String getCd() {
	    return cd;
	}

	//学校コードの設定
	public void setCd(String cd) {
	    this.cd = cd;
	}

	//学校名の取得
	public String getName() {
	    return name;
	}

	//学校名の設定
	public void setName(String name) {
	    this.name = name;
	}
}