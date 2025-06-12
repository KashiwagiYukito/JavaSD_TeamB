package bean;

import java.io.Serializable;

public class Teacher implements Serializable {

    private String id;
    private String password;
    private String name;
    private String schoolCd;

    //教師IDの取得
    public String getId() {
        return id;
    }

    //教師IDの設定
    public void setId(String id) {
        this.id = id;
    }

    //教師のパスワードの取得
    public String getPassword() {
        return password;
    }

    //教師のパスワードの設定
    public void setPassword(String password) {
        this.password = password;
    }

    //教師の名前の取得
    public String getName() {
        return name;
    }

    //教師の名前の設定
    public void setName(String name) {
        this.name = name;
    }

    //所属している学校のコードの取得
    public String getSchoolCd() {
        return schoolCd;
    }

  //所属している学校のコードの設定
    public void setSchoolCd(String schoolCd) {
        this.schoolCd = schoolCd;
    }
}
