package main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Student;
import bean.Subject;
import bean.TestListSubject;
import dao.StudentDAO;
import dao.SubjectDAO;
import dao.TestListSubjectDao;

@WebServlet("/main/ScoreReferenceServlet")
public class ScoreReferenceServlet extends HttpServlet {

    private static final String SCHOOL_CD = "oom"; // 学校コードを定数として定義

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("ScoreReferenceServlet: doGetメソッドが呼び出されました。");
        try {
            // セレクトボックスに必要なリストを設定
        	setSelectLists(request);

            // 初期表示は検索画面 (scoreReference.jsp) にフォワード
            request.getRequestDispatcher("/main/scoreReference.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "システムエラーが発生しました");
            request.getRequestDispatcher("/main/scoreReference.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("ScoreReferenceServlet: doPostメソッドが呼び出されました。");

        try {
            // セレクトボックスに必要なリストを設定 (検索フォーム部分のため)
            setSelectLists(request);

            String entYearParam = request.getParameter("entYear");
            String classNumParam = request.getParameter("classNum");
            String subjectCdParam = request.getParameter("subjectCd");
            String studentNoParam = request.getParameter("studentNo");

            System.out.println("パラメータ: entYear=" + entYearParam + ", classNum=" + classNumParam +
                               ", subjectCd=" + subjectCdParam + ", studentNo=" + studentNoParam);

            // 検索パラメータをJSPに保持させるためにリクエスト属性に設定
            request.setAttribute("paramEntYear", entYearParam != null ? entYearParam : "");
            request.setAttribute("paramClassNum", classNumParam != null ? classNumParam : "");
            request.setAttribute("paramSubjectCd", subjectCdParam != null ? subjectCdParam : "");
            request.setAttribute("paramStudentNo", studentNoParam != null ? studentNoParam : "");


            // 検索タイプを判断
            boolean isStudentSearch = (studentNoParam != null && !studentNoParam.isEmpty());
            boolean isSubjectSearch = (entYearParam != null && !entYearParam.isEmpty() &&
                                       classNumParam != null && !classNumParam.isEmpty() &&
                                       subjectCdParam != null && !subjectCdParam.isEmpty());

            System.out.println("検索フラグ: isStudentSearch=" + isStudentSearch + ", isSubjectSearch=" + isSubjectSearch);


            // 結果をフォワードするJSPは常に /main/scoreReference_done.jsp になります。
            // 検索条件が不足している場合も、このページでエラーメッセージを表示します。
            String forwardPath = "/main/scoreReference_done.jsp";

            if (isStudentSearch) {
                System.out.println("学生番号で検索を実行します。");
                searchByStudent(request, studentNoParam);
            } else if (isSubjectSearch) {
                System.out.println("科目情報で検索を実行します。");
                searchBySubject(request, entYearParam, classNumParam, subjectCdParam);
            } else {
                // 検索条件が不足している場合
                request.setAttribute("error", "検索条件を指定してください。");
                System.out.println("検索条件が不足しています。");
            }

            System.out.println("最終的なフォワードパス: " + forwardPath);
            request.getRequestDispatcher(forwardPath).forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("ScoreReferenceServlet: doPostメソッドで例外が発生しました: " + e.getMessage());
            request.setAttribute("error", "システムエラーが発生しました: " + e.getMessage());
            // 例外発生時も、結果表示JSPにフォワードし、エラーメッセージを表示
            request.getRequestDispatcher("/main/scoreReference_done.jsp").forward(request, response);
        }
    }

    /**
     * 各種セレクトボックスのリストを設定するヘルパーメソッドです。
     */
    private void setSelectLists(HttpServletRequest request) throws Exception {
        TestListSubjectDao testListSubjectDao = new TestListSubjectDao();
        SubjectDAO subjectDao = new SubjectDAO();

        List<Integer> entYearList = testListSubjectDao.getEntYears(SCHOOL_CD);
        List<String> classNumList = testListSubjectDao.getClassNums(SCHOOL_CD);
        List<Subject> subjectList = subjectDao.filterBySchool(SCHOOL_CD);

        // ここでリストの中身を出力してみる（デバッグ用）
        System.out.println("entYearList=" + entYearList);
        System.out.println("classNumList=" + classNumList);
        System.out.println("subjectList=" + subjectList);

        request.setAttribute("entYearList", entYearList);
        request.setAttribute("classNumList", classNumList);
        request.setAttribute("subjectList", subjectList);
        System.out.println("セレクトボックスのリストを設定しました。");
    }

    /**
     * 学生番号で学生情報を検索し、リクエスト属性に設定するヘルパーメソッドです。
     */
    private void searchByStudent(HttpServletRequest request, String studentNo) throws Exception {
        StudentDAO studentDao = new StudentDAO();
        Student student = studentDao.findById(studentNo);

        if (student != null && student.getSchoolCd() != null && student.getSchoolCd().equals(SCHOOL_CD)) {
            request.setAttribute("studentResult", student);
            System.out.println("学生情報が見つかりました: " + student.getName());
        } else {
            request.setAttribute("error", "該当する学生が見つかりません。");
            System.out.println("該当する学生が見つからないか、学校コードが一致しませんでした。");
        }
    }

    /**
     * 科目情報で成績を検索し、リクエスト属性に設定するヘルパーメソッドです。
     */
    private void searchBySubject(HttpServletRequest request, String entYearParam, String classNumParam, String subjectCdParam) throws Exception {
        SubjectDAO subjectDao = new SubjectDAO();
        Subject subject = subjectDao.findById(SCHOOL_CD, subjectCdParam);

        if (subject != null) {
            int entYear = Integer.parseInt(entYearParam);

            School school = new School();
            school.setCd(SCHOOL_CD);

            TestListSubjectDao testListSubjectDao = new TestListSubjectDao();

            // 1回目のテスト結果を取得
            List<TestListSubject> test1Results = testListSubjectDao.filter(
                    entYear, classNumParam, subject, school, 1);
            System.out.println("1回目のテスト結果数: " + test1Results.size());

            // 2回目のテスト結果を取得
            List<TestListSubject> test2Results = testListSubjectDao.filter(
                    entYear, classNumParam, subject, school, 2);
            System.out.println("2回目のテスト結果数: " + test2Results.size());

            // 学生番号をキーとしたMapで一時的に結果を保持し、統合します。
            Map<String, Map<String, Object>> combinedMap = new HashMap<>();

            // 1回目の結果をMapに格納
            for (TestListSubject t1 : test1Results) {
                Map<String, Object> studentData = new HashMap<>();
                studentData.put("entYear", t1.getEntYear());
                studentData.put("classNum", t1.getClassNum());
                studentData.put("no", t1.getStudentNo()); // JSPのs.noに対応
                studentData.put("name", t1.getStudentName()); // JSPのs.nameに対応
                studentData.put("score1", t1.getPoint(1)); // 1回目の点数

                combinedMap.put(t1.getStudentNo(), studentData);
            }

            // 2回目の結果を既存のMapエントリに統合
            for (TestListSubject t2 : test2Results) {
                Map<String, Object> existingStudentData = combinedMap.get(t2.getStudentNo());
                if (existingStudentData != null) {
                    existingStudentData.put("score2", t2.getPoint(2)); // 2回目の点数
                } else {
                    // もし2回目のデータのみ存在する場合（通常は発生しないが念のため）
                    Map<String, Object> studentData = new HashMap<>();
                    studentData.put("entYear", t2.getEntYear());
                    studentData.put("classNum", t2.getClassNum());
                    studentData.put("no", t2.getStudentNo());
                    studentData.put("name", t2.getStudentName());
                    studentData.put("score2", t2.getPoint(2)); // 2回目の点数

                    combinedMap.put(t2.getStudentNo(), studentData);
                }
            }

            // Mapの値をListに変換し、JSPに渡します。
            List<Map<String, Object>> combinedResults = new ArrayList<>(combinedMap.values());

            if (!combinedResults.isEmpty()) {
                request.setAttribute("subjectResult", combinedResults);
                request.setAttribute("selectedSubjectName", subject.getName());
                System.out.println("科目成績が見つかりました。結果数: " + combinedResults.size());
            } else {
                request.setAttribute("error", "該当する科目成績が見つかりません。");
                System.out.println("該当する科目成績が見つかりませんでした。");
            }
        } else {
            request.setAttribute("error", "科目情報が取得できません。");
            System.out.println("科目情報が見つかりませんでした。");
        }
    }
}