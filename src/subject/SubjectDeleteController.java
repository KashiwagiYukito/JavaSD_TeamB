package subject;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectDAO;


@WebServlet("/main/SubjectDeleteController")
public class SubjectDeleteController extends HttpServlet {

	 //Postリクエスト
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
	       throws ServletException, IOException {

			try {
				// パラメータの取得
		        String subjectCd = request.getParameter("subjectCd");
		        String schoolCd = request.getParameter("schoolCd");

	            //削除処理を実行
	            SubjectDAO dao = new SubjectDAO();
	            dao.delete(schoolCd, subjectCd);

	            // 削除成功 → 一覧画面へリダイレクト
	            //（仮）
	            response.sendRedirect(request.getContextPath() + "/SubjectList.action");


		    } catch (Exception e) {

		    	//削除に失敗したときの処理
		        e.printStackTrace(); // エラーの詳細をログに出す
		        request.setAttribute("error", "削除処理中にエラーが発生しました。");
	            //request.getRequestDispatcher("/error.jsp").forward(request, response);

		    }
		}

	//GETリクエスト
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
		   throws ServletException, IOException {

			// TODO: 必要があれば将来追加。通常、削除はPOSTで行う。
		}

}


