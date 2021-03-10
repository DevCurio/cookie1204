package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.DessertService;
import product.model.vo.Dessert;

/**
 * Servlet implementation class DessertDisable
 */
@WebServlet("/admin/dessertBestChange")
public class DessertBestDeleteChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DessertService dessertService = new DessertService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Dessert> list = dessertService.selectDessertList();
		request.setAttribute("list",list);
		request.getRequestDispatcher("/WEB-INF/views/admin/dessertDisableView.jsp")
		   .forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] ableChange = request.getParameterValues("abledisable[]");
		List<Dessert> list = dessertService.selectDessertList();
		
		
		List<Dessert> ableChangeList = new ArrayList<>();
		
		int total_ableChangeResult=0;
		if (ableChange==null) {
			System.out.println("null값");
		}
		else {
			for (int i = 0; i < ableChange.length; i++) {
				for(Dessert d : list) {
					if(d.getDessertNum()==Integer.parseInt(ableChange[i])) {
						System.out.println(d.getDessertName());
						ableChangeList.add(d);
						break;
					}
				}
			}
		
			for (int i = 0; i < ableChangeList.size(); i++) {
				System.out.println("제품번호:"+ableChangeList.get(i).getDessertNum()+", 제품 이름"
									+ableChangeList.get(i).getDessertName()
									+", 제품종류:"+ableChangeList.get(i).getDessertCategory()+", 인기여부 :"+ableChangeList.get(i).getDessertIsBest());
			
			
				int result = dessertService.updateIsBest(ableChangeList.get(i));
				System.out.println(result);
				total_ableChangeResult+=1;
			}
		}
		
		
		String[] deleteChange = request.getParameterValues("activedelete[]");
		list = dessertService.selectDessertList();
		List<Dessert> deleteChangeList = new ArrayList<>();
		
		int total_deleteChangeResult=0;
		if (deleteChange==null) {
			System.out.println("null값");
		}
		else {
			for (int i = 0; i < deleteChange.length; i++) {
				for(Dessert d : list) {
					if(d.getDessertNum()==Integer.parseInt(deleteChange[i])) {
						System.out.println(d.getDessertName());
						deleteChangeList.add(d);
						break;
					}
				}
			}
		
			for (int i = 0; i < deleteChangeList.size(); i++) {
				System.out.println("변경 전  -->제품번호:"+deleteChangeList.get(i).getDessertNum()+", 제품 이름"
					+deleteChangeList.get(i).getDessertName()
					+", 제품종류:"+deleteChangeList.get(i).getDessertCategory()+", 인기여부 :"+deleteChangeList.get(i).getDessertIsBest()
					+", 삭제여부: "+deleteChangeList.get(i).getDessertDelete());

				int result = dessertService.updateDelete(deleteChangeList.get(i));
				System.out.println("변경 후  -->제품번호:"+deleteChangeList.get(i).getDessertNum()+", 제품 이름"
						+deleteChangeList.get(i).getDessertName()
						+", 제품종류:"+deleteChangeList.get(i).getDessertCategory()+", 인기여부 :"+deleteChangeList.get(i).getDessertIsBest()
						+", 삭제여부: "+deleteChangeList.get(i).getDessertDelete()+"\n");

				total_deleteChangeResult+=1;
			}
		}
		
		
		System.out.println("비활성화 변경 :"+total_ableChangeResult+", 삭제부활변경 : "+total_deleteChangeResult);
		
		list = dessertService.selectDessertList();
		
//		for (int i = 0; i <list.size(); i++) {
//			System.out.println(list.get(i).getDessertDelete());
//		}
//		
		request.setAttribute("list",list);
		String location = request.getContextPath() + "/product/shoppingMain"; 
		
		String msg = "제품 등록상태 변경 완료!";
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(location);
		
		
	}

}
